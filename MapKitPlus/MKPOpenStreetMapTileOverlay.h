//
//  MKPOpenStreetMapTileOverlay.h
//  MapKitPlus
//
//  Created by Jonathan Baker on 7/28/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import <MapKit/MapKit.h>

extern NSString * const MKPOpenStreetMapURLTemplate;

/**
 A subclass of MKTileOverlay configured to display tiles from OpenStreetMap.
 */
@interface MKPOpenStreetMapTileOverlay : MKTileOverlay

/**
 Convenience method for creating a new instance.
 */
+ (instancetype)overlay;

@end
