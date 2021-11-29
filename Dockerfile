FROM node:latest

WORKDIR /usr/app
COPY . .

EXPOSE 1337
RUN useradd -mc /bin/bash dc
USER dc
CMD ["npm","start"]
