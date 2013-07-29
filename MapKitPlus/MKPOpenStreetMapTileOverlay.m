//
//  MKPOpenStreetMapTileOverlay.m
//  MapKitPlus
//
//  Created by Jonathan Baker on 7/28/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import "MKPOpenStreetMapTileOverlay.h"

NSString * const MKPOpenStreetMapURLTemplate = @"http://tile.openstreetmap.org/{z}/{x}/{y}.png";

@implementation MKPOpenStreetMapTileOverlay

#pragma mark - Factories

+ (instancetype)overlay {
    return [[self alloc] init];
}

#pragma mark - Initializers

- (id)init {
    return [super initWithURLTemplate:MKPOpenStreetMapURLTemplate];
}

@end
