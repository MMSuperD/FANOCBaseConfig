//
//  UIView+extension_FAN.h
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/5/3.
//

#import <UIKit/UIKit.h>

// View 圆角和加边框
#define VIEW_BORDER_RADIUS(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define VIEW_RADIUS(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

NS_ASSUME_NONNULL_BEGIN

@interface UIView (extension_FAN)

/**
 * @brief 位置
 */
/** UIView 的坐标X点 */
@property (nonatomic, assign) CGFloat x;
/** UIView 的坐标Y点 */
@property (nonatomic, assign) CGFloat y;

/** UIView 的中心点X值 */
@property (nonatomic, assign) CGFloat centerX;
/** UIView 的中心点Y值 */
@property (nonatomic, assign) CGFloat centerY;

/** UIView的最大X值 */
@property (assign, nonatomic) CGFloat maxX;
/** UIView的最大Y值 */
@property (assign, nonatomic) CGFloat maxY;

/** UIView 的宽度 */
@property (nonatomic, assign) CGFloat width;
/** UIView 的高度 */
@property (nonatomic, assign) CGFloat height;

/** UIView 的 size */
@property (nonatomic, assign) CGSize size;
/** UIView 的坐标 */
@property (nonatomic, assign) CGPoint origin;

/**
 * @brief 边框颜色
 */
@property (nonatomic, strong) UIColor * borderColor;
/**
 * @brief 边框宽度
 */
@property (nonatomic, assign) CGFloat   borderWidth;
/**
 * @brief 园角
 */
@property (nonatomic, assign) CGFloat   radius;

/**
 * @brief 删除所有子试图
 */
- (void)removeAllSubviews;

/**
 View的点击事件，通过UITapGestureRecognizer 实现的
 */
- (void)tapClick:(void(^)(UIView *clickView))tapView;

/**
 交换两个方法
 */
+ (void)method_exchangeClassStr:(NSString *)clsString selector:(SEL)sourceSel selector:(SEL)newSel;

@end

NS_ASSUME_NONNULL_END
