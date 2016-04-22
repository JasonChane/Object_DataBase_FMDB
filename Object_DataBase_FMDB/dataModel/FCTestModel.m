//
//  FCTestModel.m
//  Object_DataBase_FMDB
//
//  Created by Rich on 15/11/12.
//  Copyright © 2015年 Rich. All rights reserved.
//

#import "FCTestModel.h"

@implementation FCTestModel

//+(NSString *)getCreateTableSQL//组织SQL语句
//{
//    LKModelInfos* infos = [self getModelInfos];
//    NSString* primaryKey = [self getPrimaryKey];
//    NSMutableString* table_pars = [NSMutableString string];
//    for (int i=0; i<infos.count; i++) {
//        
//        if(i > 0)
//            [table_pars appendString:@","];
//        
//        LKDBProperty* property =  [infos objectWithIndex:i];
//        [self columnAttributeWithProperty:property];
//        
//        [table_pars appendFormat:@"%@ %@",property.sqlColumnName,property.sqlColumnType];
//        
//        if([property.sqlColumnType isEqualToString:LKSQL_Type_Text])
//        {
//            if(property.length>0)
//            {
//                [table_pars appendFormat:@"(%ld)",(long)property.length];
//            }
//        }
//        if(property.isNotNull)
//        {
//            [table_pars appendFormat:@" %@",LKSQL_Attribute_NotNull];
//        }
//        if(property.isUnique)
//        {
//            [table_pars appendFormat:@" %@",LKSQL_Attribute_Unique];
//        }
//        if(property.checkValue)
//        {
//            [table_pars appendFormat:@" %@(%@)",LKSQL_Attribute_Check,property.checkValue];
//        }
//        if(property.defaultValue)
//        {
//            [table_pars appendFormat:@" %@ %@",LKSQL_Attribute_Default,property.defaultValue];
//        }
//        if(primaryKey && [property.sqlColumnName isEqualToString:primaryKey])
//        {
//            [table_pars appendFormat:@" %@",LKSQL_Attribute_PrimaryKey];
//        }
//    }
//    NSString* createTableSQL = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@(%@)",[self getTableName],table_pars];
//    return createTableSQL;
//}

+(NSString *)getCreateTableSQL//组织SQL语句
{
    return @"无sql";
    
}

@end
