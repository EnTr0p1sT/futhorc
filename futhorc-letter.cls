\LoadClass[11pt, a4paper]{article} %yes, it will still be a letter
\ProvidesClass{futhorc-letter}

\usepackage{futhorc}
\usepackage[top=15mm, bottom=35mm, left=25mm, right=25mm]{geometry}

\thispagestyle{empty}

%Define commands for salutation, etc
\newcommand{\salutation}[1]{\def \intsalutation {#1}}
\newcommand{\valediction}[1]{\def \intvalediction {#1}}
\newcommand{\addressee}[1]{\def \intaddressee {#1}}
\newcommand{\deliveryaddress}[1]{\def \intdeliveryaddress {#1}}
\newcommand{\letterdate}[1]{\def \intdate {#1}}
\newcommand{\subjectline}[1]{\def \intsubjectline {#1}}
\newcommand{\signature}[1]{\def \intsignature {#1}}
\newfontfamily\letterheadfont[Numbers=OldStyle, UprightFeatures={SmallCapsFeatures={Letters=SmallCaps, LetterSpace=25}}, BoldFeatures={SmallCapsFeatures={Letters=SmallCaps, LetterSpace = 25}}, BoldFont={* Semibold}, ItalicFeatures={SmallCapsFeatures={Letters=SmallCaps, LetterSpace = 5}}, ItalicFont={* Bold}]{\sffontname}


%combine full name into a formatted single line
\makeatletter \newcommand{\nameline}{\MakeLowercase{\@firstname} \MakeLowercase{\@middlename} \textbf{\MakeLowercase{\@surname}}}
\makeatother

%render postcode small caps in unbreakable block
\newcommand{\postcode}{%
\mbox{\textsc{\MakeLowercase{\postcodeaddr}}}
}

%address line consisting of full address
\newcommand{\addressline}{%
\startsquarepar \houseaddr\  \townaddr\  \countyaddr, \postcode\stopsquarepar \startsquarepar \homephone\  \textsc{(h)} \workphone\  \textsc{(w)}  \mobilephone\ \textsc{(m)}\stopsquarepar \startsquarepar \persemail \  $\bullet$ \workemail\stopsquarepar}

%block formatted address with name on top

\newcommand{\addressblock}{%
\begin{center}
\begin{minipage}{8.5cm}
{\color{acccol} \startsquarepar {\letterheadfont {\textsc{\Large  \nameline}}}\stopsquarepar}
%\vspace{-0.7\baselineskip}
\begin{spacing}{0.8}
{\small \addressline}

\end{spacing}
\end{minipage}
\end{center}
}


%make the top part of the letter
\newcommand{\letterstart}{%
\begin{minipage}[t][4cm][t]{\textwidth}
\addressblock
\end{minipage}
\begin{minipage}[t][39mm][t]{0.5\textwidth}
\textsc{\MakeLowercase{\intaddressee}}\\
\intdeliveryaddress
\end{minipage}
%\begin{minipage}[t][39mm][t]{0.5\textwidth}
\begin{flushright} \intdate \end{flushright}
%\end{minipage}\par
\noindent \intsalutation

\vspace{0.5\baselineskip}
\noindent {\textsf{\textsc{\MakeLowercase{\intsubjectline}}}}
\vspace{0.5\baselineskip}

\ignorespaces\noindent\ignorespaces
}
%make the bottom part of the letter
\newcommand{\letterend}{%

\vspace{0.5\baselineskip}
\hspace{8cm}\begin{minipage}{6cm}
\noindent \intvalediction

\vspace{4\baselineskip}

\noindent \intsignature
\end{minipage}
}

\newenvironment{letter}{\letterstart \noindent}{\letterend}
