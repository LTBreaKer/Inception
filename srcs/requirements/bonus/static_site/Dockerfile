FROM debian:bullseye

RUN apt-get update && apt-get install wget git -y

RUN wget https://github.com/gohugoio/hugo/releases/download/v0.118.2/hugo_extended_0.118.2_Linux-64bit.tar.gz
RUN tar -zxvf hugo_extended_0.118.2_Linux-64bit.tar.gz && rm -f hugo_extended_0.118.2_Linux-64bit.tar.gz
RUN mv hugo /usr/local/bin/hugo

RUN hugo new site LTB_Portfolio

WORKDIR /LTB_Portfolio

RUN mkdir -p themes/hugo-coder/ \
    && mkdir -p content/projects

COPY ./conf/config.toml .

RUN rm hugo.toml

RUN git clone https://github.com/luizdepra/hugo-coder.git themes/hugo-coder

RUN mkdir -p content/post

COPY tools/1_project.md content/post

CMD ["hugo", "server", "--baseURL", "http://ltb-portfolio.me", "--bind", "0.0.0.0", "--port", "80", "--appendPort=false"]