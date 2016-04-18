function hash-aliases:less-or-grep() {
    if [ -t 0 ]; then
        if [ $# -eq 1 ]; then
            less -R "${@}"
        else
            grep "$2" "$1" "${@:3}"
        fi
    else
        if [ $# -eq 0 ]; then
            if [ -t 1 ]; then
                less -R
            else
                cat
            fi
        else
            grep -iE "${@}"
        fi
    fi
}


function hash-aliases:sed-substitute() {
    local expression="$1"; shift

    sed -res"$expression" "${@}"
}


function hash-aliases:sed-delete() {
    local expression="$1"; shift

    sed -re"${expression}{d}" "${@}"
}


function hash-aliases:awk-print-field() {
    local args=()
    for arg in "${@}"; do
        if grep -xqE "[0-9]+" <<< "$arg"; then
            args+=("\$$arg")
        elif grep -qE "^ | $" <<< "$arg"; then
            args+=("\"${arg}\"")
        else
            args+=("${arg}")
        fi
    done

    awk "{print $args}"
}


function hash-aliases:tail-or-last() {
    if [ $# -gt 1 ]; then
        tail -n "${@:1}"
    else
        tail
    fi
}


function hash-aliases:head-or-first() {
    if [ $# -gt 1 ]; then
        head -n "${@:1}"
    else
        head
    fi
}

function hash-aliases:install() {
    alias -g -- '#'='2>&1 | hash-aliases:less-or-grep'
    alias -g --     '#s'='| hash-aliases:sed-substitute'
    alias -g --    '#sd'='| hash-aliases:sed-delete'
    alias -g --     '#f'='| hash-aliases:awk-print-field'
    alias -g --     '#t'='| hash-aliases:tail-or-last'
    alias -g --     '#h'='| hash-aliases:head-or-first'

    alias -g --     '#x'='| xargs -n1 -I{}'
    alias -g --     '#c'='| cut -f'
    alias -g --    '#cs'='| cut -d" " -f'
    alias -g --     '#w'='| wc -l'

    alias -g --    '#tt'='tail -f'

    alias -g --     '##'='2>&1'

    if whence hijack:transform > /dev/null; then
        hijack:transform 'sed -re "s@^# @hash-aliases:less-or-grep @"'
    fi
}

