\name{DeviationsChart}
\alias{DeviationsChart}
\docType{data}
\title{ Radiation Therapy Deviations
}
\description{
The DeviationsChart dataset includes information about deviations and corrective actions in Radiation Therapy treatments from the ACC Cancer Center. The dataset was created and merged from multiple spreadsheets to gather the variables. This data frame contains 247 observations and 25 variables.
}
\usage{DeviationsChart}
\format{
  This data frame consists of the following columns:
  \describe{
    \item{\code{DEVID}}{A value representing each distinct deviation; Some deviations have multiple rows due to multiple corrective actions taken.}
    
    \item{\code{ATTRIBUTE_ID}}{The ID value for the Attribute of the deviation.}
    
    \item{\code{CATEGORY2_ID}}{The ID value for the Subcategory of the deviation.}
    
    \item{\code{CATEGORY1_ID}}{The ID value of the Category of the deviation.}
    
    \item{\code{ERROR_CODE}}{A sequence of numbers, representing "Category-Subcategory-Attribute".}
    
    \item{\code{DESCR_IF_MISC}}{A field for custom attributes to be described about the deviation.}
    
    \item{\code{DESCRIPTION}}{Free text descriving the details of the deviation.}
    
    \item{\code{Date}}{The date of the deviation's occurance.}
    
    \item{\code{IDENTIFIED_BY}}{The username of the staff member who identified the deviation.}
    
    \item{\code{Role}}{The staff member's role in the organization.}
    
    \item{\code{AFFECTED_TREATMENT}}{Did the deviation affect the patient's treatment?}
    
    \item{\code{CORRECTED}}{Was the deviation corrected?}
    
    \item{\code{WHYNOTCORRECTED}}{If the deviation was not corrected, free-text response as to why.}
    
    \item{\code{Treatment_Intent}}{The intended treatment for the patient.}
    
    \item{\code{Treatment_Method}}{The type of treatment method being utilized for the patient.}
    
    \item{\code{DEV_TYPE}}{Main type of deviation during the treatment.}
    
    \item{\code{CATDESC}}{Description of the deviation's category.}
    
    \item{\code{SUBDESC}}{Description of the deviation's subcategory.}
    
    \item{\code{ATTRDESC}}{Description of the deviation's attribute.}
    
    \item{\code{ACTION_ID}}{A value representing a corrective action taken as a result of the deviation. Some deviations might not have had action taken on them: Therefore, this variable and the ones after will most likely be missing for that certain observation.}
    
    \item{\code{ACTIONDESC_CUST}}{Free text describing more about the corrective actions taken.}
    
    \item{\code{ISSHORTTERM}}{Is the corrective action taken as a result of the deviation short-term or long-term? 0 = No, 1 = Yes.}

    \item{\code{CAT1}}{The first 5 number sequence of the ACTION_ID.}
    
    \item{\code{CAT2}}{The second 5 number sequence of the ACTION_ID.}
    
    \item{\code{ACTIONDESC}}{Preconfigured short-term and long-term corrective actions taken as a result of the deviation.}
  }
}
\keyword{datasets}
