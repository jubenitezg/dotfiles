#!/bin/bash

source ~/.zprofile

cat <<EOF > ${HOME}/.tokens.sh
#!/bin/bash

EOF

eval "$(op signin)"
op item get "Tokens" --field notesPlain | sed -e 's/^"//' -e 's/"$//' >> ${HOME}/.tokens.sh

