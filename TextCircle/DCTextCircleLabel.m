//
//  DCTextCircleLabel.m
//  TextCircle
//
//  Created by 单车 on 16/3/17.
//  Copyright © 2016年 单车. All rights reserved.
//

#import "DCTextCircleLabel.h"
#import "NSString+Extension.h"
#import "UIView+Extension.h"

#define size [self.titleText sizeWithFont:[UIFont systemFontOfSize:15] maxW:MAXFLOAT]

@interface DCTextCircleLabel()
@property (nonatomic, weak) UILabel *preTitleLabel;
@property (nonatomic, weak) UILabel *nextTitleLabel;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation DCTextCircleLabel

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        UILabel *preTitleLabel = [[UILabel alloc] init];
        preTitleLabel.backgroundColor = [UIColor blackColor];
        preTitleLabel.textColor = [UIColor whiteColor];
        preTitleLabel.font = [UIFont systemFontOfSize:15];
        preTitleLabel.textColor = [UIColor whiteColor];
        preTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:preTitleLabel];
        self.preTitleLabel = preTitleLabel;
        
        UILabel *nextTitleLabel = [[UILabel alloc] init];
        nextTitleLabel.backgroundColor = [UIColor blackColor];
        nextTitleLabel.textColor = [UIColor whiteColor];
        nextTitleLabel.font = [UIFont systemFontOfSize:15];
        nextTitleLabel.textColor = [UIColor whiteColor];
        nextTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:nextTitleLabel];
        self.nextTitleLabel = nextTitleLabel;
        NSLog(@"initWithFrame");
    }
    return self;
}

- (void)setTitleText:(NSString *)titleText {
    
    _titleText = [titleText copy];
    
    self.preTitleLabel.text = titleText;
    self.nextTitleLabel.text = titleText;
    NSLog(@"setTitleText");
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat tempWidth = (NSInteger)size.width  + 1;
    CGFloat tempWidth2 = (NSInteger)self.width;
    
    self.preTitleLabel.x = 0;
    self.preTitleLabel.y = 0;
    self.preTitleLabel.width = tempWidth;
    self.preTitleLabel.height = self.height;
    
    if (tempWidth > tempWidth2) {
        self.preTitleLabel.x = 0;
        
        self.nextTitleLabel.x = tempWidth;
        self.nextTitleLabel.y = 0;
        self.nextTitleLabel.width = tempWidth;
        self.nextTitleLabel.height = self.height;
        
        [self addTimer];
    }else {
        self.preTitleLabel.x = (tempWidth2 - tempWidth) * 0.5;
        
        self.nextTitleLabel.x = 0;
        self.nextTitleLabel.y = 0;
        self.nextTitleLabel.width = 0;
        self.nextTitleLabel.height = 0;
    }
}

// 添加定时器
- (void)addTimer {
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(beginRun) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
}

- (void)removeTimer {
    
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)dealloc {
    [self removeTimer];
}

// 下一页
- (void)beginRun{
    
    CGFloat width = self.preTitleLabel.width;
    CGFloat pX = self.preTitleLabel.x;

    if (pX == 0) {
        self.nextTitleLabel.x = width;
    }
    else if (pX > - width && pX < 0) {
        
    }else if (pX == - width) {
        self.preTitleLabel.x = width;
    }
    
    self.preTitleLabel.x --;
    self.nextTitleLabel.x --;
    
    NSLog(@"%f %f %f",self.preTitleLabel.x,self.nextTitleLabel.x,size.width);
}

@end






