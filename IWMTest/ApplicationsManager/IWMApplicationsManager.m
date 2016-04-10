//
//  IWMApplicationsManager.m
//  IWMTest
//
//  Created by Trevor Doodes on 08/04/2016.
//  Copyright © 2016 Trevor Doodes. All rights reserved.
//

#import "IWMApplicationsManager.h"
#import "IWMNetworkManager.h"

@implementation IWMApplicationsManager


-(instancetype) initWithNetworkManager:(IWMNetworkManager *)networkManager {
    
    if (self = [super init]) {
        _networkManager = networkManager;
    }
    
    return self;
}

- (void)getApplicationsWithSuccessBlock:(successBlock)successBlock
                                    failureBlock:(failureBlock)failureBlock
{
    
}

@end
