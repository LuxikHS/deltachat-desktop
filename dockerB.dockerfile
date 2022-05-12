FROM node:latest
RUN git clone https://github.com/deltachat/deltachat-desktop.git
WORKDIR /deltachat-desktop/
RUN npm i && npm run build