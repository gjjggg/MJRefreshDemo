//
//  UIImageView+LHMExtension.h
//  MJRefreshDemo
//
//  Created by iOSDev on 17/4/7.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LHMExtension)
// 播放GIF
- (void)playGifAnim:(NSArray *)images;
// 停止动画
- (void)stopGifAnim;
@end
