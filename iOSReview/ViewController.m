//
//  ViewController.m
//  iOSReview
//
//  Created by JGPeng on 2018/7/11.
//  Copyright © 2018年 彭金光. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "JGTest.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UIImageView *myImage2;
@property (nonatomic,assign)int i;
@property (nonatomic,strong) CAShapeLayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _i = 0;
}

- (IBAction)RoundedCornersAction1:(id)sender {
      [JGTest imageView:self.myImage Conradius:20.0];
}

- (IBAction)AddShadow:(id)sender {
// 这边是两种方法  设置阴影  一种是采用贝塞尔绘制 一种是使用 shadowradius  后者较耗性能
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:_myImage.bounds];
    self.myImage.layer.shadowColor = [UIColor redColor].CGColor;
    self.myImage.layer.shadowOffset = CGSizeMake(2, 5);
    self.myImage.layer.shadowOpacity = 0.5;
    self.myImage.layer.shadowPath = shadowPath.CGPath;
    
//    self.myImage.layer.shadowColor = [UIColor redColor].CGColor;
//    self.myImage.layer.shadowOffset = CGSizeMake(2, 5);
//    self.myImage.layer.shadowOpacity = 0.5;
//    self.myImage.layer.shadowRadius = 5;
//    self.myImage.layer.cornerRadius = 10;
}

- (IBAction)RoundedCornersAction2:(id)sender {
     [JGTest imageView:self.myImage2 withConradius:20.0 RoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight];
}

// 这个主要是当年处理缝纫机针迹踩坑的解决办法
- (IBAction)CASharpeLayer:(id)sender {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 667/2)];
    [self UIBezierPath:path];
    CAShapeLayer *layer = [self createShapeLayer:[UIColor orangeColor]];
    layer.lineWidth = 2.0;
    self.layer = layer;
}

- (void)UIBezierPath:(UIBezierPath*)path{
    _i += 1;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [path addLineToPoint:CGPointMake(self->_i, 667/2)];
        self.layer.path = path.CGPath;
        [self UIBezierPath:path];
    });
 
}
- (IBAction)pushYYFPSVC:(id)sender {
    ViewController1 * vc1 = [[ViewController1 alloc]init];
    
    [self.navigationController pushViewController:vc1 animated:YES];
}

- (CAShapeLayer *)createShapeLayer:(UIColor *)color{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = [UIColor blackColor].CGColor;
    //设置填充色
    layer.fillColor = color.CGColor;
    [self.view.layer addSublayer:layer];
    
    return layer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
