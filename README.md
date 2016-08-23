# Grafaner

Create awesome Grafana dashboards with ease.

## Installation

Run the following command to install `grafaner` on your system:

``` bash
# TODO
# ideally something like
/curl some.path.org | sh
```

## Setup

Put your Grafana auth token in the `~/.grafaner/token` file:

``` bash
echo '<API_TOKEN>' > ~/.grafaner/token
```

Put the path to your Grafana server in the `~/.grafaner/server` file:

``` bash
echo 'http://test-server.com' > ~/.grafaner/server
```

## Usage

First, create a template file:

**TODO** (define format)

``` yml
title: "Test Dashboard"
```

Then create your dashboard with the following:

``` bash
grafaner production_overview.yml
```
