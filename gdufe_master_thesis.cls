% !Mode:: "TeX:UTF-8"

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gdufe_master_thesis}[2025/05/17 Master Thesis template for GDUFE v0.1.0]
\LoadClass[zihao=-4,a4paper,oneside]{ctexbook}
\setmainfont{Times New Roman}
% \setCJKmainfont{SimSun}
% \setCJKmainfont{SimSun}[BoldFont = SimHei,,ItalicFont=KaiTi]
\setCJKmainfont{SimSun}[AutoFakeBold={3.17},ItalicFont=KaiTi]
% \setCJKsansfont{SimHei}%对应sf无衬线
% \setCJKmonofont{FangSong}%对应tt打字机

% ---------声明变量-------------
\tl_new:N g__whu_thesis_class_tl

% ---------键值对设置-------------
\RequirePackage{xkeyval}
\keys_define:nn{gdufe_master_thesis}{
    class .choice:,
    class .value_required:n = true,
    class .choices:nn =
      { academic, professional }
      { \tl_gset_eq:NN \g__whu_thesis_class_tl \l_keys_choice_tl },
    class .initial:n = academic
}

%--------biblatex 与cite upcite bibliographystyle二选一-------------
\RequirePackage[style=gb7714-2015,backend=biber]{biblatex}

%%%%%%--------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\newif\ifprint\printfalse
\DeclareOption{forprint}{\printtrue}
\ProcessOptions


\setlength{\baselineskip}{20pt}
%------------------------ Page layout ----------------------------------
\RequirePackage{zhlineskip}
\RequirePackage{fancyhdr}
\RequirePackage[colorlinks,linkcolor=red,anchorcolor=blue,citecolor=green]{hyperref}
\RequirePackage{tikz}
\RequirePackage{setspace}
\RequirePackage{booktabs}
\hypersetup{pdfencoding=auto}  %%% 邓东升修改
\ifprint
    \hypersetup{hidelinks}
\else
    \hypersetup{citecolor=magenta,linkcolor=blue}
\fi
\RequirePackage[top=2.54truecm,bottom=2.54truecm,left=3truecm,right=2.2truecm,headheight=1.5truecm,footskip=1.75cm,includefoot,xetex]{geometry}    % 页面设置%


% \newtoks\Cmajor          %学科专业中文名
% \newtoks\Csupervisor     %指导教师中文名
% \newtoks\Cschoolname      %学院中文名
% \newtoks\EnterDate      %论文提交时间
% \newtoks\Classname      %班级名称
% \newtoks\StudentNumber  %学号
% \newtoks\Engtitle       %英文标题
% \newtoks\SubmitDate     %论文提交时间
% \newtoks\DefenseDate    %论文答辩时间
% \newtoks\SignDate       %签字日期
% \newcommand{\Ctitle}{\@title}

% \newcommand{\Cname}{\@author}

\fancypagestyle{master-mainmatter}
{
    \fancyhead{}                                    % clear all header fields
    \fancyhead[L]{\zihao{5}广东财经大学学术学位硕士论文}
    \fancyhead[R]{\zihao{5}\@title}

    \renewcommand{\headrulewidth}{0.3pt}
    \fancyfoot{}                                    % clear all footer fields
    \fancyfoot[C]{\thepage}
}

\fancypagestyle{master-frontandbackmatter}{
    \fancyhead{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot{}
    \fancyfoot[C]{\thepage}
}

\def\maketitle{\null\pagestyle{empty}\leavevmode }
%%=====封面=====================
% \def\maketitle{%
% \thispagestyle{empty}%
% \newgeometry{top=3.7truecm,bottom=3.5truecm,left=2.8truecm,right=2.6truecm}
% {\noindent \fangsong \zihao{-4} \textbf{%
% 分类号： UDC\\[0pt]
% 密\quad 级：\\[0pt]
% 编\quad 号：}
% }

%   \vspace*{0.3cm}
%   \begin{center} \leavevmode
%     {%
% \begin{minipage}{0.71\textwidth}
%   \centering
% \includegraphics[width=\textwidth]{gdufelogo.jpg}
% \end{minipage}
% }

%     % \par
%     % \vspace*{1.1cm} %插入空白
%     \rule{0.9\textwidth}{1pt}
%     \vskip 12pt
%     % {\bfseries \zihao{1} \makebox[5cm][s]{学术学位硕士论文}}\\
%     {\heiti \fontsize{48pt}{\baselinestretch} {学术学位硕士论文}}\\
%     \vspace{60pt}
%     {\heiti \zihao{-2} \@title}\\
%     {\heiti \zihao{-2} \the\Engtitle \par}
%    \vspace*{2em}
%      \vfill\vfill\vfill


%  {\fangsong\zihao{4}
%  \renewcommand{\arraystretch}{1.5}
%     \begin{tabular}{ll}
%     %\hline
%       \makebox[3.25cm][s]{专\hfill 业\hfill 名\hfill 称} & { {}\underline{\makebox[5.75cm][c]{\the\Cmajor}}}\hfill{}\\%\hline
%       \makebox[3.25cm][s]{学\hfill 位\hfill 申\hfill 请\hfill 人} & { {}\underline{\makebox[5.75cm][c]{\@author}}}\hfill{} \\%\hline
%       \makebox[3.25cm][s]{导\hfill 师\hfill 姓\hfill 名\hfill 及\hfill 职\hfill 称} & { {}\underline{\makebox[5.75cm][c]{\the\Csupervisor}}}\hfill{}  \\%\hline
%       \makebox[3.25cm][s]{学\hfill 号} & { {}\underline{\makebox[5.75cm][c]{\the\StudentNumber}}}\hfill{}  \\%\hline
%       \makebox[3.25cm][s]{入\hfill 学\hfill 时\hfill 间} & { {}\underline{\makebox[5.75cm][c]{\the\EnterDate}}}\hfill{}  \\%\hline
%      \end{tabular}
%     }
%   \vskip 1.5cm
% {
%   \fangsong\zihao{3} \bfseries ~~~~~年~~~~~月~~~~~日
% }
%   \vskip 1em
% % \begin{tikzpicture}
% %   \draw[draw=black!70,fill=black!70](0,0)rectangle node[below=1pt]{\zihao{-4}\textcolor[rgb]{0.3,0.3,0.3}{广东财经大学教务处 \ \ 制}}(\textwidth,4pt);
% % \end{tikzpicture}
% \end{center}

% %%========扉页========================%%
% \newpage
% \thispagestyle{empty}
% \vspace*{0.75cm}
% \begin{center}
%   {\songti \zihao{0} 学术学位硕士论文}
% \vskip 2.5cm
% {\heiti \zihao{-2} \@title \par \the\Engtitle}
% \vskip 2.1cm
% {\heiti\zihao{4}
%  \renewcommand{\arraystretch}{1.5}
%     \begin{tabular}{ll}
%     %\hline
%       \makebox[3.25cm][s]{专\hfill 业\hfill 名\hfill 称} & { {}\underline{\makebox[5.75cm][c]{\the\Cmajor}}}\hfill{}\\%\hline
%       \makebox[3.25cm][s]{学\hfill 位\hfill 申\hfill 请\hfill 人} & { {}\underline{\makebox[5.75cm][c]{\@author}}}\hfill{} \\%\hline
%       \makebox[3.25cm][s]{指导教师} & { {}\underline{\makebox[5.75cm][c]{\the\Csupervisor}}}\hfill{}  \\%\hline
%       \makebox[3.25cm][s]{学\hfill 号} & { {}\underline{\makebox[5.75cm][c]{\the\StudentNumber}}}\hfill{}  \\%\hline
%       \makebox[3.25cm][s]{入\hfill 学\hfill 时\hfill 间} & { {}\underline{\makebox[5.75cm][c]{\the\EnterDate}}}\hfill{}  \\%\hline
%      \end{tabular}
%      \vskip 2em
%      \begin{tabular}{lr}
%       %\hline
%         \makebox[4.25cm][s]{论文提交时间}&{ {}\makebox[4.75cm][r]{\the\SubmitDate}}\hfill{}\\%\hline
%         \makebox[4.25cm][s]{论文答辩时间}&{ {}\makebox[4.75cm][r]{\the\DefenseDate}}\hfill{} \\%\hline
%       \end{tabular}
%       \vskip 1em
%       \begin{tabular}{lr}
%           \makebox[4.25cm][s]{答辩委员会主席}&{ {}\underline{\makebox[4.75cm][s]{}}}\hfill{}\\%\hline
%           \makebox[4.25cm][s]{答辩委员会委员}&{ {}\underline{\makebox[4.75cm][s]{}}}\hfill{} \\%\hline
%           \makebox[4.25cm][s]{ }&{ {}\underline{\makebox[4.75cm][s]{}}}\hfill{} \\%\hline
%         \end{tabular}
%     }
% \end{center}

% %%=====原创性声明========================%%
% \newpage
% \thispagestyle{empty}
% \begin{center}
%   \vspace*{0.8cm}
%   {\heiti \zihao{3} \bfseries 广东财经大学学位论文原创性声明}
% \end{center}
% \vskip 0.72cm

% \begin{spacing}{2.0}
% \fangsong \zihao{4}
% 本人郑重声明：所呈交的学位论文是本人在导师的指导下独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。因本学位论文引起的法律后果完全由本人承担。
% \newline
% \begin{tabular}{rr}
%   \makebox[11cm][r]{学位论文作者签名:}&{ {}{\makebox[3.75cm][s]{ }}}\hfill{}\\%\hline
%   \makebox[11cm][r]{签字日期:}&{ {}{\makebox[3.75cm][l]{\the\SignDate}}}\hfill{} \\%\hline
% \end{tabular}
% \end{spacing}
% \vskip 1em
% \begin{spacing}{1.5}
% \begin{center}
%   {\heiti \bfseries \zihao{3} 广东财经大学学位论文版权使用授权书}
% \end{center}

% \fangsong \zihao{4}
% 本学位论文作者完全了解广东财经大学有关保留、使用学位论文的规定，有权保留并向国家有关部门或机构送交论文的纸质版和电子版，允许论文被查阅和借阅。本人授权广东财经大学可以将学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。

% （保密的学位论文在解密后适用本授权书）
% \end{spacing}
% \vspace*{1em}
% {\fangsong \zihao{4} \noindent
% \makebox[9.5cm][l]{学位论文作者签名：} \makebox[5truecm][l]{导师签名：}\\
% \makebox[9.5cm][l]{签字日期：\the\SignDate} \makebox[5truecm][l]{签字日期：\the\SignDate}
% }
% \restoregeometry
% }

%------------------------ Abstract & Keywords -------------------------
% 格式在摘要页调整
\newcommand\cnkeywords[1]{ {\heiti\zihao{-4}\cnkeywordsname: }#1}
\newcommand\cnkeywordsname{关键词}
\newcommand\enkeywords[1]{ {\noindent\bfseries\zihao{-4}\enkeywordsname: }#1}
\newcommand\enkeywordsname{Key Words}

% \newenvironment{cnabstract}{
%   \chapter[摘要]{\heiti \ziju{1}{摘要}}
%   }  %%%终于解决了书签乱码的问题 2005-04-12.huangzh
%    {\songti\zihao{-4}
%     \@afterheading}
%     {\par}
% \newenvironment{enabstract}{
%     \chapter[ABSTRACT]{\bfseries \centering ABSTRACT}}
%     {\noindent \zihao{-4}
%     \@afterheading
%     }{\par}

%%------------------------常用宏包-----------------------------------

\RequirePackage{amsmath,amssymb}
\RequirePackage[amsmath,thmmarks]{ntheorem}% AMSLaTeX宏包.
\RequirePackage{graphicx}                 % 图形
\RequirePackage{color,xcolor}             %支持彩色
%\RequirePackage{mathrsfs}   % 不同于\mathcal or \mathfrak 之类的英文花体字体
\RequirePackage{url}
\RequirePackage{enumerate}
%%----------------------- Theorems -----------------------------------
\theoremstyle{plain}
\theoremheaderfont{\heiti}
\theorembodyfont{\songti} \theoremindent 0em
\theorempreskip{0pt}
\theorempostskip{0pt}
\theoremnumbering{arabic}
%\theoremsymbol{} %定理结束时自动添加的标志
\newtheorem{theo}{\hspace{2em}定理}[section]
\newtheorem{defi}{\hspace{2em}定义}[section]
\newtheorem{lemm}{\hspace{2em}引理}[section]
\newtheorem{coro}{\hspace{2em}推论}[section]
\newtheorem{prop}{\hspace{2em}性质}[section]
\newtheorem{exam}{\hspace{2em}例}[section]
\newtheorem{rema}{\hspace{2em}注}[section]

\theoremstyle{nonumberplain}
\theoremheaderfont{\heiti}
\theorembodyfont{\normalfont \rm \songti}
\theoremindent0em \theoremseparator{\hspace{1em}}
\theoremsymbol{$\square$}
\newenvironment{proof}{{\heiti 证明：}}{\hfill $\square$\par}
\newenvironment{solu}{{\heiti 解:}}{\hfill $\square$\par}


%%%%%%%-------------------------------------------------
%%%===  suppress extra inter-line spacing in \list environments
\makeatletter \setlength\partopsep{0pt}
\def\@listI{\leftmargin\leftmargini
    \parsep 0pt
    \topsep \parsep
    \itemsep \parsep}
\@listI
\def\@listii {\leftmargin\leftmarginii
    \labelwidth\leftmarginii
    \advance\labelwidth-\labelsep
    \parsep    \z@ \@plus\z@  \@minus\z@
    \topsep    \parsep
    \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
    \labelwidth\leftmarginiii
    \advance\labelwidth-\labelsep
    \parsep    \z@ \@plus\z@  \@minus\z@
    \topsep    \parsep
    \itemsep   \parsep}
\def\@listiv{\leftmargin\leftmarginiv
    \labelwidth\leftmarginiv
    \advance\labelwidth-\labelsep
    \parsep    \z@ \@plus\z@  \@minus\z@
    \topsep    \parsep
    \itemsep   \parsep}
\def\@listv{\leftmargin\leftmarginv
    \labelwidth\leftmarginv
    \advance\labelwidth-\labelsep
    \parsep    \z@ \@plus\z@  \@minus\z@
    \topsep    \parsep
    \itemsep   \parsep}
\def\@listvi{\leftmargin\leftmarginvi
    \labelwidth\leftmarginvi
    \advance\labelwidth-\labelsep
    \parsep    \z@ \@plus\z@  \@minus\z@
    \topsep    \parsep
    \itemsep   \parsep}
%
% Change default margins for \list environments
\setlength\leftmargini   {2\ccwd} \setlength\leftmarginii
{\leftmargini} \setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini} \setlength\leftmarginv
{\ccwd} \setlength\leftmarginvi  {\ccwd} \setlength\leftmargin
{\leftmargini} \setlength\labelsep      {.5\ccwd}
\setlength\labelwidth    {\leftmargini}
%
\setlength\listparindent{2\ccwd}
% Change \listparindent to 2\ccwd in \list
\def\list#1#2{\ifnum \@listdepth >5\relax \@toodeep
    \else \global\advance\@listdepth\@ne \fi
    \rightmargin \z@ \listparindent2\ccwd \itemindent \z@
    \csname @list\romannumeral\the\@listdepth\endcsname
    \def\@itemlabel{#1}\let\makelabel\@mklab \@nmbrlistfalse #2\relax
    \@trivlist
    \parskip\parsep \parindent\listparindent
    \advance\linewidth -\rightmargin \advance\linewidth -\leftmargin
    \advance\@totalleftmargin \leftmargin
    \parshape \@ne \@totalleftmargin \linewidth
    \ignorespaces}

\makeatother

%%%%%%%%listings 设置%%%%%%%%%%%%
\usepackage{listings}
\usepackage{textcomp}
\definecolor{listinggray}{gray}{0.9}
\definecolor{lbcolor}{rgb}{0.9,0.9,0.9}
\lstset{
    backgroundcolor=\color{white},
    tabsize=4,
    rulecolor=,
    language=TeX,
    basicstyle=\scriptsize,
    upquote=true,
    aboveskip={1.5\baselineskip},
    columns=fixed,
    showstringspaces=false,
    extendedchars=true,
    breaklines=true,
    prebreak = \raisebox{0ex}[0ex][0ex]{\ensuremath{\hookleftarrow}},
    frame=single,
    showtabs=false,
    showspaces=false,
    showstringspaces=false,
    identifierstyle=\ttfamily,
    keywordstyle=\color[rgb]{0,0,1},
    commentstyle=\color[rgb]{0.133,0.545,0.133},
    stringstyle=\color[rgb]{0.627,0.126,0.941},
}
%---------------------------------------------------

%%% ---- 章节标题设置 ----- %%%%
\ctexset{chapter={format+={\heiti\zihao{3}\raggedright},%
                    number={\arabic{chapter}},
                    name={,},
                    afterskip={1em},
                    beforeskip={0em},
                    aftername={\quad},
                    pagestyle={master-mainmatter}
                    }
                    }
\ctexset{section={format+={\heiti\zihao{-3}\raggedright},
                          afterskip={6pt},
                          beforeskip={6pt},
                          aftername={\quad}
                          }
                          }
\ctexset{subsection={format+={\zihao{-4}\raggedright},
                      afterskip={3pt},
                      beforeskip={3pt},
                      aftername={\quad}
                      }
                      }
\ctexset{subsubsection={format={\zihao{-4}\bfseries\raggedright},
                          afterskip={0},
                          beforeskip={0pt},
                          aftername={\quad}
                          }
                          }

\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{4}

%%% ---- 图表标题设置 ----- %%%%
\RequirePackage[labelsep=quad]{caption} %% 序号之后空一格写标题
\captionsetup[figure]{font={bf,small}}  %
\renewcommand\figurename{\bfseries \zihao{5} 图}
\renewcommand\tablename{\bfseries \zihao{5} 表}

%%% ------ 目录设置 ------- %%%%
\ctexset{contentsname={\heiti\zihao{-2} { }\hfill \ziju{2}{目录} \hfill { }}}

\RequirePackage[titles]{tocloft}
\renewcommand\cftaftertoctitle{\par 1\par 1}

\renewcommand{\cfttoctitlefont}{\centering}
\renewcommand{\cftchapfont}{\songti\zihao{-4}}       % 章标题
\renewcommand{\cftsecfont}{\songti\zihao{-4}}        % 节标题
\renewcommand{\cftsubsecfont}{\songti\zihao{-4}}     % 条标题
\renewcommand{\cftchappagefont}{\songti\zihao{-4}}    % 章页码
\renewcommand{\cftsecpagefont}{\songti\zihao{-4}}    % 节页码
\renewcommand{\cftsubsecpagefont}{\songti\zihao{-4}} % 条页码

% 不额外空行
\setlength{\cftbeforechapskip}{0pt}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}

% 设置缩进
\setlength{\cftchapindent}{0pt} % chapter 不缩进
\setlength{\cftsecindent}{0pt} % section 不缩进
\setlength{\cftsubsecindent}{0pt} % subsection 不缩进

% 点线设置
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\graphicspath{{figures/}}        % 图片文件路径
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\allowdisplaybreaks

\endlinechar `\^^M
\endinput
