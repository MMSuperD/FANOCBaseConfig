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

/**
 交换两个方法
 */
- (void)method_exchangeClassStr:(NSString *)clsString selector:(SEL)sourceSel selector:(SEL)newSel{
    
    Class cls = NSClassFromString(clsString);
    Method method1 = class_getInstanceMethod(cls, sourceSel);
    Method method2 = class_getInstanceMethod(cls, newSel);
    method_exchangeImplementations(method1, method2);
}

/**
 *  @brief 根据方法名 参数 调用方法
 *  @param selector 方法名
 *  @param objects  参数数组
 *  @return 被调用的方法的返回值和参数都不支持结构体和block，仅仅支持基本数值类型和对象
 */
- (id)fan_performSelector:(SEL)selector withObjects:(NSArray *)objects
{
    
    // 方法签名(方法的描述)
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:selector];
    if (signature == nil) {
        
        //可以抛出异常也可以不操作。
    }
    
    // NSInvocation : 利用一个NSInvocation对象包装一次方法调用（方法调用者、方法名、方法参数、方法返回值）
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    
    //获取返回类型
    const char *returnType = [signature methodReturnType];
    // 判断返回值类型 根据类型转化数据类型
    NSString *returnTypeString = [NSString stringWithUTF8String:returnType];
    
    // 设置参数
    NSInteger paramsCount = signature.numberOfArguments - 2; // 除self、_cmd以外的参数个数
    paramsCount = MIN(paramsCount, objects.count);
    for (int i = 0; i < paramsCount; i++) {
        // 取出参数对象
        id obj = objects[i];
        // 判断需要设置的参数是否是NSNull, 如果是就设置为nil
        if ([obj isKindOfClass:[NSNull class]]) {
            obj = nil;
        }
        // 获取参数类型
        const char *argumentType = [signature getArgumentTypeAtIndex:i + 2];
        
        // 判断参数类型 根据类型转化数据类型
        NSString *argumentTypeString = [NSString stringWithUTF8String:argumentType];
        
        if ([argumentTypeString isEqualToString:@"@"]) { // id
            [invocation setArgument:&obj atIndex:i + 2];
        }  else if ([argumentTypeString isEqualToString:@"B"]) { // bool
            bool objVaule = [obj boolValue];
            [invocation setArgument:&objVaule atIndex:i + 2];
        } else if ([argumentTypeString isEqualToString:@"f"]) { // float
            float objVaule = [obj floatValue];
            [invocation setArgument:&objVaule atIndex:i + 2];
        } else if ([argumentTypeString isEqualToString:@"d"]) { // double
            double objVaule = [obj doubleValue];
            [invocation setArgument:&objVaule atIndex:i + 2];
        } else if ([argumentTypeString isEqualToString:@"c"]) { // char
            char objVaule = [obj charValue];
            [invocation setArgument:&objVaule atIndex:i + 2];
        } else if ([argumentTypeString isEqualToString:@"i"]) { // int
            int objVaule = [obj intValue];
            [invocation setArgument:&objVaule atIndex:i + 2];
        } else if ([argumentTypeString isEqualToString:@"I"]) { // unsigned int
            unsigned int objVaule = [obj unsignedIntValue];
            [invocation setArgument:&objVaule atIndex:i + 2];
        } else if ([argumentTypeString isEqualToString:@"S"]) { // unsigned short
            unsigned short objVaule = [obj unsignedShortValue];
            [invocation setArgument:&objVaule atIndex:i + 2];
        } else if ([argumentTypeString isEqualToString:@"L"]) { // unsigned long
            unsigned long objVaule = [obj unsignedLongValue];
            [invocation setArgument:&objVaule atIndex:i + 2];
        } else if ([argumentTypeString isEqualToString:@"s"]) { // shrot
            short objVaule = [obj shortValue];
            [invocation setArgument:&objVaule atIndex:i + 2];
        } else if ([argumentTypeString isEqualToString:@"l"]) { // long
            long objVaule = [obj longValue];
            [invocation setArgument:&objVaule atIndex:i + 2];
        } else if ([argumentTypeString isEqualToString:@"q"]) { // long long
            long long objVaule = [obj longLongValue];
            [invocation setArgument:&objVaule atIndex:i + 2];
        } else if ([argumentTypeString isEqualToString:@"C"]) { // unsigned char
            unsigned char objVaule = [obj unsignedCharValue];
            [invocation setArgument:&objVaule atIndex:i + 2];
        } else if ([argumentTypeString isEqualToString:@"Q"]) { // unsigned long long
            unsigned long long objVaule = [obj unsignedLongLongValue];
            [invocation setArgument:&objVaule atIndex:i + 2];
        } else if ([argumentTypeString isEqualToString:@"{CGRect={CGPoint=dd}{CGSize=dd}}"]) { // CGRect
            CGRect objVaule = [obj CGRectValue];
            [invocation setArgument:&objVaule atIndex:i + 2];
        } else if ([argumentTypeString isEqualToString:@"{UIEdgeInsets=dddd}"]) { // UIEdgeInsets
            UIEdgeInsets objVaule = [obj UIEdgeInsetsValue];
            [invocation setArgument:&objVaule atIndex:i + 2];
        }
    }
    // 调用方法
    [invocation invoke];
    id result ;
    //获取返回值
    if ([returnTypeString isEqualToString:@"@"]) { // id
        void * returnValue;
        if (signature.methodReturnLength){
            [invocation getReturnValue:&returnValue];
            result= (__bridge id)returnValue;
            returnValue = nil;
            
        }else{
            result= nil;
            
        }
    }  else if ([returnTypeString isEqualToString:@"B"]) { // bool
        bool returnValue;
        if (signature.methodReturnLength){
            [invocation getReturnValue:&returnValue];
            result= [NSNumber numberWithBool:returnValue];
        }else{
            result= nil;
        }
    } else if ([returnTypeString isEqualToString:@"f"]) { // float
        float returnValue;
        if (signature.methodReturnLength){
            [invocation getReturnValue:&returnValue];
            result= [NSNumber numberWithFloat:returnValue];
            
        }else{
            result= nil;
            
        }
    } else if ([returnTypeString isEqualToString:@"d"]) { // double
        double returnValue;
        if (signature.methodReturnLength){
            [invocation getReturnValue:&returnValue];
            result= [NSNumber numberWithDouble:returnValue];
            
        }else{
            result= nil;
            
        }
    } else if ([returnTypeString isEqualToString:@"c"]) { // char
        char returnValue;
        if (signature.methodReturnLength){
            [invocation getReturnValue:&returnValue];
            result= [NSNumber numberWithChar:returnValue];
            
        }else{
            result= nil;
            
        }
    } else if ([returnTypeString isEqualToString:@"i"]) { // int
        int returnValue; if (signature.methodReturnLength){
            [invocation getReturnValue:&returnValue];
            result= [NSNumber numberWithInt:returnValue];
            
        }else{
            result= nil;
            
        }
    } else if ([returnTypeString isEqualToString:@"I"]) { // unsigned int
        unsigned int returnValue;
        if (signature.methodReturnLength){
            [invocation getReturnValue:&returnValue];
            result= [NSNumber numberWithUnsignedInteger:returnValue];
            
        }else{
            result= nil;
            
        }
    } else if ([returnTypeString isEqualToString:@"S"]) { // unsigned short
        unsigned short returnValue;
        if (signature.methodReturnLength){
            [invocation getReturnValue:&returnValue];
            result= [NSNumber numberWithUnsignedShort:returnValue];
            
        }else{
            result= nil;
            
        }
    } else if ([returnTypeString isEqualToString:@"L"]) { // unsigned long
        unsigned long returnValue;
        if (signature.methodReturnLength){
            [invocation getReturnValue:&returnValue];
            result= [NSNumber numberWithUnsignedLong:returnValue];
            
        }else{
            result= nil;
            
        }
    } else if ([returnTypeString isEqualToString:@"s"]) { // shrot
        short returnValue;
        if (signature.methodReturnLength){
            [invocation getReturnValue:&returnValue];
            result= [NSNumber numberWithShort:returnValue];
            
        }else{
            result= nil;
            
        }
    } else if ([returnTypeString isEqualToString:@"l"]) { // long
        long returnValue;
        if (signature.methodReturnLength){
            [invocation getReturnValue:&returnValue];
            result= [NSNumber numberWithLong:returnValue];
            
        }else{
            result= nil;
            
        }
    } else if ([returnTypeString isEqualToString:@"q"]) { // long long
        long long returnValue;
        if (signature.methodReturnLength){
            [invocation getReturnValue:&returnValue];
            result= [NSNumber numberWithLongLong:returnValue];
            
        }else{
            result= nil;
            
        }
    } else if ([returnTypeString isEqualToString:@"C"]) { // unsigned char
        unsigned char returnValue;
        if (signature.methodReturnLength){
            [invocation getReturnValue:&returnValue];
            result= [NSNumber numberWithUnsignedChar:returnValue];
            
        }else{
            result= nil;
            
        }
    } else if ([returnTypeString isEqualToString:@"Q"]) { // unsigned long long
        unsigned long long returnValue;if (signature.methodReturnLength){
            [invocation getReturnValue:&returnValue];
            result= [NSNumber numberWithUnsignedLongLong:returnValue];
            
        }else{result= nil;}
    }else if([returnTypeString isEqualToString:@"v"]){
        result= nil;
    }else{
        //        PA_THROW_EXCEPTION(@"不能识别的返回类型");
        result= nil;
    }
    signature = nil;
    invocation = nil;
    return result;
    //    else if ([returnTypeString isEqualToString:@"{CGRect={CGPoint=dd}{CGSize=dd}}"]) { // CGRect
    //        CGRect returnValue;[invocation getReturnValue:&returnValue]; return [NSValue valueWithCGRect:returnValue];
    //    } else if ([returnTypeString isEqualToString:@"{UIEdgeInsets=dddd}"]) { // UIEdgeInsets
    //        UIEdgeInsets returnValue;[invocation getReturnValue:&returnValue]; return [NSValue valueWithUIEdgeInsets:returnValue];
    //    }
    //    @"{CGPoint=dd}" @"{CGSize=dd}" @"{UIOffset=dd}"
    
}

/**
 *  @brief 根据方法名 参数 调用方法
 *  @param funcStr 方法名
 *  @param objects  参数数组
 *  @return 被调用的方法的返回值和参数都不支持结构体和block，仅仅支持基本数值类型和对象
 */
- (id)fan_performFuncStr:(NSString *)funcStr withObjects:(NSArray *)objects{
    
    return [self fan_performSelector:NSSelectorFromString(funcStr) withObjects:objects];
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
