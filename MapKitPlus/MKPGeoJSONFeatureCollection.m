//
//  MKPGeoJSONFeatureCollection.m
//  MapKitPlus
//
//  Created by Jonathan Baker on 7/31/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import "MKPGeoJSONFeatureCollection.h"

@implementation MKPGeoJSONFeatureCollection

#pragma mark - Instance Factory

+ (MKPGeoJSONFeatureCollection *)featureCollectionWithAttributes:(NSDictionary *)attributes {
    return [[self alloc] initWithAttributes:attributes];
}

#pragma mark - Initalizer

- (id)initWithAttributes:(NSDictionary *)attributes {
    if ((self = [super initWithAttributes:attributes])) {
        NSArray *featuresAttrs = attributes[@"features"];
        NSMutableArray *features = [NSMutableArray array];
        [featuresAttrs enumerateObjectsUsingBlock:^(NSDictionary *featureAttrs, NSUInteger idx, BOOL *stop) {
            MKPGeoJSONFeature *feature = [MKPGeoJSONFeature featureWithAttributes:featureAttrs];
            if (feature) {
                [features addObject:feature];
            }
        }];
        self.features = features;
    }
    return self;
}

@end
