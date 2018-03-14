#  Localiziation

The purpose of this project is to help with managing Localized strings in a way that gives you safty and ease of use.

## Usage

Simply run the application. The command line will prompt you for input.

Specify the source file
Specify the destination file
Specify the destination for the generated `ResourceFile.swift`


###### Displayed options
## Please select an option:
1) Add new entry with auto gernerated key
2) Add new entry with specified key
3) Generate Resources
4) Generate Strings


## 1 Add new entry with auto gernerated key

auto generates a key based off of the string you entered by  `camelCaseing` the phrase and removeing spaces.
Adds that entry to the `locolizable.strings` file.


## 2 Add new entry with specified key

lets you specify a key and value
Adds that entry to the `locolizable.strings` file.

## 3 Generate Resources
Creates the `Resources.swift` based off of the contents of the `locolizable.strings` file

## 4 Generate Strings
Takes the source file specified and generates a new `Localizable.stirngs`
1) by parsing the values for each entry.
2) Auto generating a `camleCased` key
3) Adding a comment and the [key: value] to the`Localizable.stirngs` file.


## How to use the Resources
Inside the main project you can access `locolized strings` like this
`R.{stringInCammelCase}`

EX: `self.title = R.awesomeTitle`
this will return a locolised version of "Awesome Title"

