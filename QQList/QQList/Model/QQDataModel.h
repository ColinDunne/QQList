//
//  QQDataModel.h
//  QQList
//
//  Created by 钱辰 on 3/26/15.
//  Copyright (c) 2015 qianchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QQDataModel : NSObject

@property (nonatomic, strong) NSArray *dataArray;

- (instancetype)initWithContentsOfFile:(NSString *)path;

@end
