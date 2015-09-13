//
//  RootView.m
//  UI通讯录
//
//  Created by 邢家赫 on 15/9/10.
//  Copyright (c) 2015年 邢家赫. All rights reserved.
//

#import "RootView.h"

@implementation RootView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addAllViews];
    }
    return self;
}

-(void)addAllViews
{
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
    
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
//    self.tableView.allowsMultipleSelection = YES;
    [self addSubview:_tableView];
    
    
    //_tableView.separatorColor = [UIColor blueColor];
    _tableView.rowHeight = 100 ;
}














@end
