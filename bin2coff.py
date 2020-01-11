#!/usr/bin/env python
# Copyright 2013 The Flutter Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

import argparse
import os
import subprocess
import sys

def main():
  parser = argparse.ArgumentParser(description='Convert a data file to an object file')
  parser.add_argument('--objcopy', type=str, required=True)
  parser.add_argument('--input', type=str, required=True)
  parser.add_argument('--output', type=str, required=True)
  parser.add_argument('--arch', type=str, required=True)

  args = parser.parse_args()

  input_dir, input_file = os.path.split(args.input)
  output_path = os.path.abspath(args.output)

  cli_args = [
    args.objcopy,
    input_file,
    output_path,
  ]

  if args.arch == 'x64':
      cli_args.append('64bit')

  subprocess.check_call(cli_args, cwd=input_dir)

if __name__ == '__main__':
  sys.exit(main())
