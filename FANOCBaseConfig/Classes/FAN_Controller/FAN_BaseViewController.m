//
//  FAN_BaseViewController.m
//  Pods
//
//  Created by 王丹 on 2022/5/3.
//

#import "FAN_BaseViewController.h"

@interface FAN_BaseViewController ()

@end

@implementation FAN_BaseViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.isTurnOnNavRightPanGesture = YES;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"order:%s",__FUNCTION__);
    [self addNvView];

    [self initNotification];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"order:%s",__FUNCTION__);
    [self hiddenNVView];
    if (!self.isTurnOnNavRightPanGesture) {
        // 禁用返回手势
        if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        }
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"order:%s",__FUNCTION__);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"order:%s",__FUNCTION__);
    // 开启返回手势
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"order:%s",__FUNCTION__);
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.titleLabel.text = title;
}



- (void)initNavRightSlideDelegate {
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

// 隐藏系统的导航栏
- (void)hiddenNVView {
    if (self.navigationController) {
//        [self.navigationController.navigationBar setHidden:YES];
        [self.navigationController setNavigationBarHidden:YES animated:NO];
    }
    self.view.backgroundColor = [UIColor whiteColor];

}


// 自定义导航栏 默认是有导航栏的 需要重写该方法
- (void)addNvView {

    [self.view addSubview:self.nvView];

    [self.nvView addSubview:self.lineView];

    [self addTitleView];

    [self addLeftNvBarBtn];

    [self addRightNvBarBtn];

}

//  自定义TitleView 需要重写该方法
- (void)addTitleView {
    [self.nvView addSubview:self.titleLabel];

}

//  自定义左边按钮 默认只有一个 默认显示 需要重写该方法
- (void)addLeftNvBarBtn {
    self.leftNvBarBtn.hidden = NO;
    [self.nvView addSubview:self.leftNvBarBtn];

}

//  自定义右边按钮 默认只有一个 默认隐藏 需要重写该方法
- (void)addRightNvBarBtn {
//    self.rightNvBarBtn.hidden = YES;
    [self.nvView addSubview:self.rightNvBarBtn];
}


// 添加子控件 需要重写该方法
- (void)addChildSubview {

}

// 加载数据
- (void)loadData {

}

// 初始化数据
- (void)initData {

}

// 服务器异常通知界面
- (void)actionXTServiceBreakNotification:(NSNotification *)sender {
   // [XTFuncTools showServicePage];
}

// 特定的控制器通知
- (void)actionVCNotification:(NSNotification *)sender {

}

// 服务器异常通知界面
- (void)showBreakPage{
   // [XTFuncTools showServicePage];
}




// 显示序号控制器
- (void)showVcIndex:(NSArray<NSNumber *> *)numArray {

    NSMutableArray *vcArray = [NSMutableArray array];
    NSInteger vcNumber = self.navigationController.viewControllers.count;
    NSInteger temp;
    if (self.navigationController) {
        for (int i = 0; i < numArray.count; i++) {
            temp = [numArray[i] integerValue];
            if (temp < vcNumber) {
                [vcArray addObject:self.navigationController.viewControllers[temp]];
            }
        }
    }
    self.navigationController.viewControllers = vcArray;

}

// 添加CoverView
- (void)addCoverView {
    [self.view addSubview:self.coverView];
    [self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

// 移除CoverView
- (void)removeCoverView {

    if (self.coverView.superview) {
        dispatch_async(dispatch_get_main_queue(), ^{

            [UIView animateWithDuration:0.25 animations:^{
                self.coverView.alpha = 0;
            } completion:^(BOOL finished) {
                [self.coverView removeFromSuperview];
                self.coverView = nil;
            }];
        });

    }

}

// 显示当前控制器 和 第一个控制器
- (void)showCurrentAndFirstController {

    if (self.navigationController) {
        NSMutableArray *vcArray = [NSMutableArray array];
        if (![self isEqual:self.navigationController.viewControllers[0]]) {
            [vcArray addObject:self.navigationController.viewControllers[0]];
            [vcArray addObject:self];
            self.navigationController.viewControllers = vcArray;
        }
    }
}

// 初始化通知
- (void)initNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(actionFNewBaseViewControllerRefreshDataNofication) name:FAN_BaseViewControllerRefreshDataNofication object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(actionXTServiceBreakNotification:) name:XTServieBreakNotification object:nil];

    NSString *notificationString = [NSString stringWithFormat:@"%@Notification",NSStringFromClass([self class])];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(actionVCNotification:) name:notificationString object:nil];

}



// 显示状态栏
- (BOOL)prefersStatusBarHidden {
    return NO;
}

#pragma mark 响应事件
// 通知响应事件
- (void)actionFNewBaseViewControllerRefreshDataNofication {
    [self loadData];
}

// 左边按钮点击事件
- (void)leftButtonClick:(UIButton *)sender {
    if (self.navigationController) {
        for (UIView *tempView in [UIApplication sharedApplication].keyWindow.subviews) {
            if (tempView.tag == 10008) {
                [tempView removeFromSuperview];
                break;
            }
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
}

// 右边按钮点击事件
- (void)rightButtonClick:(UIButton *)sender {

}

#pragma mark - getter
- (UIView *)nvView {
    if (!_nvView) {
        _nvView = [UIView new];
        _nvView.backgroundColor = [UIColor whiteColor];
        _nvView.frame = CGRectMake(0, 0, SCREEN_WIDTH_FAN, NAVBAR_HEIGHT_FAN);
    }
    return _nvView;
}

- (UIView *)lineView {
    if (_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, NAVBAR_HEIGHT_FAN - 1, SCREEN_WIDTH_FAN, 1)];
        _lineView.backgroundColor = [UIColor fan_colorWithHexString:@"e9e9e9"];
    }
    return _lineView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,  SCREEN_WIDTH_FAN - 120, 20)];
        _titleLabel.centerX = SCREEN_WIDTH_FAN / 2;
        _titleLabel.centerY = SAVEAREA_TOP_FAN + (NAVBAR_HEIGHT_FAN * 1.0 / 2);
        _titleLabel.textColor = [UIColor fan_colorWithHexString:@"333333"];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
    }
    return _titleLabel;
}

- (UIButton *)leftNvBarBtn {
    if (!_leftNvBarBtn) {
        _leftNvBarBtn = [UIButton buttonWithType:0];
//        _leftNvBarBtn.frame = CGRectMake(15, (44 - 16)/2 + XZFNavHeight, 10, 16);
        _leftNvBarBtn.frame = CGRectMake(0, SAVEAREA_TOP_FAN, 40, NAVBAR_HEIGHT_FAN);
        [_leftNvBarBtn setImage:[UIImage imageNamed:@"icon_back_4.8"] forState:UIControlStateNormal];
        [_leftNvBarBtn addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftNvBarBtn;
}

- (UIButton *)rightNvBarBtn {
    if (!_rightNvBarBtn) {
        _rightNvBarBtn = [UIButton buttonWithType:0];
        _rightNvBarBtn.titleLabel.font = [UIFont systemFontOfSize:14];;
        _rightNvBarBtn.frame = CGRectMake(SCREEN_WIDTH_FAN - 60 - 15, STATUSBAR_NAVBAR_HEIGHT_FAN, 60, 44);
        [_rightNvBarBtn setTitleColor:[UIColor fan_colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [_rightNvBarBtn setTitle:@"" forState:UIControlStateNormal];
        [_rightNvBarBtn addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightNvBarBtn;
}


- (UIView *)coverView {
    if (!_coverView) {
        _coverView = [UIView new];
        [_coverView setBackgroundColor:[UIColor whiteColor]];
    }
    return _coverView;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:FAN_BaseViewControllerRefreshDataNofication object:nil];
     NSString *notificationString = [NSString stringWithFormat:@"%@Notification",NSStringFromClass([self class])];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:notificationString object:nil];
    NSLog(@"%@",NSStringFromClass([self class]));
}


@end
