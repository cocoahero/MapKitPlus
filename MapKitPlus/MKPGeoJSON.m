//
//  MKPGeoJSON.m
//  MapKitPlus
//
//  Created by Jonathan Baker on 7/31/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import "MKPGeoJSON.h"

NSString * const MKPGeoJSONErrorDomain = @"com.cocoahero.mapkitplus.geojson.ErrorDomain";

NSString * const MKPGeoJSONTypePoint = @"Point";
NSString * const MKPGeoJSONTypeMultiPoint = @"MultiPoint";
NSString * const MKPGeoJSONTypeLineString = @"LineString";
NSString * const MKPGeoJSONTypeMultiLineString = @"MultiLineString";
NSString * const MKPGeoJSONTypePolygon = @"Polygon";
NSString * const MKPGeoJSONTypeMultiPolygon = @"MultiPolygon";
NSString * const MKPGeoJSONTypeGeometryCollection = @"GeometryCollection";
NSString * const MKPGeoJSONTypeFeature = @"Feature";
NSString * const MKPGeoJSONTypeFeatureCollection = @"FeatureCollection";

@implementation MKPGeoJSONObject

#pragma mark - Initalizer

- (id)initWithAttributes:(NSDictionary *)attributes {
    if ((self = [super init])) {
        self.type = attributes[@"type"];
    }
    return self;
}

@end

@implementation MKPGeoJSON

+ (id)GeoJSONObjectWithData:(NSData *)data error:(NSError *__autoreleasing *)error {
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                               options:kNilOptions
                                                                 error:error];
    if (dictionary) {
        return [self GeoJSONObjectWithAttributes:dictionary error:error];
    }
    
    return nil;
}

+ (id)GeoJSONObjectWithStream:(NSInputStream *)stream error:(NSError *__autoreleasing *)error {
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithStream:stream
                                                                 options:kNilOptions
                                                                   error:error];
    if (dictionary) {
        return [self GeoJSONObjectWithAttributes:dictionary error:error];
    }
    
    return nil;
}

+ (id)GeoJSONObjectWithAttributes:(NSDictionary *)attributes error:(NSError *__autoreleasing *)error {
    NSString *type = attributes[@"type"];
    
    if (!type || !type.length) {
        *error = [self errorForInvalidSchema];
        return nil;
    }
    
    if ([MKPGeoJSONTypePoint isEqualToString:type]) {
        return [MKPGeoJSONPoint pointWithAttributes:attributes];
    }
    
    if ([MKPGeoJSONTypePolygon isEqualToString:type]) {
        return nil;
    }
    
    if ([MKPGeoJSONTypeFeature isEqualToString:type]) {
        return [MKPGeoJSONFeature featureWithAttributes:attributes];
    }
    
    if ([MKPGeoJSONTypeMultiPoint isEqualToString:type]) {
        return nil;
    }
    
    if ([MKPGeoJSONTypeLineString isEqualToString:type]) {
        return nil;
    }
    
    if ([MKPGeoJSONTypeMultiPolygon isEqualToString:type]) {
        return nil;
    }
    
    if ([MKPGeoJSONTypeMultiLineString isEqualToString:type]) {
        return nil;
    }
    
    if ([MKPGeoJSONTypeFeatureCollection isEqualToString:type]) {
        return nil;
    }
    
    if ([MKPGeoJSONTypeGeometryCollection isEqualToString:type]) {
        return nil;
    }
    
    *error = [self errorForInvalidType:type];
    
    return nil;
}

#pragma mark - Error Generators

+ (NSError *)errorForInvalidSchema {
    return [NSError errorWithDomain:MKPGeoJSONErrorDomain code:MKPInvalidSchemaError userInfo:@{
        NSLocalizedDescriptionKey: @"The GeoJSON object's schema is invalid."
    }];
}

+ (NSError *)errorForInvalidType:(NSString *)type {
    return [NSError errorWithDomain:MKPGeoJSONErrorDomain code:MKPUnknownObjectTypeError userInfo:@{
        NSLocalizedDescriptionKey: [NSString stringWithFormat:@"The GeoJSON object's type \"%@\" is invalid.", type]
    }];
}

@end
