//
//  ViewController.m
//  Realm_base
//
//  Created by 谢鑫 on 2019/8/20.
//  Copyright © 2019 Shae. All rights reserved.
//

#import "ViewController.h"
#import "WebSite.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *docDir=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"Documents目录:%@",docDir);
    //创建RLMObject类型（或子类）的对象
    WebSite *webSite1=[[WebSite alloc]init];
    webSite1.webName=@"baidu";
    webSite1.html=@"https://www.baidu.com";
    
    WebSite *webSite2=[[WebSite alloc]init];
    webSite2.webName=@"sina";
    webSite2.html=@"http://www.sina.com.cn";
    
    //写入Ream数据库，需要获取一个RLMRealm类型的Realm数据库，然后在一个事务中调用addObject:方法，即可把一个对象写入到Realm数据库中
    RLMRealm *realm=[RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:webSite1];
        [realm addObject:webSite2];
    }];
    
    //全量查询
    RLMResults <WebSite *> *webSites=[WebSite allObjects];
    NSLog(@"webSites count : %lu",(unsigned long)webSites.count);
    NSLog(@"%@",webSites);
    
    //条件查询。
    RLMResults <WebSite *>*webSitesWithCondition=[WebSite objectsWhere:@"webName == 'baidu'"];
    NSLog(@"%@",[webSitesWithCondition firstObject]);
    NSLog(@"%@",[webSitesWithCondition firstObject].webName);
    
    //更新操作
   /* WebSite *webSite=[webSitesWithCondition firstObject];
    [realm beginWriteTransaction];
    webSite.webName=@"CSDN";
    webSite.html=@"https://mp.csdn.net";
    [realm commitWriteTransaction];
    */
    
    //删除操作
    [realm transactionWithBlock:^{
        [realm deleteObjects:webSitesWithCondition];
    }];
    
}


@end
