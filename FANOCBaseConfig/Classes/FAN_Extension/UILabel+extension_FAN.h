//
//  UILabel+extension_FAN.h
//  Pods
//
//  Created by 王丹 on 2022/5/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (extension_FAN)

#pragma mark 这里是创建 UILabel的方法
+ (instancetype)fan_labelWithText:(NSString *)text font:(CGFloat)font;
+ (instancetype)fan_labelWithText:(NSString *)text font:(CGFloat)font textColor:(UIColor *)color;
+ (instancetype)fan_labelWithText:(NSString *)text font:(CGFloat)font hexColor:(uint32_t)hexColor;
+ (instancetype)fan_labelWithText:(NSString *)text font:(CGFloat)font textColorStr:(NSString *)colorStr;
+ (instancetype)fan_labelWithText:( NSString * __nullable)text font:( CGFloat)font textColor:(UIColor * __nullable)color typeFace:(NSString * __nullable)typeFaceName textAlignment:(NSTextAlignment)textAlignment;


#pragma mark 这里是设置UIlabel 的属性

-(void)fan_setLineSpace:(CGFloat)lineSpace withText:(NSString *)text;


@end

NS_ASSUME_NONNULL_END
