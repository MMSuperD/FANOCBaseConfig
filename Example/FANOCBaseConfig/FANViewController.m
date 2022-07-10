//
//  FANViewController.m
//  FANOCBaseConfig
//
//  Created by MMSuperD on 05/03/2022.
//  Copyright (c) 2022 MMSuperD. All rights reserved.
//

#import "FANViewController.h"
#import <FANOCBaseConfig/FANOCBaseConfig.h>
@interface FANViewController ()

@end

@implementation FANViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    FAN_BaseViewController *vc = [FAN_BaseViewController new];
    vc.title = @"My";
    [self presentViewController:vc animated:YES completion:nil];
    
}

@end
