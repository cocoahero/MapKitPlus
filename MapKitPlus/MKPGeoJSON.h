//
//  MKPGeoJSON.h
//  MapKitPlus
//
//  Created by Jonathan Baker on 7/31/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import <Foundation/Foundation.h>

//
//  Error Handling
//
extern NSString * const MKPGeoJSONErrorDomain;

typedef NS_ENUM(NSInteger, MKPGeoJSONErrorCode) {
    MKPInvalidSchemaError = 100,
    MKPUnknownObjectTypeError
};

//
//  Valid Object Types
//
//  GeoJSON objects must belong to one of the types below.
//  See http://www.geojson.org/geojson-spec.html for more info.
//
extern NSString * const MKPGeoJSONTypePoint;
extern NSString * const MKPGeoJSONTypePolygon;
extern NSString * const MKPGeoJSONTypeFeature;
extern NSString * const MKPGeoJSONTypeMultiPoint;
extern NSString * const MKPGeoJSONTypeLineString;
extern NSString * const MKPGeoJSONTypeMultiPolygon;
extern NSString * const MKPGeoJSONTypeMultiLineString;
extern NSString * const MKPGeoJSONTypeFeatureCollection;
extern NSString * const MKPGeoJSONTypeGeometryCollection;

@interface MKPGeoJSON : NSObject

+ (id)GeoJSONObjectWithData:(NSData *)data error:(NSError **)error;

+ (id)GeoJSONObjectWithStream:(NSInputStream *)stream error:(NSError **)error;

+ (id)GeoJSONObjectWithAttributes:(NSDictionary *)dictionary error:(NSError **)error;

@end
