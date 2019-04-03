//
//  SecondCellComponent.m
//  NativeComponent
//
//  Created by Kobe Dai on 2019/4/3.
//  Copyright © 2019 Kobe Dai. All rights reserved.
//

#import "SecondCellComponent.h"
#import "SecondCell.h"

@implementation SecondCellComponent

- (void)drawComponentInView:(UIView *)view withProps:(id)props {
    if ([view isKindOfClass:[SecondCell class]]) {
        [(SecondCell *)view setCellWithProps:props];
    }
}

+ (CGSize)componentSize:(id)props {
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 200);
}

- (Class)cellClass {
    return SecondCell.class;
}

@end
