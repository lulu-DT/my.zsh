function cert_fingerprint() {
    openssl s_client -connect $1:443 </dev/null | openssl x509 -fingerprint -noout
}

function cert_info() {
    openssl s_client -connect $1:443 -servername $1 </dev/null | openssl x509 -noout -text
}
