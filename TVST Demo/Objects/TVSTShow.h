//
//  TVSTShow.h
//  TVST Demo
//
//  Created by Talal on 24/04/2014.
//  Copyright (c) 2014 Talal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TVSTShow : NSObject

@property (nonatomic, strong) NSString *showID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *overview;

@property (nonatomic, strong) NSArray *comments;

- (void) getDataOnSuccess:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *result))success onFailure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure;

- (void) getCommentsAtPage:(NSInteger) page limit:(NSInteger) limit OnSuccess:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *result))success onFailure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure;

@end
