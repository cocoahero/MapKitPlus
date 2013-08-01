//
//  MKPGeoJSONPoint.m
//  MapKitPlus
//
//  Created by Jonathan Baker on 7/31/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import "MKPGeoJSONPoint.h"
#import "MKPFunctions.h"

@implementation MKPGeoJSONPoint

#pragma mark - Instance Factory

+ (MKPGeoJSONPoint *)pointWithAttributes:(NSDictionary *)attributes {
    return [[self alloc] initWithAttributes:attributes];
}

#pragma mark - Initializer

- (id)initWithAttributes:(NSDictionary *)attributes {
    if ((self = [super initWithAttributes:attributes])) {
        self.coordinate = MKP_CLLocationCoordinate2DMakeWithArray(attributes[@"coordinates"]);
    }
    return self;
}

@end
