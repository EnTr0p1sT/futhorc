\LoadClass[10pt, a4paper, titlepage]{article}
\ProvidesClass{futhorc-article}

%%%%%Load the classes needed
\usepackage{lettrine}
\usepackage[top=20mm, bottom=36mm, left=26mm, right=26mm, marginparsep=3mm, marginparwidth=16.5mm]{geometry}
%\usepackage[top=26.8mm, bottom=48mm, left=35mm, right=35mm, marginparsep=3mm, marginparwidth=16.5mm]{geometry}
\usepackage{futhorc}


%Make footnote and endnote interchangeable (useful flag)
%\let\footnote=\endnote

%%%%%Create title page
\newcommand{\maketitlepage}{
\begin{titlepage}
%\AddToShipoutPicture*{\BackgroundPic{background}}
\newgeometry{left=4.5cm} %defines the geometry for the titlepage
\noindent
%\includegraphics[width=2cm]{logo.jpg}\\[-1em]
\vskip13\baselineskip
{\noindent \Huge\textsf{\textsc{\MakeLowercase{\@articletitle}}}}\\
\color{acccol}
\makebox[0pt][l]{\rule{1.3\textwidth}{1pt}}
\par
\noindent
\textbf{\textsf{\textsc{\MakeLowercase{\@subjectcode}}}}
\vfill
\noindent
{\Large \textsf{\@articleauthor}}
\vskip\baselineskip
\noindent
\textsf{\@articledate}
\end{titlepage}
\restoregeometry % restores the geometry
}


%\widowpenalty10000
%\clubpenalty10000

%%%%%Header and footer stuff
\newcommand{\headformat}[1]{\sffamily \scshape \color{acccol} \MakeLowercase{#1}}

\pagestyle{fancy}
\fancyhf{}
\rhead{\headformat{\@articletitle}}
\lhead{\headformat{\@articleauthor}}
\lfoot{\headformat{\@subjectcode}}
\rfoot{\headformat{page \thepage}}

\setlength{\columnsep}{6.5mm}
\setlength{\columnseprule}{0.0pt}

\renewcommand{\footnoterule}{%
  \kern -3pt
  \hrule width \textwidth height 0.2pt
  \kern 2.8 pt
}

\setlength{\headsep}{6.5mm}
\setlength{\skip\footins}{\headsep}
\setlength{\footskip}{1.3cm}
\renewcommand{\headrulewidth}{0.2pt}

%%%%%Bibliography stuff
\renewcommand{\refname}{references}

\renewcommand{\notesname}{notes}
\renewcommand{\enoteformat}{\noindent\theenmark.\ }
\DefineBibliographyStrings{english}{references = {references},}

%%%%%Variables for title page etc
\newcommand{\articletitle}[1]{\def \@articletitle {#1}}
\newcommand{\articleauthor}[1]{\def \@articleauthor {#1}}
\newcommand{\subjectcode}[1]{\def \@subjectcode {#1}}
\newcommand{\articledate}[1]{\def \@articledate {#1}}

\articletitle{}
\articleauthor{}
\articledate{}
\subjectcode{}

%Section formatting
%\makeatletter
%\renewcommand*{\@seccntformat}[1]{%
%{\raggedright \csname the#1 \endcsname}
%\parbox{\leftrightcol{\marginnote{\csname the#1\endcsname}}%
%{{\reversemarginpar\marginnote{\csname the#1\endcsname}}}}}
%}
%\makeatother


\newcommand{\formatsectionnumber}[1]{%
A
\centering \color{acccol}\nobreak \sffamily \scshape \itshape \Large \nobreak #1
}

\newcommand{\lapping}[1]{%
\leftrightcol{\rlap{#1\hskip\marginparsep}}{\llap{#1\hskip\marginparsep}}
}

\titleformat{\section}[block]{%
\centering \color{acccol}\nobreak \sffamily \scshape \itshape \Large \nobreak%
\leftrightcol{\marginnote{\thesection}}%
{\reversemarginpar\marginnote{\thesection}}%
}{}{0pt}{}


\titleformat{\subsection}{%
\centering \color{acccol} \sffamily \scshape \bfseries \large \nobreak%
\leftrightcol{\marginnote{\thesubsection}}%
{\reversemarginpar\marginnote{\thesubsection}}%
}{}{0pt}{}

\titleformat{name=\section,numberless}{%
\centering \color{acccol} \sffamily \scshape \itshape \Large 
}{}{0pt}{}
%
\titleformat{name=\subsection,numberless}{
\centering \color{acccol} \sffamily \scshape \bfseries \large
}{}{0pt}{}

%%%%%Equation numbering
%%%%%From leqno.clo originally
\makeatletter
\def\@eqnnum{%
\leftrightcol%
{\marginnote{\formatrightmarginnote{Eq \theequation}}}%
{\reversemarginpar\marginnote{\formatleftmarginnote{Eq \theequation}}}%$
}
\makeatother

\newcommand{\Sidenote}[1]{%
\flag{\RaggedRight \scriptsize{\textsf{\color{acccol}#1}}}
}
%\renewcommand{\flag}[1]{\marginnote{\parbox{\marginparwidth}{\formatrightmarginnote{#1}}}}
%\let\footnote=\flag

