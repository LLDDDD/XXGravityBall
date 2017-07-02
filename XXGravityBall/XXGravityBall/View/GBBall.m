//
//  GBBall.m
//  GravityBall
//
//  Created by xxg90s on 2017/7/1.
//  Copyright © 2017年 xxg90s Inc. All rights reserved.
//

#import "GBBall.h"

#define GBBALLWIDTH 40.

@implementation GBBall

+ (GBBall *)factoryBallWithModel:(GBModel *)model referenceViewSize:(CGSize)referenceViewSize {
    GBBall *ball = [[GBBall alloc] initWithFrame:CGRectMake([[self class] randValueBetween:0 and: (referenceViewSize.width - GBBALLWIDTH)], [[self class] randValueBetween:0 and: (referenceViewSize.height - GBBALLWIDTH)], GBBALLWIDTH, GBBALLWIDTH)];
    ball.layer.cornerRadius = ball.frame.size.width/2;
    ball.layer.borderWidth = 1;
    ball.layer.borderColor = [UIColor darkGrayColor].CGColor;
    ball.layer.masksToBounds = YES;
    ball.ball = model;
    
    return ball;
}

- (void)setBall:(GBModel *)ball {
    _ball = ball;
    
    self.image = [UIImage imageNamed:_ball.ballName];
    self.tag = _ball.ballTag;
}

- (UIDynamicItemCollisionBoundsType)collisionBoundsType {
    return UIDynamicItemCollisionBoundsTypeEllipse;
}

/** 取随机float值*/
+ (float)randValueBetween:(float)low and:(float)high {
    float diff = high - low;
    return (((float) rand() / RAND_MAX) * diff) + low;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
