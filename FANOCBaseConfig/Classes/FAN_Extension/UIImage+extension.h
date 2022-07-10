//
//  UIImage+extension.h
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/7/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (extension)

+ (UIImage *)fan_imageWithName:(NSString *)imageName;

+ (UIImage *)fan_imageWithName:(NSString *)imageName bundle:(NSBundle *)bundle;

@end

NS_ASSUME_NONNULL_END
