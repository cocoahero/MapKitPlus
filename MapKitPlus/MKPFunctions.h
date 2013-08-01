//
//  MKPFunctions.h
//  MapKitPlus
//
//  Created by Jonathan Baker on 6/14/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#ifndef MapKitPlus_MKPFunctions_h
#define MapKitPlus_MKPFunctions_h

#define MKPLog(fmt, args...) NSLog(@"[MapKitPlus] " fmt, ##args)

/**
 Creates a CLLocationCoordinate2D given an NSArray.
 \param array An NSArray instance in the format of [lon, lat].
 \returns Returns a CLLocationCoorindate2D or kCLLocationCoordinate2DInvalid if the
 array was of invalid format.
 */
CLLocationCoordinate2D MKP_CLLocationCoordinate2DMakeWithArray(NSArray *array) {
    if (array && array.count == 2) {
        double lon = [array[0] doubleValue];
        double lat = [array[1] doubleValue];
        return CLLocationCoordinate2DMake(lat, lon);
    }
    return kCLLocationCoordinate2DInvalid;
}

#endif
