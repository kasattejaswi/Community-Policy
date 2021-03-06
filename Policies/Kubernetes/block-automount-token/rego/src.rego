package k8sazureblockautomounttoken

violation[{"msg": msg}] {
  obj := input.review.object
  not valid_service_account(obj.spec)
  msg := sprintf("Automounting service account token is disallowed, pod: %v", [obj.metadata.name])
}

valid_service_account(spec) {
  spec.automountServiceAccountToken == false
}
