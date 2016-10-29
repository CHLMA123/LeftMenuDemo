//
//  FCNavigationBarController.m
//  Foscam
//
//  Created by song.wang on 14-7-10.
//  Copyright (c) 2014年 Foscam. All rights reserved.
//

#import "FSNavigationController.h"

@interface FSNavigationController ()

@end

@implementation FSNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (UIBarButtonItem *)backBarButtonItem
{
    UIControl *backItem = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, 41.f, 24.f)];
    backItem.backgroundColor = [UIColor blueColor];
    [backItem addTarget:self action:@selector(backToParentView) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_back_nor"]];
    [backImageView setContentMode:UIViewContentModeScaleAspectFit];
    backImageView.frame = CGRectMake(0, (CGRectGetHeight(backItem.frame) - CGRectGetHeight(backImageView.frame)) * 0.5f, backImageView.image.size.width, backImageView.image.size.height);
    [backItem addSubview:backImageView];
    
    return [[UIBarButtonItem alloc] initWithCustomView:backItem];
}

- (void)backToParentView
{
    //当回到根页面时，才将此窗口dismiss
    if ([self presentingViewController] && self.viewControllers.count == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else {
         [self popViewControllerAnimated:YES];
    }
}

@end
