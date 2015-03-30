//
//  QQGroupModel.m
//  QQList
//
//  Created by 钱辰 on 3/26/15.
//  Copyright (c) 2015 qianchen. All rights reserved.
//

#import "QQGroupModel.h"
#import "QQFirendModel.h"

@implementation QQGroupModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *friendsArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in self.friends) {
            QQFirendModel *friend = [QQFirendModel FriendWithDict:dict];
            [friendsArray addObject:friend];
        }
        
        self.friends = friendsArray;
        
    }
    
    return self;
}

+ (instancetype)GroupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (void)toggleOpen {
    self.isOpen = !self.isOpen;
}

@end
