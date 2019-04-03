//
//  DataController.m
//  NativeComponent
//
//  Created by Kobe Dai on 2019/4/3.
//  Copyright © 2019 Kobe Dai. All rights reserved.
//

#import "DataController.h"

@interface DataController ()

@property (nonatomic, strong, readwrite) NSArray<SectionController *> *sections;

@end

@implementation DataController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.sections = @[];
    }
    return self;
}

- (NSInteger)numberOfSections {
    return self.sections.count;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section {
    SectionController *sec = self.sections[section];
    
    return [sec numberOfItems];
}

- (void)addData:(BaseComponent *)component {
    if (component) {
        SectionController *currentSection;
        if (self.sections.count == 0) {
            currentSection = [[SectionController alloc] init];
            NSMutableArray *sections = [NSMutableArray arrayWithArray:self.sections];
            [sections addObject:currentSection];
            self.sections = [NSArray arrayWithArray:sections];
        } else {
            currentSection = self.sections.lastObject;
            if (currentSection.cells.count > 0) {
                CellComponent *cell = currentSection.cells.lastObject;
                if (![cell.type isEqualToString:component.type]) {
                    currentSection = [[SectionController alloc] init];
                    NSMutableArray *sections = [NSMutableArray arrayWithArray:self.sections];
                    [sections addObject:currentSection];
                    self.sections = [NSArray arrayWithArray:sections];
                }
            }
        }
        if ([component isKindOfClass:[CellComponent class]]) {
            [currentSection addCellItem:component];
        } else if ([component isKindOfClass:[HeaderComponent class]]) {
            [currentSection addHeader:component];
        }
    }
}

@end
