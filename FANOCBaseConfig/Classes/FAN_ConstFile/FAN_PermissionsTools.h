//
//  FAN_ PermissionsTools.h
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/5/3.
//

#import <Foundation/Foundation.h>
#import "FAN_ConstBlockFile.h"
#import <Photos/Photos.h>
#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
NS_ASSUME_NONNULL_BEGIN

@interface FAN_PermissionsTools : NSObject

// 这个是相册访问权限
/**
 messageDict = @{
        @"title":@"",
        @"content":@"",
        @"cancel":@"",
        @"sure":@""
 };
 */
+ (void)photoAlbumPermissionsMessageDict:(NSDictionary *)messageDic Success:(NULLParamsBlock_noReturn_FAN)success;

// 这个是相机访问权限
/**
 messageDict = @{
        @"title":@"",
        @"content":@"",
        @"cancel":@"",
        @"sure":@""
 };
 */
+ (void)carmeraPermissionsMessageDict:(NSDictionary *)messageDic Success:(NULLParamsBlock_noReturn_FAN)success;

// 这个是麦克风访问权限
/**
 messageDict = @{
        @"title":@"",
        @"content":@"",
        @"cancel":@"",
        @"sure":@""
 };
 */
+ (void)audioPermissionsMessageDict:(NSDictionary *)messageDic Success:(NULLParamsBlock_noReturn_FAN)success;

@end

NS_ASSUME_NONNULL_END
