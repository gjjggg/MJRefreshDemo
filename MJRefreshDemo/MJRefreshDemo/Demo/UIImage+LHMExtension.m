//
//  UIImage+LHMExtension.m
//  MJRefreshDemo
//
//  Created by iOSDev on 17/4/6.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "UIImage+LHMExtension.h"

@implementation UIImage (LHMExtension)
+(NSArray<UIImage *> *)jiuduImages{
    UIImage *image_01 = [UIImage imageNamed:@"load_1"];
    UIImage *image_02 = [UIImage imageNamed:@"load_2"];
    UIImage *image_03 = [UIImage imageNamed:@"load_3"];
    UIImage *image_04 = [UIImage imageNamed:@"load_4"];
    UIImage *image_05 = [UIImage imageNamed:@"load_5"];
    UIImage *image_06 = [UIImage imageNamed:@"load_6"];
    UIImage *image_07 = [UIImage imageNamed:@"load_7"];
    UIImage *image_08 = [UIImage imageNamed:@"load_8"];
    UIImage *image_09 = [UIImage imageNamed:@"load_9"];
    UIImage *image_10 = [UIImage imageNamed:@"load_10"];
    UIImage *image_11 = [UIImage imageNamed:@"load_11"];
    UIImage *image_12 = [UIImage imageNamed:@"load_12"];
    NSArray *images = @[image_01,image_02,image_03,image_04,image_05,image_06,image_07,image_08,image_09,image_10,image_11,image_12];
    return images;
}
+(NSArray <UIImage *> *)gifImages{
    UIImage *image_01 = [UIImage imageNamed:@"1"];
    UIImage *image_02 = [UIImage imageNamed:@"2"];
    UIImage *image_03 = [UIImage imageNamed:@"3"];
    UIImage *image_04 = [UIImage imageNamed:@"4"];
 
    NSArray *images = @[image_01,image_02,image_03,image_04];
    return images;





}
@end
