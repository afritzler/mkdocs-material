FROM python:3.10.4-alpine3.15

# Build-time flags
ARG WITH_PLUGINS=true

# Copy files necessary installation
COPY requirements.txt requirements.txt
COPY requirements-plugins.txt requirements-plugins.txt

# Perform mkdocs-material installation
RUN pip install --no-cache-dir -r requirements.txt \
  && \
    if [ "${WITH_PLUGINS}" = "true" ]; then \
      pip install --no-cache-dir -r requirements-plugins.txt; \
    fi

# Set working directory
WORKDIR /docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]