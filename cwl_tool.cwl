cwlVersion: v1.0

class: CommandLineTool

baseCommand: input_one_command

inputs:

  run_tools: ../../resources/run_tools/schemas.yaml#run_tools

  input_one:
    type: string
    inputBinding:
      prefix: --input_one

outputs:

  output_one:
    type: File
    outputBinding:
      glob: 'output_one.txt'
