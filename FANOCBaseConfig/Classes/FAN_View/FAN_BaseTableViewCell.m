//
//  FAN_BaseTableViewCell.m
//  Pods
//
//  Created by 王丹 on 2022/5/3.
//

#import "FAN_BaseTableViewCell.h"

@implementation FAN_BaseTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addChildView];
        [self initData];
        [self addTarget];
    }
    return self;
}

- (void)addChildView{

}

- (void)initData{

}

- (void)addTarget{

}

- (void)dealloc{
    NSLog(@"dealloc:%@",NSStringFromClass([self class]));
}

@end
