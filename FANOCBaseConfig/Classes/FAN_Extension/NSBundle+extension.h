//
//  NSBundle+extension.h
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/7/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (extension)

+ (NSBundle *)fan_resourceBundle;

+ (NSBundle *)fan_resourceBundleForClassString:(NSString *)clsStr;

@end

NS_ASSUME_NONNULL_END
