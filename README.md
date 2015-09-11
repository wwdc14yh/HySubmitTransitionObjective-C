# TKSubmitTransitionObjective-C
# OC版的转场动画

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-ObjC-brightgreen.svg?style=flat)](https://developer.apple.com/Objective-C)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](http://mit-license.org)

![Demo GIF Animation](https://raw.githubusercontent.com/wwdc14/TKSubmitTransitionObjective-C/master/Untitled.gif "Demo GIF Animation")

# 1.原作者:@entotsu

1.1 原作者连接:https://github.com/entotsu/TKSubmitTransition


# 2.使用:
import "HyTransitions.h"
import "LoglnButton.h"

2.1 创建button

    LoglnButton *log = [[LoglnButton alloc] initWithFrame:CGRectMake(20, CGRectGetHeight(self.view.bounds) - (40 + 80), [UIScreen mainScreen].bounds.size.width - 40, 40)];
    [log setBackgroundColor:[UIColor colorWithRed:0 green:119/255.0f blue:204.0f/255.0f alpha:1]];
    [self.view addSubview:log];
    [log setTitle:@"登录" forState:UIControlStateNormal];
    [log addTarget:self action:@selector(PresentViewController:) forControlEvents:UIControlEventTouchUpInside];
 
 2.2 实现方法
     ```
//网络正常 或者是密码账号正确跳转动画
        [button ExitAnimationCompletion:^{
            if (weak.Switch.on) {
                [weak didPresentControllerButtonTouch];
            }
        }];
        
        
        //网络错误 或者是密码不正确还原动画
        [button ErrorRevertAnimationCompletion:^{
            if (weak.Switch.on) {
                [weak didPresentControllerButtonTouch];
            }
        }];
        
    ```
 2.3 创建控制器
```
    UIViewController *controller = [SecondViewController new];
    UINavigationController *nai = [[UINavigationController alloc] initWithRootViewController:controller];
    nai.transitioningDelegate = self;
    
    [self presentViewController:nai animated:YES completion:nil];
 ```
 2.4 实现代理
```
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    
    return [[HyTransitions alloc]initWithTransitionDuration:0.4f StartingAlpha:0.5f isBOOL:true];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{

    return [[HyTransitions alloc]initWithTransitionDuration:0.4f StartingAlpha:0.8f isBOOL:false];
}
```
