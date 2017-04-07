//
//  LHMDIYHeader.m
//  MJRefreshDemo
//
//  Created by linhongmin on 2017/4/6.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LHMDIYHeader.h"

@interface LHMDIYHeader ()
@property(nonatomic,weak)UIImageView *logo1;
@property(nonatomic,weak)UIImageView *logo2;

@property(nonatomic,weak)UIView *bgView;
@end
@implementation LHMDIYHeader
#pragma mark- 重写方法
#pragma 在这里做一些初始化配置（比如添加子控件）
-(void)prepare{
    [super prepare];
    //设置控件高度
    self.mj_h=100;
    //bgview
    UIView *bgView=[[UIView alloc]init];
    bgView.backgroundColor=kColor(211, 211, 211);
    [self addSubview:bgView];
    self.bgView=bgView;
    //logo
    UIImageView *logo=[[UIImageView alloc]init];
    logo.image=[UIImage imageNamed:@"load_12"];
    [bgView addSubview:logo];
    self.logo1=logo;
}
#pragma mark--设置子控件的布局
-(void)placeSubviews{
    [super placeSubviews];
    self.bgView.frame=self.bounds;
    self.logo1.frame=CGRectMake(0.5*kScreenWidth-25, 0, 50, 50);
    
}
#pragma mark--监听scrollview的contenoffset的改变
-(void)scrollViewContentOffsetDidChange:(NSDictionary *)change{
    [super scrollViewContentOffsetDidChange:change];

}
#pragma mark--监听scrollview的contentsize的改变
-(void)scrollViewContentSizeDidChange:(NSDictionary *)change{
    [super scrollViewContentSizeDidChange:change];
}
#pragma mark--监听scrollview的拖拽状态的改变
-(void)scrollViewPanStateDidChange:(NSDictionary *)change{
    [super scrollViewPanStateDidChange:change];

}
#pragma mark--监听控件的刷新状态
-(void)setState:(MJRefreshState)state{
    MJRefreshCheckState;
    switch (state) {
        case MJRefreshStateIdle:
            
            break;
        case MJRefreshStatePulling:
            
            break;
        case MJRefreshStateRefreshing:
            
            break;
        default:
            break;
    }
}
#pragma mark--监听控件的拖拽比例（控件被拖出来的比例）
-(void)setPullingPercent:(CGFloat)pullingPercent{
    [super setPullingPercent:pullingPercent];

}
@end
