FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update && apt-get install -y \
    texlive-latex-base \
    texlive-fonts-recommended \
    texlive-latex-extra \
    texlive-lang-cyrillic \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /code

ADD ./resume.tex /code/
ADD ./resume.cls /code/

WORKDIR /code

RUN pdflatex resume.tex
CMD ["pdflatex", "-interaction=nonstopmode", "resume.tex"]
