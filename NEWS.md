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


### NEWS.md setup

- Added `NEWS.md` creation with [newsmd](https://github.com/Dschaykib/newsmd)


## version 0.1.0

---

- Prototype for `view_selection()`
- Add RStudio addin via `inst/rstudio/addins.dcf`


