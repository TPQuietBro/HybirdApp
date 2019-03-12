//
//  AppDelegate.m
//  YYMobile_iOS
//
//  Created by 唐鹏 on 2019/3/12.
//  Copyright © 2019 唐鹏. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
    FlutterPluginAppLifeCycleDelegate *_lifeCycleDelegate;
}

- (instancetype)init {
    if (self = [super init]) {
        _lifeCycleDelegate = [[FlutterPluginAppLifeCycleDelegate alloc] init];
    }
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return [_lifeCycleDelegate application:application didFinishLaunchingWithOptions:launchOptions];;
}



@end
