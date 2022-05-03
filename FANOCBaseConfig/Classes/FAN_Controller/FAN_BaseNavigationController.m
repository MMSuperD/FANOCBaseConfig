//
//  FAN_BaseNavigationController.m
//  Pods
//
//  Created by 王丹 on 2022/5/3.
//

#import "FAN_BaseNavigationController.h"

@interface FAN_BaseNavigationController ()

@end

@implementation FAN_BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    [super pushViewController:viewController animated:YES];
}

@end
