(in-package :lem-capi)

(defvar *default-font-spec*
  #+win32 (cons "Consolas" 10)
  #+linux (cons "DejaVu Sans Mono" 10.5)
  #+macosx (cons "Osaka" 10))

(defvar *lem-pane*)
(defvar *lem-process*)
