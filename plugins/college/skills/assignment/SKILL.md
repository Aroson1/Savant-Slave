---
name: Assignment / Lab Solver
description: Complete a programming or data assignment or lab from its brief. Reads the assignment document, does every task, generates the required files, and assembles a clean submission folder. Screenshots are genuine captures with the student name and roll number visible.
when_to_use: When the user wants to solve, finish, or complete a college assignment, lab, or exercise. Trigger phrases include "finish my lab", "complete this assignment", "do my lab", or running /assignment. An optional path to the assignment folder may be given as an argument.
argument-hint: [path-to-assignment-folder]
---

# Assignment / Lab Solver

A general purpose solver for programming and data assignments or labs. Read the brief,
complete every task against real data, produce the required deliverables, and assemble a
submission folder. Follow the steps in order and keep the writing and code rules at the
bottom in mind throughout.

## Step 1: Locate the assignment

- If an argument was given (`$ARGUMENTS`), treat it as a path. If it is a folder, look
  inside it and its immediate subfolders for the assignment brief. If it points directly
  at a brief file, use that file.
- If no argument was given, use the current working directory as the assignment root.
- Find the brief. It is usually a PDF, but may be `.docx`, `.md`, `.txt`, or an image.
  Read the entire brief before doing anything. Do not skim. Note the exact tasks, the
  required tools, any minimums (for example a record count), the required deliverables,
  and any mandatory elements such as screenshots.

## Step 2: Confirm the student identity

- Find the student name and roll or registration number. Check the user's message first,
  then memory, then ask the user if it is still unknown.
- These must appear wherever the brief requires them: report header, a banner in program
  output, the terminal prompt in screenshots, and a stamp on any charts.

## Step 3: Make a requirements checklist

- Write down every task, every deliverable, and every mandatory element from the brief.
- Keep this list and check each item off at the end. Do not mark something done unless it
  is actually produced and verified.

## Step 4: Environment and resources

- Work out which language and tools the brief requires. Check what is already installed
  and install anything missing (prefer user level installs so nothing needs admin rights).
- If a dataset or external resource is needed, acquire it. Respect any stated minimum size
  or record count and pick something that downloads directly without login where possible.
- Never fabricate data, outputs, or timings. Everything reported must come from a real run.

## Step 5: Implement the solution

- Write the code in the required stack. Keep it clear and readable with minimal comments.
- Run every task against the real data and capture the actual results and timings. Use
  those exact numbers in the report. If two methods should agree (for example SQL and
  Pandas), check that they do and say so.

## Step 6: Screenshots (only if the brief asks for them)

The screenshots must be genuine captures of a real terminal, notebook, or a text file
shown alongside the output. Do not pass off synthetically rendered or drawn images as
screenshots. The student name and roll number must be visible in the capture.

- Print a banner with the name and roll number at the top of each step's output, so it
  shows up in the capture regardless of the medium.
- On macOS, capture a real Terminal window:
  1. Run each step in Terminal with the prompt set to include the name and roll number.
  2. Size the window so the whole output fits without scrolling.
  3. Capture the exact window region.
  Use the bundled helper for this:
  `osascript "${CLAUDE_SKILL_DIR}/scripts/capture_terminal.applescript" <rows> "<projectDir>" "<Name> | <Roll>" "<command>"`
  It returns the window bounds as `left,top,right,bottom`. Then capture with:
  `screencapture -R"<left>,<top>,<width>,<height>" -o out.png` where width and height are
  computed from the bounds. Size `rows` to the number of output lines plus about four, and
  test the tallest and widest steps to confirm nothing is clipped.
- Name and roll number printed inside a chart or figure counts and does not need a
  separate terminal capture.
- On other operating systems, use an equivalent real capture method, or ask the user to
  capture and provide the screenshots.

## Step 7: Report

- If a report is required, write it in a natural, formal student voice using the writing
  rules below.
- Cover everything the brief lists for the report, in a sensible order.
- If the report will be exported to a PDF, embed the screenshots and charts inline (with
  relative paths to the media folder) so the PDF is self contained.

## Step 8: Assemble the submission folder

- Create one folder named `Submission_<Name>_<Roll>` with spaces and punctuation cleaned
  to underscores.
- Keep it flat. Put the deliverable files (notebook, script, SQL, report, and so on)
  directly in the folder root. Put all images in a single `media/` subfolder. Do not nest
  further.
- Include only what the brief says to submit. Do not copy large raw datasets into the
  submission folder unless the brief requires it.

## Step 9: Verify and hand off

- Re-run the code to confirm it works and the results are reproducible.
- Confirm every checklist item is met and every embedded image path resolves.
- Tell the user plainly what was produced, what is left for them to do (for example,
  export the report to PDF), and anything that failed or was skipped. Report outcomes
  honestly.

## Writing rules

- Write like a careful student: plain, formal, and specific.
- Do not use em dashes. Use commas, colons, parentheses, or separate sentences instead.
- Avoid AI sounding filler and buzzwords. Do not use words and phrases such as: delve,
  leverage, seamless, robust or comprehensive as filler, unlock, harness, elevate, boasts,
  "plays a crucial role", "a testament to", "navigate the landscape", "in today's world",
  "it is important to note", "when it comes to", "at the end of the day", and padding uses
  of furthermore or moreover.
- No emoji, no exclamation marks, no marketing tone.
- Vary sentence length naturally. Do not overuse three item lists or parallel triples.
- State results directly and do not overhedge.

## Code rules

- Minimal comments. Keep the code clear and readable and match the common style of the
  language.
- Do not add decorative banners beyond what is needed to show the name and roll number
  where the brief requires it.
