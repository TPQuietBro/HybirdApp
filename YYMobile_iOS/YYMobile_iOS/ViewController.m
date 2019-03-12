//
//  ViewController.m
//  YYMobile_iOS
//
//  Created by 唐鹏 on 2019/3/12.
//  Copyright © 2019 唐鹏. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>
@interface ViewController ()<FlutterStreamHandler>
@property (nonatomic, strong) FlutterViewController *vc;
@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)push:(id)sender {
    FlutterViewController *vc = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    vc.navigationItem.title = @"first flutter app";
    [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController pushViewController:vc animated:YES];
    _vc = vc;
    
    // 从flutter 接收到消息,并传值到OC
//    [self getFlutterMessage];
    
    // 从OC发送消息,传递到flutter
    [self postNativeMessage];
}

- (void)postNativeMessage{
    FlutterEventChannel *event = [FlutterEventChannel eventChannelWithName:@"com.allen.test.post" binaryMessenger:_vc];
    [event setStreamHandler:self];
}

- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events{
    if (events) {
        events(@"OC post message to flutter");
    }
    NSLog(@"arguments 1 : %@",arguments);
    return nil;
}

- (FlutterError *)onCancelWithArguments:(id)arguments{
    NSLog(@"arguments 2 : %@",arguments);
    return nil;
}

- (void)getFlutterMessage{
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"com.allen.test.call" binaryMessenger:_vc];
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"getFlutterMessage"]) {
            result(@"接收到flutter的消息,回传信息from OC");
            NSLog(@"接收到flutter的参数:%@",call.arguments);
        }
    }];
}


@end
