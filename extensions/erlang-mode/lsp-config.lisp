(defpackage :lem-erlang-mode/lsp-config
  (:use :cl :lem-lsp-mode :lem-lsp-base/type))

(in-package :lem-erlang-mode/lsp-config)

(defvar *lsp-erlang-elp-server-path*
  (uiop:native-namestring "~/Applications/elp"))

(defvar *lsp-erlang-elp-erlang-ls-path*
  (uiop:native-namestring "~/Applications/erlang_ls"))

(defvar *lsp-erlang-elp-log-path*
  (uiop:native-namestring "~/tmp/elp.log"))

(defvar *lsp-erlang-server-command*
  `(,*lsp-erlang-elp-erlang-ls-path*
    "server"
    "--log-file" ,*lsp-erlang-elp-log-path*
    "--no-log-buffering")
    )

(define-language-spec (erlang-spec lem-erlang-mode:erlang-mode)
  :language-id "erlang"
  :root-uri-patterns '("rebar3")
  :command *lsp-erlang-server-command*
  :install-command ""
  :readme-url "https://github.com/WhatsApp/erlang-language-platform"
  :connection-mode :stdio)

(setf (lem-lsp-mode/spec:spec-command
       (lem-lsp-mode/spec:get-language-spec 'lem-erlang-mode:erlang-mode))
      '("/home/afa/Applications/elp" "server" "--log-file" "/home/afa/tmp/elp.log" "--no-log-buffering"))
      ;*lsp-erlang-server-command*)