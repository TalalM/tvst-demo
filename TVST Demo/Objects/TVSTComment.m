//
//  TVSTComment.m
//  TVST Demo
//
//  Created by Talal on 24/04/2014.
//  Copyright (c) 2014 Talal. All rights reserved.
//

#import "TVSTComment.h"

@implementation TVSTComment

- (NSString *) description
{
    return [NSString stringWithFormat:@"Comment #%@ by %@: %@", self.commentID, self.user, self.content];
}

@end
