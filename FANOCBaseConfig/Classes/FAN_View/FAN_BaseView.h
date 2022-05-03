//
//  FAN_BaseView.h
//  Pods
//
//  Created by 王丹 on 2022/5/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FAN_BaseView : UIView

// 这个用来传值
@property (nonatomic,strong)id  dictData;

// 添加子View
- (void)addChildView;


+ (UIView *)keyWindow;

@end

NS_ASSUME_NONNULL_END
