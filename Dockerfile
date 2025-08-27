# Dockerfile for for python image with dependencies 
# after installation, can be used interactively with:
# sudo docker run --rm -it docker_r_base bash


# Dockerfile
FROM python:3.11.3-slim

# Keep Python output unbuffered & avoid .pyc files
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# System build/runtime deps for scientific Python
# (lapack/openblas for numpy/scipy/statsmodels, build tools for wheels)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gfortran \
    libopenblas-dev \
    liblapack-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Build-time Python tooling per your spec
RUN python -m pip install --upgrade pip setuptools && \
    python -m pip install "wheel==0.37.1"

# Copy dependency list first for better layer caching
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the rest of your app (if any)
COPY . .

# Default command (replace with your app entrypoint)
CMD ["python", "-c", "import pandas, statsmodels, joblib; print('Deps OK')"]