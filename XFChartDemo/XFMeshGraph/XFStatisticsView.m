//
//  StatisticsView.m
//  ShapeLayer
//
//  Created by xiaofei on 2017/8/9.
//  Copyright © 2017年 xiaofei. All rights reserved.
//  网状统计图

#import "XFStatisticsView.h"

#define kViewWidth      self.frame.size.width
#define kViewHeight     self.frame.size.height

#define BlankSide       kViewWidth/10.0

@interface XFStatisticsView ()

@property (nonatomic, assign)CGFloat percent1;
@property (nonatomic, assign)CGFloat percent2;
@property (nonatomic, assign)CGFloat percent3;
@property (nonatomic, assign)CGFloat percent4;
@property (nonatomic, assign)CGFloat percent5;
@property (nonatomic, assign)CGFloat percent6;

@end

@implementation XFStatisticsView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self layoutChildViews];
        [self updateDataWithDict:@{}];
    }
    return self;
}

- (void)updateDataWithDict:(NSDictionary *)dict {
    if ([[dict allKeys] count]) {
        self.percent1 = [dict[@"1"] floatValue];
        self.percent2 = [dict[@"2"] floatValue];
        self.percent3 = [dict[@"3"] floatValue];
        self.percent4 = [dict[@"4"] floatValue];
        self.percent5 = [dict[@"5"] floatValue];
        self.percent6 = [dict[@"6"] floatValue];
    }else {
        self.percent1 = 0.5;
        self.percent2 = 0.6;
        self.percent3 = 0.5;
        self.percent4 = 0.7;
        self.percent5 = 0.6;
        self.percent6 = 0.5;
    }
    
    for (UIView *view in self.subviews) {
        if (view.tag == 100) {
            [view removeFromSuperview];
        }
    }
    
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.alpha = 0.8;
    view.tag = 100;
    [self addSubview:view];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = view.bounds;
    shapeLayer.fillColor = [[UIColor lightGrayColor]CGColor];
    shapeLayer.strokeColor = [[UIColor grayColor] CGColor];
    
    CGRect rect = self.frame;
    UIBezierPath *linePath5 = [UIBezierPath bezierPath];
    [linePath5 moveToPoint:CGPointMake(rect.size.width/2, rect.size.height/2 + rect.size.height/2 * self.percent1)];
    CGFloat sideW5 = sqrt(3) * rect.size.width/4.0;
    [linePath5 addLineToPoint:CGPointMake(rect.size.width/2 + sideW5 * self.percent2, rect.size.height/2 + rect.size.height/4 * self.percent2)];
    [linePath5 addLineToPoint:CGPointMake(rect.size.width/2 + sideW5 * self.percent3, rect.size.height/2 - rect.size.height/4 * self.percent3)];
    [linePath5 addLineToPoint:CGPointMake(rect.size.width/2, rect.size.height/2 - rect.size.height/2 * self.percent4)];
    [linePath5 addLineToPoint:CGPointMake(rect.size.width/2 - sideW5 * self.percent5, rect.size.height/2 - rect.size.height/4 * self.percent5)];
    [linePath5 addLineToPoint:CGPointMake(rect.size.width/2 - sideW5 * self.percent6, rect.size.height/2 + rect.size.height/4 * self.percent6)];
    [linePath5 closePath];
    linePath5.lineWidth = 1;
    shapeLayer.path = linePath5.CGPath;
    [view.layer addSublayer:shapeLayer];
    
}

- (void)layoutChildViews {
    [self drawMainLine];
}
// 画主线
- (void)drawMainLine {
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake((kViewWidth - 0.5)/2, 0, 0.5, kViewHeight)];
    lineView1.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:lineView1];
    
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake((kViewWidth - 0.5)/2, 0, 0.5, kViewHeight)];
    lineView2.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:lineView2];
    lineView2.transform = CGAffineTransformMakeRotation(M_PI/3);
    
    UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake((kViewWidth - 0.5)/2, 0, 0.5, kViewHeight)];
    lineView3.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:lineView3];
    lineView3.transform = CGAffineTransformMakeRotation(-M_PI/3);
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *linePath5 = [UIBezierPath bezierPath];
    [linePath5 moveToPoint:CGPointMake(rect.size.width/2, rect.size.height/2 + 5 * BlankSide)];
    CGFloat sideW5 = sqrt(BlankSide * BlankSide * (25 - 6.25));
    [linePath5 addLineToPoint:CGPointMake(rect.size.width/2 + sideW5, rect.size.height/2 + BlankSide*2.5)];
    [linePath5 addLineToPoint:CGPointMake(rect.size.width/2 + sideW5, rect.size.height/2 - BlankSide*2.5)];
    [linePath5 addLineToPoint:CGPointMake(rect.size.width/2, rect.size.height/2 - BlankSide * 5)];
    [linePath5 addLineToPoint:CGPointMake(rect.size.width/2 - sideW5, rect.size.height/2 - BlankSide*2.5)];
    [linePath5 addLineToPoint:CGPointMake(rect.size.width/2 - sideW5, rect.size.height/2 + BlankSide*2.5)];
    [linePath5 closePath];
    linePath5.lineWidth = 1;
    [[UIColor whiteColor] setFill];
    [linePath5 fill];
    
    UIBezierPath *linePath4 = [UIBezierPath bezierPath];
    [linePath4 moveToPoint:CGPointMake(rect.size.width/2, rect.size.height/2 + 4 * BlankSide)];
    CGFloat sideW4 = sqrt(BlankSide * BlankSide * 12);
    [linePath4 addLineToPoint:CGPointMake(rect.size.width/2 + sideW4, rect.size.height/2 + BlankSide*2)];
    [linePath4 addLineToPoint:CGPointMake(rect.size.width/2 + sideW4, rect.size.height/2 - BlankSide*2)];
    [linePath4 addLineToPoint:CGPointMake(rect.size.width/2, rect.size.height/2 - BlankSide * 4)];
    [linePath4 addLineToPoint:CGPointMake(rect.size.width/2 - sideW4, rect.size.height/2 - BlankSide*2)];
    [linePath4 addLineToPoint:CGPointMake(rect.size.width/2 - sideW4, rect.size.height/2 + BlankSide*2)];
    [linePath4 closePath];
    linePath4.lineWidth = 1;
    [[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0] setFill];
    [linePath4 fill];
    
    
    UIBezierPath *linePath3 = [UIBezierPath bezierPath];
    [linePath3 moveToPoint:CGPointMake(rect.size.width/2, rect.size.height/2 + 3 * BlankSide)];
    CGFloat sideW3 = sqrt(BlankSide * BlankSide * 9 - BlankSide * BlankSide * 2.25);
    [linePath3 addLineToPoint:CGPointMake(rect.size.width/2 + sideW3, rect.size.height/2 + BlankSide*3/2.0)];
    [linePath3 addLineToPoint:CGPointMake(rect.size.width/2 + sideW3, rect.size.height/2 - BlankSide*3/2.0)];
    [linePath3 addLineToPoint:CGPointMake(rect.size.width/2, rect.size.height/2 - BlankSide * 3)];
    [linePath3 addLineToPoint:CGPointMake(rect.size.width/2 - sideW3, rect.size.height/2 - BlankSide*3/2.0)];
    [linePath3 addLineToPoint:CGPointMake(rect.size.width/2 - sideW3, rect.size.height/2 + BlankSide*3/2.0)];
    [linePath3 closePath];
    linePath3.lineWidth = 1;
    [[UIColor whiteColor] setFill];
    [linePath3 fill];
    
    UIBezierPath *linePath2 = [UIBezierPath bezierPath];
    [linePath2 moveToPoint:CGPointMake(rect.size.width/2, rect.size.height/2 + 2 * BlankSide)];
    CGFloat sideW2 = sqrt(BlankSide * BlankSide * 3);
    [linePath2 addLineToPoint:CGPointMake(sideW2+rect.size.width/2, rect.size.height/2 + BlankSide)];
    [linePath2 addLineToPoint:CGPointMake(sideW2+rect.size.width/2, rect.size.height/2 - BlankSide)];
    [linePath2 addLineToPoint:CGPointMake(rect.size.width/2, rect.size.height/2 - BlankSide * 2)];
    [linePath2 addLineToPoint:CGPointMake(rect.size.width/2 - sideW2, rect.size.height/2 - BlankSide)];
    [linePath2 addLineToPoint:CGPointMake(rect.size.width/2 - sideW2, rect.size.height/2 + BlankSide)];
    [linePath2 closePath];
    linePath2.lineWidth = 1;
    [[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0] setFill];
    [linePath2 fill];
    
    
    UIBezierPath *linePath1 = [UIBezierPath bezierPath];
    [linePath1 moveToPoint:CGPointMake(rect.size.width/2, rect.size.height/2+BlankSide)];
    CGFloat sideW = sqrt(BlankSide * BlankSide - BlankSide/2.0 * BlankSide/2.0);
    [linePath1 addLineToPoint:CGPointMake(sideW+rect.size.width/2, rect.size.height/2 + BlankSide/2)];
    [linePath1 addLineToPoint:CGPointMake(sideW+rect.size.width/2, rect.size.height/2 - BlankSide/2)];
    [linePath1 addLineToPoint:CGPointMake(rect.size.width/2, rect.size.height/2 - BlankSide)];
    [linePath1 addLineToPoint:CGPointMake(rect.size.width/2 - sideW, rect.size.height/2 - BlankSide/2)];
    [linePath1 addLineToPoint:CGPointMake(rect.size.width/2 - sideW, rect.size.height/2 + BlankSide/2)];
    [linePath1 closePath];
    linePath1.lineWidth = 1;
    [[UIColor whiteColor] setFill];
    [linePath1 fill];
    
    // 设置线条颜色
    [[UIColor lightGrayColor] set];
    
//    if (self.percent5) {
//        UIBezierPath *linePath5 = [UIBezierPath bezierPath];
//        [linePath5 moveToPoint:CGPointMake(rect.size.width/2, rect.size.height/2 + rect.size.height/2 * self.percent1)];
//        CGFloat sideW5 = sqrt(3) * rect.size.width/4.0;
//        [linePath5 addLineToPoint:CGPointMake(rect.size.width/2 + sideW5 * self.percent2, rect.size.height/2 + rect.size.height/4 * self.percent2)];
//        [linePath5 addLineToPoint:CGPointMake(rect.size.width/2 + sideW5 * self.percent3, rect.size.height/2 - rect.size.height/4 * self.percent3)];
//        [linePath5 addLineToPoint:CGPointMake(rect.size.width/2, rect.size.height/2 - rect.size.height/2 * self.percent4)];
//        [linePath5 addLineToPoint:CGPointMake(rect.size.width/2 - sideW5 * self.percent5, rect.size.height/2 - rect.size.height/4 * self.percent5)];
//        [linePath5 addLineToPoint:CGPointMake(rect.size.width/2 - sideW5 * self.percent6, rect.size.height/2 + rect.size.height/4 * self.percent6)];
//        [linePath5 closePath];
//        linePath5.lineWidth = 1;
//        
//        [linePath5 stroke];
//    }
    
    [linePath1 stroke];
    [linePath2 stroke];
    [linePath3 stroke];
    [linePath4 stroke];
    [linePath5 stroke];
}


@end
