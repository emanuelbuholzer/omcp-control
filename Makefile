base:
	podman build \
	--platform=linux/amd64,linux/arm64 --jobs=2 \
	--manifest=omcp-control-base \
	--file=Containerfile_base && \
	podman manifest inspect omcp-control-base

base-amd:
	podman build \
	--platform=linux/amd64 \
	--manifest=omcp-control-base \
	--file=Containerfile_base && \
	podman manifest inspect omcp-control-base

base-arm:
	podman build \
	--platform=linux/arm64 \
	--manifest=omcp-control-base \
	--file=Containerfile_base && \
	podman manifest inspect omcp-control-base

.PHONY: base base-amd base-arm
