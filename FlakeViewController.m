//
//  FlakeViewController.m
//  EmitterAnimate
//
//  Created by peng_qitao on 16/10/10.
//  Copyright © 2016年 peng_qitao. All rights reserved.
//

#define LC_APP_WINDOW ([UIApplication sharedApplication].delegate.window) //App的Window

#import "FlakeViewController.h"

@interface FlakeViewController ()

@end

@implementation FlakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    
    static int i = 0;
    if ( i % 2 == 0)
    {
        [self setEmitter];
    }
    else
    {
        [self.view.layer.sublayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[CAEmitterLayer class]])
            {
                [(CAEmitterLayer *)obj removeFromSuperlayer];
            }
        }];
    }
    
    i++;
}

-(void)setEmitter
{
    //粒子发生器
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.emitterPosition = CGPointMake(LC_APP_WINDOW.bounds.size.width/2.f, -30);
    snowEmitter.emitterSize = CGSizeMake(LC_APP_WINDOW.bounds.size.width/2.f, 0.0);
    snowEmitter.emitterShape = kCAEmitterLayerLine;
    snowEmitter.emitterMode = kCAEmitterLayerOutline;
    snowEmitter.shadowColor = [UIColor whiteColor].CGColor;
    snowEmitter.shadowOffset = CGSizeMake(0.0, 1.0);
    snowEmitter.shadowRadius = 0.0;
    snowEmitter.shadowOpacity = 1.0;
    
    
    CAEmitterCell *snowCell = [CAEmitterCell emitterCell];
    snowCell.birthRate = 1.0; //每秒出现多少个粒子
    snowCell.lifetime = 120.0; // 粒子的存活时间
    snowCell.velocity = -10; //速度 负值方向向下，正值方向向上
    snowCell.velocityRange = 10; // 平均速度
    snowCell.yAcceleration = 2;//粒子在y方向上的加速度
    snowCell.emissionRange = 0.5 * M_PI; //发射的弧度
    snowCell.spinRange = 0.25 * M_PI; // 粒子的平均旋转速度
    snowCell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"DazFlake"].CGImage);
    snowCell.color = [UIColor colorWithRed:0.6 green:0.658 blue:0.743 alpha:1.0].CGColor;
    
    CAEmitterCell *redSnowCell = [CAEmitterCell emitterCell];
    redSnowCell.birthRate = 1.0; //每秒出现多少个粒子
    redSnowCell.lifetime = 120.0; // 粒子的存活时间
    redSnowCell.velocity = -10; //速度
    redSnowCell.velocityRange = 10; // 平均速度
    redSnowCell.yAcceleration = 2;//粒子在y方向上的加速度
    redSnowCell.emissionRange = 0.5 * M_PI; //发射的弧度
    redSnowCell.spinRange = 0.25 * M_PI; // 粒子的平均旋转速度
    redSnowCell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"DazFlake"].CGImage);
    redSnowCell.color = [UIColor redColor].CGColor;
    
    snowEmitter.emitterCells = @[snowCell, redSnowCell];
    
    [self.view.layer insertSublayer:snowEmitter above:0];
    
    
//    //水龙头效果
//    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
//    //发射点的位置
//    snowEmitter.emitterPosition = self.view.center;
//    //
//    snowEmitter.emitterSize = CGSizeMake(10.0, 0.0);
//    snowEmitter.emitterShape = kCAEmitterLayerLine;
//    snowEmitter.emitterMode = kCAEmitterLayerOutline;
//    
//    CAEmitterCell *snowCell = [CAEmitterCell emitterCell];
//    
//    snowCell.birthRate = 50.0;
//    snowCell.lifetime = 10.0;
//    snowCell.velocity = 40; //速度 负值方向向下，正值方向向上
//    snowCell.velocityRange = 10;
//    snowCell.yAcceleration = 2;
//    snowCell.emissionRange =  M_PI / 9;
//    snowCell.scale = 0.1; //缩小比例
//    snowCell.scaleRange = 0.08;// 平均缩小比例
//    snowCell.contents = (id)[UIImage imageNamed:@"DazFlake"].CGImage;
//    snowCell.color = [UIColor colorWithRed:0.6 green:0.658 blue:0.743 alpha:1.0].CGColor;
//    
//    snowEmitter.emitterCells = @[snowCell];
//    
//    [self.view.layer insertSublayer:snowEmitter atIndex:0];
}

@end
