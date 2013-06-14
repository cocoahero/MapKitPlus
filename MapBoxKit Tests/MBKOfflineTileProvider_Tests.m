//
//  MBKOfflineTileProvider_Tests.m
//  MapBoxKit
//
//  Created by Jonathan Baker on 6/14/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MapBoxKit.h"

@interface MBKOfflineTileProvider_Tests : XCTestCase

@end

@implementation MBKOfflineTileProvider_Tests

- (void)setUp {
    [super setUp];
}

- (void)testOpenDatabase {
    MBKOfflineTileProvider *provider = [[MBKOfflineTileProvider alloc] initWithURL:nil];
    
    NSError *error = nil;
    [provider open:&error];
    XCTAssertNotNil(error, @"Providing nil URL or path should provide a valid error on open.");
}

@end
