//
//  QQFirendModel.m
//  QQList
//
//  Created by 钱辰 on 3/26/15.
//  Copyright (c) 2015 qianchen. All rights reserved.
//

#import "QQFirendModel.h"

@implementation QQFirendModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+ (instancetype)FriendWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
