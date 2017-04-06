//
//  LHMRootViewController.m
//  MJRefreshDemo
//
//  Created by iOSDev on 17/4/6.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LHMRootViewController.h"
#import "LHMRefrshController.h"
@interface LHMRootViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *nameArray;
@end

@implementation LHMRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"刷新样式";
    [self setupData];
    [self.view addSubview:self.tableView];
   
}
-(void)setupData{
    _nameArray=@[@"普通样式刷新",@"gif动画刷新",@"仿新浪微博刷新",@"仿斗鱼刷新",@"仿B站刷新",@"仿饿了么刷新",@"仿九度财经刷新"];
  
}

-(UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        
        tableView.delegate=self;
        tableView.dataSource=self;
        _tableView=tableView;
    }
    return _tableView;
}
#pragma mark--UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:  UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.text=_nameArray[indexPath.row];
    cell.textLabel.textColor=[UIColor colorWithRed:0 green:223 blue:201 alpha:1];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_nameArray count];


}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LHMRefrshController *refreshVC=[[LHMRefrshController alloc]init];
    refreshVC.showType=indexPath.row;
    [self.navigationController pushViewController:refreshVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
