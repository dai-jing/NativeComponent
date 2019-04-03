//
//  SecondCell.m
//  NativeComponent
//
//  Created by Kobe Dai on 2019/4/3.
//  Copyright © 2019 Kobe Dai. All rights reserved.
//

#import "SecondCell.h"

@interface SecondCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation SecondCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.label.font = [UIFont systemFontOfSize:20.f];
        self.label.textColor = [UIColor blueColor];
        
        [self.contentView addSubview:self.label];
    }
    return self;
}

- (void)setCellWithProps:(NSDictionary *)props {
    self.label.text = props[@"text"];
}

@end
