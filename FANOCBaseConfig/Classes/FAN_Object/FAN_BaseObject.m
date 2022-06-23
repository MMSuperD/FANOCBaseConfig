//
//  FAN_BaseObject.m
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/6/23.
//

#import "FAN_BaseObject.h"

@implementation FAN_BaseObject

- (void)dealloc{
    NSLog(@"dealloc:%@",NSStringFromClass([self class]));
}

@end
