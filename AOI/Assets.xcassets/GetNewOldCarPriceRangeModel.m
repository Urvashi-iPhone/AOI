//
//  GetNewCarPriceRangeModel.m
//  AOI
//
//  Created by Tecksky Techonologies on 8/24/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import "GetNewCarPriceRangeModel.h"

@implementation GetNewCarPriceRangeDataModel

-(id)initWithValue:(NSDictionary*)data
{
    GetNewCarPriceRangeDataModel *model = [[GetNewCarPriceRangeDataModel alloc] init];
    model.name = [data valueForKey:@"name"];
    model.value = [data valueForKey:@"value"];
  
    return model;
}

@end

@implementation GetNewCarPriceRangeModel

-(id)initWithValue:(NSDictionary*)data
{
    GetNewCarPriceRangeModel *model =[[GetNewCarPriceRangeModel alloc]init];
    model.status = [[data valueForKey:@"status"] boolValue];
    model.message = [data valueForKey:@"message"];
    
    NSMutableArray <GetNewCarPriceRangeDataModel*>*values = [[NSMutableArray alloc] init];
    NSMutableArray *dataArray = [data valueForKey:@"data"];
    for (int i = 0; i<dataArray.count; i++) {
        GetNewCarPriceRangeDataModel *dataModel = [[GetNewCarPriceRangeDataModel alloc]initWithValue:[dataArray objectAtIndex:i]];
        [values addObject:dataModel];
    }
    
    model.data = values;
    
    return model;
}

@end


