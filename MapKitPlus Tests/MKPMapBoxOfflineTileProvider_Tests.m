//
//  MKPMapBoxOfflineTileProvider_Tests.m
//  MapKitPlus
//
//  Created by Jonathan Baker on 6/14/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MapKitPlus.h"

@interface MKPMapBoxOfflineTileProvider_Tests : XCTestCase

@end

@implementation MKPMapBoxOfflineTileProvider_Tests

- (void)setUp {
    [super setUp];
}

- (void)testOpenDatabase {
    MKPMapBoxOfflineTileProvider *provider = [[MKPMapBoxOfflineTileProvider alloc] initWithURL:nil];
    
    NSError *error = nil;
    [provider open:&error];
    XCTAssertNotNil(error, @"Providing nil URL or path should provide a valid error on open.");
}

@end
