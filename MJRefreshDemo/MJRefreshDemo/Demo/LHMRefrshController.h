//
//  LHMRefrshController.h
//  MJRefreshDemo
//
//  Created by iOSDev on 17/4/6.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger ,ShowType) {
    ShowTypeNormal =0,//普通样式
    ShowTypeGif , //gif动画
    ShowTypeSina ,//新浪微博
    ShowTypeDouYu ,//斗鱼
    ShowTypeBilibili ,//B站
    ShowTypeEleme , //饿了么
    ShowTypeJiudu , //九度财经

};
@interface LHMRefrshController : UIViewController
@property(nonatomic,assign)ShowType showType;
@end
