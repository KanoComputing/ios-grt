//
//  HMM.h
//  ios-grt
//
//  Created by Radek Pazdera on 28/02/2018.
//  Copyright © 2018 Kano Computing. All rights reserved.
//

#ifndef HMM_h
#define HMM_h

#import "TSCDWrapper.h"
#import "MatrixFloat.h"
#import "VectorFloat.h"

@interface HMMWrapper : NSObject
+ (NSMutableDictionary *) instances;
+ (NSString *) create;
+ (void) destroy:(NSString *) instanceId;
+ (void) destroyAll;

+ (HMMWrapper *) getFromId:(NSString *) id;

- (id) initWithId:(NSString *) instanceId;
- (void) dealloc;

//----

- (BOOL) train:(TSCDWrapper *) sample;
- (BOOL) predict:(MatrixFloat *) timeseries;
- (VectorFloat *) getClassLikelihoods;
- (unsigned int) getPredictedClassLabel;
- (BOOL) setHMMType: (unsigned int) hmmType;
- (BOOL) setNumStates: (unsigned int) n;
- (BOOL) setNumSymbols: (unsigned int) n;
- (BOOL) setModelType: (unsigned int) n;
- (BOOL) setMinChange: (float) n;
- (BOOL) setMaxNumEpochs: (unsigned int) n;
- (BOOL) setNumRandomTrainingIterations: (unsigned int) n;
@end

#endif /* HMM_h */
