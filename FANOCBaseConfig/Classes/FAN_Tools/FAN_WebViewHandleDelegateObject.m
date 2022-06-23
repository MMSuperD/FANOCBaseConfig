//
//  FAN_WebViewHandleDelegateObject.m
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/6/23.
//

#import "FAN_WebViewHandleDelegateObject.h"
#include "NSObject+extension_FAN.h"

@interface FAN_WebViewHandleDelegateObject()

@property (nonatomic,strong)NSArray<NSDictionary *> *dictArray;

@property (nonatomic,weak)WKWebView *webView;

@end

@implementation FAN_WebViewHandleDelegateObject

- (void)addNameKeyArray:(NSArray<NSDictionary *> *)dictArray webView:(WKWebView *)webView{
    
    self.dictArray = dictArray;
    self.webView = webView;
    for (int i = 0; i < dictArray.count; i++) {
        [webView.configuration.userContentController addScriptMessageHandler:self name:dictArray[i][@"key"]];
    }
}

- (void)removeScriptMessageHandler{
    for (int i = 0; i < self.dictArray.count; i++) {
        [self.webView.configuration.userContentController removeScriptMessageHandlerForName:self.dictArray[i][@"key"]];
    }
}


#pragma mark WKScriptMessageHandler
/*! @abstract Invoked when a script message is received from a webpage.
 @param userContentController The user content controller invoking the
 delegate method.
 @param message The script message received.
 */
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    
    NSLog(@"%@",message.body);
    for (int i = 0; i < self.dictArray.count; i++) {
        
        if ([message.name isEqualToString:self.dictArray[i][@"key"]]) {
            
            //这里就需要执行字典当中的函数
            [(NSObject *)self.dictArray[i][@"haveObject"] fan_performFuncStr:self.dictArray[i][@"func"] withObjects:@[message]];
        }
    }
}

#pragma mark Lazy

- (FAN_JSCustomerHandleObject *)handleObject{
    
    if (!_handleObject) {
        _handleObject = [FAN_JSCustomerHandleObject new];
    }
    return _handleObject;
}

@end


@implementation FAN_JSCustomerHandleObject


- (void)location:(WKScriptMessage *)message {
    
    if ([message.name isEqualToString:@"Location"]) {
        
        NSLog(@"调用了");
    }
}

@end
