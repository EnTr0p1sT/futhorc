\LoadClass[12pt, a4paper, titlepage]{article}
\ProvidesClass{futhorc-manual}

%%%%%Load the classes needed
\usepackage{lettrine}
\usepackage[top=30mm, bottom=47mm, left=35mm, right=43mm, marginparsep=5mm, marginparwidth=24mm]{geometry}
\usepackage{futhorc}
\usepackage{sidenotes}
\usepackage{hyperref}
\usepackage{xparse}
%\usepackage[style=authortitle-ibid]{biblatex}
%Make footnote and endnote interchangeable (useful flag)
%\let\footnote=\Sidenote
%\renewcommand{\mkbibemph}[1]{\textsl{#1}}
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
\textbf{\textsf{\textit{\MakeLowercase{\@subjectcode}}}}
\vfill
\noindent
{\Large \textsf{\@articleauthor}}
\vskip\baselineskip
\noindent
\textsf{\@articledate}
\end{titlepage}
\restoregeometry % restores the geometry
}


%%%%%Header and footer stuff
\newcommand{\headformat}[1]{\sffamily \scshape \color{acccol} \MakeLowercase{#1}}

\pagestyle{fancy}
\fancyhf{}
\rhead{\headformat{\@articletitle}}
\lhead{\headformat{\@articleauthor}}
\lfoot{\headformat{\@subjectcode}}
\rfoot{\headformat{page \thepage}}
\setlength{\headwidth}{132mm}

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

%%%%%Sidenotes
\newcounter{sidenotecounter}
\setcounter{sidenotecounter}{0}
\renewcommand{\thesidenotecounter}{\arabic{sidenotecounter}}
\renewcommand{\sidenote}[1]{%
\refstepcounter{sidenotecounter}\ignorespaces
\mbox{\textsuperscript{\thesidenotecounter}}
\normalmarginpar\marginpar{\parbox{\marginparwidth}{\formatrightmarginnote{{\color{acccol} \scriptsize \textsf{\thesidenotecounter. #1}}}}}
}
\newcommand{\Sidenote}[1]{%
\flag{\RaggedRight \scriptsize{\textsf{\color{acccol}#1}}}
}
\renewcommand{\flag}[1]{\marginnote{\parbox{\marginparwidth}{\formatrightmarginnote{#1}}}}
%\let\footnote=\endnote
\hypersetup{ %Make all links blue
    colorlinks,
    citecolor=acccol,
    filecolor=acccol,
    linkcolor=acccol,
    urlcolor=acccol
}
\let\footnote=\sidenote
%%%%%Equation numbering
%%%%%From leqno.clo originally
\makeatletter
\def\@eqnnum{%
\leftrightcol%
{\marginnote{\formatrightmarginnote{Eq \theequation}}}%
{\reversemarginpar\marginnote{\formatleftmarginnote{Eq \theequation}}\normalmarginpar}%$
}
\makeatother
%---------------------------PARAGRAPHS
%normal
\makeatletter
\newcounter{parnum}
\newcounter{subparnum}
\newcommand{\@paralevel}{high}
\newcounter{sectioner}
\setcounter{sectioner}{0}



\newcommand{\@setparalevel}[3]{% Syntax: \@setparalevel{higher}{current}{paracounter}
% paralevel: \@paralevel ; measured against: #1
% sectioner: \arabic{sectioner}
% \ifthenelse{\equal{\value{sectioner}}{0}} 
\ifthenelse{\equal{\@paralevel}{#1}}
  {\setcounter{#3}{0}}{}
 \renewcommand{\@paralevel}{#2}
 \refstepcounter{#3}
}

\newcommand{\@subparplace}[1]{%
 \makebox[\parindent][l]{#1}}

\newcommand{\@parplace}[1]{%
\reversemarginpar\marginnote{{\color{acccol}\itshape #1}}\normalmarginpar\ignorespaces
}

\newcommand{\@formattednumber}{}
\newcommand{\@constructparstart}[1]{%Syntax: \@constructparstart{\@paralevel}
\ifthenelse{\equal{#1}{par}}{%
 \renewcommand{\@formattednumber}{\alph{parnum}.}
 \noindent
 \@parplace{\@formattednumber}}{%
 \ifthenelse{\equal{#1}{subpar}}{%
  \renewcommand{\@formattednumber}{\roman{subparnum}.}
  \hangindent=10mm
  \@subparplace{\@formattednumber}}{%
}}}

\newcommand{\@formattedsidehead}[1]{%
\ifthenelse{\equal{#1}{}}{}{{\color{acccol}\textit{#1}.}  }}

\usepackage{xparse}
%\makeatletter
\newcommand{\@sidehead}{}
\newcommand{\@parlabel}{}
\newcommand{\@toclabel}{}
\DeclareDocumentCommand\@parseparacall{o o o m m m}{%Sidehead; label; toc; higher; level; counter
 %\def\@tempparhead{#1} \ifx\@tempparhead\@empty \
 \ifthenelse{\equal{\arabic{sectioner}}{0}}{%Check if the preceding lump was a section heading
  \ifthenelse{\equal{#5}{par}}{%paragraph level, so space more
   \vskip 2ex}{\vskip 1ex}%subpara, so space less
 }{\renewcommand{\@paralevel}{high}}
 \setcounter{sectioner}{0}
 \renewcommand{\@parlabel}{}
 \renewcommand{\@toclabel}{}
 \@setparalevel{#4}{#5}{#6}
 \IfNoValueTF{#1}{%Sidehead not specified
  \renewcommand{\@sidehead}{}%
 }{%Else it is specified, or empty so:
  \ifthenelse{\equal{#1}{}}{}{%@sidehead label not empty
  \renewcommand{\@sidehead}{\@formattedsidehead{#1}}
  \renewcommand{\@parlabel}{#1}
  \renewcommand{\@toclabel}{#1}}}
 \IfNoValueF{#2}{%Label specified
  \renewcommand{\@parlabel}{#2}
  \renewcommand{\@toclabel}{#2}}
 \IfNoValueF{#3}{%TOC entry specified
  \renewcommand{\@toclabel}{#3}}
 \IfNoValueF{\@parlabel}{%Parlabel specified somehow
  \ifthenelse{\equal{\@parlabel}{}}{}{%If parlabel not empty 
   \label{par:\@parlabel}}}%Else dont add it
 \IfNoValueT{\@toclabel}{\renewcommand{\@toclabel}{}}%If toclabel somehow not defined, make it empty
 \ifthenelse{\equal{\@toclabel}{}}{}{%If toclabel not empty
 \ifthenelse{\equal{#5}{par}}{% Par level, add to TOC
  \addcontentsline{toc}{paragraph}{\@toclabel}}
  {\ifthenelse{\equal{#5}{subpar}}{% Else subpar level, add to TOC
   \addcontentsline{toc}{subparagraph}{\@toclabel}}
  }{}}
 
 \@constructparstart{\@paralevel}{\@sidehead}}


\DeclareDocumentCommand{\px}{s o o o}{%
 \IfBooleanTF{#1}
 {\hangindent=0mm \noindent}
 {\@parseparacall[#2][#3][#4]{high}{par}{parnum}}\ignorespaces}

\DeclareDocumentCommand{\spx}{s o o o}{%
 \IfBooleanTF{#1}
 {\hangindent=1cm}
 {\@parseparacall[#2][#3][#4]{par}{subpar}{subparnum}}\ignorespaces}

\DeclareDocumentCommand{\sspx}{s o o o}{%
 \IfBooleanTF{#1}
 {\hangindent=2cm}
 {\@parseparacall[#2][#3][#4]{subpar}{subsubpar}{subsubparnum}}\ignorespaces}

\DeclareDocumentCommand{\ssspx}{s o o o}{%
 \IfBooleanTF{#1}
 {\hangindent=3cm}
 {\@parseparacall[#2][#3][#4]{subsubpar}{subsubsubpar}{subsubsubparnum}}\ignorespaces}

%\newcounter{@levelsec}
%\setcounter{@levelsec}{0}
%\newcommand{\checksec}{%
%\ifthenelse{\equal{@levelsec}{1}}{\thesection\alph{parnum}}%
%{\thesubsection\alph{parnum}}
%}
%\renewcommand{\theparnum}{\checksec}

\renewcommand{\theparnum}{\thesubsection\alph{parnum}}



\newcommand{\setpar}{\renewcommand{\thispara}{high}}
\renewcommand{\thesubparnum}{\theparnum\ \roman{subparnum}}
%\let\flag=\empty
\makeatother
\linespread{1.1}

%%%%%%%%%%%%Section formatting
\makeatletter


\titleformat{\section}[block]{%
\color{acccol}\nobreak \sffamily \scshape \bfseries \Large \nobreak%
\leftrightcol{\marginnote{\thesection}}%
{\reversemarginpar\marginnote{\thesection}\normalmarginpar}%
}{}{0pt}{\renewcommand{\@paralevel}{high}\stepcounter{sectioner}\MakeLowercase}

\titleformat{\subsection}{%
\color{acccol} \sffamily \scshape \large \nobreak%
\leftrightcol{\marginnote{\thesubsection}}%
{\reversemarginpar\marginnote{\thesubsection}\normalmarginpar}%
}{}{0pt}{\renewcommand{\@paralevel}{high}\stepcounter{sectioner}\MakeLowercase}

\titleformat{name=\section,numberless}{%
\centering \color{acccol} \sffamily \scshape \bfseries \Large 
}{}{0pt}{\stepcounter{sectioner}\MakeLowercase}
%
\titleformat{name=\subsection,numberless}{
\color{acccol} \sffamily \scshape \large
}{}{0pt}{\stepcounter{sectioner}\MakeLowercase}



\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%
%For source code listings
\usepackage{perchta}
\definecolor{darkgreen}{rgb}{0, 0.4, 0}
\definecolor{codeback}{RGB}{232, 255, 232}
\lstset{%
 backgroundcolor=\color{codeback},
 numbersep = 0.5cm,
 numbers=left,
 breaklines=true,
 basicstyle=\ttfamily\scriptsize\color{black},
 numberstyle=\scriptsize\color{acccol},
 morekeywords={\{, \}, \[, \]}
}

