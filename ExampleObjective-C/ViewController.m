//
//  ViewController.m
//  ExampleObjective-C
//
//  Created by  东海 on 15/9/2.
//  Copyright (c) 2015年 ouy.Aberi. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"
#import "HyTransitions.h"
#import "LoglnButton.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createPresentControllerButton];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)createPresentControllerButton{

    LoglnButton *log = [[LoglnButton alloc] initWithFrame:CGRectMake(20, CGRectGetHeight(self.view.bounds) - (40 + 80), [UIScreen mainScreen].bounds.size.width - 40, 40)];
    [log setBackgroundColor:[UIColor colorWithRed:0 green:119/255.0f blue:204.0f/255.0f alpha:1]];
    [self.view addSubview:log];
    [log setTitle:@"登录" forState:UIControlStateNormal];
    [log addTarget:self action:@selector(Pre:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)Pre:(LoglnButton *)button{
    
    [button StartAnimationCompletion:^{
        
        [self didPresentControllerButtonTouch];

    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [button ExitAnimation];
        
    });
    
}

- (void)didPresentControllerButtonTouch
{
    UIViewController *controller = [SecondViewController new];
    
    controller.transitioningDelegate = self;
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    
    return [[HyTransitions alloc]initWithTransitionDuration:0.5f StartingAlpha:0.8f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
