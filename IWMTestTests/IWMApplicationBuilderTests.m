\
//
//  IWMApplicationBuilderTests.m
//  IWMTest
//
//  Created by Trevor Doodes on 10/04/2016.
//  Copyright © 2016 Trevor Doodes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IWMApplicationBuilder.h"
#import "IWMApplication.h"

@interface IWMApplicationBuilderTests : XCTestCase

@property (nonatomic, strong) IWMApplicationBuilder *applicationBuilder;
@end

@implementation IWMApplicationBuilderTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.applicationBuilder = [[IWMApplicationBuilder alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.applicationBuilder = nil;
    [super tearDown];
}

- (void)testThatnilIsNotAnAcceptableParameter {
    XCTAssertThrows([self.applicationBuilder applicationFromDictionary:nil], @"Should throw error if dictionary is nil");
}


- (void)testCanBuildApplicationFromDictionary {
    
    NSString *filePath = [[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingPathComponent:@"application.json"];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    NSError* error = nil;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    
    NSDictionary *feed = result[@"feed"];
    NSDictionary *entry = feed[@"entry"];
    
    IWMApplication *application = [self.applicationBuilder applicationFromDictionary:entry];
    
    XCTAssertEqualObjects(application.name, @"Minecraft: Pocket Edition", @"Should set name correctly");
    XCTAssertEqualObjects(application.category, @"Games", @"Should set category correctly");
    XCTAssertEqualObjects(application.artist, @"Mojang", @"Should set author correctly");
    XCTAssertEqualObjects(application.photo, @"http://is3.mzstatic.com/image/thumb/Purple49/v4/29/ac/a6/29aca63f-d84b-d6fd-b2d8-ef6b66690320/mzl.eaarmayi.png/53x53bb-85.png", @"Should set photo link correctly");
    XCTAssertEqualObjects(application.summary, @"Our latest free update includes a new Story Mode Skin Pack - free through April 13th! Don one of 27 new skins and try your hand at our free Story Mode-themed map: http://aka.ms/storymodemap. Assemble a team of adventurers and see how long you can survive!\n\nExplore randomly generated worlds and build amazing things from the simplest of homes to the grandest of castles. Play in creative mode with unlimited resources or mine deep into the world in survival mode, crafting weapons and armor to fend off the dangerous mobs.\n\nCraft, create, and explore alone, or with friends on mobile devices or Windows 10.", @"Should set summary correctly");
}


@end
