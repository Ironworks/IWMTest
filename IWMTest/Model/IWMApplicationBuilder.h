//
//  IWMApplicationBuilder.h
//  IWMTest
//
//  Created by Trevor Doodes on 10/04/2016.
//  Copyright © 2016 Trevor Doodes. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IWMApplication;
@interface IWMApplicationBuilder : NSObject

- (IWMApplication *)applicationFromDictionary:(NSDictionary *)dictionary;
@end
