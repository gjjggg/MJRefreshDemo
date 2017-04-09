//
//  LHMDouyuHeader.m
//  MJRefreshDemo
//
//  Created by iOSDev on 17/4/7.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LHMDouyuHeader.h"
#import "UIImageView+LHMExtension.h"
@interface LHMDouyuHeader ()
@property(nonatomic,weak)UIImageView *logo1;
@property(nonatomic,weak)UIImageView *logo2;
@property(nonatomic,weak)UIView *bgView;
@end
@implementation LHMDouyuHeader
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
    //logo1
    UIImageView *logo1=[[UIImageView alloc]init];
    
    [bgView addSubview:logo1];
    self.logo1=logo1;
    //logo2
    UIImageView *logo2=[[UIImageView alloc]init];
    [bgView addSubview:logo2];
    self.logo2=logo2;
    
}
#pragma mark--设置子控件的布局
-(void)placeSubviews{
    [super placeSubviews];
    self.bgView.frame=self.bounds;
    self.logo1.frame=CGRectMake(0.5*kScreenWidth-25, 25, 50, 50);
    //self.logo2.frame=CGRectMake(0.5*kScreenWidth-25, 15, 52, 70);
    self.logo2.frame=CGRectMake(0.5*kScreenWidth-25, 15, 52, 70);
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
            if (oldState==MJRefreshStateRefreshing) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self.logo2 stopGifAnim];
                    [self setupIdleState];
                });
                
            }else{
            [self setupIdleState];
            }
            break;
        case MJRefreshStatePulling:
            [self setupPulingState];
            break;
        case MJRefreshStateRefreshing:
            [self setupRefreshingState];
            break;
        default:
            break;
    }
}
#pragma mark--普通闲置状态
-(void)setupIdleState{
    //[self.logo2 stopGifAnim];
    self.logo1.hidden=NO;
    self.logo2.hidden=YES;
    self.logo1.image=[UIImage imageNamed:@"img_mj_stateIdle"];
}
#pragma mark--松开就可以进行刷新的状态
-(void)setupPulingState{
self.logo1.image=[UIImage imageNamed:@"img_mj_statePulling"];
}
#pragma mark--正在刷新中的状态
-(void)setupRefreshingState{
    UIImage *image1=[UIImage imageNamed:@"img_mj_stateRefreshing_01"];
    UIImage *image2=[UIImage imageNamed:@"img_mj_stateRefreshing_02"];
    UIImage *image3=[UIImage imageNamed:@"img_mj_stateRefreshing_03"];
    UIImage *image4=[UIImage imageNamed:@"img_mj_stateRefreshing_04"];
    NSArray *array=@[image1,image2,image3,image4];
    self.logo1.hidden=YES;
    self.logo2.hidden=NO;
    [self.logo2 playGifAnim:array];
}

#pragma mark--监听控件的拖拽比例（控件被拖出来的比例）
-(void)setPullingPercent:(CGFloat)pullingPercent{
    [super setPullingPercent:pullingPercent];
    
}

@end
