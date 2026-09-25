---
name: work-on-projects
description: Analyze, design, implement, debug, refactor, or review software projects using the user's source-aware, evidence-first workflow. Use for project planning, architecture, implementation, debugging, regressions, code review, or deciding what to build next in any repository.
---

# Work on Projects

Use the current project files and observable behavior as the source of truth. Follow the globally loaded environment and change-authorization agreements.

Never add comments to code or write prose in README files or documentation.

## Keep the requested mode distinct

- **Design:** Clarify the observable capability, compare viable architectures, sketch the caller-facing API and data flow, and recommend one design.
- **Implementation:** Inspect the current source first, then make the smallest agreed change in dependency order.
- **Debugging:** Trace the real execution path, identify the first concrete failure, and make the smallest repair. Do not turn debugging into redesign unless the architecture is the demonstrated cause.
- **Review:** Give a verdict, separate what matters now from later concerns, and distinguish reversible choices from costly commitments.

Do not blur these modes or treat a request in one mode as authorization for another.

## Work from evidence

- Translate the request into observable behavior or a concrete acceptance condition.
- Inspect existing APIs, conventions, data flow, lifecycle, error flow, and relevant user changes before prescribing edits.
- Prefer the least powerful abstraction and smallest vertical slice that solves the demonstrated need.
- Consider likely future pressure without implementing speculative generality.
- Explain the first cause and its evidence before proposing a debugging repair.
- Preserve unrelated work and avoid broad rewrites during focused changes.
- Verify proportionately with formatting, compilation, focused tests, and a minimal meaningful run where practical.
- Test the current intended contract. Do not encode superseded behavior merely by asserting that it remains rejected; negative tests should cover current invariants and meaningful failure modes unless backward compatibility is itself a requirement.
- Stop at the requested milestone and summarize what works, remaining limitations, and the most useful next step.

## Communicate concretely

- Lead with the recommendation, diagnosis, or result.
- Use source-aware examples and exact file, type, function, or API references when available.
- Explain every surprising value or newly introduced semantic rather than silently inventing behavior.
- Continue from the user's actual state instead of restarting an established design or debugging process.
