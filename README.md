# viewR

## A pipe-friendly way to invoke the `View()` function

Are you, like me, a fan of both `magrittr` pipes *and* the RStudio data viewer? Especially when doing EDA, you'll oftentimes want to casually check the current "state" of your transformed data frame without assigning it to a variable each time.

With `viewR`, you can seamlessly view the currently selected lines of code in the RStudio data viewer: Instead of selecting the lines and then executing them, which will print the result to the console, you can assign an RStudio shortcut to `view_selection` (the workhorse of `viewR`) and immediately view the current selection in the data viewer.

You can even keep the trailing `%>%` selected, making it easy to keyboard-navigate through your code and invoke `viewR` on "mid-code" selections.
