//
//  JGTest.h
//  iOSReview
//
//  Created by JGPeng on 2018/7/11.
//  Copyright © 2018年 彭金光. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JGTest : NSObject

// 创建圆角 --  这边采用gpu方式  绘制的方法创建 -- 方法1
+ (UIImageView *)imageView:(UIImageView *)imageView Conradius:(CGFloat)radius;
// 创建圆角 -- 方法 2 cashapelayer
+ (UIImageView *)imageView:(UIImageView *)imageView withConradius:(CGFloat)radius RoundingCorners:(UIRectCorner)corners;

@end
