//
//  TVSTUser.m
//  TVST Demo
//
//  Created by Talal on 24/04/2014.
//  Copyright (c) 2014 Talal. All rights reserved.
//

#import "TVSTUser.h"

@implementation TVSTUser

- (NSString *) description
{
    return [NSString stringWithFormat:@"User #%@ : %@", self.userID, self.name];
}

@end
