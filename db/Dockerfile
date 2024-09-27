FROM postgres:15
ENV POSTGRES_PASSWORD=Could_you_guess_this_password_1234
ENV POSTGRES_USER=JStormer

WORKDIR .
COPY init.sql /docker-entrypoint-initdb.d/
