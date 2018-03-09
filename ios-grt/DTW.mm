//
//  DTW.m
//  ios-grt
//
//  Created by Radek Pazdera on 07/03/2018.
//  Copyright © 2018 Kano Computing. All rights reserved.
//

#ifdef __cplusplus
#include "GRT.h"
#endif

#import <Foundation/Foundation.h>
#import "DTW.h"

@implementation DTWWrapper: NSObject {
    NSString *instanceId;
    GRT::DTW *instance;
}

static NSMutableDictionary *instances = [[NSMutableDictionary alloc] init];

+ (NSString *) create {
    NSString *uuid = [[NSUUID UUID] UUIDString];
    instances[uuid] = [[DTWWrapper alloc] initWithId: uuid];
    return uuid;
}

+ (void) destroy:(NSString *) instanceId {
    //[instances[instanceId] dealloc];
    [instances removeObjectForKey:instanceId];
}

+ (void) destroyAll {
    NSArray *keys = [instances allKeys];
    for (int i = 0 ; i < [keys count]; i++)
    {
        if ([instances[keys[i]] isKindOfClass:[DTWWrapper class]])
        {
            [self destroy: keys[i]];
        }
    }
}

+ (DTWWrapper *) getFromId:(NSString *) instanceId {
    return instances[instanceId];
}


- (id)initWithId: (NSString *) aInstanceId {
    if( self = [super init] )
    {
        instanceId = aInstanceId;
        instance = new GRT::DTW;
    }
    
    return self;
}

- (void) dealloc {
    delete instance;
}

//----

- (BOOL) train:(TSCDWrapper *) sample {
    return instance->train(*[sample getCppInstance]);
}

- (BOOL) predict:(MatrixFloat *) timeseries {
    return instance->predict(*[timeseries getCppInstance]);
}

- (float) getMaximumLikelihood {
    return  instance->getMaximumLikelihood();
}

- (unsigned int) getPredictedClassLabel {
    return instance->getPredictedClassLabel();
}

@end
