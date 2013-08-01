//
//  MKPGeoJSONFeature.m
//  MapKitPlus
//
//  Created by Jonathan Baker on 7/31/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import "MKPGeoJSONFeature.h"
#import "MKPFunctions.h"

@implementation MKPGeoJSONFeature

#pragma mark - Instance Factory

+ (MKPGeoJSONFeature *)featureWithAttributes:(NSDictionary *)attributes {
    return [[self alloc] initWithAttributes:attributes];
}

#pragma mark - Initalizer

- (id)initWithAttributes:(NSDictionary *)attributes {
    if ((self = [super initWithAttributes:attributes])) {
        NSDictionary *geometryAttrs = attributes[@"geometry"];
        if (geometryAttrs) {
            NSError *error = nil;
            if (!(self.geometry = [MKPGeoJSON GeoJSONObjectWithAttributes:geometryAttrs error:&error])) {
                MKPLog(@"Failed to parse geometry for feature!\n%@", error);
            }
        }
        self.properties = attributes[@"properties"];
    }
    return self;
}

@end
