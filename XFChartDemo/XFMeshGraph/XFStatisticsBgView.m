//
//  StatisticsBgView.m
//  ShapeLayer
//
//  Created by xiaofei on 2017/8/10.
//  Copyright © 2017年 xiaofei. All rights reserved.
//

#import "XFStatisticsBgView.h"
#import "XFStatisticsView.h"

#define TextFont    [UIFont systemFontOfSize:14]

@interface XFStatisticsBgView ()

@property (nonatomic, strong)UILabel *label1;
@property (nonatomic, strong)UILabel *label2;
@property (nonatomic, strong)UILabel *label3;
@property (nonatomic, strong)UILabel *label4;
@property (nonatomic, strong)UILabel *label5;
@property (nonatomic, strong)UILabel *label6;

@property (nonatomic, strong)XFStatisticsView *statisticsView;

@end

@implementation XFStatisticsBgView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        CGFloat width = frame.size.width;
        self.statisticsView = [[XFStatisticsView alloc] initWithFrame:CGRectMake(0, 0, width - 100, width - 100)];
        self.statisticsView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [self addSubview:self.statisticsView];
        
        [self addChildViews];
    }
    return self;
}

- (void)addChildViews {
    [self addSubview:self.label1];
    
    [self addSubview:self.label2];
    
    [self addSubview:self.label3];
    
    [self addSubview:self.label4];
    
    [self addSubview:self.label5];
    
    [self addSubview:self.label6];
}

- (void)updateInfoWithDict:(NSDictionary *)dict {
    [self.statisticsView updateDataWithDict:dict];
}

- (UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 50, 30)];
        CGPoint center = _label1.center;
        center.x = self.frame.size.width/2;
        _label1.text = @"房务";
        _label1.center = center;
        _label1.font = TextFont;
        _label1.textAlignment = NSTextAlignmentCenter;
    }
    return _label1;
}

- (UILabel *)label2 {
    if (!_label2) {
        _label2 = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-50, self.frame.size.height/3.0-15, 50, 30)];
        _label2.text = @"餐饮";
        _label2.font = TextFont;
        _label2.textAlignment = NSTextAlignmentCenter;
    }
    return _label2;
}

- (UILabel *)label3 {
    if (!_label3) {
        _label3 = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-50, self.frame.size.height*2/3.0-10, 50, 30)];
        _label3.text = @"客服";
        _label3.font = TextFont;
        _label3.textAlignment = NSTextAlignmentCenter;
    }
    return _label3;
}

- (UILabel *)label4 {
    if (!_label4) {
        _label4 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height-40, 80, 30)];
        _label4.textAlignment = NSTextAlignmentCenter;
        CGPoint center = _label4.center;
        center.x = self.frame.size.width/2;
        _label4.center = center;
        _label4.font = TextFont;
        _label4.text = @"增值服务";
    }
    return _label4;
}

- (UILabel *)label5 {
    if (!_label5) {
        _label5 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height/3.0-15, 50, 30)];
        _label5.text = @"销售";
        _label5.font = TextFont;
        _label5.textAlignment = NSTextAlignmentCenter;
    }
    return _label5;
}

- (UILabel *)label6 {
    if (!_label6) {
        _label6 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*2/3.0-10, 50, 30)];
        _label6.text = @"护理";
        _label6.font = TextFont;
        _label6.textAlignment = NSTextAlignmentCenter;
    }
    return _label6;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
