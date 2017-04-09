//
//  LHMBilibiliTwoHeader.m
//  MJRefreshDemo
//
//  Created by iOSDev on 17/4/7.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LHMBilibiliTwoHeader.h"
#import "UIImageView+LHMExtension.h"
@interface LHMBilibiliTwoHeader ()
@property(nonatomic,weak)UIImageView *logo;
@property(nonatomic,weak)UILabel *stateLabel;
@property(nonatomic,weak)UIView *bgView;
@property(nonatomic,weak)UIImageView *left;
@property(nonatomic,weak)UIImageView *right;
@property(nonatomic,weak)UIView *circleView;
@end
@implementation LHMBilibiliTwoHeader
#pragma mark- 重写方法
#pragma 在这里做一些初始化配置（比如添加子控件）
-(void)prepare{
    [super prepare];
    
    //设置控件高度
    self.mj_h=100;
    
    //bgview
    UIView *bgView=[[UIView alloc]init];
    bgView.backgroundColor=[UIColor whiteColor];
    [self addSubview:bgView];
    self.bgView=bgView;
    //logo1
    UIImageView *logo=[[UIImageView alloc]init];
    
    [bgView addSubview:logo];
    self.logo=logo;
    //logo2
   UILabel *stateLabel=[[UILabel alloc]init];
    stateLabel.font=[UIFont systemFontOfSize:10];
    stateLabel.textColor=[UIColor orangeColor];
    [bgView addSubview:stateLabel];
    self.stateLabel=stateLabel;
    //left
    UIImageView *left=[[UIImageView alloc]initWithFrame:CGRectMake(0.5*kScreenWidth-28, 0, 28, 8)];
    left.image=[UIImage imageNamed:@"common_rabbitBar"];
    [bgView addSubview:left];
    self.left=left;
    //right
    UIImageView *right=[[UIImageView alloc]initWithFrame:CGRectMake(0.5*kScreenWidth, 0, 28, 8)];
    right.image=[UIImage imageNamed:@"common_rabbitBar"];
    [bgView addSubview:right];
    self.right=right;
    //光圈
    UIView *circleView=[[UIView alloc]init];
    circleView.backgroundColor=[UIColor redColor];
    [self insertSubview:circleView atIndex:0];
    self.circleView=circleView;
    
}
#pragma mark--设置子控件的布局
-(void)placeSubviews{
    [super placeSubviews];
    self.circleView.frame=CGRectMake(0.5*kScreenWidth-25, 18, 50, 25);
   self.bgView.frame=CGRectMake(0, 50,kScreenWidth, 50);
   self.logo.frame=CGRectMake(0.5*kScreenWidth-15, 5, 30, 30);
    self.stateLabel.frame=CGRectMake(0.5*kScreenWidth-50, 35, 100, 10);
    self.stateLabel.textAlignment=NSTextAlignmentCenter;
}
#pragma mark--监听scrollview的contenoffset的改变
-(void)scrollViewContentOffsetDidChange:(NSDictionary *)change{
    [super scrollViewContentOffsetDidChange:change];
    //翻转
    if (self.state==MJRefreshStateIdle) {
        NSLog(@"%f",self.scrollView.contentOffset.y);
        if (self.scrollView.contentOffset.y>-163) {
            float rate=(-63-self.scrollView.contentOffset.y)*0.01;
            self.left.layer.anchorPoint=CGPointMake(1, 0);
            self.left.transform=CGAffineTransformMakeRotation(M_PI_2*rate);
            self.right.layer.anchorPoint=CGPointMake(0, 0);
            self.right.transform=CGAffineTransformMakeRotation(-M_PI_2*rate);
        }else{
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                NSTimer  *timer=[NSTimer timerWithTimeInterval:2 target:self selector:@selector(addLayer) userInfo:nil repeats:YES];
                [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
            });
        
        
        }
        
    }
   
   
    
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
                
               self.stateLabel.text=@"更新完成";
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
    self.transform=CGAffineTransformIdentity;
    self.logo.hidden=YES;
    self.stateLabel.hidden=YES;
    
   
   
   
}
#pragma mark--松开就可以进行刷新的状态
-(void)setupPulingState{
    self.mj_h=100;
    
    
}
#pragma mark--正在刷新中的状态
-(void)setupRefreshingState{
    
    
    self.bgView.frame=CGRectMake(0, 0, kScreenWidth, 50);
    UIImage *image1=[UIImage imageNamed:@"common_rabbitBar_face0"];
    UIImage *image2=[UIImage imageNamed:@"common_rabbitBar_face1"];
    UIImage *image3=[UIImage imageNamed:@"common_rabbitBar_face2"];
    UIImage *image4=[UIImage imageNamed:@"common_rabbitBar_face3"];
    NSArray *array=@[image1,image2,image3,image4];
    self.logo.hidden=NO;
    [self.logo playGifAnim:array];
    self.stateLabel.text=@"正在更新...";
    self.stateLabel.hidden=NO;
    
}

#pragma mark--监听控件的拖拽比例（控件被拖出来的比例）
-(void)setPullingPercent:(CGFloat)pullingPercent{
    [super setPullingPercent:pullingPercent];
    
}

#pragma mark--画圈
-(void)addLayer{
    UIBezierPath *path=[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.circleView.frame.size.width, self.circleView.frame.size.height) cornerRadius:5];
   
    path.lineWidth=1;
    CAShapeLayer *layer=[[CAShapeLayer alloc]init];
    layer.path=path.CGPath;
    layer.strokeColor=[UIColor whiteColor].CGColor;
    layer.fillColor=[UIColor clearColor].CGColor;
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.circleView.frame.size.width, self.circleView.frame.size.height)];
    [self.circleView addSubview:view];
    [view.layer addSublayer:layer];
    [UIView setAnimationRepeatCount:2];
    //动画
    [UIView animateWithDuration:1 animations:^{
        view.transform=CGAffineTransformScale(view.transform, 2.5, 2.5);
        self.left.transform=CGAffineTransformRotate(self.left.transform, -M_PI_4*0.25);
        
         self.right.transform=CGAffineTransformRotate(self.right.transform, M_PI_4*0.25);
        
        view.alpha=0;
    } completion:^(BOOL finished) {
        self.left.transform=CGAffineTransformRotate(self.left.transform, M_PI_4*0.25);
        self.right.transform=CGAffineTransformRotate(self.right.transform, -M_PI_4*0.25);
        [view removeFromSuperview];
        
    }];






}
@end
