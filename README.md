# VIP Demo App

> This is an implementation of a the VIP ([Clean Swift](https://clean-swift.com/)) architecture by [Raymond Law](https://twitter.com/rayvinly).

This implementation is based on the this [article](https://medium.com/better-programming/implement-a-clean-vip-architecture-in-swift-5-e1a27c7c92a7) 
by [Zafar Ivaev](https://medium.com/@z.ivaev?source=post_page-----e1a27c7c92a7--------------------------------).

## What's VIP

The VIP pattern was created to address some issues of the VIPER architecture. 
One problem was that the Presenter (P) component may become too large — as it’s responsible for handling UI actions and preparing data for the view. 

To facilitate the single responsibility principle the relationship between objects was altered. 
While the VIPER’s V part means both ViewController and a UIView, the VIP’s “V” means simply ViewController. 

Therefore, the UIView is a separate component now, which makes view controllers a little bit thinner.

## Let's Understand the component part of VIP

Each module or scene usually involves the following components with their corresponding responsibilities:

 - `View`: Anything that is a UIView subclass. It should be reusable and as passive as possible.
 
 - `ViewController`: An object that is created to manage the behavior of a specific view. May act as a data source or event handler. Calls necessary Interactor’s methods in response to view events and receives raw view-representable data from the Presenter.
 
 - `Interactor`: Performs business logic in the app, but is not aware of lower-level implementations, such as network clients or databases. For this, we have dependencies on services that do know about them and use them directly. When a service’s task is performed, the Interactor obtains the result and sends it to the Presenter.
 
 - `Presenter`: Receives a task’s result from the interactor and transforms it into a view-suitable format. For example, it may transform an array of complicated Core Data objects into a simple array of Strings.
 
 - `Router`: Responsible for performing navigation inside the app. Typically has a dependency on a UINavigationController that’s provided by a Configurator.
 
 - `Configurator`: An object that creates a module by linking all the previous components.
 
 - `Entity`: A plain object, such as a Core Data entity or a Codable model.
 
 Take a look at the diagram below
 (an object that is been pointed to is owned by the pointing object):
 
 ![VIP](https://miro.medium.com/max/1400/1*eSER5qbVsRS4snwmVp64Tg.png)
 
 
