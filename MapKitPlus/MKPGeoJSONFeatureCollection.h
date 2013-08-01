//
//  MKPGeoJSONFeatureCollection.h
//  MapKitPlus
//
//  Created by Jonathan Baker on 7/31/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import "MKPGeoJSON.h"

@interface MKPGeoJSONFeatureCollection : MKPGeoJSONObject

@property (nonatomic, strong) NSArray *features;

+ (MKPGeoJSONFeatureCollection *)featureCollectionWithAttributes:(NSDictionary *)attributes;

@end
