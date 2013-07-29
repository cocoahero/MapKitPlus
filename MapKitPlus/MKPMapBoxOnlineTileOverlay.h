//
//  MKPMapBoxOnlineTileOverlay.h
//  MapKitPlus
//
//  Created by Jonathan Baker on 6/14/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import <MapKit/MapKit.h>

extern NSString * const MKPMapBoxDefaultBaseURL;

@interface MKPMapBoxOnlineTileOverlay : MKTileOverlay

/**
 The MapBox hosted map identifier.
 */
@property (nonatomic, strong) NSString *mapIdentifier;


/**
 Whether or not the overlay will use HTTPS when requesting tiles.
 */
@property (nonatomic, assign) BOOL useSecureTransport;

/**
 Initializes and returns a new tile overlay configured to use the given
 MapBox map identifier.
 \param identifier An identifier for a MapBox hosted map.
 \returns Returns an initialized MBKOnlineTileOverlay object or nil if the
 object could not be successfully initialized.
 */
- (id)initWithMapIdentifier:(NSString *)identifier;

@end
