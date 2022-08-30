get_mysql_records() {
  OS=$(uname -s)

  case "$(uname -m)" in
    x86_64)
      ARCH="amd64"
      ;;
    *)
      ARCH="$(uname -m)"
      ;;
  esac

  curl -s https://raw.githubusercontent.com/datacharmer/dbdeployer/master/downloads/tarball_list.json |
  tr '\n' ' ' |
  tr '{}' '\n\n' |
  grep -e "\"OS\": *\"$OS\"" |
  grep -e "\"arch\": *\"$ARCH\"" |
  grep -e '"flavor": *"mysql"' |
  grep -e '"minimal": *false'
}
