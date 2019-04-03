//
//  FirstViewController.m
//  NativeComponent
//
//  Created by Kobe Dai on 2019/4/3.
//  Copyright © 2019 Kobe Dai. All rights reserved.
//

#import "FirstViewController.h"
#import "WaterfallComponent.h"
#import "FirstCellComponent.h"
#import "SecondCellComponent.h"

@interface FirstViewController ()

@property (nonatomic, strong) WaterfallComponent *waterfallComponent;

@end

@implementation FirstViewController

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
            FirstCellComponent *cellComponent = [[FirstCellComponent alloc] initWithProps:props];
            [self.waterfallComponent insertChildComponent:cellComponent];
        } else if ([props[@"type"] isEqualToString:@"2"]) {
            SecondCellComponent *cellComponent = [[SecondCellComponent alloc] initWithProps:props];
            [self.waterfallComponent insertChildComponent:cellComponent];
        }
    }
    
    [self.waterfallComponent drawComponentInView:self.view withProps:nil];
}

@end
