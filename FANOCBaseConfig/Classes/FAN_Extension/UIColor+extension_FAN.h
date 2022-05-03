//
//  UIColor+extension_FAN.h
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/5/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (extension_FAN)

+ (instancetype)fan_colorWithHex:(uint32_t)hex;
+ (instancetype)fan_colorWithR:(int)red G:(int)green B:(int)blue alpha:(float)alpha;
+ (instancetype)fan_randomColor;
+ (instancetype)fan_colorWithHexString: (NSString *)color;

@end

NS_ASSUME_NONNULL_END
