//
//  DataController.h
//  NativeComponent
//
//  Created by Kobe Dai on 2019/4/3.
//  Copyright © 2019 Kobe Dai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseComponent.h"
#import "SectionController.h"

@interface DataController : NSObject

@property (nonatomic, strong, readonly) NSArray<SectionController *> *sections;

- (NSInteger)numberOfSections;
- (NSInteger)numberOfItemsInSection:(NSInteger)section;

- (void)addData:(BaseComponent *)component;

@end
