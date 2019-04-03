//
//  CellComponent.m
//  NativeComponent
//
//  Created by Kobe Dai on 2019/4/3.
//  Copyright © 2019 Kobe Dai. All rights reserved.
//

#import "CellComponent.h"

@implementation CellComponent

- (instancetype)initWithProps:(id)props {
    if (self = [super initWithProps:props]) {
        self.type = NSStringFromClass(self.class);
    }
    return self;
}

+ (Class)cellClass {
    return nil;
}

+ (CGSize)componentSize:(id)props {
    return CGSizeZero;
}

@end
