//
//  UIView+extension_FAN.m
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/5/3.
//

#import "UIView+extension_FAN.h"
#import <objc/runtime.h>


typedef  void(^TapBlock_FAN)(UIView *tapView);

@interface UIView()

@property (nonatomic,copy)TapBlock_FAN tapBlock;

@end

@implementation UIView (extension_FAN)

#pragma --mark
#pragma --mark x,y,w,h

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setMaxX:(CGFloat)maxX{
    CGRect frame = self.frame;
    frame.origin.x = maxX - frame.size.width;
    self.frame = frame;
}

- (CGFloat)maxX{
    return CGRectGetMaxX(self.frame);
}

- (void)setMaxY:(CGFloat)maxY{
    CGRect frame = self.frame;
    frame.origin.y = maxY - frame.size.height;
    self.frame = frame;
}

- (CGFloat)maxY{
    return CGRectGetMaxY(self.frame);
}


- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}


#pragma --mark
#pragma --mark border

- (UIColor *)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}

- (CGFloat)borderWidth
{
    return self.layer.borderWidth;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)radius
{
    return self.layer.cornerRadius;
}

- (void)setRadius:(CGFloat)radius
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius  = radius;
}

#pragma --mark
#pragma --mark Remove all subviews

- (void)removeAllSubviews
{
    while ([self.subviews count]) {
        [[self.subviews lastObject] removeFromSuperview];
    }
}

- (void)tapClick:(void (^)(UIView * _Nonnull))tapBlock{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTap:)];
    [self addGestureRecognizer:tap];
    self.tapBlock = tapBlock;
}


- (void)actionTap:(UITapGestureRecognizer *)tap{
    UIView *tapView = tap.view;
    if (self.tapBlock) {
        self.tapBlock(tapView);
    }
}

- (void)setTapBlock:(TapBlock_FAN)tapBlock{
//    objc_setAssociatedObject(self, @selector(tapBlock), tapBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(self), tapBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);

}
- (TapBlock_FAN)tapBlock{
//    return objc_getAssociatedObject(self, _cmd);
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(self));
}

/**
 交换两个方法
 */
+ (void)method_exchangeClassStr:(NSString *)clsString selector:(SEL)sourceSel selector:(SEL)newSel{
    
    Class cls = NSClassFromString(clsString);
    Method method1 = class_getInstanceMethod(cls, sourceSel);
    Method method2 = class_getInstanceMethod(cls, newSel);
    method_exchangeImplementations(method1, method2);
}



@end
