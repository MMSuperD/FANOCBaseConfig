//
//  FAN_NoDataView.m
//  Pods
//
//  Created by 王丹 on 2022/5/3.
//

#import "FAN_NoDataView.h"
#import "UILabel+extension_FAN.h"
#import <Masonry/Masonry.h>
#import "UIColor+extension_FAN.h"

@interface FAN_NoDataView ()

@property(nonatomic,strong)UIImageView *noDataImageV;

@property (nonatomic,strong)UILabel *titleLable;

@property (nonatomic, strong)UIButton *btn;

@end

@implementation FAN_NoDataView


+ (FAN_NoDataView *)noDataViewImageName:(NSString *)imageName title:(nonnull NSString *)title{
    FAN_NoDataView *tempView = [FAN_NoDataView new];
    tempView.imageName = imageName;
    tempView.titleStr = title;
    return tempView;
}

- (void)addChildView{

    self.noDataImageV = [UIImageView new];
    [self addSubview:self.noDataImageV];
    
    [self.noDataImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];

    self.titleLable = [UILabel fan_labelWithText:@"没有课程安排哦" font:14 textColorStr:@"#999999"];
    [self addSubview:self.titleLable];

    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.noDataImageV.mas_bottom).mas_offset(18);
    }];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn setTitle:@"立即报名" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor fan_colorWithHexString:@"#FF6D01"] forState:UIControlStateNormal];
    self.btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.btn.layer.cornerRadius = 15;
    self.btn.layer.masksToBounds = YES;
    self.btn.layer.borderColor = [[UIColor fan_colorWithHexString:@"#FF6D01"] colorWithAlphaComponent:0.2].CGColor;
    self.btn.layer.borderWidth = 1;
    self.btn.hidden = YES;
    [self addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLable.mas_bottom).offset(12);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(30);
        make.centerX.mas_equalTo(0);
    }];
    
}

- (void)btnClick:(UIButton *)sender {
    
    if (self.btnBlock) {
        self.btnBlock();
    }
}

- (void)setImageName:(NSString *)imageName{
    _imageName = imageName;
    [self.noDataImageV setImage:[UIImage imageNamed:imageName]];
}

- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    self.titleLable.text = titleStr;
}

- (void)setOffY:(CGFloat)offY {
    
    _offY = offY;
    [self.noDataImageV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(offY);
    }];
    [self layoutIfNeeded];
}

- (void)setShowBtn:(BOOL)showBtn {
    
    _showBtn = showBtn;
    self.btn.hidden = !showBtn;
}

@end
