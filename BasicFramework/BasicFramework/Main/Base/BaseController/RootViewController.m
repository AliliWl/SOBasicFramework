//
//  RootViewController.m
//  BasicFramework
//
//  Created by wangli on 16/8/18.
//  Copyright © 2016年 wangli. All rights reserved.
//

#import "RootViewController.h"
#import "RAYNewFunctionGuideVC.h"
#import "MYBlurIntroductionView.h"
@interface RootViewController ()<MYIntroductionDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}
- (void)viewDidAppear:(BOOL)animated{
//    [self makeGuideView];
    [self makeUserGuide];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 用户引导页实现
- (void)makeUserGuide{
    MYIntroductionPanel *panel = [[MYIntroductionPanel alloc] initWithFrame:self.view.frame title:@"test1" description:@"description1" image:[UIImage imageNamed:@"introduction"]];
    
    MYBlurIntroductionView *introductionView = [[MYBlurIntroductionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    introductionView.delegate = self;
    introductionView.BackgroundImageView.image = [UIImage imageNamed:@"introduction"];
    
    NSArray *panels = @[panel];
    
    [introductionView buildIntroductionWithPanels:panels];
    
    [self.view addSubview:introductionView];
}
// 聚光灯指示使用
- (void)makeGuideView{
    RAYNewFunctionGuideVC *vc = [[RAYNewFunctionGuideVC alloc]init];
    vc.titles = @[@"新增: 功能1，",@"新增: 功能2，",@"新增: 功能3，",@"新增: 功能4，",@"新增: 功能5，",];
    vc.frames = @[@"{{0,  60},{100,80}}",
                  @"{{200,60},{100,80}}",
                  @"{{0,  360},{100,80}}",
                  @"{{200,360},{100,80}}",
                  @"{{100,210},{100,80}}",
                  ];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}


@end
