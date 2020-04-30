param(
  [switch] $keep = $false
)

$proposal="IF-2018-Part_B"

pdflatex $proposal
pdflatex -jobname=document1 "\includeonly{doc1}\input{$proposal}"
pdflatex -jobname=document2 "\includeonly{doc2}\input{$proposal}"

bibtex $proposal
bibtex document1
bibtex document2
pdflatex $proposal
pdflatex $proposal
pdflatex -jobname=document1 "\includeonly{doc1}\input{$proposal}"
pdflatex -jobname=document2 "\includeonly{doc2}\input{$proposal}"

if (-not $keep) {
  Remove-Item * -Include *.aux, *.idx, *.log, *.bbl, *.lol, *.lof, *.lot, *.blg, *-blx.bib, *.out, *.backup, *.brf, *.toc, *.bcf, *.run.xml
}