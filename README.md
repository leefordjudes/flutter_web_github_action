# flutter_web_github_action

## Project Create Command

flutter create flutter_web_github_action --org "io.auditplus" --platforms web

## Run Project with WASM

flutter run -d chrome --web-port 50001 --wasm

## Build Dockerfile

* docker build -t web:action1 .

## Copy web_ui.zip from container to host machine 

* docker create --name temp_web_build web:action1 \
    && docker cp temp_web_build:/app/dist/web_ui.zip ./web_ui.zip \
    && docker rm temp_web_build

