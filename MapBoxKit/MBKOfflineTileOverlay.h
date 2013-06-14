//
//  MBKOfflineTileOverlay.h
//  MapBoxKit
//
//  Created by Jonathan Baker on 6/14/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBKOfflineTileProvider;

@interface MBKOfflineTileOverlay : MKTileOverlay

- (id)initWithTileProvider:(MBKOfflineTileProvider *)provider;

@property (nonatomic, strong) MBKOfflineTileProvider *provider;

@end
