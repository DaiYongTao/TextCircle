//
//  NSString+Extension.h
//  单车微博
//
//  Created by dyt on 15/10/27.
//  Copyright (c) 2015年 戴永涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;

- (CGSize)sizeWithFont:(UIFont *)font;

/**
 * 计算一个文件\文件夹的大小
 */
- (NSInteger)sizeOfFilepath;

@end
