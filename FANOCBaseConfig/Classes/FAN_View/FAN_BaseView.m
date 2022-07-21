//
//  FAN_BaseView.m
//  Pods
//
//  Created by 王丹 on 2022/5/3.
//

#import "FAN_BaseView.h"

@implementation FAN_BaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addChildView];
    }
    return self;
}

- (void)addChildView{
    
    
}

+ (UIView *)keyWindow{
    return UIApplication.sharedApplication.keyWindow;
}

- (void)dealloc{
    NSLog(@"dealloc:%@",NSStringFromClass([self class]));
}
@end
