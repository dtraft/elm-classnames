# elm-classnames

A simple utility for conditionally joining html classes together.  Essentially an Elm port of [JedWatson's](https://github.com/JedWatson) excellent javascript [classnames](https://github.com/JedWatson/classnames) library.

## Usage

This utility helps simply the generation of html className strings based on one or more conditions.  As the number of conditions grows, this can become more challenging to manage.  By passing a list of `(String, Bool)` tuples to the exposed `classNames` function, this becomes much easer.

```elm
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

import ClassNames exposing (classNames)

view: Bool ->  Bool -> Html msg
view isActive isSelected =
    let
        itemClasses =
            classNames
                [ ("item", True) -- This class should always be assigned.
                , ("is-active", isActive) -- `is-active` will be added when isActive == True
                , ("is-selected, isSelected) -- `is-selected` will be added when isSelected == True
                ]
    in
        div [ class itemClasses ] [text "Item"]
```

Calling `view True False` will generate the following Html: `<div class="item is-active">Item</div>`.

## Contributing

Pull requests are welcome!



