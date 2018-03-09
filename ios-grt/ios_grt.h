//
//  ios-grt.h
//  ios-grt
//
//  Created by Radek Pazdera on 28/02/2018.
//  Copyright © 2018 Kano Computing. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for ios_grt.
FOUNDATION_EXPORT double ios_grtVersionNumber;

//! Project version string for ios_grt.
FOUNDATION_EXPORT const unsigned char ios_grtVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <ios_grt/PublicHeader.h>

#import <ios_grt/HMM.h>
#import <ios_grt/DTW.h>
#import <ios_grt/TSCDWrapper.h>
#import <ios_grt/KMeansQuantizer.h>

/*

TimeSeriesClassificationData
    setInfoText(text)
    getInfoText()
    setNumDimensions(n)
    getNumDimensions()
    getNumSamples()
    addSample(label, matrix)

DTW
    train(sample)
    predict(vertices)
    getMaximumLikelihood()
    getPredictedClassLabel()

KMeansQuantizer
    setNumClusters(n)
    train(sample)
    quantize(data)
    getFeatureVector()
    clear()

HMM
    train(sample)
    predict(vertices)
    getClassLikelihoods()
    getPredictedClassLabel()
    setHMMType(n)
    setNumStates(n)
    setNumSymbols(n)
    setModelType(n)
    setMinChange(n)
    setMaxNumEpochs(n)
    setNumRandomTrainingIterations(n)

*/
