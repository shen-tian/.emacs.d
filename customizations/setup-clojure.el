;;;;
;; Clojure
;;;;

(defun my-clojure-mode-setup ()
  "Midje highlighting, indentation and clj-refactor for `clojure-mode'."
  (setq inferior-lisp-program "lein repl")
  ;; syntax hilighting for midje
  (font-lock-add-keywords
   nil
   '(("(\\(facts?\\)"
      (1 'font-lock-keyword-face))
     ("(\\(background?\\)"
      (1 'font-lock-keyword-face))))
  (define-clojure-indent (fact 1))
  (define-clojure-indent (facts 1))
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(use-package clojure-mode
  :ensure t
  ;; Use clojure mode for other extensions. cljs uses clojurescript-mode.
  :mode ("\\.edn\\'" "\\.boot\\'" "lein-env\\'")
  :hook ((clojure-mode . enable-paredit-mode)
         (clojure-mode . company-mode)
         ;; camel-case tokens, like names of Java classes
         (clojure-mode . subword-mode)
         (clojure-mode . rainbow-delimiters-mode)
         (clojure-mode . display-fill-column-indicator-mode)
         (clojure-mode . my-clojure-mode-setup))
  :config
  ;; A little more syntax highlighting
  (require 'clojure-mode-extra-font-locking)
  ;; Flycheck checkers
  (require 'flycheck-joker)
  (require 'flycheck-clj-kondo))

;;;;
;; Cider
;;;;

(use-package cider
  :ensure t
  ;; enable paredit in your REPL
  :hook (cider-repl-mode . paredit-mode)
  :custom
  ;; open cider in the current window (i.e. don't open a new one)
  ;; go right to the REPL buffer when it's finished connecting
  (cider-repl-display-in-current-window t)
  (cider-repl-pop-to-buffer-on-connect t)
  ;; When there's a cider error, show its buffer and switch to it
  (cider-show-error-buffer t)
  (cider-auto-select-error-buffer t)
  ;; Where to store the cider history.
  (cider-repl-history-file "~/.emacs.d/cider-history")
  ;; Wrap when navigating history.
  (cider-repl-wrap-history t)
  ;; Don't show help banner in REPL
  (cider-repl-display-help-banner nil)
  :config
  ;; allow cider to work correctly with cljs
  (setq cider-cljs-lein-repl
        "(do (require 'figwheel-sidecar.repl-api)
             (figwheel-sidecar.repl-api/start-figwheel!)
             (figwheel-sidecar.repl-api/cljs-repl))"))
