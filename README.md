SQLViking
=========

Tool is broken up into two pieces:
  1. Scout: passively reads and logs SQL queries and their responses on the wire
  2. Pillage: leverages TCP injection to execute arbitrary queries and parse responses without needing credentials


TDS (tabular data stream) parsing functionality forked from pytds: https://github.com/denisenkom/pytds