//
//  TVSTComment.h
//  TVST Demo
//
//  Created by Talal on 24/04/2014.
//  Copyright (c) 2014 Talal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TVSTUser.h"

@interface TVSTComment : NSObject

@property (nonatomic, strong) NSString *commentID;

@property (nonatomic, strong) TVSTUser *user;

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, strong) NSString *content;

@end
