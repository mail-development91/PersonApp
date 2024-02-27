//
//  MockString.swift
//  PersonTests
//
//  Created by Amit Kumar on 27/02/24.
//

import Foundation

struct MockString {
    static let data =
        """
        {
          "status": "OK",
          "code": 200,
          "total": 2,
          "data": [
            {
              "id": 1,
              "firstname": "Ozella",
              "lastname": "Mohr",
              "email": "nheathcote@donnelly.net",
              "phone": "+8048507328071",
              "birthday": "2010-10-22",
              "gender": "female",
              "address": {
                "id": 0,
                "street": "50250 Hackett Summit Apt. 637",
                "streetName": "Hagenes Skyway",
                "buildingNumber": "653",
                "city": "Madonnaberg",
                "zipcode": "96711",
                "country": "Portugal",
                "county_code": "CK",
                "latitude": -45.803544,
                "longitude": -84.361853
              },
              "website": "http://bayer.com",
              "image": "http://placeimg.com/640/480/people"
            },
            {
              "id": 2,
              "firstname": "Amalia",
              "lastname": "Gaylord",
              "email": "becker.jaylen@jerde.info",
              "phone": "+3807256116260",
              "birthday": "2021-02-11",
              "gender": "female",
              "address": {
                "id": 0,
                "street": "561 Feil Heights",
                "streetName": "Borer Forest",
                "buildingNumber": "6128",
                "city": "West Angel",
                "zipcode": "62409",
                "country": "Saint Pierre and Miquelon",
                "county_code": "NR",
                "latitude": -54.250563,
                "longitude": -128.890868
              },
              "website": "http://romaguera.biz",
              "image": "http://placeimg.com/640/480/people"
            }
          ]
        }
        """
}
