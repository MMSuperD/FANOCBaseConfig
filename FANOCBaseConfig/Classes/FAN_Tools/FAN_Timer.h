//
//  FAN_Timer.h
//  FANOCBaseConfig
//
//  Created by xzmac on 2022/5/23.
//

/**
 使用方式
 self.task = [FAN_Timer execTask:self
                      selector:@selector(doTask)
                         start:2.0
                      interval:1.0
                       repeats:YES
                         async:NO];
 
 self.task = [FAN_Timer execTask:^{
     NSLog(@"111111 - %@", [NSThread currentThread]);
 } start:2.0 interval:-10 repeats:NO async:NO];
 
 [FAN_Timer cancelTask:self.task];
 
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FAN_Timer : NSObject


/// GCD exc timer task
/// @param task  block task
/// @param start  start time
/// @param interval  interval time
/// @param repeats is repeats
/// @param async is async
+ (NSString *)execTask:(void(^)(void))task
           start:(NSTimeInterval)start
        interval:(NSTimeInterval)interval
         repeats:(BOOL)repeats
           async:(BOOL)async;


///  GCD exc timer task
/// @param target object
/// @param selector SEL
/// @param start start time
/// @param interval interval time
/// @param repeats is repeats
/// @param async is async
+ (NSString *)execTask:(id)target
              selector:(SEL)selector
                 start:(NSTimeInterval)start
              interval:(NSTimeInterval)interval
               repeats:(BOOL)repeats
                 async:(BOOL)async;


/// cancel timer task
/// @param name task name
+ (void)cancelTask:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
