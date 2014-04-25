//
//  TVSTShow.m
//  TVST Demo
//
//  Created by Talal on 24/04/2014.
//  Copyright (c) 2014 Talal. All rights reserved.
//

#import "TVSTShow.h"
#import "AppDelegate.h"

@implementation TVSTShow

- (NSString *) description
{
    return [NSString stringWithFormat:@"Show #%@ : %@", self.showID, self.name];
}

- (void) getDataOnSuccess:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *result))success onFailure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure
{
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful); // Anything in 2xx
    NSString *url = [[NSString alloc] initWithFormat:@"/v2/show/%@/data/en", self.showID];
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[AppDelegate showMapping] method:RKRequestMethodGET pathPattern:url keyPath:@"" statusCodes:statusCodes];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", kApiUrl, url]]];
    RKObjectRequestOperation *operation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        success(operation, result);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
    [operation start];
}

- (void) getCommentsAtPage:(NSInteger) page limit:(NSInteger) limit OnSuccess:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *result))success onFailure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure
{
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful); // Anything in 2xx
    NSString *urlPath = @"/v2/show/%@/comments";
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[AppDelegate commentMapping] method:RKRequestMethodGET pathPattern:urlPath keyPath:nil statusCodes:statusCodes];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@?page=%d&limit=%d", kApiUrl, urlPath, page, limit]]];
    RKObjectRequestOperation *operation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        success(operation, result);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
    [operation start];
}


@end
