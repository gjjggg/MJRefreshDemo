//
//  LHMRefrshController.m
//  MJRefreshDemo
//
//  Created by iOSDev on 17/4/6.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LHMRefrshController.h"
#import "UIImage+LHMExtension.h"
#import "MJRefresh.h"

#import "LHMDouyuHeader.h"//自定义
#import "LHMBilbiliHeader.h"

@interface LHMRefrshController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)NSArray *nameArray;
@end

@implementation LHMRefrshController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self setupData];
    self.title=_nameArray[self.showType];
    
}

-(UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        tableView.delegate=self;
        tableView.dataSource=self;
        _tableView=tableView;
        [self setRefreshType:self.showType];
    }
    return _tableView;
}
#pragma mark--加载不同的刷新样式
-(void)setRefreshType:(ShowType )showType{
    if (showType==ShowTypeNormal) {//普通样式
        _tableView.mj_header=[self setupNormalRefresh];
       
    }else if (showType==ShowTypeGif){//gif动画
        _tableView.mj_header=[self setupGifRefresh];
        
    }else if (showType==ShowTypeSina){//新浪微博
        
        _tableView.mj_header=[self setupSinaRefresh];
        
    }else if (showType==ShowTypeDouYu){//斗鱼
        _tableView.mj_header=[self setupDouyuRefresh];
        
        
    }else if (showType==ShowTypeBilibili1){//B站1
         _tableView.mj_header=[self setupBilibiliRefresh];
        
        
    }else if (showType==ShowTypeBilibili2){//B站2
       
        
        
    }else if (showType==ShowTypeEleme){//饿了么
        
        
    }else if (showType==ShowTypeJiudu){//九度财经
        
        _tableView.mj_header=[self setJiuduRefresh];
    }
    
    
    
    
    
    
}

-(void)setShowType:(ShowType)showType{
    _showType=showType;
    [self.view addSubview:self.tableView];
}
#pragma mark--普通样式
-(MJRefreshNormalHeader *)setupNormalRefresh{
    MJRefreshNormalHeader *header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(myRefresh)];
 
    return header;

}
#pragma mark---普通的gif
-(MJRefreshGifHeader *)setupGifRefresh{
    MJRefreshGifHeader *header=[MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(myRefresh)];
    header.stateLabel.hidden=YES;
    header.lastUpdatedTimeLabel.hidden=YES;

    [header setImages:[UIImage gifImages] forState:MJRefreshStatePulling];
    [header setImages:[UIImage gifImages] forState:MJRefreshStateRefreshing];
    [header setImages:[UIImage gifImages] forState:MJRefreshStateIdle];
    return header;
}
#pragma mark---新浪微博
-(MJRefreshNormalHeader *)setupSinaRefresh{
    MJRefreshNormalHeader *header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(myRefresh)];
       header.lastUpdatedTimeLabel.hidden=YES;
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"释放更新" forState:MJRefreshStatePulling];
    [header setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    
    return header;
}
#pragma mark--斗鱼
-(LHMDouyuHeader *)setupDouyuRefresh{
    LHMDouyuHeader *header=[LHMDouyuHeader headerWithRefreshingTarget:self refreshingAction:@selector(myRefresh)];
    
    
    
    return header;
    
    
    
    
}
-(LHMBilbiliHeader *)setupBilibiliRefresh{
    LHMBilbiliHeader *header=[LHMBilbiliHeader headerWithRefreshingTarget:self refreshingAction:@selector(myRefresh)];
    return header;
}
#pragma mark--九度财经
-(MJRefreshGifHeader *)setJiuduRefresh{
    MJRefreshGifHeader *header=[MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(myRefresh)];
    
   NSArray *images=[UIImage jiuduImages];
    [header setImages:images forState:MJRefreshStateRefreshing];
    [header setImages:images forState:MJRefreshStatePulling];
    [header setTitle:@"松开手指进行刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"努力刷新中" forState:MJRefreshStateRefreshing];
    return header;
    
}
#pragma mark--刷新操作
-(void)myRefresh{
    //模拟场景,实际中不需要
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.tableView.mj_header endRefreshing];
    });




}
#pragma mark--UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.text=_dataArray[indexPath.row];
    cell.textLabel.textColor=[UIColor colorWithRed:0 green:223 blue:201 alpha:1];
    return cell;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return  [_dataArray count];
}

-(void)setupData{
    _dataArray=@[@"疾风剑豪",@"德玛西亚之力",@"伊泽瑞尔",@"熔岩巨兽",@"卡米尔",@"兰博",@"盲审_李青",@"德玛西亚之翼",@"寒冰射手",@"维鲁斯",@"红领烬",@"Faker",@"世界第一ADC_UZI",@"麻辣叉鸡",@"mid_虎",@"ming神",@"Letme",@"clearlove_4396",@"韦神"];
    _nameArray=@[@"普通样式",@"gif动画",@"仿新浪微博",@"仿斗鱼",@"仿B站1",@"仿B站2",@"仿饿了么",@"仿九度财经"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
