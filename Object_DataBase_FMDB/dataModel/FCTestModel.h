//
//  FCTestModel.h
//  Object_DataBase_FMDB
//
//  Created by Rich on 15/11/12.
//  Copyright © 2015年 Rich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKDBHelper.h"
#import "FCTestSubModel.h"



@interface FCTestModel : NSObject

//@property(strong,nonatomic)LKTestForeign* address;

@property (nonatomic, strong) NSString* comName;
@property (nonatomic, assign) NSInteger comMemNum;
@property (nonatomic, strong) NSString* comAddress;
@property (strong,nonatomic) NSDate* comDate;
@property CGRect comFrame;
@property CGSize comSize;
@property CGPoint comPoint;
@property (strong, nonatomic) NSArray* comBlah;
@property BOOL isListed;
@property (strong, nonatomic) NSDictionary* comHoho;
@property CGFloat score;
//@property (nonatomic, strong) FCTestSubModel* address;

+(NSString *)getCreateTableSQL;//组织SQL语句

@end


