//
//  ConstFile_FAN.h
//  Pods
//
//  Created by 王丹 on 2022/5/3.
//

#import "ConstFun_FAN.h"


#ifndef ConstFile_FAN_h
#define ConstFile_FAN_h

// 屏幕的宽
#define SCREEN_WIDTH_FAN    [UIScreen mainScreen].bounds.size.width

// 屏幕的高
#define SCREEN_HEIGHT_FAN    [UIScreen mainScreen].bounds.size.height

// 屏幕的尺寸
#define SCREEN_SIZE_FAN      [UIScreen mainScreen].bounds.size

// 屏幕的Bounds
#define SCREEN_BOUNDS_FAN      [UIScreen mainScreen].bounds

//顶部安全区域
#define SAVEAREA_TOP_FAN    (([ConstFun_FAN IS_IPHONE_X_FAN]) ? 34.0 : 20)

//底部安全区域
#define SAVEAREA_BTM_FAN    (([ConstFun_FAN IS_IPHONE_X_FAN]) ? 34.0 : 0.0)

//状态栏的高度
#define STATUSBAR_HEIGHT_FAN    (([ConstFun_FAN IS_IPHONE_X_FAN]) ? 34.0 : 20.0)

//导航栏的高度
#define NAVBAR_HEIGHT_FAN    (([ConstFun_FAN IS_IPHONE_X_FAN]) ? 54.0 : 44.0)

//状态栏 + 导航栏 的高度
#define STATUSBAR_NAVBAR_HEIGHT_FAN    (STATUSBAR_HEIGHT_FAN + NAVBAR_HEIGHT_FAN)

//TabBar的高度
#define TARBAR_HEIGHT_FAN    (([ConstFun_FAN IS_IPHONE_X_FAN]) ? 83.0 : 49.0)


#endif /* ConstFile_FAN_h */
