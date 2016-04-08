//
//  IWMApplication.m
//  IWMTest
//
//  Created by Trevor Doodes on 08/04/2016.
//  Copyright © 2016 Trevor Doodes. All rights reserved.
//

#import "IWMApplication.h"

@implementation IWMApplication

- (instancetype)initWithName:(NSString *)name
                    category:(NSString *)category
                      artist:(NSString *)artist
                       photo:(NSString *)photo
                     summary:(NSString *)summary
{
    if (self = [super init]) {
        _name = [name copy];
        _category = [category copy];
        _artist = [artist copy];
        _photo = [photo copy];
        _summary = [summary copy];
    }
    
    return self;
}

@end
