//
//  MKPGeoJSONPoint.h
//  MapKitPlus
//
//  Created by Jonathan Baker on 7/31/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import "MKPGeoJSON.h"

@interface MKPGeoJSONPoint : MKPGeoJSONObject

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

+ (MKPGeoJSONPoint *)pointWithAttributes:(NSDictionary *)attributes;

@end
