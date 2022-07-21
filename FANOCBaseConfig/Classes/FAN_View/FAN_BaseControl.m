//
//  FAN_BaseControl.m
//  Pods
//
//  Created by 王丹 on 2022/5/3.
//

#import "FAN_BaseControl.h"

@implementation FAN_BaseControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
        [self addChildView];
    }
    return self;
}

- (void)addChildView{
    
    
}

// 初始化数据
- (void)initData{
    
}

+ (UIView *)keyWindow{
    return UIApplication.sharedApplication.keyWindow;
}

- (void)dealloc{
    NSLog(@"dealloc:%@",NSStringFromClass([self class]));
}

@end
