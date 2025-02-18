BASE_DIR=$(realpath "$(dirname "$BASH_SOURCE")")
if [[ ! -d "$BASE_DIR/auth" ]]; then
    echo "Creating Auth Directory.."
	mkdir -p "$BASE_DIR/auth"
fi

CONTAINER="ForcePhishing"
IMAGE="grpdsg20/ForcePhishing:latest"
IMG_MIRROR="ghcr.io/grpdsg20/ForcePhishing:latest"
MOUNT_LOCATION=${BASE_DIR}/auth
check_container=$(docker ps --all --format "{{.Names}}")

if [[ ! $check_container == $CONTAINER ]]; then
	echo "Creating new container..."
	docker create \
		--interactive --tty \
		--volume ${MOUNT_LOCATION}:/ForcePhishing/auth/ \
		--network host \
		--name "${CONTAINER}" \
		"${IMAGE}"
fi

docker start --interactive "${CONTAINER}"

