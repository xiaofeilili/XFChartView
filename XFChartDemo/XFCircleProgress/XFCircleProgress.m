//
//  CircleProgress.m
//  ShapeLayer
//
//  Created by xiaofei on 2017/8/15.
//  Copyright © 2017年 xiaofei. All rights reserved.
//  圆形进度条

#import "XFCircleProgress.h"

#define width   self.frame.size.width > self.frame.size.height ? self.frame.size.height:self.frame.size.width
#define side    3

@interface XFCircleProgress ()

@property (nonatomic, strong)UILabel *titLabel;
@property (nonatomic, strong)CAShapeLayer *shapeLayer;

@end

@implementation XFCircleProgress

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self layout];
        [self addSubview:self.titLabel];
    }
    return self;
}

- (void)layout {
    // view.layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
//    shapeLayer.strokeStart = 0;
//    
//    shapeLayer.strokeEnd = 0.7;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width/2, width/2) radius:(width - side)/2 startAngle:-M_PI_2 endAngle:M_PI_2 * 3 clockwise:YES];
    shapeLayer.path = path.CGPath;
    self.shapeLayer = shapeLayer;
    
    shapeLayer.fillColor = [[UIColor clearColor]CGColor];
    shapeLayer.lineWidth = side;// 线条宽度
    shapeLayer.strokeColor = [[UIColor redColor]CGColor];
    [self.layer addSublayer:shapeLayer];
    // 动画
    CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima.duration = 3.0f;
    pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnima.toValue = [NSNumber numberWithFloat:0.7f];
    if (self.percent) {
        pathAnima.toValue = [NSNumber numberWithFloat:self.percent/100.0];
    }
    
    pathAnima.fillMode = kCAFillModeForwards;
    pathAnima.removedOnCompletion = NO;
    [shapeLayer addAnimation:pathAnima forKey:@"strokeEndAnimation"];
}

- (UILabel *)titLabel {
    if (!_titLabel) {
        _titLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width * 2/ 3.0, width * 2/ 3.0)];
        _titLabel.center = CGPointMake(width/2, width/2);
        _titLabel.font = [UIFont systemFontOfSize:14];
        _titLabel.text = @"标题";
        _titLabel.textAlignment = NSTextAlignmentCenter;
        _titLabel.numberOfLines = 0;
    }
    return _titLabel;
}

- (void)setPercent:(NSInteger)percent {
    _percent = percent;
    
    [self.shapeLayer removeFromSuperlayer];
    [self layout];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width/2, width/2) radius:(width - side)/2 startAngle:-M_PI_2 endAngle:M_PI_2 * 3 clockwise:YES];
    path.lineWidth = side;
    
//    [[UIColor whiteColor] setFill];
//    [path fill];
    [[UIColor lightGrayColor] set];
    [path stroke];
    
    
}


@end
