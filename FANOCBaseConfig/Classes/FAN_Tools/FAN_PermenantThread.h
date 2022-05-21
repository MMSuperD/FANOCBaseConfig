//
//  FAN_PermenantThread.h
//  FANOCBaseConfig
//
//  Created by xzmac on 2022/5/21.
//

#import <Foundation/Foundation.h>

typedef void (^FAN_PermenantThreadTask)(void);


NS_ASSUME_NONNULL_BEGIN

@interface FAN_PermenantThread : NSObject

/**
 开启线程
 */
- (void)run;

/**
 在当前子线程执行一个任务
 */
- (void)executeTask:(FAN_PermenantThreadTask)task;

/**
 结束线程
 */
- (void)stop;

@end

NS_ASSUME_NONNULL_END
