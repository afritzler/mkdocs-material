FROM python:3.9.7-alpine3.13

# Copy files necessary installation
COPY requirements.txt requirements.txt

# Perform mkdocs-material installation
RUN pip install --no-cache-dir -r requirements.txt

# Set working directory
WORKDIR /docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]