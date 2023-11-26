% resume.cls

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved.  This file is offered as-is,
% without any warranty.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Note: I have modified this class to fit my own needs but I do want to give credit
% to the original creator. Trey Hunner's can be found here: https://github.com/treyhunner/resume

\ProvidesClass{resume}[8/12/2020 Resume class]
\LoadClassWithOptions{article}

%\RequirePackage{hyperref}               % added for adding external links
\RequirePackage{xcolor}                 % added for blue links
\RequirePackage[normalem]{ulem}         % added for underlining
\RequirePackage{anysize}
\RequirePackage[parfill]{parskip}       % Do not indent paragraphs
\RequirePackage{array}                  % required for boldface tabular columns
\RequirePackage{ifthen}                 % added for variable number of arguments in commands
\RequirePackage{enumitem}               % for more complicated list environments
\usepackage{tabularx}                   % for properly centering the header based on center column
\usepackage{fancyhdr}
\usepackage{scrextend}
\usepackage{multicol}
\usepackage[hidelinks]{hyperref}

%the document margins can be set here, but I prefer to do it in the document itself
%\usepackage[left=0.6in,top=0.6in,right=0.6in,bottom=0.6in]{geometry} % Document margins

\nofiles                                % .aux files are not needed for resumes
\pagestyle{empty}                       % resumes do not need page numbers

\def\sectionskip{\medskip}              %sets space between sections
\def\sectionlineskip{\smallskip}          %adds in vertical space around the divider lines
\def\indent{1.25em}                     %changes indent for all sections
\def\itemSeperation{-0.5em}             %changes the seperation between bullets
\def\headerSpace{-0.15in}               %changes how much space is between end of header and first section
\def\seperator{$\diamond$ }             %changes the seperator between items in the header







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% URL command for blue URLs
\newcommand\URL[2]{\href{#1}{\color{blue}\uline{#2}}}

\newcommand\header[6]{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HEADER
	\ifthenelse{\equal{#5}{}}{ %if a 5th argument is empty
		\begin{center}
			\MakeUppercase{\Huge\bf #1} \\ \medskip
			#2 \seperator #3 \seperator #4 
		\end{center}
		\vspace{\headerSpace} %tighten things up a bit
	}
	{ %else
		\begin{center}
			\MakeUppercase{\Huge\bf #1} \\ \medskip
			\newcolumntype{Y}{>{\raggedleft\arraybackslash}X} %allows centering to occur based on middle col
			\setlength\tabcolsep{1.5pt} %reduce the space between columns
			\begin{tabularx}{\linewidth}{YcX}
				#2 & \seperator & #3 \\
				#4 & \seperator & #5 \\          
			\end{tabularx}
			   #6
		\end{center}
		\vspace{\headerSpace} %tighten things up a bit
	}
}

\newenvironment{Section}[1]{
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% SECTIONS: Create section headings
	
	
	%\sectionskip
	\MakeUppercase{\bf #1}
	\sectionlineskip
	\hrule
	\begin{list}{}{\setlength{\leftmargin=\indent}}
		\item[] % sets the list environment to no symbol
	}{
	\end{list}
	%\sectionskip
}
\newenvironment{SubSection}[1]{
\MakeUppercase{\bf #1}
	%\sectionlineskip
	%\hrule
	\begin{list}{}{\setlength{\leftmargin=\indent}}
		\item[] % sets the list environment to no symbol
	}{
	\end{list}
	%\sectionskip
}

\newenvironment{Education}[5]{
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% Jobs
	
	%%%%%%%%%%%%%%%%%%%%%% Default Layout: %%%%%%%%%%%%%%%%%%%%%%%%
	%%    School (bold)                       Dates (regular)    %%
	%%    Degree (regular)                    GPA (regular)      %%
	%%    extra (regular)                                        %%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\hspace{-\indent} {\bf #1}                 \hfill     {#2}\\% date will appear at end of line
	{\em #3}                 \hfill     {\textbf{GPA:} #4}
	{#5}
} 

\newenvironment{Project}[3]{
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% Projects
	%%%%%%%%%%%%%%%%%%%%%% Default Layout: %%%%%%%%%%%%%%%%%%%%%%%%
	%%    Project Name (bold), link(regular)  Dates (regular)    %%
	%%    What (regular)                      Type(Italics)      %%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\hspace{-\indent} {\bf #1} {#2}           \hfill                          {#3}
	 \vspace{0em}
	
	%this whitespace is necessary
	
	}
	{
		\vspace{0em} %put a little space between this project and the next one
	}
	
	
	\newenvironment{ProjectNot}[3]{
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% Projects
	%%%%%%%%%%%%%%%%%%%%%% Default Layout: %%%%%%%%%%%%%%%%%%%%%%%%
	%%    Project Name (bold), link(regular)  Dates (regular)    %%
	%%    What (regular)                      Type(Italics)      %%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	 {#1} \hfill     {#2}    
	 
	 
	      
	%this whitespace is necessary
	
	
	
	}
	



\newenvironment{JobTwo}[2]{

  \hspace{-\indent} {\bf #1}                 \hfill     {#2}\\% date will appear at end of 
    \smallskip
}



\newenvironment{Job}[3]{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jobs

  %%%%%%%%%%%%%%%%%%%%%% Default Layout: %%%%%%%%%%%%%%%%%%%%%%%%
  %%    Employer (bold)                     Dates (regular)    %%
  %%    Title (emphasis)                                       %%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  \hspace{-\indent} {\bf #1}                 \hfill     {#2}\\% date will appear at end of line
  {\em #3}                 \hfill
  \smallskip
}

