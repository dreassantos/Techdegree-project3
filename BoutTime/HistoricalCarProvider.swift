//
//  HistoricalCarProvider.swift
//  BoutTime
//
//  Created by Andrea on 2/7/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
// car list: https://gearpatrol.com/2011/12/02/feature-here-to-eternity-the-50-most-iconic-cars-in-motoring-history/
//car images from wiki and listing above

import Foundation

struct HistoricalCar {
    var carName : String
    var imageName: String
    var websiteUrl: String
    var carYear: Int
}

struct Cars {
    let carList: [HistoricalCar] = [
        HistoricalCar(
            carName: "Ford Model T Touring",
            imageName: "FordModelTtouring1925.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Ford_Model_T",
            carYear: 1925),
        HistoricalCar(
            carName: "Fardier à vapeur",
            imageName: "1770FardierVapeur.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Nicolas-Joseph_Cugnot",
            carYear: 1770),
        HistoricalCar(
            carName: "Double Model E",
            imageName: "DobleModelE1924.jpeg",
            websiteUrl: "https://en.wikipedia.org/wiki/Doble_steam_car",
            carYear: 1924),
        HistoricalCar(
            carName: "Stanley Steamer",
            imageName: "StanleyWoggleBug.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Stanley_Motor_Carriage_Company",
            carYear: 1903),
        HistoricalCar(
            carName: "Bugatti Type 35",
            imageName: "Bugattitype351926.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Bugatti_Type_35",
            carYear: 1926),
        HistoricalCar(
            carName: "Alfa Romeo Super Sport",
            imageName: "AlfaRomeoSuperSport1929.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Alfa_Romeo_6C",
            carYear: 1929),
        HistoricalCar(
            carName: "Rolls Royce Phantom",
            imageName: "RollsRoycePhantom1936.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Rolls-Royce_Phantom_III",
            carYear: 1936),
        HistoricalCar(
            carName: "Bugatti Type 57SC Atlantic",
            imageName: "1936-Bugatti-Type-57SC-Atlantic.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Bugatti_Type_57",
            carYear: 1936),
        HistoricalCar(
            carName: "Tucker Torpedo",
            imageName: "1948-Tucker-Torpedo.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Tucker_48",
            carYear: 1948),
        HistoricalCar(
            carName: "Aston Martin DB4 GT Zagato",
            imageName: "1960-Aston-Martin-DB4-GT-Zagato.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Aston_Martin_DB4_GT_Zagato",
            carYear: 1960),
        HistoricalCar(
            carName: "Ferrari 250 GT Berlinetta SWB",
            imageName: "Ferrari-250-GT-Berlinetta-SWB.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Ferrari_250",
            carYear: 1959),
        HistoricalCar(
            carName: "Chevrolet Corvette Sting Ray Coupe",
            imageName: "1963-Chevrolet-Corvette-Sting-Ray-Coupe.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Chevrolet_Corvette_(C2)",
            carYear: 1963),
        HistoricalCar(
            carName: "Ford GT40",
            imageName: "Ford-GT40.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Ford_GT40",
            carYear: 1964),
        HistoricalCar(
            carName: "Aston Martin DB5",
            imageName: "Aston-Martin-DB5.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Aston_Martin_DB5",
            carYear: 1963),
        HistoricalCar(
            carName: "Alfa Romeo 33 Stradale",
            imageName: "1967-Alfa-Romeo-33-Stradale.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Alfa_Romeo_33_Stradale",
            carYear: 1967),
        HistoricalCar(
            carName: "BMW M1",
            imageName: "1978BMWM1.jpg", //Cite- Wikipage listed
            websiteUrl: "https://en.wikipedia.org/wiki/BMW_M1",
            carYear: 1978),
        HistoricalCar(
            carName: "AC Shelby Cobra 427",
            imageName: "ac-shelby-cobra.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/AC_Cobra#Cobra_427",
            carYear: 1962),
        HistoricalCar(
            carName:"Acura NSX / Honda NSX",
            imageName: "Acura-NSX.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Honda_NSX",
            carYear: 1990),
        HistoricalCar(
            carName: "DeLorean DMC-12",
            imageName: "DeLorean-DMC-12.jpg", // TODO:Get a Flux capacitor
            websiteUrl: "https://en.wikipedia.org/wiki/DMC_DeLorean",
            carYear: 1981),
        HistoricalCar(
            carName: "Jaguar E-Type",
            imageName: "Jaguar-E-Type.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Jaguar_E-Type",
            carYear: 1961),
        HistoricalCar(
            carName: "Lamborghini Countach",
            imageName: "Lamborghini-Countach.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Lamborghini_Countach",
            carYear: 1974),
        HistoricalCar(
            carName: "Mazda Miata MX-5",
            imageName: "Mazda-Miata.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Mazda_MX-5",
            carYear: 1989),
        HistoricalCar(
            carName: "Volvo P1800", //Originally started 1957 as M1 prototype but only sold 68 and resold the new verson 1963
            imageName: "Volvo_P1800_1963.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Volvo_P1800",
            carYear: 1963),
        HistoricalCar(
            carName: "Pontiac GTO",
            imageName: "1967-Pontiac-GTO.jpg",//Cite- Wikipage listed
            websiteUrl: "https://en.wikipedia.org/wiki/Pontiac_GTO",
            carYear: 1967),
        HistoricalCar(
            carName: "Maserati 3500 GT Vignale Spyder",
            imageName: "Maserati_3500_GT_front.jpg",//Cite- Wikipage listed
            websiteUrl: "https://en.wikipedia.org/wiki/Maserati_3500_GT",
            carYear: 1957),
        HistoricalCar(
            carName: "Audi Quattro",
            imageName: "1980Audi_Quattro.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Audi_Quattro",
            carYear: 1980),
        HistoricalCar(
            carName: "Datsun 240Z / Nissan S30",
            imageName: "Datsun-240Z-280Z.jpg",
            websiteUrl: "https://en.wikipedia.org/wiki/Nissan_S30#240Z",
            carYear: 1970), // using the 1970's verson 240Z (240Z-280Z)
    ]
}

