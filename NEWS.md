## version 0.4.0

---

- `viewR` can now also be run directly from the RStudio console (currently only single-line prompts and no partial selections)

## version 0.3.0

---


### Warning in case of truncated selection

- `viewR` now by default issues a warning if part of the selection was truncated before evaluation (e.g. due to incomplete selection).
- For example, take the following code: 

```r
iris %>% 
   head() %>% 
   filter(Sepal.Length > 5)
```

- If you now happen to accidentally only select the following incomplete part: 

```r
iris %>% 
   head() %>% 
   filter(
```

- `viewR` will drop the last line and issue a warning: `Warning: Selection truncated! Removed the following part: ' %>% filter('`
- This feature can be disabled by setting `options(viewR.warn.truncated = FALSE)`. Note that no warning is issued for truncated trailing pipes ` %>% ` because one of the core features of `viewR` is to be able to keep trailing pipes selected.


### Backend and testing infrastructure

- Refactor and modularize backend
- Define additional tests in `tests/testthat/`
- Add code coverage tracking with [Codecov](https://app.codecov.io/gh/lukasfeick-sw/viewR?branch=main)


## version 0.2.0

---


### User Experience

- Users can now use `viewR` in more contexts, making it more robust and more applicable to different use cases:
   - Select single lines of code
   - Keep the trailing pipe `%>%` selected
   - Keep leading comments `#` selected
   - Keep inline comments `#` selected



### Backend Enhancements

- Enhance detection of tab title and make parsing more robust
- Move from regex-based detection to parsing via `utils::getParseData()`


### NEWS.md Setup

- Add `NEWS.md` creation with [newsmd](https://github.com/Dschaykib/newsmd)


## version 0.1.0

---

- Prototype for `view_selection()`
- Add RStudio addin via `inst/rstudio/addins.dcf`


