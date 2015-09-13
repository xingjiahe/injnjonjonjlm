//
//  RootViewController.m
//  UI通讯录
//
//  Created by 邢家赫 on 15/9/10.
//  Copyright (c) 2015年 邢家赫. All rights reserved.
//

#import "RootViewController.h"
#import "ShowViewController.h"
#import "RootView.h"
#import "Person.h"
@interface RootViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) RootView *rootVeiw;
@property(nonatomic,copy) NSMutableArray *biggerArrays;
@property(nonatomic,strong) Person *person;

@end

@implementation RootViewController

-(void)loadView
{
    self.rootVeiw = [[RootView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.rootVeiw;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"通讯录";

    self.rootVeiw.tableView.delegate = self;
    
    self.rootVeiw.tableView.dataSource = self;
    
   
    
    //加载数据
    [self loadData];
    
    //添加编辑按钮
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(editBarButtonAction:)];
    
    

}

-(void)editBarButtonAction:(UIBarButtonItem *)sender
{
    if (self.rootVeiw.tableView.editing == YES) {
        sender.title = @"编辑";
    }
    else
    {
       sender.title = @"完成";
    }
    
    //设置取反状态
    [self.rootVeiw.tableView setEditing:!self.rootVeiw.tableView.editing animated:YES];

}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *sec = self.biggerArrays[indexPath.section];
    
    //Person *p = sec[indexPath.row];
    
    if (sec.count == 1 ) {
        //更新数据
        [self.biggerArrays removeObject:self.biggerArrays[indexPath.section]];
        
        //更新页面
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:indexPath.section];
        [tableView deleteSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else
    {
        //更新数据
        [sec removeObjectAtIndex:indexPath.row];
        
        //更新页面
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return @"别删我";
}




//处理移动过程
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //更新数据
    
    //1.获取key
    Person *p = self.biggerArrays[sourceIndexPath.section][sourceIndexPath.row];
    NSLog(@"%@",p);
    
    
    if (self.biggerArrays[sourceIndexPath.section] == self.biggerArrays[destinationIndexPath.section]) {
        
        [self.biggerArrays removeObject:p];

        [self.biggerArrays[sourceIndexPath.section] insertObject:p atIndex:destinationIndexPath.row];
    }
    else
    {
        
        NSMutableArray *sec = self.biggerArrays[sourceIndexPath.section];
        
        [self.biggerArrays[sourceIndexPath.section] removeObject:p];

        if (sec.count == 0) {
            
            [self.biggerArrays[destinationIndexPath.section] insertObject:p atIndex:destinationIndexPath.row] ;
            
            [self.biggerArrays removeObject:sec];
            
            //更新页面
            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:sourceIndexPath.section];
            [tableView deleteSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];

            
        }
        else
        {
        
        //可以跨分组移动但是没能删除分组头标题
            [self.biggerArrays[sourceIndexPath.section] removeObject:p];
            
            [self.biggerArrays[destinationIndexPath.section] insertObject:p atIndex:destinationIndexPath.row];
            
            NSLog(@"%@",self.biggerArrays[destinationIndexPath.section][destinationIndexPath.row]);
            
      }
        
    }
    
    
    //4.先删除
    
    //5.后插入
    
    
    
//    Person *p1 = self.biggerArrays[sourceIndexPath.section][sourceIndexPath.row];
    //Person *p1 = [[Person alloc] initWithName:p.name number:p.number image:p.image age:p.age group:@""];
    //Person *p2 = [p copy];
    
    
    
}
//设置禁止跨分区移动
//- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
//{
//    //如果原来分区和目标的分区相等,就返回目标分区
//    if (sourceIndexPath.section != proposedDestinationIndexPath.section) {
//        
//    
//        //return sourceIndexPath;
//        return proposedDestinationIndexPath;
//        
//    }
//    else{
//        //否则返回原来分区
//        return sourceIndexPath;
//        
//    }
//}







-(void)loadData
{
    Person *p1 = [[Person alloc]initWithName:@"zang" number:@"13298897832" image:@"h1.jpeg" age:15 group:@"Z"];
    Person *p2 = [[Person alloc]initWithName:@"wang" number:@"13298897831" image:@"h2.jpeg" age:17 group:@"W"];
    Person *p3 = [[Person alloc]initWithName:@"zhao" number:@"13298897834" image:@"h3.jpeg" age:18 group:@"Z"];
    Person *p4 = [[Person alloc]initWithName:@"wangxiao" number:@"13298897835" image:@"h4.jpeg" age:16 group:@"W"];
    
    _biggerArrays = [NSMutableArray arrayWithObjects:[NSMutableArray arrayWithObjects:p1,p3, nil],[NSMutableArray arrayWithObjects:p2,p4, nil] ,nil];
    
    
    
    
}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    ShowViewController *showVC = [ShowViewController new];
    showVC.per = _biggerArrays[indexPath.section][indexPath.row];
    
    [self.navigationController pushViewController:showVC animated:YES];
    

}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"%ld %ld",indexPath.section,indexPath.row);
//    ShowViewController *showVC = [ShowViewController new];
//    showVC.per = _biggerArrays[indexPath.section][indexPath.row];
//    
//    [self.navigationController pushViewController:showVC animated:YES];
//    
//    
//}




- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
//    NSArray *array = self.biggerArrays[section];
//    Person *P = array[0];
    return @"联系人";
}

//返回分组个数   //不设置就无法分组(识别不出有几个组,给下面的方法用)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _biggerArrays.count;
    
}


//设置每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSArray *smallArray = _biggerArrays[section];

    NSLog(@"%ld",smallArray.count);
    return smallArray.count;
    
    return 0;
    
}




////设置每行显示内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        
    
    //0.创建标示符
    static NSString *cellID = @"fadsfads";
    
    //1.从重用队列中获取cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    //2. 判断是否存在,如果不存在,则创建
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc ] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID  ];
    }
    
    //3. 使用
    _person = _biggerArrays[indexPath.section][indexPath.row];
    cell.textLabel.text = _person.name;
    cell.accessoryType = UITableViewCellAccessoryDetailButton ;
    cell.imageView.image = [UIImage imageNamed:_person.image];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"年龄:%ld岁",_person.age];
    //4. 返回
    
   
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
