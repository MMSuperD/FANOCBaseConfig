//
//  FAN_BaseTableViewController.h
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/5/3.
//

#import <FANOCBaseConfig/FANOCBaseConfig.h>
#import "FAN_NoDataView.h"
#import <MJRefresh/MJRefresh.h>

NS_ASSUME_NONNULL_BEGIN

#define EndRefresh [self.tableView.mj_header endRefreshing];

@interface FAN_BaseTableViewController : FAN_BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,assign)NSInteger currentPage;

@property (nonatomic,assign)NSInteger currentSize;

@property (nonatomic,assign)NSInteger currentRequestCount;

@property (nonatomic,assign)UITableViewStyle style;

@property (nonatomic, strong) UIView *footView;

// 添加头部刷新 默认添加 如果不需要添加,重写该方法
- (void)addHeaderRefresh;
// 添加底部刷新 默认添加,如果不需要添加,重写该方法
- (void)addFooterRefresh;
// 加载更多数据
- (void)loadMoreData;

// 显示没有数据View
- (void)showNoDataView;

// 显示没有数据View
- (void)removeNoDataView;

@end

NS_ASSUME_NONNULL_END
