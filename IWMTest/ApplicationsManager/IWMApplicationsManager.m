//
//  IWMApplicationsManager.m
//  IWMTest
//
//  Created by Trevor Doodes on 08/04/2016.
//  Copyright © 2016 Trevor Doodes. All rights reserved.
//

#import "IWMApplicationsManager.h"
#import "IWMNetworkManager.h"
#import "IWMApplication.h"
#import "IWMApplicationBuilder.h"

@interface IWMApplicationsManager ()

@property (nonatomic, strong) NSMutableArray *applicationsArray;
@end

@implementation IWMApplicationsManager


-(instancetype) initWithNetworkManager:(IWMNetworkManager *)networkManager {
    
    if (self = [super init]) {
        _networkManager = networkManager;
    }
    
    return self;
}

- (NSArray *)appsArrayFromaApplicationsArray:(NSArray *)appArray {
    
    IWMApplicationBuilder *applicationBuilder = [[IWMApplicationBuilder alloc] init];

    for (NSDictionary *entry in appArray) {
        IWMApplication *newApp = [applicationBuilder applicationFromDictionary:entry];
        [self.applicationsArray addObject:newApp];
    }
                                  
    return [self.applicationsArray copy];
}

- (void)getApplicationsWithSuccessBlock:(successBlock)successBlock
                                  failureBlock:(failureBlock)failureBlock
{
    
    __weak typeof (self)weakSelf = self;
    [self.networkManager retrieveApplicationsSuccess:^(NSArray *applicationsArray) {
        
        IWMApplicationsManager *blockSelf = weakSelf;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (successBlock) {
                NSArray *appArray = [blockSelf appsArrayFromaApplicationsArray:applicationsArray];
                successBlock(appArray);
            }
        });
        
    } failure:^(NSString *message, NSUInteger statusCode) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (failureBlock) {
                failureBlock(message);
            }
        });
    }];
}

#pragma mark - Accessor Methods
- (NSMutableArray *)applicationsArray {
    
    if (_applicationsArray == nil) {
        _applicationsArray = [NSMutableArray array];
    }
    
    return _applicationsArray;
}

@end
