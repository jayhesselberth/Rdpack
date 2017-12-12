# Rdpack

Provides functions for manipulation of R documentation objects objects, including
function reprompt() for updating existing Rd documentation for functions,
methods and classes, function rebib() for import of references from 'bibtex'
files, a macro for importing 'bibtex' references which can be used in Rd files
and 'roxygen2' comments and other convenience functions for references.


## Installing

The latest stable version is on CRAN. 
```
install_packages("Rdpack")
```

You can also install the development version of `Rdpack` from Github:

```
library(devtools)
install_github("GeoBosh/Rdpack")
```


## Usage

### Inserting references from Bibtex files

#### Preparation 
To prepare a package for importing BibTeX references it is necessary to tell the
package management tools that package Rdpack and its Rd macros are
needed. The references should be put in file inst/REFERENCES.bib.
These steps are enumerated below in somewhat more detail for convenince,
see also the vignette
[Inserting_bibtex_references](https://cran.r-project.org/package=Rdpack]).


1. Add the following lines to  file `DESCRIPTION':
```
Imports: Rdpack
RdMacros: Rdpack
```
Make sure the capitalisation of RdMacros: is as shown. If the field
'RdMacros' is already present, add 'Rdpack' to the list on that line. Similarly
for field 'Imports'.

2. Add the following line to file `NAMESPACE':
```
importFrom(Rdpack,reprompt)
```
The equivalent line for 'roxygen2' is 
```
#' @importFrom Rdpack reprompt
```


3. Create file REFERENCES.bib in  subdirectory inst/ of your package
  and put the bibtex references in it.


#### Inserting the references

Once the steps outlined in the previous section are done, references can be
inserted in the documentation as 
```
\insertRef{key}{package}
```
where 'key' is the bibtex key of the reference and 'package' is your package.
This works in Rd files and in roxygen documentation chunks. 

Usually references are put in section 'references'. In n Rd file this might look
something like:
```
\references{
\insertRef{Rpack:bibtex}{Rdpack}

\insertRef{R}{bibtex}
}
```
The equivalent roxygen2 documentation chunk would be:
```
#' @references
#' \insertRef{Rpack:bibtex}{Rdpack}
#'
#' \insertRef{R}{bibtex}
```

The first line above inserts the reference labeled 'Rpack:bibtex' in Rdpack's
REFERENCES.bib. The second line inserts the reference labeled 'R' in file
REFERENCES.bib from package `bibtex'.

 
For further details see the vignette at
[Inserting_bibtex_references.pdf](https://cran.r-project.org/package=Rdpack),
or open it from R:
```
vignette("Inserting_bibtex_references", package = "Rdpack")
```


