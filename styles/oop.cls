\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oop}[2006/01/01 v1.0
    Objektorienteeritud programmeerimise ülesannete kogu]

%%% Klassi parameetrid ja põhjad

\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{final}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{a5paper}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{b5paper}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{letterpaper}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{legalpaper}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{executivepaper}{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[twoside,a4paper,10pt,draft]{article}

% Muud põhjad
\RequirePackage{amsmath,url}

% estonian.ldf-i vigade parandused

\AtBeginDocument{%
  \ifx\f@encoding\bbl@t@one
    \def\tildelow{}%
  \fi
  \addto\captionsestonian{%
    \def\proofname{T\~oestus}%
    \def\indexname{Aineregister}%
  }
}

%%% Trükikiri ja kirja suurus
\usepackage{charter}
\IfFileExists{luximono.sty}
    {\usepackage[scaled=0.9118]{luximono}}{}
\linespread{1.07}

% lõigu kujunduse parameetrid

\tolerance 500
\clubpenalty 300
\widowpenalty 300

%%% Tekstilehe üldkujundus

% Standardse raamatulehekülje mõõdud on 139mm x 197 mm

\setlength\textwidth{355pt}
\setlength\textheight{575pt}

\setlength\topmargin{17pt}
\setlength\headheight{15pt}
\setlength\headsep{25pt}
\setlength\footskip{30pt}
\setlength\oddsidemargin{0pt}
\setlength\evensidemargin{0pt}
\setlength\marginparwidth{35mm}

\setlength\hoffset{\paperwidth}
\addtolength\hoffset{-\textwidth}
\setlength\hoffset{0.5\hoffset}
\addtolength\hoffset{-1in}
\setlength\voffset{\paperheight}
\addtolength\voffset{-\topmargin}
\addtolength\voffset{-\headheight}
\addtolength\voffset{-\headsep}
\addtolength\voffset{-\textheight}
\addtolength\voffset{-\footskip}
\setlength\voffset{0.5\voffset}
\addtolength\voffset{-1in}

\AtBeginDocument{\special{papersize=\the\paperwidth,\the\paperheight}}

% Lehekülje päis

\def\ps@uleval{%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@oddhead{%
    \hbox to\textwidth{\vbox{\hbox to\textwidth{%
      \hfill\footnotesize{\leftmark\strut}\hfill
            \makebox[0pt][r]{\footnotesize\thepage}\strut}%
      \hrule height 0.4pt width\textwidth \vskip-0.4pt
    }}\hss}
  \def\@evenhead{%
    \hbox to\textwidth{\vbox{\hbox to\textwidth{%
      \makebox[0pt][l]{\footnotesize\thepage}\hfill
      \footnotesize{\leftmark\strut}\hfill\strut}%
      \hrule height 0.4pt width\textwidth \vskip-0.4pt
    }}\hss}
  \let\@mkboth\markboth
  \def\sectionmark##1{\markboth{\MakeUppercase{\thesection. ##1}}{}}
  \def\subsectionmark##1{}}
\pagestyle{uleval}

\raggedbottom

%%% Liigendusüksuste päised

% Jaotis

\renewcommand\section{%
  \clearpage
  \thispagestyle{empty}%
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@section\@ssection}
\def\@section[#1]#2{%
  \ifnum \c@secnumdepth >\z@
    \refstepcounter{section}%
    \addcontentsline{toc}{section}%
        {\protect\numberline{\thesection}#1}%
  \else
    \addcontentsline{toc}{section}{#1}%
  \fi
  \sectionmark{#1}%
  \@makesectionhead{#2}%
  \@afterheading
}
\def\@makesectionhead#1{%
  {\parindent \z@ \normalfont
    \interlinepenalty\@M
    \centering\Large\bfseries\thesection.~#1\par
    \vskip 2.3ex
}}
\def\@ssection#1{%
  \sectionmark{#1}%
  \@makessectionhead{#1}%
  \@afterheading
}
\def\@makessectionhead#1{%
  {\parindent \z@ \normalfont
    \centering\Large\bfseries#1\par
    \vskip 2.3ex
}}

% Lisa

\renewcommand\appendix{\par
  \setcounter{section}{0}%
  \gdef\thesection{\@alph\c@section}}

% Jaotiste numbrid

\def\@seccntformat#1{\csname the#1\endcsname\ }
\setcounter{secnumdepth}{3}
\renewcommand{\thesubsection}{\@Roman\c@subsection}
\renewcommand{\thesubsubsection}{\@alph\c@subsubsection)}
\@addtoreset{subsubsection}{section}

%%% Valemid

%%% Loetelud

\setlength\leftmargini{15pt}

\def\@listi{\leftmargin\leftmargini
            \parsep 4.5pt plus 1pt minus 1pt
            \topsep 4.5pt plus 1pt minus 1pt
            \itemsep 0pt}
\let\@listI\@listi
\@listi

\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus0.5\p@ \@minus0.5\p@
              \partopsep 0.5\p@   \@plus0.5\p@   \@minus0.5\p@
              \parsep    1\p@   \@plus0.5\p@
              \itemsep   \parsep}

\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    1\p@ \@plus0.5\p@\@minus0.5\p@
              \partopsep 0.5\p@ \@plus\z@ \@minus0.5\p@
              \parsep    \z@
              \itemsep   \topsep}

\renewcommand\labelenumi{\theenumi)}
\renewcommand\labelenumii{\theenumii)}
\renewcommand\labelenumiii{\theenumiii)}
\renewcommand\labelenumiv{\theenumiv)}
\renewcommand\p@enumiii{\theenumi\theenumii--}
\renewcommand\labelitemii{$\circ$}
\renewcommand\labelitemiii{\textperiodcentered}
\renewcommand\labelitemiv{$\star$}

%%% Tekstikomponendid

% Teemade nimekiri

\newenvironment{teemad}
    {\noindent\textbf{Teemad.}\itshape}
    {\bigskip}

% Üliõpilase tulemused

\newenvironment{yliopilane}
    {\noindent\textbf{Pärast selle praktikumi läbimist oskab üliõpilane}%
        \begin{list}{\textbullet}{%
            \leftmargin\leftmargini
            \parsep\parskip
            \itemsep0pt}}
    {\end{list}\rule{\textwidth}{0.4pt}}

% Prog

\RequirePackage{fancyvrb}
\CustomVerbatimEnvironment{prog}{Verbatim}
    {xleftmargin=22pt}
\AtBeginDocument{\DefineShortVerb{\#}}

% Ülesanne

\RequirePackage{graphicx,color,calc}
\newcounter{ylesanne}
\newsavebox{\raam}
\newenvironment{ylesanne}
  {\addtolength\topsep{4pt}\setlength\fboxsep{3.5mm}%
    \trivlist\item\mbox{}%
      \begin{lrbox}{\raam}
        \begin{minipage}{\textwidth-2\fboxsep}
          \setlength\parindent{15pt}\refstepcounter{ylesanne}%
          \subsubsection*{Ülesanne~\theylesanne}}
  {\end{minipage}\end{lrbox}%
    \colorbox[gray]{0.92}{\usebox{\raam}}%
    \endtrivlist}

\newcommand{\ylpoolita}{%
  \end{minipage}\end{lrbox}%
    \colorbox[gray]{0.92}{\usebox{\raam}}%
    \endtrivlist
  \newpage
  \trivlist\item\mbox{}%
    \begin{lrbox}{\raam}
      \begin{minipage}{\textwidth-2\fboxsep}%
        \setlength\parindent{15pt}\noindent}

% Objektide nummerdamine

\@addtoreset{equation}{section}
\@addtoreset{footnote}{section}
\@addtoreset{ylesanne}{section}

%%% Joonised ja tabelid

\setlength\abovecaptionskip{5\p@}

%%% Sisukord

\renewcommand\tableofcontents{%
    {\centering\Large\bfseries\contentsname\par}
    \vskip 5ex
    \@starttoc{toc}%
    }
\setcounter{tocdepth}{1}
\def\numberline#1{\hb@xt@\@tempdima{\hfil#1. }}
\renewcommand\@pnumwidth{1.85em}
\renewcommand*\l@section{\@dottedtocline{1}{0.4em}{1.7em}}

%%% Aineregister
