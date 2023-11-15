


# MeasureEngine

![Image](https://img.shields.io/badge/SwiftUI-orange
) ![Image](https://img.shields.io/badge/Swift-orange
) ![Image](https://img.shields.io/badge/Converter-orange
) ![Image](https://img.shields.io/badge/Custom%20Font-orange
) ![Image](https://img.shields.io/badge/Custom%20Color-orange
) ![Image](https://img.shields.io/badge/NSMeasurement-orange
) ![Image](https://img.shields.io/badge/Foundation%20%20-orange
)

## Motivation

Originally, I had build this converter while completing the [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) course. That converter included the functionality but did not include any design features. I wanted to showcase some design skills by adding a custom font to the app, as well as different color schemes. 

---
## Project Description / Objectives

![Image](https://img.shields.io/badge/Unit%20of%20Measure%20Converter-orange
) ![Image](https://img.shields.io/badge/Engine-orange
) ![Image](https://img.shields.io/badge/Practical%20application-orange
) ![Image](https://img.shields.io/badge/Utility-orange
) ![Image](https://img.shields.io/badge/NSMeasurement%20%20-orange
) ![Image](https://img.shields.io/badge/Functionality%20%20-orange
)

This app is a unit of measure converter. The user is able to choose which unit of measure (*volume, distance, mass, temperature, or time*) they want to convert. They will have inputs for the amount, convert from, and convert to. Once all inputs are satisfied the engine will display their result. This is a very practical application. It has great utility. 

**Objectives**

* Create a [form](https://developer.apple.com/documentation/swiftui/form/) to display the inputs to the user
* Create the functionality behind the converter engine
* Add a custom [font](https://developer.apple.com/documentation/realitykit/preliminary-text-font/) to the application
* Include different [color](https://developer.apple.com/documentation/tvml/color/) schemes in the application
* Test the functionality to confirm engine in working condition

---

## Functionality

![Image](https://img.shields.io/badge/NSMeasurement-orange
) ![Image](https://img.shields.io/badge/MeasurementFormatter-orange
) ![Image](https://img.shields.io/badge/NavigationView-orange
) ![Image](https://img.shields.io/badge/Form-orange
) ![Image](https://img.shields.io/badge/Picker-orange
) ![Image](https://img.shields.io/badge/init()-orange
) ![Image](https://img.shields.io/badge/ForEach-orange
)

### Variables
In presenting the form to the user I knew that we needed several fields. First, we would need an **Amount To Convert** field. Under that we would need to include the **Unit of Measurement**, **Convert from**, and **Convert to** fields. Below that we would present the **Engine Result** to the user. 

In thinking about the different units of measure we would present I created a [constant variable](https://developer.apple.com/documentation/foundation/nsexpression/1413759-variable/) that is an [array](https://developer.apple.com/documentation/swift/array/) of the different units of measure

>let conversions = ["Volume", "Distance", "Mass", "Temperature", "Time"]

We will rely heavily on the native [Measurement Struct](https://developer.apple.com/documentation/foundation/measurement/) that bridges to the native [Foundation NSMeasurement Class](https://developer.apple.com/documentation/foundation/nsmeasurement/). *This particular project has really shown me how powerful the potential of using the built in programmatic interfaces that SwiftUI and Foundation offer can be*. 

With that in mind I added this array of unit types

```
let  unitTypes = [
[UnitVolume.fluidOunces, UnitVolume.cups, UnitVolume.pints, UnitVolume.quarts, UnitVolume.gallons], 
[UnitLength.feet, UnitLength.kilometers, UnitLength.meters, UnitLength.miles, UnitLength.yards], 
[UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds], 
[UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin,] 
[UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds]
]
```


Next I added the following [@State](https://developer.apple.com/documentation/swiftui/state/) properties for our input and output values

>@State private var selectedUnits 
>@State private var inputValue
>@State private var ouputValue

I set the default **inputValue** to **UnitVolume.fluidOunces**, and the default **outputValue** to **UnitVolume.gallons**. Pretty cool!

Lastly I added two more variables that drew on the native [NSMeasurement](https://developer.apple.com/documentation/foundation/nsmeasurement/)

A **constant variable** called **formatter** which would be a [MeasurementFormatter](https://developer.apple.com/documentation/foundation/measurementformatter/) and a [computed property](https://www.hackingwithswift.com/sixty/7/2/computed-properties) called **result** which would contain the code for the **MeasureEngine**.

```
 let formatter: MeasurementFormatter


var result: String {
	let inputVolume = Measurement(value: input, unit: inputValue)
	let outputVolume = inputVolume.converted(to: outputValue) 
	return formatter.string(from: outputVolume)
}
```

When I created the **formatter** variable I also had to create an [init()](https://developer.apple.com/documentation/realitykit/transform/init()/) to initialize this formatter. Here is the code to do so

```
init() {
	formatter = MeasurementFormatter()
	formatter.unitOptions = .providedUnit
	formatter.unitStyle = .long

}
```


### Form

With the variables in place I now set about creating the form. In looking at a practical solution that provided the most utility the form would include a field to enter the amount to convert, three [pickers](https://developer.apple.com/documentation/swiftui/picker/) (where the user selects the unit of measure, convert from, and convert to) and then a field for the engine result. 

The basic syntax of our form would look like this

```
NavigationView {
	Form {
		Section {
			TextField()
				.modifiers()
		} header: {
			Text()
			}
		
		Picker() {
			ForEach {
				Text()
					.modifiers()
			}
		}
		Picker() {
			ForEach {
				Text()
					.modifiers()
			}
		}
		Picker() {
			ForEach {
				Text()
					.modifiers()
			}
		}
		Section {
			Text()
				.modifiers()
		} header: {
			Text()
				.modifiers()
		}
	}
}
```

Here is the code example of  the [ForEach](https://developer.apple.com/documentation/realitykit/entity/childcollection/foreach(_:)/) loop for **Convert from**

```
Picker("Convert from", selection: $inputValue) {
	ForEach(unitTypes[selectedUnits], id: \.self) {
		Text(formatter.string(from: $0).capitalized)
	}
}
```

Then I added a [navigationTitle](https://developer.apple.com/documentation/realitykit/realityviewcontent/body/navigationtitle(_:)-1bx9d/) of **MeasureEngine**. 

*The application was starting to take shape.*

---

**Screenshots**
*The Unit of Measure picker*
![Image](https://github.com/beamthecode/MeasureEngine/blob/main/UnitofMeasurePicker.jpg?raw=true)

*The Convert From picker*
![Image](https://github.com/beamthecode/MeasureEngine/blob/main/ConvertFromPicker.jpg?raw=true)

*The Convert To Picker*
![Image](https://github.com/beamthecode/MeasureEngine/blob/main/ConvertToPicker.jpg?raw=true)

I wanted to add a [button](https://developer.apple.com/documentation/swiftui/button/) the user could click when they had their amount entered. 

I created a new **@State** property

>@State private var inputIsFocused: Bool

Then under the [TextField](https://developer.apple.com/documentation/swiftui/textfield/) in the first section of our form I added this [modifier.](https://developer.apple.com/documentation/swiftui/view/modifier(_:)/)

**.focused($inputIsFocused)** 

I created a [toolbar](https://developer.apple.com/documentation/swiftui/searchfieldplacement/toolbar/) to house our **Done** button, this would reference our **inputIsFocused** property. 

```
.toolbar {
	ToolbarItemGroup(placement: .keyboard) {
		Spacer()
		Button("Done") {
			inputIsFocused = false

		}
	}
}
```
When the user changes the input amount, inputIsFocused is updated and the **Done** button will appear.

Next I added this [.onChange(of:)](https://developer.apple.com/documentation/realitykit/model3d/onchange(of:initial:_:)-2vjkb/) 

```
.onChange(of: selectedUnits, initial: true) { oldSelection, newSelection in
	let units = unitTypes[newSelection]
	inputValue = units[0]
	outputValue = units[1]
}
```




**Screenshot**

*The Done Button*
![Image](https://github.com/beamthecode/MeasureEngine/blob/main/DoneButton.jpg?raw=true)

*At this point I was ready to add some design features!*

---

## Design

![Image](https://img.shields.io/badge/Custom%20Font-orange
) ![Image](https://img.shields.io/badge/Modifiers-orange
) ![Image](https://img.shields.io/badge/.scrollContentBackground()-orange
) ![Image](https://img.shields.io/badge/.background()-orange
) ![Image](https://img.shields.io/badge/.listRowBackground()%20-orange
)

*Design wise I wanted to bring in a custom font that I could utilize, as well as add some color schemes to give the application some more life.*

I started by browsing [Google Fonts.](https://fonts.google.com) Since I didn't have a particular font in mind I decided to go with [Acme-Regular.](https://fonts.google.com/specimen/Acme?query=Acme)  I downloaded the family to my local folder. 

Next I created a **group** folder in my project called **Fonts**. I dragged my font file into this folder. Then I navigated to the project settings and added a new **Custom iOS Target Property** called **Fonts provided by application**. Then under this target I added Acme-Regular as a font in Item 0 of the Fonts provided by application array. At this point I was ready to start incorporating the font into the application!

The first thing I wanted to do is change the font of the [navigationTitle.](https://developer.apple.com/documentation/realitykit/model3d/navigationtitle(_:)-5qdkf/) I was having a hard time figuring this out, so I did some Google searches and found a conversation on this [Hacking With Swift](https://www.hackingwithswift.com/forums/swiftui/custom-font-in-navigation-title-and-back-button/22989) message board directly related to this issue.

I went in to `MeasureEngineApp.swift` and added this code in the **MeasureEngineApp** [struct](https://www.hackingwithswift.com/read/0/15/structs) above the [body.](https://developer.apple.com/documentation/realitykit/model3d/body-swift.property/) 

```
init() {
	let appear = UINavigationBarAppearance()
	
	let atters = [NSAttributedString.Key: Any] = [
		.font: UIFont(name: "Acme-Regular", size: 40)!
	]

	appear.largeTitleTextAttributes = atters
	appear.titleTextAttributes = atters
	UINavigationBar.appearance().standardAppearance = appear
	UINavigationBar.appearance().compactAppearance = appear
	UINavigationBar.appearance().scrollEdgeAppearance = appear
```
Voila! That piece of code worked! Now that I had the correct font for my navigationTitle, I moved on to applying it to the text in my form fields.

To apply my custom font I used this font modifier

`.font(.custom("Acme-Regular", size: 20))`

I applied this modifier to all text fields. 

Next I added [color.](https://developer.apple.com/documentation/tvml/color/)

To change the color of the whole form I added these two modifiers under the **.navigationTitle** modifier

```
.scrollContentBackground(.hidden)
.background(.orange.opacity(0.6))
```

[.scrollContentBackground(.hidden)](https://developer.apple.com/documentation/swiftui/view/scrollcontentbackground(_:)/)  hides the default background. When I apply the color orange to the [.background()](https://developer.apple.com/documentation/tvml/background/) now the color is visible to the user. If we did not hide the default background it would be visible and our color would not show. Whew!

At this point I wanted to add color to the rows in the **Form**. To do this I added the following modifier below each [Picker](https://developer.apple.com/documentation/swiftui/picker/) and [Section](https://developer.apple.com/documentation/swiftui/section/)

`.listRowBackground(Color.cyan)`

I thought that the cyan looked good against the orange background. I was very happy with this appearance!

---
**Screenshots**

*The navigationTitle*

![Image](https://github.com/beamthecode/MeasureEngine/blob/main/NavigationTitle.jpg?raw=true)


*The app displayed on iPhone 15 Pro*
![Image](https://github.com/beamthecode/MeasureEngine/blob/main/ContentViewDesign.jpg?raw=true)


## Testing


### Test 1

The last step in building out this application was testing the application to see if our engine was working as planned. I ran a couple simple tests with this info as our conversion choices. 

> Distance -> Feet -> Miles
> Temperature -> Degrees Celsius -> Degrees Fahrenheit                    

For the first test I entered *5,280* in the *Amount to Convert* field. Then I set the *Unit of Measurement* picker to *Distance*. Next I set the *Convert from* field to *Feet* and the *Convert to* field to *Miles*

The *Engine Result* was *1 mile*. *Perfect!*

**Test 1 Screenshot**
![Image](https://github.com/beamthecode/MeasureEngine/blob/main/Test1.jpg?raw=true)

### Test 2

For the second test I entered *0* in the *Amount to Convert* field. Then I set the *Unit of Measurement* picker to *Temperature*. Next I set the *Convert from* field to *Degrees Celcius* and the *Convert to* field to *Degrees Fahrenheit*

The *Engine Result* was *32 degrees Fahrenheit*. *The engine is working as planned! Boom!*

**Test 2 Screenshot**

![Image](https://github.com/beamthecode/MeasureEngine/blob/main/Test2.jpg?raw=true)


---

## Notes

![Image](https://img.shields.io/badge/Thank%20you!%20-orange
) ![Image](https://img.shields.io/badge/NSMeasurement%20-orange
) ![Image](https://img.shields.io/badge/Foundation%20-orange
) ![Image](https://img.shields.io/badge/Continuous%20Improvement%20-orange
) ![Image](https://img.shields.io/badge/Feedback%20-orange
)

This was a fun project to build. It was good practice working with the built in functionality of **NSMeasurement** and **Foundation**. I learned more about custom color schemes and custom fonts as well! 

Thank you for checking out this project!

If there are any pointers or recommendations that you have for my code or my build out please let me know! I love the feedback. 

---

## Credit
![Image](https://img.shields.io/badge/Credit%20%20-orange
) ![Image](https://img.shields.io/badge/100%20Days%20of%20SwiftUI%20%20-orange
) ![Image](https://img.shields.io/badge/The%20more%20you%20know%20%20-orange
) ![Image](https://img.shields.io/badge/SwiftUI%20%20-orange
) ![Image](https://img.shields.io/badge/Community%20Support%20%20-orange
)

I want to thank Paul Hudson [@TwoStraws](https://github.com/twostraws) for the inspiration for this project. I originally learned how to build a converter in his [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) course. Full credit goes to  Paul for the skills that he has taught me. 

I have also found that the message boards at **Hacking With Swift** are very useful for solving problems. Thank you for the community!

---

## License

**MIT License 2023**
