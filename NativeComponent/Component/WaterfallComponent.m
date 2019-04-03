//
//  WaterfallComponent.m
//  NativeComponent
//
//  Created by Kobe Dai on 2019/4/3.
//  Copyright © 2019 Kobe Dai. All rights reserved.
//

#import "WaterfallComponent.h"

@interface WaterfallComponent () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong, readwrite) UICollectionView *collectionView;
@property (nonatomic, strong, readwrite) DataController *dataController;

@end

@implementation WaterfallComponent

- (void)drawComponentInView:(UIView *)view withProps:(id)props {
    if (!self.collectionView.superview) {
        [view addSubview:self.collectionView];
    }
    self.collectionView.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    
    [self.collectionView reloadData];
}

- (instancetype)initWithProps:(id)props {
    if (self = [super initWithProps:props]) {
        self.type = @"collectionview";
        self.dataController = [DataController new];
    }
    return self;
}

- (void)insertChildComponent:(BaseComponent *)childComponent {
    if ([childComponent isKindOfClass:[CellComponent class]] ||
        [childComponent isKindOfClass:[HeaderComponent class]]) {
        [self.dataController addData:childComponent];
    }
}

#pragma mark - <UICollectionView>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.dataController numberOfSections];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataController numberOfItemsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CellComponent *cellComponent = [self cellComponent:indexPath];
    
    NSAssert([cellComponent respondsToSelector:@selector(cellClass)], @"YITCollectionViewCellComponent should return a cell class");
    
    if (cellComponent.cellClass) {
        NSString *reuseIdentifier = NSStringFromClass(cellComponent.cellClass);
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        if ([cellComponent respondsToSelector:@selector(drawComponentInView:withProps:)]) {
            [cellComponent drawComponentInView:cell withProps:cellComponent.props];
        }
        return cell;
    } else {
        return nil;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        SectionController *section = self.dataController.sections[indexPath.section];
        if (section.header) {
            HeaderComponent *headerComponent = section.header;
            NSAssert([headerComponent respondsToSelector:@selector(headerViewClass)], @"YITCollectionViewHeaderComponent should return a header class");
            if (headerComponent.headerViewClass) {
                NSString *reuseIdentifier = NSStringFromClass(headerComponent.headerViewClass);
                UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
                if ([headerComponent respondsToSelector:@selector(drawComponentInView:withProps:)]) {
                    [headerComponent drawComponentInView:headerView withProps:headerComponent.props];
                }
                return headerView;
            }
        }
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CellComponent *cellComponent = [self cellComponent:indexPath];
    
    if ([cellComponent.class respondsToSelector:@selector(componentSize:)]) {
        return [cellComponent.class componentSize:cellComponent.props];
    } else {
        return CGSizeZero;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    HeaderComponent *headerComponent = self.dataController.sections[section].header;
    if ([headerComponent.class respondsToSelector:@selector(componentSize:)]) {
        return [headerComponent.class componentSize:headerComponent.props];
    } else {
        return CGSizeZero;
    }
}

#pragma mark - <Private Methods>

- (CellComponent *)cellComponent:(NSIndexPath *)indexPath {
    SectionController *section = self.dataController.sections[indexPath.section];
    CellComponent *cellComponent = section.cells[indexPath.item];
    
    return cellComponent;
}

#pragma mark - <Lazy Init>

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        for (SectionController *section in self.dataController.sections) {
            if (section.header) {
                if (section.header.headerViewClass) {
                    HeaderComponent *headerComponent = section.header;
                    NSString *reuseIdentifier = NSStringFromClass(headerComponent.headerViewClass);
                    [_collectionView registerClass:headerComponent.headerViewClass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifier];
                }
            }
            if (section.cells.count > 0) {
                CellComponent *cellComponent = section.cells.firstObject;
                NSAssert([cellComponent respondsToSelector:@selector(cellClass)], @"YITCollectionViewCellComponent should return a cell class");
                if (cellComponent.cellClass) {
                    NSString *reuseIdentifier = NSStringFromClass(cellComponent.cellClass);
                    [_collectionView registerClass:cellComponent.cellClass forCellWithReuseIdentifier:reuseIdentifier];
                }
            }
        }
    }
    return _collectionView;
}

@end
