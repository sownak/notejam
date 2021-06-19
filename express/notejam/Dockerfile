FROM node:10-alpine

#copy app
COPY . ./app

#Set working directory and copy package files over for
WORKDIR /app

#install dependencies
RUN npm install

#Variables for ENV file
ENV PORT=3000

EXPOSE ${PORT}
CMD [ "./bin/www" ]
