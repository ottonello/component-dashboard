#!/bin/bash
set -xe

IMAGE_NAME="component-dashboard"
IMAGE_VERSION=$(git describe --always --tag)
