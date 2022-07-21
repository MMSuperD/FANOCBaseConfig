//
//  FAN_BaseViewController.h
//  Pods
//
//  Created by 王丹 on 2022/5/3.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "ConstFile_FAN.h"
#import "UIColor+extension_FAN.h"
#import "ConstFun_FAN.h"
#import "UIView+extension_FAN.h"
NS_ASSUME_NONNULL_BEGIN

#define FAN_BaseViewControllerRefreshDataNofication  (@"FAN_BaseViewControllerRefreshDataNofication")


typedef void(^ReturnBlock_FAN)( _Nullable id);

@interface FAN_BaseViewController : UIViewController<UIGestureRecognizerDelegate>

// 默认导航栏左边返回按钮
@property (nonatomic,strong)UIButton *leftNvBarBtn;

// 默认导航栏右边按钮 默认隐藏
@property (nonatomic,strong)UIButton *rightNvBarBtn;

//  导航View
@property (nonatomic,strong)UIView   *nvView;

//导航栏底部线条
@property (nonatomic, strong) UIView *lineView;

//  标题
@property (nonatomic,strong)UILabel *titleLabel;

// 没有网络时候的View
@property (nonatomic,strong)UIView  *noNetworkView;

// 网络加载前的View(默认没有使用)
@property (nonatomic,strong,nullable)UIView *coverView;

// 返回Blcok
@property (nonatomic,copy)ReturnBlock_FAN returnBlock;

// 是否打开右滑导航控制器的右侧滑关闭页面的手势 默认打开 可以侧滑
@property (nonatomic,assign)BOOL isTurnOnNavRightPanGesture;

// 是否开启导航控制器的转场动画效果 默认不开启
@property (nonatomic,assign)BOOL isTrunOnTransitionAnimation;


// 自定义导航栏 默认是有导航栏的 需要重写该方法
- (void)addNvView;

//  自定义TitleView 需要重写该方法
- (void)addTitleView;

//  自定义左边按钮 默认只有一个 默认显示 需要重写该方法
- (void)addLeftNvBarBtn;

//  自定义右边按钮 默认只有一个 默认隐藏 需要重写该方法
- (void)addRightNvBarBtn;

// 添加子控件 需要重写该方法
- (void)addChildSubview;

// 加载数据
- (void)loadData;

// 初始化数据
- (void)initData;

// 初始化通知
- (void)initNotification;

// 左边按钮点击事件
- (void)leftButtonClick:(UIButton *)sender;

// 右边按钮点击事件
- (void)rightButtonClick:(UIButton *)sender;

// 服务器异常通知界面
- (void)actionXTServiceBreakNotification:(NSNotification *)sender;

// 特定的控制器通知 可用于刷新界面
- (void)actionVCNotification:(NSNotification *)sender;

// 显示序号控制器
- (void)showVcIndex:(NSArray<NSNumber *> *)numArray;

// 显示当前控制器 和 第一个控制器
- (void)showCurrentAndFirstController;



// 添加CoverView
- (void)addCoverView;

// 移除CoverView
- (void)removeCoverView;

@end

NS_ASSUME_NONNULL_END
