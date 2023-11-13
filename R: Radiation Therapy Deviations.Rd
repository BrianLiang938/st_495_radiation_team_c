\name{DeviationsChart}
\alias{DeviationsChart}
\docType{data}
\title{ Radiation Therapy Deviations
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
The DeviationsChart dataset includes information about deviations and corrective actions in Radiation Therapy treatments from the ACC Cancer Center. The dataset was created and merged from multiple spreadsheets. 
}
\usage{DeviationsChart}
\format{
  A data frame with 247 observations on the following 18 variables:
  \describe{
    \item{\code{DEVID}}{A value representing each distinct deviation; Some deviations have multiple rows due to multiple corrective actions taken.}
    
    \item{\code{ATTRIBUTE_ID}}{The ID value for the Attribute of the deviation.}
    
    \item{\code{CATEGORY2_ID}}{The ID value for the Subcategory of the deviation.}
    
    \item{\code{CATEGORY1_ID}}{The ID value of the Category of the deviation.}
    
    \item{\code{ERROR_CODE}}{A sequence of numbers, representing "Category-Subcategory-Attribute".}
    
    \item{\code{DESCR_IF_MISC}}{A field for custom attributes to be described about the deviation.}
    
    \item{\code{DESCRIPTION}}{Free text descriving the details of the deviation.}
    
    \item{\code{AFFECTED_TREATMENT}}{Did the deviation affect the patient's treatment?}
    
    \item{\code{DEV_TYPE}}{Main type of deviation during the treatment.}
    
    \item{\code{Category_Desc}}{Description of the deviation's category.}
    
    \item{\code{Subcat_Desc}}{Description of the deviation's subcategory.}
    
    \item{\code{Attribute_Desc}}{Description of the deviation's attribute.}
    
    \item{\code{ACTION_ID}}{A value representing a corrective action taken as a result of the deviation.}
    
    \item{\code{DESCRIPTION_Custom}}{Free text describing more about the corrective actions taken.}
    
    \item{\code{ISSHORTTERM}}{Is the corrective action taken as a result of the deviation short-term or long-term? 0 = No, 1 = Yes.}

    \item{\code{CAT1}}{The first 5 number sequence of the ACTION_ID.}
    
    \item{\code{CAT2}}{The second 5 number sequence of the ACTION_ID.}
    
    \item{\code{DESCRIPTION_Formal}}{Preconfigured short-term and long-term corrective actions taken as a result of the deviation.}
  }
}
\keyword{datasets}
