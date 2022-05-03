//
//  UILabel+extension_FAN.m
//  Pods
//
//  Created by 王丹 on 2022/5/3.
//

#import "UILabel+extension_FAN.h"
#import "UIColor+extension_FAN.h"
@implementation UILabel (extension_FAN)

#pragma mark 这里是创建 UILabel的方法

+ (instancetype)fan_labelWithText:(NSString *)text font:(CGFloat)font{
    return [self fan_labelWithText:text font:font textColor:nil typeFace:nil textAlignment:NSTextAlignmentLeft];
}

+ (instancetype)fan_labelWithText:(NSString *)text font:(CGFloat)font textColor:(UIColor *)color{
    return [self fan_labelWithText:text font:font textColor:color typeFace:nil textAlignment:NSTextAlignmentLeft];
}

+ (instancetype)fan_labelWithText:(NSString *)text font:(CGFloat)font hexColor:(uint32_t)hexColor{
    UIColor *color = [UIColor fan_colorWithHex:hexColor];
    return [self fan_labelWithText:text font:font textColor:color typeFace:nil textAlignment:NSTextAlignmentLeft];
}

+ (instancetype)fan_labelWithText:(NSString *)text font:(CGFloat)font textColorStr:(NSString *)colorStr{
    UIColor *color = [UIColor fan_colorWithHexString:colorStr];
    return [self fan_labelWithText:text font:font textColor:color typeFace:nil textAlignment:NSTextAlignmentLeft];
}

+ (instancetype)fan_labelWithText:( NSString * __nullable)text font:( CGFloat)font textColor:(UIColor * __nullable)color typeFace:(NSString * __nullable)typeFaceName textAlignment:(NSTextAlignment)textAlignment {
    
    UILabel *label = [UILabel new];
    
    if (text) {
        label.text = text;
    } else{
        label.text = @"等待初始化中...";
    }
    
    if (font > 0) {
        label.font = [UIFont systemFontOfSize:font];
    } else {
        label.font = [UIFont systemFontOfSize:12];
    }
    
    if (color) {
        label.textColor = color;
    } else {
        label.textColor = [UIColor blackColor];
    }
    
    if (font > 0 && typeFaceName) {
        [label setFont:[UIFont fontWithName:typeFaceName size:font]];
    }

    if (textAlignment) {
        label.textAlignment = textAlignment;
    } else {
        label.textAlignment = NSTextAlignmentLeft;
    }
    return label;
}

#pragma mark 这里是设置UIlabel 的属性

-(void)fan_setLineSpace:(CGFloat)lineSpace withText:(NSString *)text{
    
    if (!text ) {
          return;
      }
     NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
     paragraphStyle.lineSpacing = lineSpace;  //设置行间距
     paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
     paragraphStyle.alignment = NSTextAlignmentLeft;
     
     NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
     [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
     self.attributedText = attributedString;
}

@end
