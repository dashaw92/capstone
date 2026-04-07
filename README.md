# Daniel Shaw's Capstone Project
Hello! In this repository, I have implemented a pantry inventory tracker with
a companion app.

## Proposal
My project idea was to develop a pantry inventory system where I could keep a
list of ingredients on-hand. Using this list, I would then have the ability to
check a recipe URL against this list and report what I need to acquire before I
can follow the recipe.

## Components
The project is split into several components as follows. Each component has
a readme documenting what it does in its root directory.  
| *Component* | *Description* |
| :---------- | :------------ |
| [Backend](./backend) | The backend server driving the database |
| [Frontend](./frontend) | Interface for checking recipes |
| [Extractors](./extractors) | Modules capable of extracting ingredients from recipes |
| [Protocol](./protocol) | Definition of client<=>server communication |
