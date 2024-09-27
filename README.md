# Marketplace
```mermaid
classDiagram
    Project :  technologies
    Project <|-- DB
    Project <|-- Backend
    WIP: Work In Progress
    DB --|> Containerization
    DB --|> WIP
    
    DB: postgresql
    Backend --|> WIP
    Backend : Node.js( Express.js )
    Backend : Graphql server

    Frontend --|> WIP

    Frontend: React(Next.js)
    Frontend: Tailwindcss
    Frontend: SCSS

    WIP --|> Containerization

    Containerization: Docker compose
```