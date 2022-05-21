//
//  FAN_PermenantThread.m
//  FANOCBaseConfig
//
//  Created by xzmac on 2022/5/21.
//

#import "FAN_PermenantThread.h"

/** MJThread **/
@interface FAN_BaseThread : NSThread
@end
@implementation FAN_BaseThread
- (void)dealloc
{
    NSLog(@"%s", __func__);
}
@end

@interface FAN_PermenantThread()

@property (nonatomic,strong)FAN_BaseThread *innerThread;

@end

@implementation FAN_PermenantThread

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self __initData];
    }
    return self;
}

- (void)dealloc{
    
    [self __stop];
    
    NSLog(@"%s",__func__);
}

#pragma mark public Method

/**
 开启线程
 */
- (void)run{
    
    if (!self.innerThread || self.innerThread.isExecuting) return;

    [self.innerThread start];
}

/**
 在当前子线程执行一个任务
 */
- (void)executeTask:(FAN_PermenantThreadTask)task{
    
    if (!self.innerThread || !task) return;
    
    [self performSelector:@selector(__executeTask:) onThread:self.innerThread withObject:task waitUntilDone:NO];
    
}

/**
 结束线程
 */
- (void)stop{
    
    if (!self.innerThread) return;
    
    [self performSelector:@selector(__stop) onThread:self.innerThread withObject:nil waitUntilDone:YES];
}

#pragma mark private Method
- (void)__initData {
    
    self.innerThread = [[FAN_BaseThread alloc] initWithBlock:^{
        
        NSLog(@"begin----");

        // 通过C语言方式实现
        
        // 1.创建上下文
        CFRunLoopSourceContext context = {0};
        
        // 2.创建source 用来线程保活
        CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
        
        // 3.当前的runloop 添加source
        CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
        
        // 4. 销毁创建的 source
        CFRelease(source);
        
        // 5.启动runloop
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
        
        NSLog(@"end----");
    }];
    
}

- (void)__stop
{
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.innerThread = nil;
}

- (void)__executeTask:(FAN_PermenantThreadTask)task
{
    if (task) {
        task();
    }
}

@end
