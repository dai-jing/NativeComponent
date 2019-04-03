//
//  SectionController.h
//  NativeComponent
//
//  Created by Kobe Dai on 2019/4/3.
//  Copyright © 2019 Kobe Dai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeaderComponent.h"
#import "CellComponent.h"

@interface SectionController : NSObject

@property (nonatomic, strong, readonly) HeaderComponent *header;
@property (nonatomic, strong, readonly) NSArray<CellComponent *> *cells;

- (NSInteger)numberOfItems;

- (void)addHeader:(HeaderComponent *)header;
- (void)addCellItem:(CellComponent *)cell;

@end
