//
//  QQGroupModel.h
//  QQList
//
//  Created by 钱辰 on 3/26/15.
//  Copyright (c) 2015 qianchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QQFirendModel;

@interface QQGroupModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *online;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, strong) QQFirendModel *friendModel;
@property (nonatomic, assign) BOOL isOpen;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)GroupWithDict:(NSDictionary *)dict;

- (void)toggleOpen;

@end
