//
//  BaseComponent.m
//  NativeComponent
//
//  Created by Kobe Dai on 2019/4/3.
//  Copyright © 2019 Kobe Dai. All rights reserved.
//

#import "BaseComponent.h"

@interface BaseComponent ()

@property (nonatomic, strong, readwrite) id props;

@end

@implementation BaseComponent

- (instancetype)initWithProps:(id)props {
    if (self = [super init]) {
        self.props = props;
    }
    return self;
}

@end
