//
//  IWMApplication.h
//  IWMTest
//
//  Created by Trevor Doodes on 08/04/2016.
//  Copyright © 2016 Trevor Doodes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IWMApplication : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *category;
@property (nonatomic, copy, readonly) NSString *artist;
@property (nonatomic, copy, readonly) NSString *photo;
@property (nonatomic, copy, readonly) NSString *summary;

- (instancetype)initWithName:(NSString *)name
                    category:(NSString *)category
                      artist:(NSString *)artist
                       photo:(NSString *)photo
                     summary:(NSString *)summary;
@end
