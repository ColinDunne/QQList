//
//  QQDataModel.m
//  QQList
//
//  Created by 钱辰 on 3/26/15.
//  Copyright (c) 2015 qianchen. All rights reserved.
//

#import "QQDataModel.h"
#import "QQGroupModel.h"

@implementation QQDataModel

- (instancetype)initWithContentsOfFile:(NSString *)path {
    if (self = [super init]) {
        NSArray *dataArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *modelArray = [NSMutableArray arrayWithCapacity:dataArray.count];
        
        for (NSDictionary *dict in dataArray) {
            QQGroupModel *groupModel = [QQGroupModel GroupWithDict:dict];
            [modelArray addObject:groupModel];
        }
        
        self.dataArray = modelArray;
    }
    
    return self;
}

@end
