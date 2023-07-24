;;;; marcus.lisp

(in-package #:marcus)

(named-readtables:in-readtable :interpol-syntax)
;;;; https://spec.commonmark.org/0.30/#appendix-a-parsing-strategy

;;;; Parsing has two phases:
;;;; 1. In the first phase, lines of input are consumed and the block structure
;;;;    of the document - its division into paragraphs, block quotes, list items
;;;;    and so on is constructed. Text is assigned to these blocks but not parsed.
;;;;    Link reference definitions are parsed and a map of links is constructed.

(defun convert-to-blocks (path) 
  (with-open-file (input path :direction :input) 
    (loop for line = (read-line input nil nil)
          while line
          collect (scan-line line))))

(convert-to-blocks #p"example.md")

(defun scan-line (line) 
  (cond ((match-heading line) (list 'heading line))
        (t 'error)))

(defun match-heading (line) 
  "Check if line matches ATX heading"
  (cl-ppcre:scan "^#{1,6}\\s+(\.+)$" line))
