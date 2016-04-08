//
//  IWMApplicationsManager.h
//  IWMTest
//
//  Created by Trevor Doodes on 08/04/2016.
//  Copyright © 2016 Trevor Doodes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IWMApplicationsManager : NSObject

typedef void (^successBlock) (NSArray *applicationsArray);
typedef void (^failureBlock) (NSString *message);


- (void)getApplicationsWithSuccessBlock:(successBlock)successBlock
                           failureBlock:(failureBlock)failureBlock;

@end
