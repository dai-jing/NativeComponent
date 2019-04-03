//
//  FirstCell.m
//  NativeComponent
//
//  Created by Kobe Dai on 2019/4/3.
//  Copyright © 2019 Kobe Dai. All rights reserved.
//

#import "FirstCell.h"

@interface FirstCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation FirstCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.label.font = [UIFont systemFontOfSize:16.f];
        self.label.textColor = [UIColor redColor];
        
        [self.contentView addSubview:self.label];
    }
    return self;
}

- (void)setCellWithProps:(NSDictionary *)props {
    self.label.text = props[@"text"];
}

@end
