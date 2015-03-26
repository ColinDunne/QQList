//
//  ListTableViewController.h
//  QQList
//
//  Created by 钱辰 on 3/26/15.
//  Copyright (c) 2015 qianchen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QQDataModel;

@interface ListTableViewController : UITableViewController

@property (nonatomic, strong) QQDataModel *dataModel;

@end
