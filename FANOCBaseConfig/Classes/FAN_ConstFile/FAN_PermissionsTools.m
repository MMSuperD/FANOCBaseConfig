//
//  FAN_ PermissionsTools.m
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/5/3.
//

#import "FAN_PermissionsTools.h"

@implementation FAN_PermissionsTools

+ (void)photoAlbumPermissionsMessageDict:(NSDictionary *)messageDic Success:(NULLParamsBlock_noReturn_FAN)success{

    NSMutableDictionary *newMessageDict = [NSMutableDictionary dictionary];
    
    newMessageDict[@"title"] = (messageDic[@"title"] != nil) ? messageDic[@"title"] : @"提示";
    newMessageDict[@"content"] = (messageDic[@"content"] != nil) ? messageDic[@"content"] : @"请去-> [设置 - 隐私 - 相册 - 小站雅思] 打开访问开关";
    newMessageDict[@"cancel"] = (messageDic[@"cancel"] != nil) ? messageDic[@"cancel"] : @"取消";
    newMessageDict[@"sure"] = (messageDic[@"sure"] != nil) ? messageDic[@"sure"] : @"去设置";


    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusRestricted) { // 此应用程序没有被授权访问的照片数据。可能是家长控制权限。
        NSLog(@"因为系统原因, 无法访问相册");
    } else if (status == PHAuthorizationStatusDenied) { // 用户拒绝访问相册

        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:newMessageDict[@"title"] message:newMessageDict[@"content"]  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:newMessageDict[@"sure"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:^(BOOL success) {

            }];
        }];

        UIAlertAction *action3 = [UIAlertAction actionWithTitle:newMessageDict[@"cancel"] style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

        }];

        [alertVc addAction:action2];
        [alertVc addAction:action3];

        [[FAN_PermissionsTools topMostController] presentViewController:alertVc animated:YES completion:nil];


    } else if (status == PHAuthorizationStatusAuthorized) { // 用户允许访问相册
        // 放一些使用相册的代码
        // 放一些使用相册的代码
          if (success) {
              success();
          }
    } else if (status == PHAuthorizationStatusNotDetermined) { // 用户还没有做出选择
        // 弹框请求用户授权
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized) { // 用户点击了好
              // 放一些使用相册的代码

                dispatch_async(dispatch_get_main_queue(), ^{
                    if (success) {
                        success();
                    }
                });
            }
        }];
    }
}

// 这个是相机访问权限
+ (void)carmeraPermissionsMessageDict:(NSDictionary *)messageDic Success:(NULLParamsBlock_noReturn_FAN)success{

    NSMutableDictionary *newMessageDict = [NSMutableDictionary dictionary];
    
    newMessageDict[@"title"] = (messageDic[@"title"] != nil) ? messageDic[@"title"] : @"提示";
    newMessageDict[@"content"] = (messageDic[@"content"] != nil) ? messageDic[@"content"] : @"请去-> [设置 - 隐私 - 相机 - 小站托福] 打开访问开关";
    newMessageDict[@"cancel"] = (messageDic[@"cancel"] != nil) ? messageDic[@"cancel"] : @"取消";
    newMessageDict[@"sure"] = (messageDic[@"sure"] != nil) ? messageDic[@"sure"] : @"去设置";
    
    [self publicPermissionsSuccess:success type:AVMediaTypeVideo contentDict:newMessageDict];
}

// 这个是麦克风访问权限
+ (void)audioPermissionsMessageDict:(NSDictionary *)messageDic Success:(NULLParamsBlock_noReturn_FAN)success{

    NSMutableDictionary *newMessageDict = [NSMutableDictionary dictionary];
    
    newMessageDict[@"title"] = (messageDic[@"title"] != nil) ? messageDic[@"title"] : @"提示";
    newMessageDict[@"content"] = (messageDic[@"content"] != nil) ? messageDic[@"content"] : @"请去-> [设置 - 隐私 - 麦克风 - 小站托福] 打开访问开关";
    newMessageDict[@"cancel"] = (messageDic[@"cancel"] != nil) ? messageDic[@"cancel"] : @"取消";
    newMessageDict[@"sure"] = (messageDic[@"sure"] != nil) ? messageDic[@"sure"] : @"去设置";
    
    [self publicPermissionsSuccess:success type:AVMediaTypeAudio contentDict:newMessageDict];

}


+ (void)publicPermissionsSuccess:(NULLParamsBlock_noReturn_FAN)success type:(AVMediaType)type contentDict:(NSDictionary *)dict{

    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:type];

    if (status == AVAuthorizationStatusRestricted) { // 此应用程序没有被授权访问的照片数据。可能是家长控制权限。
        NSLog(@"因为系统原因, 无法访问相机");
    } else if (status == AVAuthorizationStatusDenied) { // 用户拒绝访问

        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:dict[@"title"] message:dict[@"message"]  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:dict[@"sure"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:^(BOOL success) {

            }];
        }];

        UIAlertAction *action3 = [UIAlertAction actionWithTitle:dict[@"cancel"] style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

        }];

        [alertVc addAction:action2];
        [alertVc addAction:action3];

        [[FAN_PermissionsTools topMostController] presentViewController:alertVc animated:YES completion:nil];


    } else if (status == AVAuthorizationStatusAuthorized) { // 用户允许访问

          if (success) {
              success();
          }
    } else if (status == AVAuthorizationStatusNotDetermined) { // 用户还没有做出选择
        // 弹框请求用户授权
        [AVCaptureDevice requestAccessForMediaType:type completionHandler:^(BOOL granted) {
            AVAuthorizationStatus tempStatus = [AVCaptureDevice authorizationStatusForMediaType:type];

            if (tempStatus == AVAuthorizationStatusAuthorized) {

                dispatch_async(dispatch_get_main_queue(), ^{
                    if (success) {
                        success();
                    }

                });
            }
        }];
    }

}

+ (UIViewController*)topMostController {
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;

    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }

    return topController;
}

@end
