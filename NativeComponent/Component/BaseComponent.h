//
//  BaseComponent.h
//  NativeComponent
//
//  Created by Kobe Dai on 2019/4/3.
//  Copyright © 2019 Kobe Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YITComponentProtocol <NSObject>

/**
 *  绘制组件
 *
 *  @param view 组件的root view
 */
- (void)drawComponentInView:(UIView *)view withProps:(id)props;

/**
 *  组件的尺寸
 *
 *  @param props 该component的数据model
 *  @return 该组件的size
 */
+ (CGSize)componentSize:(id)props;

@end

@interface BaseComponent : NSObject <YITComponentProtocol>

- (instancetype)initWithProps:(id)props;

@property (nonatomic, strong, readonly) id props;

@property (nonatomic, strong, readwrite) NSString *type;

@end
