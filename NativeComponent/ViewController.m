//
//  ViewController.m
//  NativeComponent
//
//  Created by Kobe Dai on 2019/4/3.
//  Copyright © 2019 Kobe Dai. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *firstVCButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 100, 30)];
    [firstVCButton setTitle:@"第一个列表页" forState:UIControlStateNormal];
    [firstVCButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [firstVCButton.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
    
    UIButton *secondVCButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 150, 100, 30)];
    [secondVCButton setTitle:@"第二个列表页" forState:UIControlStateNormal];
    [secondVCButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [secondVCButton.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
    
    [self.view addSubview:firstVCButton];
    [self.view addSubview:secondVCButton];
    
    [firstVCButton addTarget:self action:@selector(firstButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [secondVCButton addTarget:self action:@selector(secondButtonClicked) forControlEvents:UIControlEventTouchUpInside];
}

- (void)firstButtonClicked {
    [self.navigationController pushViewController:[[FirstViewController alloc] init] animated:YES];
}

- (void)secondButtonClicked {
    [self.navigationController pushViewController:[[SecondViewController alloc] init] animated:YES];
}

@end
