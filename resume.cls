%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{report} % Font size and paper type

\usepackage[UTF8]{ctex}
\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
% COLOR DEFINITION
%----------------------------------------------------------------------------------------
% Not using blue anymore
\usepackage{xcolor}
\definecolor{blue}{rgb}{0.22,0.45,0.70}% light blue

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
    \@ifundefined{@addressthree}{
      \def \@addressthree {#1}
    }{
      \def \@addressone {#1}
    }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
\begingroup
\def \\ {\addressSep\ }
% #1
\vspace{-0.5em}
\centerline{#1}
\endgroup
\par
\addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
  \vspace{-1em}
  \hfil{\namesize\bf \@name}\hfil
  \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
% Use tabular for left/right format.
% \renewcommand{\document}{
%   \ori@document  % Begin document
%   \begin{tabular}{ll}
%    \multirow{3}{*}{\printname} & % Print the name specified with \name  
%   \@ifundefined{@addressone}{}{ % Print the first address if specified
%     \printaddress{\@addressone}} \\
%     & 
%   \@ifundefined{@addresstwo}{}{ % Print the second address if specified
%     \printaddress{\@addresstwo}} \\
%     & 
%   \@ifundefined{@addressthree}{}{ % Print the third address if specified
%     \printaddress{\@addressthree}}
%   \end{tabular}
% }
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
  \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  \vspace{-0.1em}
  \MakeUppercase{\bf #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{1em} % Margin within the section
    \itemsep -0.6em \vspace{-0.6em}
          }
    \item[]
          }{
  \end{list}
  \vspace{-0.5em}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
{\bf #1} \hfill {#2} % Bold company name and date on the right
\ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
\vspace{-0.2em}\\
{\em #3} \hfill {\em #4} % Italic job title and location
}
%\smallskip
\begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
  \itemsep -1em \vspace{-1.1em} % Compress items in list together for aesthetics
        }{
\end{list}
\vspace{-0.4em} % Some space after the list of bullet points
}

%----------------------------------------------------------------------------------------
% LIST FORMATTING
%----------------------------------------------------------------------------------------
\newenvironment{rItem}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
{\textbf{#1}} \hfill {#2} % Bold company name and date on the right
\ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
\vspace{-0.2em}\\
{#3} \hfill {\textit{#4}} % Italic job title and location
}
\vspace{-0.25em}\\
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\smallskip} % The space above the horizontal line for each section 
\def\nameskip{\bigskip} % The space after your name at the top
\def\sectionskip{\smallskip} % The space after the heading section
