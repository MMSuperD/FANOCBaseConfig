//
//  NSMutableDictionary+extension_FAN.m
//  FANOCBaseConfig
//
//  Created by xzmac on 2022/5/19.
//

#import "NSMutableDictionary+extension_FAN.h"
#import <objc/runtime.h>
#import "NSObject+extension_FAN.h"

@implementation NSMutableDictionary (extension_FAN)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 类簇：NSString、NSArray、NSDictionary，真实类型是其他类型
        [self method_exchangeClassStr:@"__NSDictionaryM" selector:@selector(setObject:forKeyedSubscript:) selector:@selector(fan_setObject:forKeyedSubscript:)];
        
        [self method_exchangeClassStr:@"__NSDictionaryI" selector:@selector(objectForKeyedSubscript:) selector:@selector(fan_objectForKeyedSubscript:)];
    });
    
}

- (void)fan_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key
{
    if (!key) {
        NSLog(@"字典设置值得时候 key 不能够为空");
        return;
    }
    [self fan_setObject:obj forKeyedSubscript:key];
}

- (id)fan_objectForKeyedSubscript:(id)key
{
    if (!key){
        
        NSLog(@"字典获取值得时候 key 不能够为空");
        return nil;
    }
    
    return [self fan_objectForKeyedSubscript:key];
}

@end
