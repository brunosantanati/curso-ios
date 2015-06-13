//
//  ContatosNoMapaViewController.h
//  ContatosIP67
//
//  Created by ios5198 on 13/06/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ContatosNoMapaViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property CLLocationManager *manager;
@property (weak, nonatomic) NSMutableArray *contatos;

@end
