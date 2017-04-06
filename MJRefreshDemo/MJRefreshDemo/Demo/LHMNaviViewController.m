//
//  LHMNaviViewController.m
//  MJRefreshDemo
//
//  Created by iOSDev on 17/4/6.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LHMNaviViewController.h"
@interface LHMNaviViewController ()

@end
@implementation LHMNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
+(void)initialize{

    
    [self setupNavigationBarTheme];
   


}
// 设置导航栏的主题
+ (void)setupNavigationBarTheme {
    
    UINavigationBar *appearance = [UINavigationBar appearance];
    [appearance setBackgroundImage:[[UIImage imageNamed:@"nav_bar"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *enableTextAttrs = [NSMutableDictionary dictionary];
    enableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:18.0f];
    enableTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [appearance setTitleTextAttributes:enableTextAttrs];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
