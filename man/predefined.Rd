\name{predefined}
\alias{Rdo_predefined_sections}
\alias{Rdo_piece_types}
\alias{rdo_top_tags}
\title{
  Tables of predefined sections and types of pieces of Rd objects
}
\description{
  Tables of predefined sections and types of pieces of Rd objects.
}
\usage{
Rdo_predefined_sections

Rdo_piece_types

rdo_top_tags
}
\details{

  The Rd syntax defines several tables
  \insertCite{parseRd}{Rdpack}. \pkg{Rdpack} stores them in the
  variables described here.
  
  \code{Rdo_predefined_sections} is a named character vector of types of the
  top level sections of an Rd object. 

  \code{Rdo_piece_types} is a named character vector giving the types of
  the core (all possible?)  Rd macros.

  \strong{NOTE:} These objects are hard coded and need to be updated if
  the specifications of the Rd format are updated.

  todo: write functions that go through existing Rd documentation to
  discover missing or wrong items.
}
\value{
  
  for \code{Rdo_predefined_sections}, the name-value pairs are given in
  the following table. For example,
  \code{Rdo_predefined_sections["examples"]} is
  \Sexpr[stage=build,results=rd]{Rdo_predefined_sections["examples"]}.
  
  \Sexpr[stage=build,results=rd]{require(Rdpack);
    paste(
    "\\\\if{latex}{",
    "\\\\tabular{ll|lll}{",
          paste(names(Rdo_predefined_sections)[1:5], Rdo_predefined_sections[1:5],
          " ",
          names(Rdo_predefined_sections)[-(1:5)], Rdo_predefined_sections[-(1:5)],
          sep=" \\\\tab ", collapse="\\\\cr\n"),
          "}",
	  "}{",
    "\\\\tabular{lllll}{",
          paste(names(Rdo_predefined_sections)[1:5], Rdo_predefined_sections[1:5],
          " | ",
          names(Rdo_predefined_sections)[-(1:5)], Rdo_predefined_sections[-(1:5)],
          sep=" \\\\tab ", collapse="\\\\cr\n"),
          "}",

	  "}"

	  )}

  for \code{Rdo_piece_types}, the name-value pairs are:

  \Sexpr[stage=build,results=rd]{
    paste(
    "\\\\if{latex}{",
    "\\\\tabular{ll|ll|ll|ll|ll|ll}{",
     paste(names(Rdo_piece_types), "\\\\tab ", Rdo_piece_types, c(rep("\\\\tab ",2),"\\\\cr"),
           sep="", collapse="\n"),
           "}",
	   "}{",

    "\\\\tabular{llllllllllll}{",
    paste(names(Rdo_piece_types), "\\\\tab ", Rdo_piece_types,
                                              c(rep(paste("\\\\tab ", "|", sep=""),2),
					        "\\\\cr"),
      sep="", collapse="\n"),
           "}",


	   "}"

	)}

  for \code{rdo_top_tags}, the values are:

  \Sexpr[stage=build,results=rd]{
    paste("\\\\tabular{lllll}{",
    paste(sub("^[#]", "\\\\\\\\verb{#}", sub("^([\\\\])", "{\\\\\\\\\\\\1}", rdo_top_tags)),
          c(rep("\\\\tab ",4),"\\\\cr"),
          sep="", collapse="\n"),
          "}")}

  Note that most, but not all,  are prefixed with backaslash.
}
\references{
  \insertAllCited{}
}
\keyword{Rd}
