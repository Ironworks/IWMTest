//
//  IWMApplicationTests.m
//  IWMTest
//
//  Created by Trevor Doodes on 08/04/2016.
//  Copyright © 2016 Trevor Doodes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IWMApplication.h"

@interface IWMApplicationTests : XCTestCase

@property (nonatomic, strong) IWMApplication *application;

@end

@implementation IWMApplicationTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.application = [[IWMApplication alloc] initWithName:@"MyApp"
                                                   category:@"Applications"
                                                     artist:@"Artist"
                                                      photo:@"http://example.com/photo.png"
                                                    summary:@"Application Summary"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.application = nil;
    [super tearDown];
}

- (void)testCanCreateApplication {
    XCTAssertNotNil(self.application, @"Should be able to create application object");
}


- (void)testCanGiveApplicationAName {
    XCTAssertEqualObjects(self.application.name, @"MyApp", @"Should be able to name app");
}

- (void)testCanSetCategoryForApplication {
    XCTAssertEqualObjects(self.application.category, @"Applications", @"Should be able to give application a category");
}

- (void)testCaSetArtistForApplication {
    XCTAssertEqualObjects(self.application.artist, @"Artist", @"Should be able to set srtist on application");
}

- (void)testCanAddPhotoToApplication {
    XCTAssertEqualObjects(self.application.photo, @"http://example.com/photo.png", @"Should be able to add photo to application");
}

- (void)testCanAddSummaryToApplication {
    XCTAssertEqualObjects(self.application.summary, @"Application Summary", @"Should be able to add a summary to the application");
}

@end
