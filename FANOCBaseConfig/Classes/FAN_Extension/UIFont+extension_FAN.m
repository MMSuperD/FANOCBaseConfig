//
//  UIFont+extension_FAN.m
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/5/3.
//

#import "UIFont+extension_FAN.h"

@implementation UIFont (extension_FAN)

+ (UIFont *)fan_regularFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}

+ (UIFont *)fan_semiboldFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
}

+ (UIFont *)fan_mediumFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
}

@end
