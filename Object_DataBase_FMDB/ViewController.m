//
//  ViewController.m
//  Object_DataBase_FMDB
//
//  Created by Rich on 15/11/12.
//  Copyright © 2015年 Rich. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property(strong,nonatomic)NSMutableString* ms;
@property (weak, nonatomic) IBOutlet UITextView *tv;


@end

#define addText(fmt, ...) [self add:[NSString stringWithFormat:fmt,##__VA_ARGS__]]

@implementation ViewController
{
    FCTestModel* _comFCModel;
    
    LKDBHelper* _globalHelper;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",NSHomeDirectory());
    
    self.ms = [NSMutableString string];
    
    [self testDB];
    

    
}

-(void)testDB
{
    _globalHelper = [FCTestModel getUsingLKDBHelper];//数据库manager单例 创建数据库 利用本类创建数据库

    _comFCModel = [[FCTestModel alloc]init];
    
    _comFCModel.comAddress = @"1111";
    _comFCModel.comBlah = @[@"金融",@"房地产",@"互联网"];
    _comFCModel.comDate = [NSDate date];
    _comFCModel.comFrame = CGRectMake(10, 10, 10, 10);
    _comFCModel.comHoho = @{@"key":@"value"};
    _comFCModel.comMemNum = 20;
    _comFCModel.comName = @"房筹";
    _comFCModel.comPoint = CGPointMake(0, 0);
    _comFCModel.comSize = CGSizeMake(10, 10);
    _comFCModel.isListed = YES;
    _comFCModel.score = [[NSDate date] timeIntervalSince1970];
    
//    FCTestSubModel* subModel = [[FCTestSubModel alloc]init];
//    subModel.addressDetail = @"棠下西边大街";
//    subModel.addressId = 110;
//    _comFCModel.address = subModel;
    
    
}

- (IBAction)createData:(id)sender {
    
    addText(@"示例 开始 example start \n\n");

    //    [globalHelper dropAllTable];
    
    addText(@"LKTest create table sql :\n%@\n",[FCTestModel getCreateTableSQL]);
    
    //    addText(@"LKTestForeign create table sql :\n%@\n",[LKTestForeign getCreateTableSQL]);

    addText(@"%f",_comFCModel.score);
    
    //同步 插入第一条 数据   synchronous insert the first
    [_comFCModel saveToDB];
    
}

- (IBAction)deleteData:(id)sender {//删
    
    [_globalHelper deleteWithClass:[_comFCModel class] where:@"comAddress = '棠下'"];
    
    [_globalHelper deleteWithClass:[_comFCModel class] where:@"rowid = 8"];
    
    [_globalHelper deleteWithClass:[_comFCModel class] where:@"rowid = 5"];
}

- (IBAction)updateData:(id)sender {//改
    
    _comFCModel.comAddress = @"22222";
    
    
    [_globalHelper updateToDB:_comFCModel where:@""];
    
    
//    _comFCModel.comAddress = @"五羊村";
//    
//    
//    [_globalHelper updateToDB:_comFCModel where:@"comAddress = '棠下'"];
    
    
    FCTestSubModel* subModel = [[FCTestSubModel alloc]init];
    subModel.addressDetail = @"西川成都";
    subModel.addressId = 380;
//    _comFCModel.address = subModel;
    
    [_globalHelper updateToDB:_comFCModel where:@"comAddress = '棠下'"];
    
}

- (IBAction)readData:(id)sender {
    
    //-----
    NSArray* array = [_globalHelper search:[_comFCModel class] column:nil where:@"" orderBy:nil offset:0 count:0];
    
    for (FCTestModel* model in array) {
//        NSLog(@"%@,%ld,%@",model.comAddress,(long)model.rowid,model.address.addressDetail);
    }
    
    //-----
    array = [_globalHelper searchWithSQL:@"select *,rowid from FCTestModel where comAddress = '珠江新城'" toClass:[_comFCModel class]];
    
    //-----
    FCTestModel* model = [_globalHelper searchSingle:[_comFCModel class] where:@"comAddress = '珠江新城'" orderBy:nil];//返回一个对象
    NSLog(@"%@,%@",model.comAddress,model.comName);
  
    //-----
    model = [_globalHelper searchSingle:[_comFCModel class] where:@"comAddress = '五羊村'" orderBy:nil];//返回一个对象
    NSLog(@"%@,%@",model.comAddress,model.comName);
}

- (IBAction)insertData:(id)sender {
    
    addText(@"示例 开始 example start \n\n");
    
    
    //    [globalHelper dropAllTable];
    
    addText(@"LKTest create table sql :\n%@\n",[FCTestModel getCreateTableSQL]);
    
    //    addText(@"LKTestForeign create table sql :\n%@\n",[LKTestForeign getCreateTableSQL]);

    _comFCModel.comAddress = @"44444";
    _comFCModel.comBlah = @[@"金融",@"房地产",@"互联网"];
    _comFCModel.comDate = [NSDate date];
    _comFCModel.comFrame = CGRectMake(10, 10, 10, 10);
    _comFCModel.comHoho = @{@"key":@"value"};
    _comFCModel.comMemNum = 20;
    _comFCModel.comName = @"房筹";
    _comFCModel.comPoint = CGPointMake(0, 0);
    _comFCModel.comSize = CGSizeMake(10, 10);
    _comFCModel.isListed = YES;
    _comFCModel.score = [[NSDate date] timeIntervalSince1970];
    
    addText(@"%f",_comFCModel.score);
    
    FCTestSubModel* subModel = [[FCTestSubModel alloc]init];
    subModel.addressDetail = @"惠丰花园";
    subModel.addressId = 520;
//    _comFCModel.address = subModel;
    
    _comFCModel.rowid = 0;//若赋值rowid=0 则是添加（会不限次数地添加）
    //同步 插入第一条 数据   synchronous insert the first
    [_comFCModel saveToDB];
}



-(void)add:(NSString*)txt
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_ms appendString:@"\n"];
        [_ms appendString:txt];
        [_ms appendString:@"\n"];
        
        self.tv.text = _ms;
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
