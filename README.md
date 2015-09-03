# TKSubmitTransitionObjective-C

![image](https://raw.githubusercontent.com/wwdc14/TKSubmitTransitionObjective-C/master/Untitled.gif)

1.使用:
#import "HyTransitions.h"
#import "LoglnButton.h"
-(void)viewDidLoad
{
    LoglnButton *log = [[LoglnButton alloc] initWithFrame:CGRectMake(20, CGRectGetHeight(self.view.bounds) - (40 + 80), [UIScreen mainScreen].bounds.size.width - 40, 40)];
    [log setBackgroundColor:[UIColor colorWithRed:0 green:119/255.0f blue:204.0f/255.0f alpha:1]];
    [self.view addSubview:log];
    [log setTitle:@"登录" forState:UIControlStateNormal];
    [log addTarget:self action:@selector(PresentViewController:) forControlEvents:UIControlEventTouchUpInside];
    
    -(void)PresentViewController:(LoglnButton *)button{
    
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

OC版的转场动画
