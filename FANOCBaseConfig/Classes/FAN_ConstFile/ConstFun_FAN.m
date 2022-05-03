//
//  ConstFun_FAN.m
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/5/3.
//

#import "ConstFun_FAN.h"

@implementation ConstFun_FAN

//判断是否是IPHONE X 系列
+ (BOOL)IS_IPHONE_X_FAN {
    
    if (@available(iOS 11.0, *)) {
        
        BOOL isX = UIApplication.sharedApplication.windows.firstObject.safeAreaInsets.bottom > 0;
        return isX;
    }
    
    
    return NO;
    
}

@end
