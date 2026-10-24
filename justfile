# List recipes
default:
    @just --list

# Lint all charts
lint:
    helm lint charts/*

# Regenerate chart READMEs
docs:
    helm-docs --chart-search-root charts
