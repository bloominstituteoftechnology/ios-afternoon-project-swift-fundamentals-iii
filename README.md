---
typora-root-url: ../ios-afternoon-project-swift-fundamentals-iii
---

# Swift Fundamentals III Afternoon Project

So I decided to use this project to push myself to try to learn some new stuff. So rather than just complete the provided app (which I did), I made my own currency conversion app which I called Currency Swap. 

![ScreenShot](/images/ScreenShot.png)

To start with, my wife who just this week decided to learn UI Design, designed the UI for the app using Figma. We first brainstormed about what the layout should be, and drew up a sketch. She then picked some colors and designed the background and the "swap" button, which we thought would be useful for swapping the input and output currencies. After laying out the labels and picking fonts, the design was complete.

I then exported the background and button design and brought them in to the assets folder. Along with those, I created a couple of color swatches in the assets, and imported the font she selected. I decided to layout the app programatically, because it is a simple app, and I wanted more practice laying out using UIKit in code.

I had watched a brownbag last week on using Combine, so I decided I wanted to integrate that into my call to the API I selected (fixer.io). This went fairly smoothly, with the exception that my API key limited me to using HTTP and not HTTPS so I had to add a key to my info.plist. The api also limited me to one base currency (EUR) though that was fine as I could convert everything by going from inputCurrency -> EUR -> outputCurrency.

I decided to show a table view for selecting the currencies instead of a picker, as in the future I would like to make the list searchable, as the api returns a large number of currencies. I added a selection handler closure to my table view controller to pass the selected currency back to my main view controller.

I made use of a scroll view that doesn't actually have any subviews to allow for dismissing the keyboard by swiping. I've had experience using inputAccessoryView with a done button to do the same, but this was my first time using a scroll view in this way to handle dismissal.

One feature that I recently discovered and implemented in my swap button is swapping variables like so:

```swift
(inputCurrencyCode, outputCurrencyCode) = (outputCurrencyCode, inputCurrencyCode)
```

I thought that was a neat, concise way to write it.

I made use of some extensions I wrote, namely to simplify view layout. I did copy paste code from SO with a bit of editing for finding the shortest currency symbol for a given currency code, but I would like to go back and write that out myself.

I tried to make use of constants instead of typing out strings and such, but there are a couple of places I need to go back and use constants.

Overall, I'm proud of what I came up with (with help from my wife on the design) and learned quite a bit on this project. I know this is overkill for an afternoon project, but I needed the challenge, and I've been working on it since Tuesday as well.

