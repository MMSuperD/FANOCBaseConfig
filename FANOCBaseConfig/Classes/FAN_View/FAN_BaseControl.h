//
//  FAN_BaseControl.h
//  Pods
//
//  Created by 王丹 on 2022/5/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FAN_BaseControl : UIControl

// 这个用来传值
@property (nonatomic,strong)id  dictData;

// 添加子View
- (void)addChildView;

// 初始化数据
- (void)initData;


+ (UIView *)keyWindow;

@end

NS_ASSUME_NONNULL_END
