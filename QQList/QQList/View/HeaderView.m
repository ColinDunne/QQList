//
//  HeaderView.m
//  QQList
//
//  Created by 钱辰 on 3/27/15.
//  Copyright (c) 2015 qianchen. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView {
    UIButton *_arrowButton;
    UILabel *_labelOnline;
}

+ (instancetype)headerViewWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"header";
    HeaderView *header = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!header) {
        header = [[HeaderView alloc] initWithReuseIdentifier:identifier];
    }
    
    return header;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super init]) {
        // create the arrow button
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg_highlighted"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.imageView.contentMode = UIViewContentModeCenter;
        button.imageView.clipsToBounds = NO;
        
        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        _arrowButton = button;
        [self addSubview:_arrowButton];
        
        // create the label to show the online qq number
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        _labelOnline = label;
        [self addSubview:_labelOnline];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _arrowButton.frame = self.bounds;
    _labelOnline.frame = CGRectMake(self.frame.size.width - 70, 0, 60, self.frame.size.height);
}

- (void)setGroupModel:(QQGroupModel *)groupModel {
    _groupModel = groupModel;
    [_arrowButton setTitle:groupModel.name forState:UIControlStateNormal];
    _labelOnline.text = [NSString stringWithFormat:@"%@/%lu",_groupModel.online,(unsigned long)_groupModel.friends.count];
}

- (void)didMoveToSuperview {
    _arrowButton.imageView.transform = self.groupModel.isOpen ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformMakeRotation(0);
}

#pragma mark - Button Action

- (void)buttonAction {
    [self.groupModel toggleOpen];
    
    if ([self.delegate respondsToSelector:@selector(clickView)]) {
        [self.delegate clickView];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
