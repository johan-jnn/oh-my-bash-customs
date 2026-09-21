_proto() {
    local i cur prev opts cmd
    COMPREPLY=()
    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
        cur="$2"
    else
        cur="${COMP_WORDS[COMP_CWORD]}"
    fi
    prev="$3"
    cmd=""
    opts=""

    for i in "${COMP_WORDS[@]:0:COMP_CWORD}"
    do
        case "${cmd},${i}" in
            ",$1")
                cmd="proto"
                ;;
            proto,activate)
                cmd="proto__subcmd__activate"
                ;;
            proto,alias)
                cmd="proto__subcmd__alias"
                ;;
            proto,bin)
                cmd="proto__subcmd__bin"
                ;;
            proto,clean)
                cmd="proto__subcmd__clean"
                ;;
            proto,completions)
                cmd="proto__subcmd__completions"
                ;;
            proto,debug)
                cmd="proto__subcmd__debug"
                ;;
            proto,diagnose)
                cmd="proto__subcmd__diagnose"
                ;;
            proto,exec)
                cmd="proto__subcmd__exec"
                ;;
            proto,install)
                cmd="proto__subcmd__install"
                ;;
            proto,mcp)
                cmd="proto__subcmd__mcp"
                ;;
            proto,migrate)
                cmd="proto__subcmd__migrate"
                ;;
            proto,outdated)
                cmd="proto__subcmd__outdated"
                ;;
            proto,pin)
                cmd="proto__subcmd__pin"
                ;;
            proto,plugin)
                cmd="proto__subcmd__plugin"
                ;;
            proto,regen)
                cmd="proto__subcmd__regen"
                ;;
            proto,run)
                cmd="proto__subcmd__run"
                ;;
            proto,setup)
                cmd="proto__subcmd__setup"
                ;;
            proto,shell)
                cmd="proto__subcmd__shell"
                ;;
            proto,status)
                cmd="proto__subcmd__status"
                ;;
            proto,unalias)
                cmd="proto__subcmd__unalias"
                ;;
            proto,uninstall)
                cmd="proto__subcmd__uninstall"
                ;;
            proto,unpin)
                cmd="proto__subcmd__unpin"
                ;;
            proto,upgrade)
                cmd="proto__subcmd__upgrade"
                ;;
            proto,versions)
                cmd="proto__subcmd__versions"
                ;;
            proto__subcmd__debug,config)
                cmd="proto__subcmd__debug__subcmd__config"
                ;;
            proto__subcmd__debug,env)
                cmd="proto__subcmd__debug__subcmd__env"
                ;;
            proto__subcmd__plugin,add)
                cmd="proto__subcmd__plugin__subcmd__add"
                ;;
            proto__subcmd__plugin,info)
                cmd="proto__subcmd__plugin__subcmd__info"
                ;;
            proto__subcmd__plugin,list)
                cmd="proto__subcmd__plugin__subcmd__list"
                ;;
            proto__subcmd__plugin,remove)
                cmd="proto__subcmd__plugin__subcmd__remove"
                ;;
            proto__subcmd__plugin,search)
                cmd="proto__subcmd__plugin__subcmd__search"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        proto)
            opts="-c -l -r -t -y -h -V --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version activate alias bin clean completions debug diagnose exec install mcp migrate outdated pin plugin regen run setup shell status unalias uninstall unpin upgrade versions"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__activate)
            opts="-c -l -r -t -y -h -V --export --no-bin --no-init --no-shim --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__alias)
            opts="-c -l -r -t -y -h -V --to --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --to)
                    COMPREPLY=($(compgen -W "global local user" -- "${cur}"))
                    return 0
                    ;;
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__bin)
            opts="-c -l -r -t -y -h -V --all --dir --bin --shim --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --dir)
                    COMPREPLY=($(compgen -W "exes globals" -- "${cur}"))
                    return 0
                    ;;
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__clean)
            opts="-c -l -r -t -y -h -V --days --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version all cache plugins temp tools"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --days)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__completions)
            opts="-c -l -r -t -y -h -V --shell --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --shell)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__debug)
            opts="-c -l -r -t -y -h -V --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version config env"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__debug__subcmd__config)
            opts="-c -l -r -t -y -h -V --raw --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__debug__subcmd__env)
            opts="-c -l -r -t -y -h -V --raw --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__diagnose)
            opts="-c -l -r -t -y -h -V --shell --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --shell)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__exec)
            opts="-c -l -r -t -y -h -V --tools-from-config --raw --shell --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --shell)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__install)
            opts="-c -l -r -t -y -h -V --build --no-build --force --pin --quiet --update-lockfile --internal --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --pin)
                    COMPREPLY=($(compgen -W "global local user" -- "${cur}"))
                    return 0
                    ;;
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__mcp)
            opts="-c -l -r -t -y -h -V --info --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__migrate)
            opts="-c -l -r -t -y -h -V --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__outdated)
            opts="-c -l -r -t -y -h -V --latest --update --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__pin)
            opts="-c -l -r -t -y -h -V --resolve --to --tool-native --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --to)
                    COMPREPLY=($(compgen -W "global local user" -- "${cur}"))
                    return 0
                    ;;
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__plugin)
            opts="-c -l -r -t -y -h -V --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version add info list remove search"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__plugin__subcmd__add)
            opts="-c -l -r -t -y -h -V --to --type --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --to)
                    COMPREPLY=($(compgen -W "global local user" -- "${cur}"))
                    return 0
                    ;;
                --type)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__plugin__subcmd__info)
            opts="-c -l -r -t -y -h -V --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__plugin__subcmd__list)
            opts="-c -l -r -t -y -h -V --aliases --versions --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__plugin__subcmd__remove)
            opts="-c -l -r -t -y -h -V --from --type --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --from)
                    COMPREPLY=($(compgen -W "global local user" -- "${cur}"))
                    return 0
                    ;;
                --type)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__plugin__subcmd__search)
            opts="-c -l -r -t -y -h -V --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__regen)
            opts="-c -l -r -t -y -h -V --bin --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__run)
            opts="-c -l -r -t -y -h -V --exe --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --exe)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__setup)
            opts="-c -l -r -t -y -h -V --shell --no-modify-profile --no-modify-path --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --shell)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__shell)
            opts="-c -l -r -t -y -h -V --shell --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --shell)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__status)
            opts="-c -l -r -t -y -h -V --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__unalias)
            opts="-c -l -r -t -y -h -V --from --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --from)
                    COMPREPLY=($(compgen -W "global local user" -- "${cur}"))
                    return 0
                    ;;
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__uninstall)
            opts="-c -l -r -t -y -h -V --quiet --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__unpin)
            opts="-c -l -r -t -y -h -V --from --tool-native --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --from)
                    COMPREPLY=($(compgen -W "global local user" -- "${cur}"))
                    return 0
                    ;;
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__upgrade)
            opts="-c -l -r -t -y -h -V --check --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        proto__subcmd__versions)
            opts="-c -l -r -t -y -h -V --aliases --installed --config-mode --dump --log --log-file --json --otel --otel-logs --otel-service-name --reporter --theme --yes --help --version"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config-mode)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "global local upwards upwards-global" -- "${cur}"))
                    return 0
                    ;;
                --log)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                -l)
                    COMPREPLY=($(compgen -W "off error warn info debug trace verbose" -- "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --otel-service-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --reporter)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -W "text json ndjson" -- "${cur}"))
                    return 0
                    ;;
                --theme)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "dark light" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
    esac
}

if [[ "${BASH_VERSINFO[0]}" -eq 4 && "${BASH_VERSINFO[1]}" -ge 4 || "${BASH_VERSINFO[0]}" -gt 4 ]]; then
    complete -F _proto -o nosort -o bashdefault -o default proto
else
    complete -F _proto -o bashdefault -o default proto
fi
