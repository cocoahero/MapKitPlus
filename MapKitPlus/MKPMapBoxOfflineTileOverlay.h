//
//  MKPMapBoxOfflineTileOverlay.h
//  MapKitPlus
//
//  Created by Jonathan Baker on 6/14/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import <MapKit/MapKit.h>

@class MKPMapBoxOfflineTileProvider;

@interface MKPMapBoxOfflineTileOverlay : MKTileOverlay

/**
 * The MBKOfflineTileProvider instance that will be providing the tiles.
 */
@property (nonatomic, strong) MKPMapBoxOfflineTileProvider *provider;

/**
 * Initializes and returns a new tile overlay configured to use the given
 * offline tile provider.
 * \param provider An instance of an offline tile provider to serve the tiles.
 * \returns Returns an initialized MBKOfflineTileOverlay object or nil if the
 * object could not be successfully initialized.
 */
- (id)initWithTileProvider:(MKPMapBoxOfflineTileProvider *)provider;

@end
