//
//  FAN_BaseTableViewCell.h
//  Pods
//
//  Created by 王丹 on 2022/5/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FAN_BaseTableViewCell : UITableViewCell

- (void)addChildView;

- (void)initData;

- (void)addTarget;

@end

NS_ASSUME_NONNULL_END
