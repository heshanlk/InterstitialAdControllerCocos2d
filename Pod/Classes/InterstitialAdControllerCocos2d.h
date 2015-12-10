//
//  SimpleAdControllerCocos2d.h
//  JigsawHero
//
//  Created by Heshan Wanigasooriya on 12/9/15.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import <iAd/iAd.h>
@import GoogleMobileAds;

@interface InterstitialAdControllerCocos2d : NSObject <ADInterstitialAdDelegate, GADInterstitialDelegate>{
    ADInterstitialAd *iAdInterstitial;
    GADInterstitial *gAdInterstitial;
}

+(instancetype)sharedInstance;

-(void)showInterstitial;

@end