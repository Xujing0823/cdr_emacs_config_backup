;;; cargo-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (cargo-minor-mode) "cargo" "cargo.el" (22254 7018
;;;;;;  435209 915000))
;;; Generated autoloads from cargo.el

(autoload 'cargo-minor-mode "cargo" "\
Cargo minor mode. Used to hold keybindings for cargo-mode

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (cargo-process-repeat cargo-process-update cargo-process-current-file-tests
;;;;;;  cargo-process-current-test cargo-process-test cargo-process-search
;;;;;;  cargo-process-run cargo-process-new cargo-process-doc cargo-process-clean
;;;;;;  cargo-process-build cargo-process-bench) "cargo-process"
;;;;;;  "cargo-process.el" (22254 7018 427209 856000))
;;; Generated autoloads from cargo-process.el

(autoload 'cargo-process-bench "cargo-process" "\
Run the Cargo bench command.
Cargo: Run the benchmarks.

\(fn)" t nil)

(autoload 'cargo-process-build "cargo-process" "\
Run the Cargo build command.
Cargo: Compile the current project.

\(fn)" t nil)

(autoload 'cargo-process-clean "cargo-process" "\
Run the Cargo clean command.
Cargo: Remove the target directory.

\(fn)" t nil)

(autoload 'cargo-process-doc "cargo-process" "\
Run the Cargo doc command.
Cargo: Build this project's and its dependencies' documentation.

\(fn)" t nil)

(autoload 'cargo-process-new "cargo-process" "\
Run the Cargo new command.
Cargo: Create a new cargo project.
NAME is the name of your application.
If BIN is t then create a binary application, otherwise a library.

\(fn NAME &optional BIN)" t nil)

(autoload 'cargo-process-run "cargo-process" "\
Run the Cargo run command.
Cargo: Build and execute src/main.rs.

\(fn)" t nil)

(autoload 'cargo-process-search "cargo-process" "\
Run the Cargo search command.
Cargo: Search registry for crates.
SEARCH-TERM is used as the search term for the Cargo registry.

\(fn SEARCH-TERM)" t nil)

(autoload 'cargo-process-test "cargo-process" "\
Run the Cargo test command.
Cargo: Run the tests.

\(fn)" t nil)

(autoload 'cargo-process-current-test "cargo-process" "\
Run the Cargo test command for the current test.
Cargo: Run the tests.

\(fn)" t nil)

(autoload 'cargo-process-current-file-tests "cargo-process" "\
Run the Cargo test command for the current file.
Cargo: Run the tests.

\(fn)" t nil)

(autoload 'cargo-process-update "cargo-process" "\
Run the Cargo update command.
Cargo: Update dependencies listed in Cargo.lock.

\(fn)" t nil)

(autoload 'cargo-process-repeat "cargo-process" "\
Run the last cargo-process command.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("cargo-pkg.el") (22254 7018 441082 520000))

;;;***

(provide 'cargo-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; cargo-autoloads.el ends here
