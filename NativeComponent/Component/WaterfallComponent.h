//
//  WaterfallComponent.h
//  NativeComponent
//
//  Created by Kobe Dai on 2019/4/3.
//  Copyright © 2019 Kobe Dai. All rights reserved.
//

#import "BaseComponent.h"
#import "HeaderComponent.h"
#import "CellComponent.h"
#import "DataController.h"

@interface WaterfallComponent : BaseComponent

@property (nonatomic, strong, readonly) UICollectionView *collectionView;
@property (nonatomic, strong, readonly) DataController *dataController;

- (void)insertChildComponent:(BaseComponent *)childComponent;

@end
