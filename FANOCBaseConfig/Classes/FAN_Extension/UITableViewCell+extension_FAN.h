//
//  UITableViewCell+extension_FAN.h
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (extension_FAN)


- (CGFloat)cellHeight;
+ (CGFloat)cellHeight;

// cell 的点击事件
- (void)cellClick;

@end

NS_ASSUME_NONNULL_END
