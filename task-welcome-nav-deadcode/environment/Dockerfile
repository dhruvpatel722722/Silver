FROM us-docker.pkg.dev/afterqueryai/silver-repo-images/ticket-management-system-tms01-7vlzo:v1@sha256:3ce277eaae9e7a98031f1a4f6b344e7ad845e5f409270efc36610d4dea5db989

ENTRYPOINT []

WORKDIR "/app/ticket-management-system-tms01"

RUN set -e \
 && git reset --hard a9c8e6032979986e47a48faf6ffecf5ea1a42c8c \
 && git clean -fd \
 && git checkout a9c8e6032979986e47a48faf6ffecf5ea1a42c8c

RUN yarn install --frozen-lockfile

RUN mkdir -p /logs/verifier
