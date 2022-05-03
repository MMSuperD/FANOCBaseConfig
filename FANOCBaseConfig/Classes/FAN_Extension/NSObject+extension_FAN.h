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

@end

NS_ASSUME_NONNULL_END
