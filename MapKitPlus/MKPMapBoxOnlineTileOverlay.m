//
//  MKPMapBoxOnlineTileOverlay.m
//  MapKitPlus
//
//  Created by Jonathan Baker on 6/14/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import "MKPMapBoxOnlineTileOverlay.h"

NSString * const MKPMapBoxDefaultBaseURL = @"api.tiles.mapbox.com/v3";

@implementation MKPMapBoxOnlineTileOverlay

#pragma mark - Initializers

- (id)initWithMapIdentifier:(NSString *)identifier {
    if ((self = [super init])) {
        self.mapIdentifier = identifier;
        self.useSecureTransport = NO;
    }
    return self;
}

#pragma mark - MKTileOverlay Overrides

- (NSURL *)URLForTilePath:(MKTileOverlayPath)path {
    NSString *basePath = [self baseURLString];
    NSString *formated = [NSString stringWithFormat:@"%@/%d/%d/%d.png", basePath, path.z, path.x, path.y];
    return [NSURL URLWithString:formated];
}

#pragma mark - Internal Methods

- (NSString *)baseURLString {
    NSString *protocol = self.useSecureTransport ? @"https://" : @"http://";
    return [NSString stringWithFormat:@"%@%@/%@", protocol, MKPMapBoxDefaultBaseURL, self.mapIdentifier];
}

@end
