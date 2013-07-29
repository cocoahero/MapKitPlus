//
//  MKPMapBoxOfflineTileProvider.h
//  MapKitPlus
//
//  Created by Jonathan Baker on 6/14/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const MKPSQLiteErrorDomain;

@interface MKPMapBoxOfflineTileProvider : NSObject

- (id)initWithURL:(NSURL *)url;

- (id)initWithPath:(NSString *)path;

- (BOOL)open:(NSError **)error;

- (BOOL)close:(NSError **)error;

- (int)minimumZoom;

- (int)maximumZoom;

- (NSString *)valueForMetadata:(NSString *)name;

- (NSData *)tileDataForColumn:(int)x row:(int)y zoom:(int)z;

@end
