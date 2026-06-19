name: publish docker of simple-java-docker
on:
  push: 
    branches: [main]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: code checkout
        uses: actions/checkout@v4
        with:
          filter: blob:none
          sparse-checkout: |
            simple-java-docker
          sparse-checkout-cone-mode: false
      - name: list all files
        run: ls -la
      - name: Build docker image
        working-directory: ./simple-java-docker
        run: docker build -t simple-java-docker .
      - name: Tag docker images
        run: docker tag simple-java-docker afroz25/simple-java-docker:latest