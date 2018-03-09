//
//  HMM.mm
//  ios-grt
//
//  Created by Radek Pazdera on 28/02/2018.
//  Copyright © 2018 Kano Computing. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus
#include "GRT.h"
#endif

#import "HMM.h"
#import "VectorFloat.h"

@implementation HMMWrapper: NSObject {
    NSString *instanceId;
    GRT::HMM *instance;
}

static NSMutableDictionary *instances = [[NSMutableDictionary alloc] init];

+ (NSString *) create {
    NSString *uuid = [[NSUUID UUID] UUIDString];
    instances[uuid] = [[HMMWrapper alloc] initWithId: uuid];
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
        if ([instances[keys[i]] isKindOfClass:[HMMWrapper class]])
        {
            [self destroy: keys[i]];
        }
    }
}

+ (HMMWrapper *) getFromId:(NSString *) instanceId {
    return instances[instanceId];
}


- (id)initWithId: (NSString *) aInstanceId {
    if( self = [super init] )
    {
        instanceId = aInstanceId;
        instance = new GRT::HMM;
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

- (VectorFloat *) getClassLikelihoods {
    GRT::VectorFloat likelihoods = instance->getClassLikelihoods();
    return [[VectorFloat alloc] initWithGRTVector:&likelihoods];
}

- (unsigned int) getPredictedClassLabel {
    return instance->getPredictedClassLabel();
}

- (BOOL) setHMMType: (unsigned int) hmmType {
    return instance->setHMMType(hmmType);
}

- (BOOL) setNumStates: (unsigned int) n {
    return instance->setNumStates(n);
}

- (BOOL) setNumSymbols: (unsigned int) n {
    return instance->setNumSymbols(n);
}

- (BOOL) setModelType: (unsigned int) n {
    return instance->setModelType(n);
}

- (BOOL) setMinChange: (float) n {
    return instance->setMinChange(n);
}

- (BOOL) setMaxNumEpochs: (unsigned int) n {
    return instance->setMaxNumEpochs(n);
}

- (BOOL) setNumRandomTrainingIterations: (unsigned int) n {
    return instance->setNumRandomTrainingIterations(n);
}
@end
