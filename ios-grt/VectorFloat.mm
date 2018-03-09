//
//  VectorFloat.m
//  ios-grt
//
//  Created by Radek Pazdera on 01/03/2018.
//  Copyright © 2018 Kano Computing. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus
#include "GRT.h"
#endif

#import "VectorFloat.h"

@implementation VectorFloat : NSObject {
    GRT::VectorFloat *instance;
}

- (id) init {
    if( self = [super init] )
    {
        instance = new GRT::VectorFloat;
    }
    
    return self;
}

- (id) initWithSize:(unsigned int) size {
    if( self = [super init] )
    {
        instance = new GRT::VectorFloat(size);
    }
    
    return self;
}

- (id)initWithGRTVector:(GRT::VectorFloat *) vector {
    if( self = [super init] )
    {
        instance = new GRT::VectorFloat(*vector);
    }
    
    return self;
}

- (GRT::VectorFloat *) getCppInstance {
    return instance;
}

- (void) dealloc {
    delete instance;
}

- (void) clear {
    instance->clear();
}

- (void) push_back:(float) value {
    instance->push_back(value);
}

- (NSArray *) toNSArray {
    unsigned int size = instance->getSize();
    double *data = instance->getData();
    NSMutableArray *array = [NSMutableArray arrayWithCapacity: size];
    
    for (unsigned int i = 0; i < size; i++) {
        [array addObject: [NSNumber numberWithDouble:data[i]]];
    }
    
    return array;
}
@end
