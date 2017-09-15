//
//  GetHomeNewCarModel.h
//  AOI
//
//  Created by Tecksky Techonologies on 8/24/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetCityDataModel : NSObject

@property(nonatomic)NSInteger ids;
@property(nonatomic)NSString *name;
@property(nonatomic)NSInteger state_id;

-(id)initwithValue:(NSDictionary*)data;


@end

@interface GetHomeNewOldCarModel : NSObject

@property(nonatomic)BOOL status;
@property(nonatomic)NSString *message;
@property(nonatomic)NSMutableArray<GetCityDataModel*>*data;

-(id)initWithValue:(NSDictionary*)data;

@end


@interface GetHomeNewCarModel : NSObject

@end
