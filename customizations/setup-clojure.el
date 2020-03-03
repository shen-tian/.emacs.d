;;;;
;; Clojure
;;;;

;; Enable paredit for Clojure
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

(add-hook 'clojure-mode-hook 'company-mode)

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

;; Enable rainbow delimiters for Clojure.
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; Enable fill colum indicator for Clojure
(add-hook 'clojure-mode-hook 'fci-mode)

;; Hack for company-mode interaction
;; https://github.com/alpaker/Fill-Column-Indicator/issues/54
(defun on-off-fci-before-company (command)
  (when (string= "show" command)
    (turn-off-fci-mode))
  (when (string= "hide" command)
    (turn-on-fci-mode)))

(advice-add 'company-call-frontends :before #'on-off-fci-before-company)

;; A little more syntax highlighting
(require 'clojure-mode-extra-font-locking)

;; syntax hilighting for midje
(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "lein repl")
            (font-lock-add-keywords
             nil
             '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
               ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 1))
            (clj-refactor-mode 1)
            (yas-minor-mode 1) ; for adding require/use/import statements
            ;; This choice of keybinding leaves cider-macroexpand-1 unbound
            (cljr-add-keybindings-with-prefix "C-c C-m")))

;;;;
;; Cider
;;;;

;; provides minibuffer documentation for the code you're typing into the repl
;; (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; open cider in the current window (i.e. don't open a new one)
;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-display-in-current-window t)
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; Don't show help banner in REPL
(setq cider-repl-display-help-banner nil)

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; allow cider to work correctly with cljs
(setq cider-cljs-lein-repl
      "(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel!)
           (figwheel-sidecar.repl-api/cljs-repl))")

;; Use clojure mode for other extensions
;; Removed cljs from here, as that seems to use clojurescript-mode
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

;; Flycheck
(require 'flycheck-joker)

;; clj-kondo
(require 'flycheck-clj-kondo)
