//
//  MKPGeoJSONFeature.h
//  MapKitPlus
//
//  Created by Jonathan Baker on 7/31/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import "MKPGeoJSON.h"

@interface MKPGeoJSONFeature : MKPGeoJSONObject

@property (nonatomic, strong) MKPGeoJSONObject *geometry;

@property (nonatomic, strong) NSDictionary *properties;

+ (MKPGeoJSONFeature *)featureWithAttributes:(NSDictionary *)attributes;

@end
