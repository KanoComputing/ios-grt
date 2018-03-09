//
//  DTW.h
//  ios-grt
//
//  Created by Radek Pazdera on 07/03/2018.
//  Copyright © 2018 Kano Computing. All rights reserved.
//

#ifndef DTW_h
#define DTW_h

#import "TSCDWrapper.h"
#import "MatrixFloat.h"

@interface DTWWrapper : NSObject
+ (NSMutableDictionary *) instances;
+ (NSString *) create;
+ (void) destroy:(NSString *) instanceId;
+ (void) destroyAll;

+ (DTWWrapper *) getFromId:(NSString *) id;

- (id) initWithId:(NSString *) instanceId;
- (void) dealloc;

//----

- (BOOL) train:(TSCDWrapper *) sample;
- (BOOL) predict:(MatrixFloat *) timeseries;
- (float) getMaximumLikelihood;
- (unsigned int) getPredictedClassLabel;

@end
 
#endif /* DTW_h */
