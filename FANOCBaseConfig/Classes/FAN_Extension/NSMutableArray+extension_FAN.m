//
//  NSMutableArray+extension_FAN.m
//  FANOCBaseConfig
//
//  Created by xzmac on 2022/5/19.
//

#import "NSMutableArray+extension_FAN.h"
#import <objc/runtime.h>
#import "NSObject+extension_FAN.h"
@implementation NSMutableArray (extension_FAN)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 类簇：NSString、NSArray、NSDictionary，真实类型是其他类型
            [self method_exchangeClassStr:@"__NSArrayM" selector:@selector(insertObject:atIndex:) selector:@selector(fan_insertObject:atIndex:)];
    });
    
}

- (void)fan_insertObject:(id)anObject atIndex:(NSUInteger)index{
    
    if (anObject == nil) {
        
        NSLog(@"insert %zd 的值为 nil,所以这个值不能插入成功",index);
        return;
    }
    [self fan_insertObject:anObject atIndex:index];
}

@end
