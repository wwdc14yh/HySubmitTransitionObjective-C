//
//  SecondViewController.m
//  Example
//
//  Created by Jonathan Tribouharet
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:54./256. green:70./256. blue:93./256. alpha:1.];
    
    [self createCloseButton];
}

- (void)createCloseButton
{
    UIImageView *imageview= [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:imageview];
    imageview.image = [UIImage imageNamed:@"Home"];
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didCloseButtonTouch)];
    [imageview setUserInteractionEnabled:true];
    [imageview addGestureRecognizer:tap];
}

- (void)didCloseButtonTouch
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
