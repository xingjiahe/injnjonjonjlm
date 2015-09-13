//
//  ShowViewController.m
//  UI通讯录
//
//  Created by 邢家赫 on 15/9/10.
//  Copyright (c) 2015年 邢家赫. All rights reserved.
//

#import "ShowViewController.h"
#import "ShowView.h"
#import "RootView.h"
#import "RootViewController.h"
@interface ShowViewController ()

@property(nonatomic,strong ) ShowView *showView;

@end

@implementation ShowViewController

-(void)loadView
{
    self.showView = [[ShowView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.showView.backgroundColor = [UIColor cyanColor];
    self.view = self.showView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.per.image]];

    image.frame = CGRectMake(100, 100, self.view.frame.size.width - 200, 200);
    [self.view addSubview:image];

    UILabel *namelable = [[UILabel alloc] initWithFrame:CGRectMake(100, 350, self.view.frame.size.width - 200, 50)];
    namelable.textAlignment = NSTextAlignmentCenter;
    namelable.text = self.per.name;
    [self.view addSubview:namelable];
    
    UILabel *numberlabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 450, self.view.frame.size.width - 200, 50)];
    numberlabel.textAlignment = NSTextAlignmentCenter;
    numberlabel.text = self.per.number;
    [self.view addSubview:numberlabel];
    
    UILabel *agelabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 550, self.view.frame.size.width - 200, 50)];
    agelabel.textAlignment =NSTextAlignmentCenter;
    NSString *name = [NSString stringWithFormat:@"年龄:%ld岁",self.per.age];
    agelabel.text = name;
    
    [self.view addSubview:agelabel];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
