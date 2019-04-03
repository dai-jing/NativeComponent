//
//  SecondViewController.m
//  NativeComponent
//
//  Created by Kobe Dai on 2019/4/3.
//  Copyright © 2019 Kobe Dai. All rights reserved.
//

#import "SecondViewController.h"
#import "WaterfallComponent.h"
#import "FirstCellComponent.h"
#import "SecondCellComponent.h"

@interface SecondViewController ()

@property (nonatomic, strong) WaterfallComponent *waterfallComponent;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.waterfallComponent = [[WaterfallComponent alloc] initWithProps:nil];
    
    NSDictionary *data1 = @{@"type": @"1", @"text": @"111"};
    NSDictionary *data2 = @{@"type": @"1", @"text": @"222"};
    NSDictionary *data3 = @{@"type": @"1", @"text": @"333"};
    NSDictionary *data4 = @{@"type": @"1", @"text": @"444"};
    NSDictionary *data5 = @{@"type": @"2", @"text": @"555"};
    NSDictionary *data6 = @{@"type": @"2", @"text": @"666"};
    NSDictionary *data7 = @{@"type": @"2", @"text": @"777"};
    NSDictionary *data8 = @{@"type": @"2", @"text": @"888"};
    NSDictionary *data9 = @{@"type": @"2", @"text": @"999"};
    
    NSArray *datas = @[data1, data2, data3, data4, data5, data6, data7, data8, data9];
    
    for (NSDictionary *props in datas) {
        if ([props[@"type"] isEqualToString:@"1"]) {
            SecondCellComponent *cellComponent = [[SecondCellComponent alloc] initWithProps:props];
            [self.waterfallComponent insertChildComponent:cellComponent];
        } else if ([props[@"type"] isEqualToString:@"2"]) {
            FirstCellComponent *cellComponent = [[FirstCellComponent alloc] initWithProps:props];
            [self.waterfallComponent insertChildComponent:cellComponent];
        }
    }
    
    [self.waterfallComponent drawComponentInView:self.view withProps:nil];
}

@end
