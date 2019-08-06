cwlVersion: v1.0

class: Workflow

requirements:

  # Use this if the workflow has multiple inputs:
  MultipleInputFeatureRequirement: {}
  
  # Use this if the workflow makes use of JS expressions (e.g. valueFrom)
  InlineJavascriptRequirement: {}
  
  # Use this if the workflow calls out to other workflows:
  SubworkflowFeatureRequirement: {}
  
  # Use this if the inputs make use of valueFrom
  StepInputExpressionRequirement: {}

inputs:

  ##
  # An input of type File
  ##
  input_one: File
  
  ##
  # An input of type string
  ##
  input_two: string

outputs:

  output_one:
    type: File
    outputSource: step_one/an_output

  output_two:
    type: File
    outputSource: step_two/another_output

steps:

  ##
  # A simple workflow step that calls out to a CWL CommandLineTool
  ##
  step_one:
    run: ../cwl_tools/tool_one.cwl
    in:
      test_input: input_one
    out: [an_output]

  ##
  # A simple workflow step that takes an input from a previous step
  ##
  step_two:
    run: ../cwl_tools/tool_two.cwl
    in:
      test_input: input_two
      input_from_previous_step: step_one/an_output
    out: [another_output]
    
