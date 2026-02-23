Run the two-stage meeting minutes pipeline.

## Stage 1: Generate Minutes

Use the `meeting-minutes` agent to convert the provided transcript and agenda into formal minutes. Save the output to a file named `minutes-YYYY-MM-DD-[meeting-name].md` in the current directory.

## Stage 2: Verify Minutes

Use the `meeting-verifier` agent to check the generated minutes against the source transcript and agenda. Save the verification report to `minutes-YYYY-MM-DD-[meeting-name]-verification.md`.

## After Both Stages

Report:

1. Verification result (Approve / Revise / Major revision)
2. Number and severity of any concerns found
3. If revisions needed: apply the corrections to the minutes file and note what changed
