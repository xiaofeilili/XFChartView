//
//  ViewController.m
//  XFChartDemo
//
//  Created by xiaofei on 2017/8/15.
//  Copyright © 2017年 xiaofei. All rights reserved.
//

#import "ViewController.h"
#import "XFCircleProgress.h"
#import "XFStatisticsBgView.h"

@interface ViewController ()

@property (nonatomic, strong)XFCircleProgress *circleProgress;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createStatisticsView];
    [self cirCleProgress];
}

// 网状图
- (void)createStatisticsView {
    XFStatisticsBgView *bgView = [[XFStatisticsBgView alloc] initWithFrame:CGRectMake(30, 300, 300, 300)];
    [self.view addSubview:bgView];
    [bgView updateInfoWithDict:@{@"1":@(0.6), @"2":@(0.5), @"3":@(0.5), @"4":@(0.7), @"5":@(0.6), @"6":@(0.5)}];
}

/**画圆*/
- (void)cirCleProgress {
    XFCircleProgress *circleProgress = [[XFCircleProgress alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.circleProgress = circleProgress;
    circleProgress.percent = 30;
    [self.view addSubview:circleProgress];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.circleProgress.percent = 50;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
