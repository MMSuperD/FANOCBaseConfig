//
//  FAN_NoDataView.h
//  Pods
//
//  Created by 王丹 on 2022/5/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FAN_NoDataView : UIView

@property (nonatomic,copy)NSString *imageName;

@property (nonatomic,copy)NSString *titleStr;

@property (nonatomic, assign)CGFloat offY;

/// 是否显示按钮，默认不显示
@property (nonatomic, assign)BOOL showBtn;

/// 按钮点击回调
@property (nonatomic, copy)dispatch_block_t btnBlock;

+ (FAN_NoDataView *)noDataViewImageName:(NSString *)imageName title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
