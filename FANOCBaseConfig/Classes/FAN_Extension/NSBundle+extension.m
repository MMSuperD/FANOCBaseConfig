//
//  NSBundle+extension.m
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/7/10.
//

#import "NSBundle+extension.h"

@implementation NSBundle (extension)


+ (NSBundle *)fan_resourceBundle{
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"FANOCBaseConfig" ofType:@"bundle"];
    if (bundlePath) {
        return [NSBundle mainBundle];
    }
    
    
    return [self fan_resourceBundleForClassString:@"FAN_BaseViewController"];
}

+ (NSBundle *)fan_resourceBundleForClassString:(NSString *)clsStr{
    
    Class cls = NSClassFromString(clsStr);
    
    NSString *resourceBundlePath = [[NSBundle bundleForClass:cls] pathForResource:@"FANOCBaseConfig" ofType:@"bundle"];

    return [NSBundle bundleWithPath:resourceBundlePath];
}

@end
