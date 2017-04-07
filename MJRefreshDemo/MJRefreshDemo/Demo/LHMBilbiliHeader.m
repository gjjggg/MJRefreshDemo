//
//  LHMBilbiliHeader.m
//  MJRefreshDemo
//
//  Created by iOSDev on 17/4/7.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LHMBilbiliHeader.h"
#import "UIImageView+LHMExtension.h"
@interface LHMBilbiliHeader ()
@property(nonatomic,weak)UILabel *stateLabel;
@property(nonatomic,weak)UIImageView *logo;
@property(nonatomic,weak)UIImageView *arrow;
@property(nonatomic,weak)UIActivityIndicatorView *loading;

@end
@implementation LHMBilbiliHeader

#pragma mark- 重写方法
#pragma 在这里做一些初始化配置（比如添加子控件）
-(void)prepare{
    [super prepare];
    //设置控件高度
    self.mj_h=100;
   
    //logo1
    UIImageView *logo=[[UIImageView alloc]init];
    [self addSubview:logo];
    self.logo=logo;
    //arrow
    UIImageView *arrow=[[UIImageView alloc]init];
    arrow.image=[UIImage imageNamed:@"arrow"];
    [self addSubview:arrow];
    self.arrow=arrow;
    //stateLabel
    UILabel *stateLabel=[[UILabel alloc]init];
    [self addSubview:stateLabel];
    self.stateLabel=stateLabel;
    //loading
    UIActivityIndicatorView *loading =[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:loading];
    self.loading=loading;
    
}
#pragma mark--设置子控件的布局
-(void)placeSubviews{
    [super placeSubviews];

    self.logo.frame=CGRectMake(0.5*kScreenWidth-165*0.5, 25, 165, 50);
    self.stateLabel.frame=CGRectMake(0.5*kScreenWidth-165*0.5, 75, 200, 25);
    self.arrow.frame=CGRectMake(0.5*kScreenWidth-165*0.5-40, 72, 34, 28);
    self.loading.frame=CGRectMake(0.5*kScreenWidth-165*0.5-40, 72, 34, 28);
    
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
                    [self.logo stopGifAnim];
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
   
    self.logo.image=[UIImage imageNamed:@"common_pull_loading_1"];
    self.stateLabel.text=@"再拉,再拉就刷给你看";
    [self.loading stopAnimating];
    self.arrow.transform=CGAffineTransformIdentity;
    self.arrow.hidden=NO;
    //self.loading.hidden=YES;
    
}
#pragma mark--松开就可以进行刷新的状态
-(void)setupPulingState{
    self.stateLabel.text=@"够了啦,松开人家嘛";
    self.arrow.transform=CGAffineTransformMakeRotation(0.0000001-M_PI);
    self.logo.image=[UIImage imageNamed:@"common_pull_loading_1"];
    
    
    
}
#pragma mark--正在刷新中的状态
-(void)setupRefreshingState{
    self.arrow.hidden=YES;
    [self.loading startAnimating];
    
    UIImage *image1=[UIImage imageNamed:@"common_pull_loading_1"];
    UIImage *image2=[UIImage imageNamed:@"common_pull_loading_2"];
    UIImage *image3=[UIImage imageNamed:@"common_pull_loading_3"];
    UIImage *image4=[UIImage imageNamed:@"common_pull_loading_4"];
    NSArray *array=@[image1,image2,image3,image4];
     self.stateLabel.text=@"刷呀刷呀,好累呀,喵";
    [self.logo playGifAnim:array];
}

#pragma mark--监听控件的拖拽比例（控件被拖出来的比例）
-(void)setPullingPercent:(CGFloat)pullingPercent{
    [super setPullingPercent:pullingPercent];
    
}


@end
