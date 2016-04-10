//
//  IWMNetworkManager.m
//  IWMTest
//
//  Created by Trevor Doodes on 08/04/2016.
//  Copyright © 2016 Trevor Doodes. All rights reserved.
//

#import "IWMNetworkManager.h"
#import "AFNetworking.h"


NSString * const kURL = @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=20/json";

@implementation IWMNetworkManager


- (void)retrieveApplicationsSuccess:(success)success failure:(failure)failure {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:kURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSHTTPURLResponse *httpResp = (NSHTTPURLResponse *)response;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (failure) {
                    failure(error.localizedDescription, httpResp.statusCode);
                }
            });
            
        } else {
            
 
            
            NSDictionary *feed = responseObject[@"feed"];
            NSArray *entries  = feed[@"entry"];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (success) {
                    success(entries);
                }
            });
 
        }
    }];
    [dataTask resume];}

@end
