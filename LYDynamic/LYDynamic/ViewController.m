//
//  ViewController.m
//  LYDynamic
//
//  Created by sand on 2/11/15.
//  Copyright © 2015 sand. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIDynamicAnimator *dynamicAnimator;
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet UIView *greenView;

@end

@implementation ViewController

#pragma 懒加载
- (UIDynamicAnimator *)dynamicAnimator{
    
    if (_dynamicAnimator == nil) {
        _dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        
    }
    
    return _dynamicAnimator;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 重力事件
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.yellowView]];
    // 下落方向以及加速度
    gravityBehavior.gravityDirection = CGVectorMake(0, 1);
    gravityBehavior.magnitude = 2;
    
    // 碰撞事件
    UICollisionBehavior *collisionBehabvior = [[UICollisionBehavior alloc] initWithItems:@[self.yellowView]];
    // 添加直线边界
    collisionBehabvior.translatesReferenceBoundsIntoBoundary = YES;
//    [collisionBehabvior addBoundaryWithIdentifier:@"abc" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(320, 320)];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 320, 320)];
    [collisionBehabvior addBoundaryWithIdentifier:@"avc" forPath:path];
    
    [gravityBehavior addItem:self.yellowView];
//    [gravityBehavior addItem:self.greenView];
    [collisionBehabvior addItem:self.greenView];
    [collisionBehabvior addItem:self.yellowView];
    
    
    [self.dynamicAnimator addBehavior:gravityBehavior];
    [self.dynamicAnimator addBehavior:collisionBehabvior];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.dynamicAnimator removeAllBehaviors];

}

- (void)test{
    
    UIGravityBehavior *grabityBehabior = [[UIGravityBehavior alloc] initWithItems:@[self.yellowView]];
    // 方向
    grabityBehabior.gravityDirection = CGVectorMake(1, 1);
    // 加速度
    grabityBehabior.magnitude = 10;
    
    [self.dynamicAnimator addBehavior:grabityBehabior];
}

@end
