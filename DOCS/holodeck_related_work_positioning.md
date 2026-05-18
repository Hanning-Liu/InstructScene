# Holodeck, InstructScene, and Positioning for New Research

This note summarizes the comparison landscape around Holodeck, InstructScene,
and related open-vocabulary 3D indoor scene generation work. The goal is to make
future research positioning more solid.

## Core Question

If the new research mainly focuses on open-vocabulary input instructions, then
Holodeck becomes a direct comparison. Holodeck already supports broad prompts
such as:

- `a living room`
- `a bedroom for a gamer`
- `an office of a professor who is a fan of Star Wars`
- `an apartment for a researcher with a cat`

Therefore, a new paper should not be positioned as simply:

```text
Open-vocabulary InstructScene
```

That framing is too weak because Holodeck, AnyHome, Open-Universe Indoor Scene
Generation, LayoutGPT-style methods, and newer systems already operate in this
space.

## Important Related Work

### Holodeck: Language Guided Generation of 3D Embodied AI Environments

Holodeck generates 3D embodied AI environments from language prompts using an
LLM, object retrieval, and constraint-based object placement.

Main strengths:

- Open-vocabulary language input.
- LLM-based room, object, and constraint planning.
- Objaverse/Objathor asset retrieval.
- Doors, windows, walls, rooms, wall objects, ceiling objects, and small objects.
- AI2-THOR-compatible interactive environments.
- Human evaluation and embodied AI application.

Main limitation relative to the proposed direction:

- Layouts are primarily produced through LLM-generated constraints and procedural
  search/optimization, not through a learned layout prior trained on real interior
  layout distributions.
- Intermediate constraints are prompt-generated and may be brittle.
- Semantic graph controllability is not the central learned representation.

### InstructScene: Instruction-Driven 3D Indoor Scene Synthesis with Semantic Graph Prior

InstructScene uses a semantic graph prior and a layout decoder for
instruction-driven indoor scene synthesis.

Main strengths:

- Learned semantic graph prior.
- Explicit object and relation representation.
- Layout decoder trained from 3D-FRONT-style indoor scenes.
- Good controllability for relation-style instructions.
- Supports zero-shot graph operations such as stylization, rearrangement, and
  completion.

Main limitations:

- Closed furniture vocabulary.
- Closed relation vocabulary.
- Instructions are templated object-object spatial relations.
- Weak handling of open-ended lifestyle or design briefs.
- No explicit architectural graph nodes for doors, windows, and walls.

### AnyHome: Open-Vocabulary Generation of Structured and Textured 3D Homes

AnyHome translates open-vocabulary descriptions, from short labels to detailed
paragraphs, into structured and textured house-scale 3D indoor scenes.

Main strengths:

- Open-vocabulary text input.
- House-scale generation.
- Structured intermediate representation.
- Textured output.
- Supports customization and editing.

Relevance:

- AnyHome is a strong open-vocabulary and house-scale baseline.
- A new method must clearly distinguish itself from AnyHome, especially if the
  new work claims open-ended natural language support.

### Open-Universe Indoor Scene Generation Using LLM Program Synthesis and Uncurated Object Databases

This work generates indoor scenes from unrestricted text prompts and unrestricted
object categories using LLM-synthesized layout programs, constraint solving, and
VLM-based mesh retrieval from uncurated databases.

Main strengths:

- Explicitly targets open-universe scene generation.
- Does not require a fixed object vocabulary.
- Uses program synthesis and constraint satisfaction.
- Retrieves from uncurated object databases.

Relevance:

- This is a direct competitor for open-vocabulary object/category support.
- A new paper should not claim that open-vocabulary scene generation is unsolved
  in general. The novelty must be more specific.

### Planner3D: LLM-Enhanced Graph Prior Meets 3D Indoor Scene Explicit Regularization

Planner3D uses LLM-enhanced graph priors and explicit layout regularization for
3D indoor scene generation from scene graphs.

Main strengths:

- Combines scene graphs and LLM-enhanced priors.
- Focuses on scene-level fidelity.
- Adds explicit layout regularization.
- Jointly considers layout and shape.

Relevance:

- This is close to the idea of combining LLMs, graph priors, and explicit
  spatial constraints.
- A new paper must be precise about what is different: for example,
  open-vocabulary design briefs, architectural grounding, learned graph
  refinement, or evaluation.

### InstructLayout: Instruction-Driven 2D and 3D Layout Synthesis with Semantic Graph Prior

InstructLayout extends semantic graph prior ideas to both 2D and 3D layout
synthesis.

Main strengths:

- Instruction-driven layout synthesis.
- Semantic graph prior.
- 2D and 3D tasks.
- Text-layout paired datasets.

Relevance:

- This is the authors' own extension direction from InstructScene.
- A new paper must go beyond templated instruction-layout generation, especially
  toward open-ended design briefs and architectural constraints.

### CommonScenes: Generating Commonsense 3D Indoor Scenes with Scene Graph Diffusion

CommonScenes converts scene graphs into controllable commonsense 3D indoor
scenes using diffusion models.

Main strengths:

- Scene graph as a compact control interface.
- Learns scene-object and object-object relationships.
- Generates layout and compatible shapes.
- Introduces SG-FRONT, a scene graph enriched version of 3D-FRONT.

Relevance:

- Important learned graph-based scene synthesis baseline.
- More graph-centric than Holodeck, but not primarily open-vocabulary natural
  language design-brief generation.

### LayoutGPT: Compositional Visual Planning and Generation with Large Language Models

LayoutGPT uses LLMs as visual planners to convert text conditions into layouts
across domains, including 3D indoor scenes.

Main strengths:

- No training required for layout planning.
- Converts text into structured visual layouts.
- Handles numerical and spatial language.

Relevance:

- Important LLM-only layout planning baseline.
- Useful contrast against learned layout priors.

### SceneEval: Evaluating Semantic Coherence in Text-Conditioned 3D Indoor Scene Synthesis

SceneEval evaluates text-conditioned 3D indoor scene synthesis and includes
methods such as ATISS, DiffuScene, InstructScene, LayoutGPT, LayoutVLM, and
Holodeck.

Main strengths:

- Focuses on evaluation rather than generation.
- Provides structured metrics for semantic coherence, physical plausibility, and
  functional quality.

Relevance:

- A new paper's evaluation section should be aware of SceneEval.
- Stronger evaluation is valuable, but it may not be enough as the sole novelty.

### Holodeck 2.0: Vision-Language-Guided 3D World Generation with Editing

Holodeck 2.0 extends Holodeck-style generation with VLM-guided parsing, richer
world generation, high-quality assets, layout refinement, style-rich scenes, and
editing from human feedback.

Relevance:

- Raises the bar for open-domain and editable scene generation.
- A new method should be clear about whether it targets indoor functional layout,
  explicit graph controllability, learned realism, or full open-domain world
  generation.

## Key Risk

The risky positioning is:

```text
We solve open-vocabulary input instructions for InstructScene.
```

This is not strong enough because open-vocabulary 3D scene generation has already
been explored by Holodeck, AnyHome, Open-Universe Indoor Scene Generation, and
other LLM/VLM-based pipelines.

## Stronger Positioning

A stronger framing is:

```text
Existing LLM-procedural systems support open vocabulary but rely heavily on
prompt-generated constraints and procedural placement. Existing learned graph
prior systems capture real layout distributions but are closed-vocabulary and
weakly grounded in architecture. We unify these directions through an
open-vocabulary, architecture-aware semantic graph prior trained and evaluated
for functional interior design.
```

This makes the paper a bridge between two families:

```text
Holodeck-style open-world prompting
and
InstructScene-style learned semantic graph generation.
```

## Potential Advantages Over Holodeck

### 1. Data-Grounded Layout Realism

Holodeck uses LLM-generated constraints and procedural search/optimization for
placement. A new method could learn from real indoor scene layouts and better
capture natural design distributions:

- Where beds usually go.
- How nightstands pair with beds.
- How desks relate to windows.
- How wardrobes avoid doors.
- How dense a bedroom should be.

### 2. Explicit Semantic Graph Controllability

Holodeck has intermediate plans, but the proposed method could expose a formal
expanded semantic graph:

- Furniture nodes.
- Door/window/wall nodes.
- Zone nodes.
- Function nodes.
- Style nodes.
- Accessibility constraints.
- Spatial, functional, and aesthetic edges.

This graph would be inspectable, editable, and evaluable.

### 3. Architecture-Aware Learned Generation

Instead of treating doors and windows as only obstacles in a solver, the proposed
method could include architectural elements directly in the learned graph prior.

Example relations:

- `desk near window`
- `bed against wall`
- `wardrobe not blocking door`
- `clear path from door to bed`
- `nightstand beside bed`

### 4. Better Stability Than Pure Prompt-Chaining

LLM-pipeline systems can be brittle:

- Invalid JSON.
- Hallucinated object names.
- Inconsistent constraints.
- Unstable results across runs.
- Weak precise spatial reasoning.

A learned graph prior could improve stability by making the LLM responsible for
intent parsing, while the generative model handles realistic spatial layout.

### 5. Stronger Evaluation and Verification

The proposed method could include a critic/evaluator that checks:

- Object intent satisfaction.
- Architecture-object relation satisfaction.
- Collision-free placement.
- Door/window obstruction.
- Walkable path quality.
- Functional zone correctness.
- Style/object relevance.
- Layout realism.

This should be compared against SceneEval-style metrics where possible.

## Proposed Core Claim

```text
Unlike LLM-procedural systems such as Holodeck, our method grounds open-ended
design briefs into an explicit architecture-aware semantic graph and uses a
learned generative prior to produce realistic, controllable, and evaluable
interior layouts.
```

## Possible Paper Titles

### Recommended

```text
IntentScene: Architecture-Aware Semantic Graph Priors for Open-Vocabulary 3D Interior Design
```

### Alternatives

```text
IntentScene: Data-Grounded 3D Interior Synthesis from Open-Vocabulary Design Briefs
```

```text
Graph2Home: Architecture-Aware Semantic Graph Priors for Open-Vocabulary Interior Design
```

```text
Brief2Scene: Learned Architecture-Aware Scene Graphs for 3D Interior Generation
```

```text
OpenGraphScene: Open-Vocabulary 3D Interior Synthesis with Learned Semantic Graph Priors
```

## Possible Contributions

1. Open-vocabulary design-brief parser
   - Converts broad lifestyle/user-intent instructions into structured scene
     requirements.

2. Expanded architecture-aware semantic graph
   - Includes furniture, doors, windows, walls, zones, function, style, material,
     accessibility, and global room goals.

3. Learned graph prior or graph refiner
   - Converts noisy LLM-parsed graphs into plausible, data-grounded scene graphs.

4. Architecture-aware layout decoder
   - Places objects using learned real-layout priors plus hard physical and
     accessibility constraints.

5. Retrieval/generation bridge
   - Supports open-vocabulary assets through retrieval or generation while
     preserving graph-level controllability.

6. Evaluation suite
   - Measures instruction fidelity, architecture constraint satisfaction,
     physical plausibility, accessibility, layout realism, and style relevance.

## Recommended Experimental Comparisons

Compare against:

- Holodeck
- AnyHome
- Open-Universe Indoor Scene Generation
- LayoutGPT
- LayoutVLM, if available
- InstructScene
- InstructLayout
- CommonScenes
- SceneEval benchmark/evaluator, if usable

Evaluation dimensions:

- Open-vocabulary object coverage.
- Instruction/design-brief fidelity.
- Layout realism.
- Architecture-object constraint satisfaction.
- Door/window obstruction rate.
- Collision rate.
- Navigability or accessibility.
- Graph editability/control.
- Human preference.
- Runtime and failure rate.

## Bottom-Line Position

The paper should not compete on open vocabulary alone. The stronger claim is:

```text
Open vocabulary plus learned layout realism, explicit graph controllability,
architectural constraint grounding, and stronger evaluation.
```

The clearest research gap is between:

```text
LLM-procedural systems:
  flexible language, weaker learned spatial priors

learned graph-prior systems:
  stronger data-grounded layout priors, weaker open vocabulary and architecture
  awareness
```

The new research should live exactly in that gap.

