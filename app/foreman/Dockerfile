FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# Add Foreman repo
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    && curl -fsSL https://deb.theforeman.org/foreman.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/foreman.gpg \
    && echo "deb http://deb.theforeman.org/ bookworm 3.13" > /etc/apt/sources.list.d/foreman.list \
    && echo "deb http://deb.theforeman.org/ plugins 3.13" >> /etc/apt/sources.list.d/foreman.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    foreman \
    foreman-postgresql \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3000

WORKDIR /usr/share/foreman
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
