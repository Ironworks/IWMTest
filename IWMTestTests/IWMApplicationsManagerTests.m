//
//  IWMApplicationsManagerTests.m
//  IWMTest
//
//  Created by Trevor Doodes on 08/04/2016.
//  Copyright © 2016 Trevor Doodes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "IWMApplicationsManager.h"
#import "IWMApplication.h"
#import "IWMNetworkManager.h"

@interface IWMApplicationsManagerTests : XCTestCase

@property (nonatomic, strong) IWMApplicationsManager *mgr;
@end

@implementation IWMApplicationsManagerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    IWMNetworkManager *networkManager = [[IWMNetworkManager alloc] init];
    self.mgr = [[IWMApplicationsManager alloc] initWithNetworkManager:networkManager];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.mgr = nil;
    [super tearDown];
}

- (NSArray *)stubResults {
    
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:20];
    IWMApplication *app = [[IWMApplication alloc] initWithName:@"App"
                                                      category:@"Games"
                                                        artist:@"Rockstar games"
                                                         photo:@"http://example.com/image.png"
                                                       summary:@"A game"];
    
    for (int i = 0; i < 20; i++) {
        [results addObject:app];
    }
    
    return results;
}

- (void)testCanCreateAnApplicationManagerObject {
    
    XCTAssertNotNil(self.mgr, @"Should be able to create an applications manager");
}

- (void)testCanSetNetworkManager {
    
    XCTAssertNotNil(self.mgr.networkManager, @"Should be able to set newtwork manager");
}

- (void)testCanGetListOfApplications {
    
    id sut = [OCMockObject mockForClass:[IWMApplicationsManager class]];
    [[[sut stub] andDo:^(NSInvocation *invocation) {
        //Our stubbed results
        NSArray *applications = [self stubResults];
        successBlock blockToExecute = nil;
        
        [invocation getArgument:&blockToExecute atIndex:2];
        
        blockToExecute(applications);
    }] getApplicationsWithSuccessBlock:[OCMArg any]
                       failureBlock:[OCMArg any]];
    
    
    [sut getApplicationsWithSuccessBlock:^(NSArray *applicationsArray) {
        XCTAssertTrue(applicationsArray.count == 20, @"Array should have data");
    } failureBlock:^(NSString *message) {
        //Should not see this in our test
        XCTAssertTrue(NO, @"Should not have an error");
    }];
}

@end
