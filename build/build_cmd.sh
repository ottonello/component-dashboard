#!/bin/bash
set -xe

# Install dependencies
glide install

revel package github.com/ottonello/component-dashboard
