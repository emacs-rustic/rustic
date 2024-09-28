(package "rustic"
         "3.5"
         "Rust development environment")

(package-file "rustic.el")

(files "rustic-*.el")

(source 'gnu)
(source 'melpa)

(depends-on "rust-mode" "1.0.6")
(depends-on "dash")
(depends-on "f")
(depends-on "markdown-mode")
(depends-on "s")
(depends-on "spinner")
(depends-on "xterm-color")
(depends-on "flycheck")
(depends-on "project" "0.3.0")

(development
 (depends-on "ert-runner")
 (depends-on "lsp-mode"))

(setq network-security-level 'low)  ; see https://github.com/jcs090218/setup-emacs-windows/issues/156#issuecomment-932956432
