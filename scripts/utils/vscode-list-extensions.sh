#!/bin/bash
# https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list

cwd="$(cd "$(dirname "${0}")" && pwd)"
vscode_dir="${cwd}/../vscode"

cat <<EOF > "${vscode_dir}/extensions.sh"
#!/bin/bash

source ~/.zprofile

$(code --list-extensions | sort -f | xargs -L 1 echo 'code --install-extension')

EOF

chmod +x "${vscode_dir}/extensions.sh"

