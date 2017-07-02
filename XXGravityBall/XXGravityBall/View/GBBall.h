//
//  GBBall.h
//  GravityBall
//
//  Created by xxg90s on 2017/7/1.
//  Copyright © 2017年 xxg90s Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBModel.h"

@interface GBBall : UIImageView

@property (nonatomic, strong) GBModel *ball;

/**
 @param referenceViewSize 重力作用视图的大小，在此范围内随机生成ball的frame
 */
+ (GBBall *)factoryBallWithModel:(GBModel *)model referenceViewSize:(CGSize)referenceViewSize;

@end
