FROM build-chat:latest
WORKDIR /deltachat-desktop/
RUN npm run test