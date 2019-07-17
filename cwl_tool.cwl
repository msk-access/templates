cwlVersion: v1.0

class: CommandLineTool

baseCommand: tool_command

inputs:

  input_one:
    type: string
    inputBinding:
      prefix: --input_one
      
  input_two_with_default:
    type: string?
    default: this_is_a_default
    inputBinding:
      prefix: --input_two
      
  input_three_with_default_expression:
    type: string?
    default:
      valueFrom: $('this_is_a_default')
    inputBinding:
      prefix: --input_two
    
outputs:

  output_one:
    type: File
    outputBinding:
      glob: 'output_one.txt'
