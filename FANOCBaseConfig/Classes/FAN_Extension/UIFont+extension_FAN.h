//
//  UIFont+extension_FAN.h
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/5/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (extension_FAN)

/// 平方字体-Regular大小的对象
/// @param size 字体大小
+ (UIFont *)fan_regularFontSize:(CGFloat)size;

/// 平方字体-Semibold大小的对象
/// @param size 字体大小
+ (UIFont *)fan_semiboldFontSize:(CGFloat)size;

/// 平方字体-Medium大小的对象
/// @param size 字体大小
+ (UIFont *)fan_mediumFontSize:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
