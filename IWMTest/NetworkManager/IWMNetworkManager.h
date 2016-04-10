//
//  IWMNetworkManager.h
//  IWMTest
//
//  Created by Trevor Doodes on 08/04/2016.
//  Copyright © 2016 Trevor Doodes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IWMNetworkManager : NSObject

typedef void (^success) (NSArray *applicationsArray);
typedef void (^failure) (NSString *message, NSUInteger statusCode);


- (void)retrieveApplicationsSuccess:(success)success
                            faulure:(failure)failure;

@end
