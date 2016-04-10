//
//  IWMApplicationBuilder.m
//  IWMTest
//
//  Created by Trevor Doodes on 10/04/2016.
//  Copyright © 2016 Trevor Doodes. All rights reserved.
//

#import "IWMApplicationBuilder.h"
#import "IWMApplication.h"

@implementation IWMApplicationBuilder

- (NSString *)nameFromDictionary:(NSDictionary *)dict {
    return [dict[@"label"] copy];
}

- (NSString *)categoryFromDictionary:(NSDictionary *)dict {
    NSDictionary *catDict = dict[@"attributes"];
    return [catDict[@"term"] copy];
}

- (NSString *)artistFromDictionary:(NSDictionary *)dict {
    return [dict[@"label"] copy];
}

- (NSString *)photoFromArray:(NSArray *)imageArray {
    
    if (imageArray != nil) {
        NSDictionary *firstImageDict = imageArray[0];
        return [firstImageDict[@"label"] copy];
    } else {
        return nil;
    }
    
}

- (NSString *)summaryFromDictionary:(NSDictionary *)dict {
    return [dict[@"label"] copy];
}

- (IWMApplication *)applicationFromDictionary:(NSDictionary *)dictionary {
    
    NSParameterAssert(dictionary != nil);
    
    NSString *name = [self nameFromDictionary:dictionary[@"im:name"]];
    NSString *category = [self categoryFromDictionary:dictionary[@"category"]];
    NSString *artist = [self artistFromDictionary:dictionary[@"im:artist"]];
    NSString *photo = [self photoFromArray:dictionary[@"im:image"]];
    NSString *summary = [self summaryFromDictionary:dictionary[@"summary"]];
    
    IWMApplication *application = [[IWMApplication alloc] initWithName:name
                                                              category:category
                                                                artist:artist
                                                                 photo:photo
                                                               summary:summary];
    return application;
}

@end
