//
//  ViewController.m
//  TextCircle
//
//  Created by 单车 on 16/3/16.
//  Copyright © 2016年 单车. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"
#import "NSString+Extension.h"
#import "DCTextCircleLabel.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, weak) DCTextCircleLabel *textCircleLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
     NSString *titleText = @" 我是大丰收的库萨方式比较深";
    
    DCTextCircleLabel *textCircleLabel = [[DCTextCircleLabel alloc] initWithFrame:CGRectMake(0, 100, self.view.width, 35)];
    textCircleLabel.backgroundColor = [UIColor redColor];
    textCircleLabel.titleText = titleText;
    [self.view addSubview:textCircleLabel];
    self.textCircleLabel = textCircleLabel;
}

@end





