//
//  SimpleAdControllerCocos2d.m
//  JigsawHero
//
//  Created by Heshan Wanigasooriya on 12/9/15.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "InterstitialAdControllerCocos2d.h"

@implementation InterstitialAdControllerCocos2d

+(instancetype)sharedInstance{
    static SimpleAdControllerCocos2d *sharedInstance = nil;
    if (sharedInstance == nil)
    {
        sharedInstance = [(SimpleAdControllerCocos2d *)[self alloc] init];
    }
    return sharedInstance;
}

// Interstitial iAd
-(void)showInterstitial {
    [self initiAdBanner];
    [self initgAdBanner];
}

#pragma mark - preload Banners -
// preload iAd banner
-(void)initiAdBanner{
    NSLog(@"called of iAD here");
    iAdInterstitial = [[ADInterstitialAd alloc] init];
    iAdInterstitial.delegate = self;
}

// preload gAd banner
-(void)initgAdBanner{
    if (!gAdInterstitial){
        NSLog(@"called of gAD here");
        GADRequest *request = [GADRequest request];
        gAdInterstitial = [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-5583102413884765/8674883219"];
        gAdInterstitial.delegate = self;
        request.testDevices = @[ @"f27f959b294d38a776cee42868116b9d"];
        [gAdInterstitial loadRequest:request];
    }
    else{
        NSLog(@"called elas gAD here");
    }
}

#pragma mark - gAd Banner show -
// only gAds needs this
-(void)gAdShowBanner{
    if ([gAdInterstitial isReady]) {
        [gAdInterstitial presentFromRootViewController:[CCDirector sharedDirector].navigationController];
        gAdInterstitial = nil;
    }
}

#pragma mark - ADInterstitialAdDelegate delegate methods -

-(void)interstitialAd:(ADInterstitialAd *)interstitialAd didFailWithError:(NSError *)error {
    iAdInterstitial = nil;
    NSLog(@"iAD didFailWithError");
    NSLog(@"%@", error);
    [self gAdShowBanner];
}

-(void)interstitialAdDidLoad:(ADInterstitialAd *)interstitialAd {
    NSLog(@"iAD interstitialAdDidLoad");
    [iAdInterstitial presentFromViewController:[CCDirector sharedDirector].navigationController];
}

-(void)interstitialAdDidUnload:(ADInterstitialAd *)interstitialAd {
    iAdInterstitial = nil;
    NSLog(@"iAD interstitialAdDidUnload");
}

-(void)interstitialAdActionDidFinish:(ADInterstitialAd *)interstitialAd {
    NSLog(@"iAD interstitialAdActionDidFinish");
}

#pragma mark - GADInterstitialDelegate delegate methods -

- (void)interstitialDidReceiveAd:(GADInterstitial *)interstitial{
    NSLog(@"gAD interstitialDidReceiveAd");
}

- (void)interstitial:(GADInterstitial *)interstitial didFailToReceiveAdWithError:(GADRequestError *)error{
    gAdInterstitial = nil;
    NSLog(@"gAD didFailToReceiveAdWithError");
    NSLog(@"%@", error);
    [self showInterstitial];
}
- (void)interstitialWillPresentScreen:(GADInterstitial *)interstitial{
    NSLog(@"gAD interstitialWillPresentScreen");
}
- (void)interstitialWillDismissScreen:(GADInterstitial *)interstitial{
    NSLog(@"gAD interstitialWillDismissScreen");
}
- (void)interstitialDidDismissScreen:(GADInterstitial *)interstitial{
    gAdInterstitial = nil;
    NSLog(@"gAD interstitialDidDismissScreen");
}

- (void)interstitialWillLeaveApplication:(GADInterstitial *)interstitial{
    NSLog(@"gAD interstitialWillLeaveApplication");
}

@end