//
//  MBKOfflineTileOverlay.m
//  MapBoxKit
//
//  Created by Jonathan Baker on 6/14/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import "MBKFunctions.h"
#import "MBKOfflineTileOverlay.h"
#import "MBKOfflineTileProvider.h"

@implementation MBKOfflineTileOverlay

#pragma mark - Initializer

- (id)initWithTileProvider:(MBKOfflineTileProvider *)provider {
    if ((self = [super init])) {
        self.provider = provider;
        self.geometryFlipped = YES;
    }
    return self;
}

#pragma mark - MKTileOverlay Overrides

- (void)loadTileAtPath:(MKTileOverlayPath)path result:(void (^)(NSData *, NSError *))result {
    if (result) {
        result([self.provider tileDataForColumn:path.x row:path.y zoom:path.z], nil);
    }
}

- (NSInteger)minimumZ {
    return self.provider.minimumZoom;
}

- (NSInteger)maximumZ {
    return self.provider.maximumZoom;
}

#pragma mark - Properties

- (void)setProvider:(MBKOfflineTileProvider *)provider {
    if (_provider) {
        NSError *error = nil;
        if (![_provider close:&error]) {
            MBKLog(@"Error Closing Existing Provider: %@", error);
        }
    }
    _provider = provider;
}


@end
