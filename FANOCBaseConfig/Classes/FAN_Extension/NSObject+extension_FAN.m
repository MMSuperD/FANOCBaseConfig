//
//  NSObject+extension_FAN.m
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/5/3.
//

#import "NSObject+extension_FAN.h"
#import <objc/runtime.h>

@implementation NSObject (extension_FAN)

#pragma mark--Public method
-(void)fan_setDataDictionary:(NSDictionary *)dataDictionary
{
    [self fan_setAttributes:dataDictionary obj:self];
}

-(NSDictionary*)fan_dataDictionary
{
    //获取属性列表
    NSArray *properties = [self fan_propertyNames:[self class]];
    //根据属性列表获取属性值
    return [self fan_propertiesAndValuesDictionary:self properties:properties];
}
#pragma mark--- Private method
//通过属性名字拼凑 setter 方法
-(SEL)fan_getSetterSelWithAttibuteName:(NSString *)attributeName
{
    NSString *captial = [[attributeName substringToIndex:1]uppercaseString];
    NSString *setterSelStr = [NSString stringWithFormat:@"set%@%@:",captial,[attributeName substringFromIndex:1]];
    return NSSelectorFromString(setterSelStr);
}
//通过字典设置属性
-(void)fan_setAttributes:(NSDictionary *)dataDic obj:(id)obj
{
    //获取所有的key值
    NSEnumerator *keyEnum = [dataDic keyEnumerator];
    //字典的key值（与model的属性值一一对应）
    id attrbuteName = nil;
    while (attrbuteName = [keyEnum nextObject]) {
        //获取 拼凑的setter方法
        SEL sel = [obj fan_getSetterSelWithAttibuteName:attrbuteName];
        //验证setter方法是否能回应
        if ([obj respondsToSelector:sel]) {
            id value = nil;
            id tmpValue = dataDic[attrbuteName];
            if ([tmpValue isKindOfClass:[NSNull class]]) {
                //如果是NSNull 类型，则 value值为空
                value = @"";
            }
            else
            {
                value = tmpValue;
            }
            //执行setter 方法
            [obj performSelectorOnMainThread:sel withObject:value waitUntilDone:[NSThread isMainThread]];
        }
    }
}
//获取一个类的属性名字列表
-(NSArray *)fan_propertyNames:(Class)class
{
    NSMutableArray *propertyNames = [[NSMutableArray alloc]init];
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList(class, &propertyCount);
    for (unsigned int i =0; i<propertyCount; ++i) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        [propertyNames addObject:[NSString stringWithUTF8String:name]];
    }
    free(properties);
    return propertyNames;
}
//根据属性数组获取该属性的值
-(NSDictionary*)fan_propertiesAndValuesDictionary:(id)obj properties:(NSArray *)properties
{
    NSMutableDictionary *propertiesValueDic = [NSMutableDictionary dictionary];
    for (NSString *property in properties) {
        SEL getSel =NSSelectorFromString(property);
        if ([obj respondsToSelector:getSel]) {
            NSMethodSignature *signature = nil;
            signature = [obj methodSignatureForSelector:getSel];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            [invocation setTarget:obj];
            [invocation setSelector:getSel];
            NSObject *__unsafe_unretained valueObj = nil;
            [invocation invoke];
            [invocation getReturnValue:&valueObj];
            //assign to @"" string
            if (valueObj == nil) {
                valueObj = @"";
            }
            propertiesValueDic[property] = valueObj;
        }
    }
    return propertiesValueDic;
}

- (id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"key");
    return nil;
}


@end
