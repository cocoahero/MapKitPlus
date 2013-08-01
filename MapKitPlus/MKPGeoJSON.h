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

/**
 Abstract parent class of all GeoJSON object subtypes. You should not create an instance of this class directly.
 Instead, use [MKPGeoJSON GeoJSONObjectWithAttributes: error:] to get a properly cast instance that represents
 a particular type of GeoJSON object.
 */
@interface MKPGeoJSONObject : NSObject

@property (nonatomic, strong) NSString *type;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end

/**
 You can use the MKPGeoJSON class to parse GeoJSON structured JSON into 
 subclasses of MKPGeoJSONObject that represent each possible type.
 */
@interface MKPGeoJSON : NSObject

+ (MKPGeoJSONObject *)GeoJSONObjectWithData:(NSData *)data error:(NSError **)error;

+ (MKPGeoJSONObject *)GeoJSONObjectWithStream:(NSInputStream *)stream error:(NSError **)error;

+ (MKPGeoJSONObject *)GeoJSONObjectWithAttributes:(NSDictionary *)attributes error:(NSError **)error;

@end

#import "MKPGeoJSONPoint.h"
