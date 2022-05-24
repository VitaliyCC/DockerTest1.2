FROM openjdk:17.0.1 as builder
COPY src/ /src/
RUN mkdir "app"
RUN javac src/com/company/Main.java -d /app

FROM openjdk:17.0.1
COPY --from=builder /app /app
WORKDIR /app/com/company
CMD java Main.class

