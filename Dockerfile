FROM python:3.9.7-alpine3.13

# Build-time flags
ARG WITH_PLUGINS=true

# Copy files necessary installation
COPY requirements.txt requirements.txt

# Perform mkdocs-material installation
RUN pip install --no-cache-dir -r requirements.txt \
  && \
    if [ "${WITH_PLUGINS}" = "true" ]; then \
      pip install --no-cache-dir \
        "mkdocs-minify-plugin>=0.3" \
        "mkdocs-redirects>=1.0"; \
    fi

# Set working directory
WORKDIR /docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]