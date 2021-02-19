//
//  VoiceView.m
//  音量震动条
//
//  Created by MacBook pro on 2021/2/19.
//

#import "VoiceView.h"

@implementation VoiceView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(80, 200, 300, 300);
        self.backgroundColor = [UIColor clearColor];
        [self setUI];
    }
    return self;
}

- (void)setUI {
    //利用复制层来创建多个
    CAReplicatorLayer *repl = [[CAReplicatorLayer alloc] init];
    repl.frame = self.bounds;
    repl.backgroundColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:repl];
    //复制出6个（包括自己）
    repl.instanceCount = 5;
    //每个复制层跟上一个的动画延时
    repl.instanceDelay = 1;
    //设置偏移，不然每一层都重叠在一起
    repl.instanceTransform = CATransform3DMakeTranslation(50, 0, 0);
    
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor greenColor].CGColor;
    //bounds和frame区别在于 bounds的x,y默认是0
    layer.bounds = CGRectMake(0, 0, 30, 100);
    //anchorPoint相当于一个中心位标，就相当于一个图纸在平面绕着A点旋转，那么A点就是anchorPoint
    layer.anchorPoint = CGPointMake(0, 1);
    //position是anchorPoint在该layer的superLayer上的点
    layer.position = CGPointMake(0, self.bounds.size.height);
    [repl addSublayer:layer];
    
    //给layer添加动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    //设置改变的属性
    animation.keyPath = @"transform.scale.y";
    //设置改变的属性结束时的值
    animation.toValue = @0;
    animation.repeatCount = MAXFLOAT;
    animation.duration = 1;
    //设置自动反转
    animation.autoreverses = YES;
    [layer addAnimation:animation forKey:NULL];
    
}
@end
