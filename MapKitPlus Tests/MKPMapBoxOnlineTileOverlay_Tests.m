//
//  MKPMapBoxOnlineTileOverlay_Tests.m
//  MapKitPlus Tests
//
//  Created by Jonathan Baker on 6/14/13.
//  Copyright (c) 2013 Jonathan Baker. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MapKitPlus.h"

@interface MKPMapBoxOnlineTileOverlay_Tests : XCTestCase

@property (nonatomic, strong) MKPMapBoxOnlineTileOverlay *overlay;

@property (nonatomic, assign) MKTileOverlayPath overlayPath;

@end

@implementation MKPMapBoxOnlineTileOverlay_Tests

- (void)setUp {
    [super setUp];
    self.overlay = [[MKPMapBoxOnlineTileOverlay alloc] initWithMapIdentifier:@"account.identifier"];
    self.overlayPath = (MKTileOverlayPath) {305, 489, 12, 1.0f};
}

- (void)testURLForTilePath {    
    NSURL *url = [self.overlay URLForTilePath:self.overlayPath];
    
    NSString *expected = @"/v3/account.identifier/12/305/489.png";
    
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
