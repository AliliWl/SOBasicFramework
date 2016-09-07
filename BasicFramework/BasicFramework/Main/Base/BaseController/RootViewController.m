//
//  RootViewController.m
//  BasicFramework
//
//  Created by wangli on 16/8/18.
//  Copyright © 2016年 wangli. All rights reserved.
//

#import "RootViewController.h"
#import "RAYNewFunctionGuideVC.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated{
    [self makeGuideView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
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
