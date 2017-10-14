module ClassNames exposing (classNames)

{-| This library provides a simple utility to conditionally join together html class strings.

## Generate class string

@docs classNames

-}


{-| Convert a list of conditional classes into a single html class String.

    classNames
        [ ("item", True)
        , ("is-selected", isSelected)
        ]
    -- Outputs 'item' when isSelected == False
    -- Outputs 'item is-selected` when isSelected == True
-}
classNames : List ( String, Bool ) -> String
classNames conditionalClasses =
    List.foldl getClassIfActive "" conditionalClasses
        |> String.trim


getClassIfActive : ( String, Bool ) -> String -> String
getClassIfActive ( class, isActive ) existing =
    if isActive then
        class ++ " " ++ existing
    else
        existing
