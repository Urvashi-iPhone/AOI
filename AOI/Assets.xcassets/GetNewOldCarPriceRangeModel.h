//
//  GetNewCarPriceRangeModel.h
//  AOI
//
//  Created by Tecksky Techonologies on 8/24/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GetNewCarPriceRangeDataModel : NSObject

@property(nonatomic)NSString *name;
@property(nonatomic)NSString *value;


-(id)initwithValue:(NSDictionary*)data;


@end

@interface GetNewCarPriceRangeModel : NSObject

@property(nonatomic)BOOL status;
@property(nonatomic)NSString *message;
@property(nonatomic)NSMutableArray<GetNewCarPriceRangeDataModel*>*data;

-(id)initWithValue:(NSDictionary*)data;

@end

