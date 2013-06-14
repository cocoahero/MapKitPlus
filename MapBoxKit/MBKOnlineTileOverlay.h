//
//  MBKOnlineTileOverlay.h
//  MapBoxKit
//
//  Created by Jonathan Baker on 6/14/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import <MapKit/MapKit.h>

extern NSString * const MBKDefaultMapBoxBaseURL;

@interface MBKOnlineTileOverlay : MKTileOverlay

@property (nonatomic, strong) NSString *mapIdentifier;

@property (nonatomic, assign) BOOL useSecureTransport;

- (id)initWithMapIdentifier:(NSString *)identifier;

@end
