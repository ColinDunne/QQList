//
//  HeaderView.h
//  QQList
//
//  Created by 钱辰 on 3/27/15.
//  Copyright (c) 2015 qianchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QQGroupModel.h"
@protocol HeaderViewDelegate <NSObject>
- (void)clickView;
@end

@interface HeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) QQGroupModel *groupModel;
@property (nonatomic, assign) id<HeaderViewDelegate> delegate;

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

@end
