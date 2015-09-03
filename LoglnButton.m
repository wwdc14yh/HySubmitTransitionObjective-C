//
//  LoglnButton.m
//  Example
//
//  Created by  东海 on 15/9/2.
//  Copyright (c) 2015年 Jonathan Tribouharet. All rights reserved.
//

#import "LoglnButton.h"


@interface LoglnButton ()

@property (nonatomic,assign) CFTimeInterval shrinkDuration;

@property (nonatomic,retain) CAMediaTimingFunction *shrinkCurve;

@property (nonatomic,retain) CAMediaTimingFunction *expandCurve;

@property (nonatomic,strong) Completion block;

@end

@implementation LoglnButton

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _spiner = [[SpinerLayer alloc] initWithFrame:self.frame];
        _shrinkCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        _expandCurve = [CAMediaTimingFunction functionWithControlPoints:0.95 :0.02 :1 :0.05];
        self.shrinkDuration = 0.1;
        [self.layer addSublayer:_spiner];
        [self setup];
    }
    return self;
}

-(void)setup{

    self.layer.cornerRadius = CGRectGetHeight(self.bounds) / 2;
    self.clipsToBounds = true;
    
}

-(void)StartAnimationCompletion:(Completion)block{
    
    _block = block;
    [self.layer addSublayer:_spiner];
    CABasicAnimation *shrinkAnim = [CABasicAnimation animationWithKeyPath:@"bounds.size.width"];
    shrinkAnim.fromValue = @(CGRectGetWidth(self.bounds));
    shrinkAnim.toValue = @(CGRectGetHeight(self.bounds));
    shrinkAnim.duration = _shrinkDuration;
    shrinkAnim.timingFunction = _shrinkCurve;
    shrinkAnim.fillMode = kCAFillModeForwards;
    shrinkAnim.removedOnCompletion = false;
    [self.layer addAnimation:shrinkAnim forKey:shrinkAnim.keyPath];
    [_spiner animation];
    [self setUserInteractionEnabled:false];
}

-(void)ExitAnimation{

    
    CABasicAnimation *expandAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    expandAnim.fromValue = @(1.0);
    expandAnim.toValue = @(33.0);
    expandAnim.timingFunction = _expandCurve;
    expandAnim.duration = 0.3;
    expandAnim.delegate = self;
    expandAnim.fillMode = kCAFillModeForwards;
    expandAnim.removedOnCompletion = false;
    [self.layer addAnimation:expandAnim forKey:expandAnim.keyPath];
    [_spiner stopAnimation];
    [self setUserInteractionEnabled:true];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{

    CABasicAnimation *cab = (CABasicAnimation *)anim;
    if ([cab.keyPath isEqualToString:@"transform.scale"]) {
        
        if (_block) {
            _block();
        }
        
        [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(DidStopAnimation) userInfo:nil repeats:nil];
        
    }
    if ([cab.keyPath isEqualToString:@"bounds.size.width"]) {
    }
    
}

-(void)DidStopAnimation{

    [self.layer removeAllAnimations];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
