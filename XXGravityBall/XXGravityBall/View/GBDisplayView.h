//
//  GBDisplayView.h
//  GravityBall
//
//  Created by xxg90s on 2017/7/1.
//  Copyright © 2017年 xxg90s Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBBall.h"

@interface GBDisplayView : UIImageView

/** 构造弹性对象视图*/
@property (nonatomic, strong) NSArray<GBBall *> *balls;
/** 是否允许点击*/
@property (nonatomic, assign) BOOL enableClick;
//点击对应事件回调
@property (nonatomic, copy) void(^didClickBallBlock)(GBModel *item);

/** 设置背景图片*/
- (void)setBgImage:(UIImage *)bgImage;

/** 为可调试弹性、阻力等参数，放出接口动态更改*/
- (void)setDynamicItemElasticity:(CGFloat)value;
- (void)setDynamicItemResistance:(CGFloat)value;
- (void)setDynamicItemFriction:(CGFloat)value;

@end
