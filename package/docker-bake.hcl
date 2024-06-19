variable "VERSION" {
  default = "2.3.1"
}

variable "FIXID" {
  default = "1"
}

group "default" {
  targets = ["xxl-job"]
}

group "acr" {
  targets = ["xxl-job-amd64", "xxl-job-arm64"]
}

target "xxl-job" {
    labels = {
        "cloud.opsbox.author" = "seanly"
        "cloud.opsbox.image.name" = "xxl-job"
        "cloud.opsbox.image.version" = "${VERSION}"
        "cloud.opsbox.image.fixid" = "${FIXID}"
    }
    dockerfile = "package/Dockerfile"
    context  = "./"
    args = {
        VERSION="${VERSION}"
    }
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["seanly/appset:xxl-job-${VERSION}-${FIXID}"]
    output = ["type=image,push=true"]
}

target "xxl-job-arm64" {
    labels = {
        "cloud.opsbox.author" = "seanly"
        "cloud.opsbox.image.name" = "xxl-job"
        "cloud.opsbox.image.version" = "${VERSION}"
        "cloud.opsbox.image.fixid" = "${FIXID}"
    }
    dockerfile = "package/Dockerfile"
    context  = "./"
    args = {
        VERSION="${VERSION}"
    }
    platforms = ["linux/arm64"]
    tags = [
        "registry.cn-chengdu.aliyuncs.com/seanly/appset:xxl-job-${VERSION}-${FIXID}-arm64",
        "registry.cn-hangzhou.aliyuncs.com/seanly/appset:xxl-job-${VERSION}-${FIXID}-arm64"
    ]
    output = ["type=image,push=true"]
}

target "xxl-job-amd64" {
    labels = {
        "cloud.opsbox.author" = "seanly"
        "cloud.opsbox.image.name" = "xxl-job"
        "cloud.opsbox.image.version" = "${VERSION}"
        "cloud.opsbox.image.fixid" = "${FIXID}"
    }
    dockerfile = "package/Dockerfile"
    context  = "./"
    args = {
        VERSION="${VERSION}"
    }
    platforms = ["linux/amd64"]
    tags = [
        "registry.cn-chengdu.aliyuncs.com/seanly/appset:xxl-job-${VERSION}-${FIXID}",
        "registry.cn-hangzhou.aliyuncs.com/seanly/appset:xxl-job-${VERSION}-${FIXID}"
    ]
    output = ["type=image,push=true"]
}