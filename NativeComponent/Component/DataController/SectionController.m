//
//  SectionController.m
//  NativeComponent
//
//  Created by Kobe Dai on 2019/4/3.
//  Copyright © 2019 Kobe Dai. All rights reserved.
//

#import "SectionController.h"

@interface SectionController ()

@property (nonatomic, strong, readwrite) NSArray<CellComponent *> *cells;
@property (nonatomic, strong, readwrite) HeaderComponent *header;

@end

@implementation SectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.header = nil;
        self.cells = @[];
    }
    return self;
}

- (NSInteger)numberOfItems {
    return self.cells.count;
}

- (void)addHeader:(HeaderComponent *)header {
    self.header = header;
}

- (void)addCellItem:(CellComponent *)cell {
    NSMutableArray *cells = [NSMutableArray arrayWithArray:self.cells];
    [cells addObject:cell];
    
    self.cells = [NSArray arrayWithArray:cells];
}

@end
