# viewR

## A pipe-friendly way to invoke the `View()` function

Are you, like me, a fan of both `magrittr` pipes *and* the RStudio data viewer? Especially when doing EDA, you'll oftentimes want to casually view the current "state" of your transformed data frame without assigning it to a variable each time. (In the latter case you'd also need to select the variable and press F2, or CMD/CTRL+Click on it in the Source Editor, or click on it the Environment pane.)

With `viewR`, you can seamlessly view the currently selected lines of code in the RStudio data viewer: Just select the lines and then, instead of executing them (which will print the result to the console and may be undesirable for formatting reasons), you can assign an RStudio shortcut to `view_selection` (the workhorse of `viewR`) and immediately view the current selection in the data viewer.

You can even keep the trailing `%>%` selected, making it easy to keyboard-navigate through your code and seamlessly invoke `viewR` on "mid-code" selections without any intermediate steps.
