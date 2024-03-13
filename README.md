# PersonApp
PersonApp is assignment for Learning purpose. This includes Clean architecture (for e.g. separation of concerns), Testcase etc.

This includes following values- 

**•** performance

**•** readability

**•** maintainability 

**•** testability

**•** scalability

**•** simplicity



After grouping all layers we have: Presentation, Domain and Data layers.

**Domain Layer (Business logic)** - is the inner-most part . It contains Entities(Business Models), Use Cases, and Repository Interfaces. 
Note: Domain Layer should not include anything from other layers(e.g Presentation — UIKit or SwiftUI or Data Layer — Mapping Codable)


**Presentation Layer**: It contains UI (UIViewControllers Views). Views are coordinated by ViewModels (Presenters) which execute one or many Use Cases. Presentation Layer depends only on the Domain Layer.

**Data Layer:** It contains Repository Implementations and one or many Data Sources. Repositories are responsible for coordinating data from different Data Sources. Data Source can be Remote or Local (for example persistent database). Data Layer depends only on the Domain Layer. In this layer, we can also add mapping of Network JSON Data (e.g. Decodable conformance) to Domain Models.


**NOTE:** It uses public API - https://github.com/public-apis/
public-apis/blob/master/README.md.



****Steps to build the Code:-****
  1. Download zip file OR Clone the code using - "git clone https://github.com/mail-development91/PersonApp/"
  2. Open terminal and go to the project folder
  3. Do pod install
  4. Open workspace file in xcode and run the app.



**screens** - Two screens are shown as

![Screen1](https://github.com/mail-development91/PersonApp/assets/159416832/48f3f951-8a3c-476b-8c8a-c577cd5230b9)


![screen2](https://github.com/mail-development91/PersonApp/assets/159416832/e01ec700-ec9a-43ad-967a-373641c30791)



