//
//  TBHomeViewController.m
//  TinyBox
//
//  Created by shenqichen on 2019/5/30.
//  Copyright © 2019 shenqichen. All rights reserved.
//

#import "TBHomeViewController.h"
#import "TBUtilty.h"
#import "TBToolListCell.h"
#import "TBCollectionHeadView.h"
#import "TBCollectionFootView.h"
#import "TBEncodeViewController.h"
#import "TBToolListDataManager.h"

#define kTBToolListCellIdentify @"kTBToolListCellIdentify"
#define kTBToolListHeadIdentify @"kTBToolListHeadIdentify"
#define kTBToolListFootIdentify @"kTBToolListFootIdentify"

@interface TBHomeViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, retain) UICollectionView *collectionView;
@property (nonatomic, retain) NSArray *toolGroups;

@end

@implementation TBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toolGroups = [[TBToolListDataManager shareInstance] getToolGroups];
    [self configTitleBar];
    [self addContentView];
}

- (void)configTitleBar {
    self.titleBar = [[TBTitleBar alloc] initWithController:self];
    [self.view addSubview:self.titleBar];
    [self.titleBar setTitle:@"工具箱"];
}

- (void)addContentView {
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, TBTitleBarHeight, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - TBTitleBarHeight) collectionViewLayout:flowLayout];
    if (@available(iOS 11.0, *)) {
        _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.clipsToBounds = YES;
    _collectionView.layer.masksToBounds = YES;
    
    [_collectionView registerClass:[TBToolListCell class] forCellWithReuseIdentifier:kTBToolListCellIdentify];
    [_collectionView registerClass:[TBCollectionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kTBToolListHeadIdentify];
    [_collectionView registerClass:[TBCollectionFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kTBToolListFootIdentify];
    
    [self.view addSubview:self.collectionView];
}

#pragma mark  定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(kTBStyleItemMarginVertical, kTBStyleItemMarginHorizontal, kTBStyleItemMarginVertical, kTBStyleItemMarginHorizontal);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(kScreenWidth, kCollectionHeadHeight);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(kScreenWidth, kCollectionFootHeight);
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
    
    TBEncodeViewController *encodeVC = [[TBEncodeViewController alloc] init];
    [self.navigationController pushViewController:encodeVC animated:YES];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.toolGroups.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section < self.toolGroups.count) {
        TBToolGroupModel *groupModel = self.toolGroups[section];
        return groupModel.toolList.count;
    }
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identify = kTBToolListCellIdentify;
    TBToolListCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    if (indexPath.section < self.toolGroups.count) {
        TBToolGroupModel *groupModel = self.toolGroups[indexPath.section];
        if (indexPath.row < groupModel.toolList.count) {
            TBToolModel *toolModel = groupModel.toolList[indexPath.row];
            [cell updateToolModel:toolModel];
        }        
    }

    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
       TBCollectionHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kTBToolListHeadIdentify forIndexPath:indexPath];
        
        if (indexPath.section < self.toolGroups.count) {
            TBToolGroupModel *groupModel = self.toolGroups[indexPath.section];
            [headView updateGroupModel:groupModel];
        }
        return headView;
        
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        TBCollectionFootView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kTBToolListFootIdentify forIndexPath:indexPath];
        footView.backgroundColor = [UIColor grayColor];
        return footView;
    }
    
    return nil;
}

#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = kScreenWidth/2 - kTBStyleItemMarginHorizontal*1.5;
    return CGSizeMake(width, width*0.6);
}


@end
