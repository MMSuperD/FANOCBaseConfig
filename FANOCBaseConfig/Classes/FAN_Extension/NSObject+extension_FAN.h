//
//  NSObject+extension_FAN.h
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/5/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (extension_FAN)

-(void)fan_setDataDictionary:(NSDictionary *)dataDictionary;
-(NSDictionary*)fan_dataDictionary;

/**
 交换两个方法
 */
- (void)method_exchangeClassStr:(NSString *)clsString selector:(SEL)sourceSel selector:(SEL)newSel;

/**
 *  @brief 根据方法名 参数 调用方法
 *  @param selector 方法名
 *  @param objects  参数数组
 *  @return 被调用的方法的返回值和参数都不支持结构体和block，仅仅支持基本数值类型和对象
 */
- (id)fan_performSelector:(SEL)selector withObjects:(NSArray *)objects;

/**
 *  @brief 根据方法名 参数 调用方法
 *  @param funcStr 方法名
 *  @param objects  参数数组
 *  @return 被调用的方法的返回值和参数都不支持结构体和block，仅仅支持基本数值类型和对象
 */
- (id)fan_performFuncStr:(NSString *)funcStr withObjects:(NSArray *)objects;

@end

NS_ASSUME_NONNULL_END
