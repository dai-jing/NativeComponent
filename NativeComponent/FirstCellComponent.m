//
//  FirstCellComponent.m
//  NativeComponent
//
//  Created by Kobe Dai on 2019/4/3.
//  Copyright © 2019 Kobe Dai. All rights reserved.
//

#import "FirstCellComponent.h"
#import "FirstCell.h"

@implementation FirstCellComponent

- (void)drawComponentInView:(UIView *)view withProps:(id)props {
    if ([view isKindOfClass:[FirstCell class]]) {
        [(FirstCell *)view setCellWithProps:props];
    }
}

+ (CGSize)componentSize:(id)props {
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
}

- (Class)cellClass {
    return FirstCell.class;
}

@end
