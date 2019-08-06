cwlVersion: v1.0

class: CommandLineTool

baseCommand: tool_command

inputs:

  ##
  # A simple input, bound to command line with a prefix
  ##
  input_one:
    type: string
    inputBinding:
      prefix: --input_one
      
  ##
  # A simple input, bound to command line @ the first position after the baseCommand
  ##
  input_one_with_position:
    type: string
    inputBinding:
      position: 0
      
  ##
  # An optional input, with a default value if none is provided
  ##
  input_two_with_default:
    type: string?
    default: this_is_a_default
    inputBinding:
      prefix: --input_two
      
  ##
  # An optional input, with a default value that comes from an expression
  ##
  input_three_with_default_expression:
    type: string?
    default:
      valueFrom: $('this_is_a_default')
    inputBinding:
      prefix: --input_two
      
outputs:

  ##
  # Output of type File
  ##
  output_one:
    type: File
    outputBinding:
      glob: 'output_one.txt'
   
  ##
  # Optional output of type File
  ##
  output_one_optional:
    type: File?
    outputBinding:
      glob: 'output_one.txt'
