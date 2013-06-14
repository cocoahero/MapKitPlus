//
//  MBKOfflineTileProvider.m
//  MapBoxKit
//
//  Created by Jonathan Baker on 6/14/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import <sqlite3.h>
#import "MBKFunctions.h"
#import "MBKOfflineTileProvider.h"

NSString * const MBKSQLiteErrorDomain = @"com.cocoahero.mapboxkit.sqlite.ErrorDomain";

@implementation MBKOfflineTileProvider {
    int _minimumZoom;
    int _maximumZoom;
    const char * _path;
    sqlite3 * _database;
    sqlite3_stmt * _metaStatement;
    sqlite3_stmt * _tileStatement;
}

#pragma mark - Initializers

- (id)initWithURL:(NSURL *)url {
    return [self initWithPath:[url path]];
}

- (id)initWithPath:(NSString *)path {
    if ((self = [super init])) {
        _path = [path UTF8String];
        _minimumZoom = -1;
        _maximumZoom = -1;
    }
    return self;
}

#pragma mark - Lifecycle

- (BOOL)open:(NSError **)error {
    if (_database) {
        return YES;
    }
    
    int result = sqlite3_open(_path, &_database);
    
    if (result != SQLITE_OK) {
        NSString *errorDesc = [NSString stringWithUTF8String:sqlite3_errmsg(_database)];
        *error = [NSError errorWithDomain:MBKSQLiteErrorDomain code:result userInfo: @{
            NSLocalizedDescriptionKey: errorDesc
        }];
        return NO;
    }
    
    return YES;
}

- (BOOL)close:(NSError **)error {
    if (!_database) {
        return YES;
    }
    
    if (_metaStatement) {
        sqlite3_finalize(_metaStatement);
        _metaStatement = nil;
    }
    
    if (_tileStatement) {
        sqlite3_finalize(_tileStatement);
        _tileStatement = nil;
    }
    
    int result = sqlite3_close(_database);
    
    if (result != SQLITE_OK) {
        NSString *errorDesc = [NSString stringWithUTF8String:sqlite3_errmsg(_database)];
        *error = [NSError errorWithDomain:MBKSQLiteErrorDomain code:result userInfo: @{
            NSLocalizedDescriptionKey: errorDesc
        }];
        return NO;
    }
    
    _database = nil;
    
    return YES;
}

#pragma mark - Accessors

- (int)minimumZoom {
    if (_minimumZoom >= 0) {
        return _minimumZoom;
    }
    
    NSString *minZoom = [self valueForMetadata:@"minzoom"];
    if (minZoom) {
        _minimumZoom = [minZoom intValue];
    }
    
    return _minimumZoom;
}

- (int)maximumZoom {
    if (_maximumZoom >= 0) {
        return _maximumZoom;
    }
    
    NSString *maxZoom = [self valueForMetadata:@"maxzoom"];
    if (maxZoom) {
        _maximumZoom = [maxZoom intValue];
    }
    
    return _maximumZoom;
}

- (NSString *)valueForMetadata:(NSString *)name {
    if (!_database && ![self open:nil]) {
        return nil;
    }
    
    NSString *result = nil;
    
    sqlite3_stmt *statement = [self metaStatement];
    
    if (statement) {
        sqlite3_bind_text(statement, 1, [name UTF8String], -1, SQLITE_TRANSIENT);
        if (sqlite3_step(statement) == SQLITE_ROW) {
            const char * value = (const char *) sqlite3_column_text(statement, 0);
            if (value) {
                result = [NSString stringWithUTF8String:value];
            }
        }
    }
    
    return result;
}

- (NSData *)tileDataForColumn:(int)x row:(int)y zoom:(int)z {
    if (!_database && ![self open:nil]) {
        return nil;
    }
    
    NSData *result = nil;
    
    sqlite3_stmt *statement = [self tileStatement];
    
    if (statement) {
        sqlite3_bind_int(statement, 1, x);
        sqlite3_bind_int(statement, 2, y);
        sqlite3_bind_int(statement, 3, z);
        if (sqlite3_step(statement) == SQLITE_ROW) {
            int length = sqlite3_column_bytes(statement, 0);
            result = [NSData dataWithBytes:sqlite3_column_blob(statement, 0) length:length];
        }
    }
    
    return result;
}

#pragma mark - Prepared Statements

- (sqlite3_stmt *)metaStatement {
    static NSString * query = @"SELECT value FROM metadata WHERE name = ?";
    
    if (!_metaStatement) {
        if (sqlite3_prepare(_database, [query UTF8String], -1, &_metaStatement, nil) != SQLITE_OK) {
            return nil;
        }
    }
    
    sqlite3_reset(_metaStatement);
    sqlite3_clear_bindings(_metaStatement);
    
    return _metaStatement;
}

- (sqlite3_stmt *)tileStatement {
    static NSString * query = @"SELECT tile_data FROM tiles WHERE tile_column = ? AND tile_row = ? AND zoom_level = ?";
    
    if (!_tileStatement) {
        if (sqlite3_prepare(_database, [query UTF8String], -1, &_tileStatement, nil) != SQLITE_OK) {
            return nil;
        }
    }
    
    sqlite3_reset(_tileStatement);
    sqlite3_clear_bindings(_tileStatement);
    
    return _tileStatement;
}

#pragma mark - Memory Management

- (void)dealloc {
    NSError *error = nil;
    if (![self close:&error]) {
        MBKLog(@"Error Closing SQLite Database Handle: %@", error);
    }
}

@end
