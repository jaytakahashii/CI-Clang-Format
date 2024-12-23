FROM ubuntu:20.04

RUN apt-get update && apt-get install -y clang-format

COPY scripts/clang-format-check.sh /usr/local/bin/clang-format-check.sh

RUN chmod +x /usr/local/bin/clang-format-check.sh

ENTRYPOINT ["bash", "/usr/local/bin/clang-format-check.sh"]
