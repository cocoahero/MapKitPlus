//
//  MapBoxKit_Tests.m
//  MapBoxKit Tests
//
//  Created by Jonathan Baker on 6/14/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MapBoxKit.h"

@interface MBKOnlineTileOverlay_Tests : XCTestCase

@property (nonatomic, strong) MBKOnlineTileOverlay *overlay;

@property (nonatomic, assign) MKTileOverlayPath overlayPath;

@end

@implementation MBKOnlineTileOverlay_Tests

- (void)setUp {
    [super setUp];
    self.overlay = [[MBKOnlineTileOverlay alloc] initWithMapIdentifier:@"account.identifier"];
    self.overlayPath = (MKTileOverlayPath) {305, 489, 12, 1.0f};
}

- (void)testURLForTilePath {    
    NSURL *url = [self.overlay URLForTilePath:self.overlayPath];
    
    NSString *expected = @"/account.identifier/305/489/12.png";
    
    XCTAssertEqualObjects([url path], expected, @"Resultant path should match identifier and coordinates.");
}

- (void)testSecureTransport {    
    self.overlay.useSecureTransport = YES;
    
    NSURL *httpsURL = [self.overlay URLForTilePath:self.overlayPath];
    
    XCTAssertEqualObjects(httpsURL.scheme, @"https", @"Resultant URL should use HTTPS.");
    
    self.overlay.useSecureTransport = NO;
    
    NSURL *httpURL = [self.overlay URLForTilePath:self.overlayPath];
    
    XCTAssertEqualObjects(httpURL.scheme, @"http", @"Resultant URL should use HTTP.");
}

@end
