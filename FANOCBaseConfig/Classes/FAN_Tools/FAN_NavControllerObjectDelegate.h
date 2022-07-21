//
//  FAN_NavControllerObjectDelegate.h
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/7/21.
//

#import <FANOCBaseConfig/FANOCBaseConfig.h>

NS_ASSUME_NONNULL_BEGIN

@interface FAN_TransitionObject : FAN_BaseObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic) BOOL isPush;


@end

@interface FAN_NavControllerObjectDelegate : FAN_BaseObject<UINavigationControllerDelegate>

@end

NS_ASSUME_NONNULL_END
