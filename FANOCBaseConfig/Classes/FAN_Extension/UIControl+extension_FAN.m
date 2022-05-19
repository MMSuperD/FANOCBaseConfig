//
//  UIControl+extension_FAN.m
//  FANOCBaseConfig
//
//  Created by xzmac on 2022/5/19.
//

#import "UIControl+extension_FAN.h"
#import "UIView+extension_FAN.h"
@implementation UIControl (extension_FAN)


+ (void)load
{
    dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        [self method_exchangeClassStr:@"UIControl" selector:@selector(sendAction:to:forEvent:) selector:@selector(fan_sendAction:to:forEvent:)];

    });
    
}

- (void)fan_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    NSLog(@"%@-%@-%@", self, target, NSStringFromSelector(action));
    
    // 调用系统原来的实现
    [self fan_sendAction:action to:target forEvent:event];
    
}

@end
