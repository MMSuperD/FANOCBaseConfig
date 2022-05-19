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

@end

NS_ASSUME_NONNULL_END
