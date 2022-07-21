//
//  FAN_NavControllerObjectDelegate.m
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/7/21.
//

#import "FAN_NavControllerObjectDelegate.h"

@interface FAN_TransitionObject()<CAAnimationDelegate>

@property (nonatomic, strong) id<UIViewControllerContextTransitioning> context;



@end

@implementation FAN_TransitionObject

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    self.context = transitionContext;
    
    UIView *containerView = [transitionContext containerView];
        
    //添加动画
    UIViewController *VC1 = nil,*VC2 = nil;

    if (_isPush) {
        VC1 = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        VC2 = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    }else{
        VC2 = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        VC1 = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    }
    
    [containerView addSubview:VC1.view];
    [containerView addSubview:VC2.view];
        
    // 这个是小圆
    CGRect frame = CGRectMake(SCREEN_WIDTH_FAN - 80, SCREEN_HEIGHT_FAN - 80, 40, 40);
    
    UIBezierPath *smallPath = [UIBezierPath bezierPathWithOvalInRect:frame];
    CGPoint centerP;
    centerP = CGPointMake(SCREEN_WIDTH_FAN - 80 + 40, SCREEN_HEIGHT_FAN - 80 + 40);
    
    
    //画大圆
    CGFloat radius = sqrtf(SCREEN_WIDTH_FAN * SCREEN_WIDTH_FAN + SCREEN_HEIGHT_FAN * SCREEN_HEIGHT_FAN);
    UIBezierPath *bigPath = [UIBezierPath bezierPathWithArcCenter:centerP radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];

    if (_isPush) {
        shapeLayer.path = bigPath.CGPath;

    }else{
        shapeLayer.path = smallPath.CGPath;

    }
    
    
    //9.添加蒙板
    UIViewController *VC;
    if (_isPush) {
        VC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    }else{
        VC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    }
    VC.view.layer.mask = shapeLayer;
    
    
    //10.给layer添加动画
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"path"];
    if (_isPush) {
        anim.fromValue = (id)smallPath.CGPath;

    }else{
        anim.fromValue = (id)bigPath.CGPath;

    }
    anim.duration = [self transitionDuration:transitionContext];
    anim.delegate = self;
    
    [shapeLayer addAnimation:anim forKey:nil];
    
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 1;
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [_context completeTransition:YES];
    if (_isPush) {
        UIViewController *tovc = [_context viewControllerForKey:UITransitionContextToViewControllerKey];
        tovc.view.layer.mask = nil;
    }else{
        UIViewController *tovc = [_context viewControllerForKey:UITransitionContextFromViewControllerKey];
        tovc.view.layer.mask = nil;
    }
   
}
@end

@implementation FAN_NavControllerObjectDelegate


- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    switch (operation) {
        case UINavigationControllerOperationPop:
        {
            FAN_TransitionObject *trans = [FAN_TransitionObject new];
            trans.isPush = NO;
            return trans;
            
            break;
        }
            
        case UINavigationControllerOperationPush:
        {
            FAN_TransitionObject *trans = [FAN_TransitionObject new];
            trans.isPush = YES;
            return trans;
            
            break;
        }
        case UINavigationControllerOperationNone:
        {
            return nil;
        }
        default:
            break;
    }
    
    
    return nil;
    
}

@end
