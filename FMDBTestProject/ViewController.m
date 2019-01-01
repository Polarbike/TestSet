//
//  ViewController.m
//  FMDBTestProject
//
//  Created by Weilian on 20/12/18.
//  Copyright © 2018年 Weilian. All rights reserved.
//

#import "ViewController.h"
#import "BGFMDB.h"

#define kArrayKey @"arrayKey"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // self.view.backgroundColor = [UIColor redColor];
    // cn.yss.---------------
    // com.kayun.www.FMDBTestProject
    [self createButtonFor];
    
    
    NSString *listString = @"0123456789";
    NSRange range = NSMakeRange(3, 2);
    NSString *subString = [listString substringWithRange:range];
    NSLog(@"打印子字符串%@",subString);
}


- (void) createButtonFor {
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button.frame = CGRectMake(20, 100, 100, 30);
    [button setTitle:@"按钮" forState:(UIControlStateNormal)];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(saveButtonClickAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    CGRect rect = button.bounds;
    CGSize radii = CGSizeMake(20, 20);
    UIRectCorner corners = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerBottomLeft | UIRectCornerTopLeft;
    //create path
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer *shaprLayer = [CAShapeLayer layer];
    shaprLayer.fillColor = [UIColor darkGrayColor].CGColor;
    shaprLayer.path = path.CGPath;
    
    [button.layer addSublayer:shaprLayer];
}

- (void)saveButtonClickAction {
    //保存
    //NSArray *array = [[NSArray alloc] init];
    //[array bg_saveArrayWithName:kArrayKey];
    //为了
    UIView *view = [[UIView alloc] initWithFrame:(CGRectMake(20, 300, 300, 200))];
    view.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:view];
    //create path 
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(175, 100)];
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    //create shape layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    shapeLayer.lineWidth = 1;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    //shapeLayer.path = path.CGPath;
    UIBezierPath *newPath = [self bezierPathRE];
    shapeLayer.path = newPath.CGPath;
    //add it to our view
    [view.layer addSublayer:shapeLayer];
    int avatarRadius = 54;
    int topOffset = 16;
    CGPoint point = CGPointMake(25 + avatarRadius * cos(M_PI/4), avatarRadius * sin(M_PI/4) + topOffset);
    //
    NSLog(@"%@",NSStringFromCGPoint(point));
}

- (UIBezierPath *)bezierPathRE {
    
    //CGFloat ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    int avatarRadius = 54;
    int topOffset = 16;
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    //your internal mediocrity is the moment when you lost the faith of being excellent
    [bezierPath moveToPoint:CGPointMake(0, topOffset)];
    [bezierPath addLineToPoint:CGPointMake(35, topOffset)];
    [bezierPath addArcWithCenter:CGPointMake(25 + avatarRadius * cos(M_PI/4), avatarRadius * sin(M_PI/4) + topOffset) radius:avatarRadius startAngle:(M_PI * 5)/4 endAngle:(M_PI * 7)/4 clockwise:YES];
    [bezierPath addLineToPoint:CGPointMake(25 + avatarRadius * cos(M_PI/4), topOffset)];
    [bezierPath addLineToPoint:CGPointMake(300, topOffset)];
    [bezierPath addLineToPoint:CGPointMake(300, 200 - (50 + 70) + topOffset - 1)];
    [bezierPath addLineToPoint:CGPointMake(0, 200 - (50 + 70) + topOffset - 1)];
    [bezierPath closePath];
    //
    __weak typeof(self) WeakSelf = self;
    
    return bezierPath;
}



@end
