//
//  ListTableViewController.m
//  QQList
//
//  Created by 钱辰 on 3/26/15.
//  Copyright (c) 2015 qianchen. All rights reserved.
//

#import "ListTableViewController.h"
#import "QQDataModel.h"
#import "QQGroupModel.h"
#import "QQFirendModel.h"
#import "HeaderView.h"
#import "DetailViewController.h"

@interface ListTableViewController () <HeaderViewDelegate>

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionHeaderHeight = 40;
    [self clipExtraCellLine:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataModel.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    QQGroupModel *groupModel = self.dataModel.dataArray[section];
    NSInteger count = groupModel.isOpen ? groupModel.friends.count : 0;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *indentifier = @"CellForFriends";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:indentifier];
    }
    
    QQGroupModel *groupModel = self.dataModel.dataArray[indexPath.section];
    QQFirendModel *friendModel = groupModel.friends[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:friendModel.icon];
    cell.textLabel.text = friendModel.name;
    cell.detailTextLabel.text = friendModel.intro;
    
    return cell;
}

#pragma mark - Table View Delegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HeaderView *headerView = [HeaderView headerViewWithTableView:tableView];
    headerView.delegate = self;
    headerView.groupModel = self.dataModel.dataArray[section];
    
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *controller = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:controller animated:NO];
}

#pragma mark - Header View Delegate

- (void)clickView {
    [self.tableView reloadData];
}

#pragma mark - Clear the Extra Lines

- (void)clipExtraCellLine:(UITableView *)tableview {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    
    [self.tableView setTableFooterView:view];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
