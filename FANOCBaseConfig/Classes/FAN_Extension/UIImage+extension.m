//
//  UIImage+extension.m
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/7/10.
//

#import "UIImage+extension.h"
#import "NSBundle+extension.h"

@implementation UIImage (extension)

+ (UIImage *)fan_imageWithName:(NSString *)imageName{
    
    return [self fan_imageWithName:imageName bundle:[NSBundle fan_resourceBundle]];
}

+ (UIImage *)fan_imageWithName:(NSString *)imageName bundle:(NSBundle *)bundle{
    
    return [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
}

@end
