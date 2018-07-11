//
//  JGTest.m
//  iOSReview
//
//  Created by JGPeng on 2018/7/11.
//  Copyright © 2018年 彭金光. All rights reserved.
//

#import "JGTest.h"


@implementation JGTest

// 创建圆角 -- 图片 这边采用gpu方式  绘制的方法创建
+ (UIImageView *)imageView:(UIImageView *)imageView Conradius:(CGFloat)radius{

    // 采用贝塞尔曲线 绘制
    UIGraphicsBeginImageContext(imageView.bounds.size);
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:radius] addClip];
    [imageView drawRect:imageView.bounds];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageView;
}

// 创建圆角 -- 方法 2 cashapelayer
+ (UIImageView *)imageView:(UIImageView *)imageView withConradius:(CGFloat)radius RoundingCorners:(UIRectCorner)corners{
    UIBezierPath * maskPath;
    if (!corners) {
        maskPath = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    }else{
        maskPath = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    }
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = imageView.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    imageView.layer.mask = maskLayer;
    return imageView;
}



@end
