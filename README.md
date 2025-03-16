🃏 Card Distribution App
Distributes a standard 52-card deck randomly to n people. Built using PHP (Backend) and ReactJS (Frontend) with Docker for cross-platform compatibility.

📌 Features
Input: Number of people (via frontend form or URL param)
Validates input: Disallows null, negative, or non-numeric values
Randomly shuffles and distributes cards
Outputs each person’s cards on a new line, comma-separated
Supports Docker for isolated development
Error handling for irregular cases as per specification

🚀 Tech Stack
Backend: PHP 7.4 - 8.3
Frontend: ReactJS v16
Containerization: Docker, Docker Compose
Compatibility: Node v12+, MySQL 5.7+, Chrome Browser

⚙️ Setup Instructions
1. Clone the Repo
   ```bash
   git clone https://github.com/guasyed/card-distribution.git
   cd card-distribution
   ```
2. Run with Docker (Recommended)
   ```bash
   docker-compose up --build
   ```
   Backend: http://localhost:8000
   Frontend: http://localhost:3000
3. Run Without Docker (Optional)
   Backend (PHP):
   ```bash
   cd backend
   php -S localhost:8000
   ```
   Frontend (ReactJS):
   ```bash
   cd frontend
   npm install
   npm start
   ```

🧪 Usage
Input
Enter number of people in frontend form OR use query param:
   ```arduino
   http://localhost:8000?people=5
   ```
Output
Each line = Cards for 1 person
Each card = Suit-Code format (e.g., S-A, H-X)
Example:
   ```mathematica
   S-A,H-X,D-3,...
   D-4,C-K,H-2,...
   ```

❗ Validation & Error Handling
Invalid input (null, negative):
Output → Input value does not exist or value is invalid
Any unexpected issue:
Output → Irregularity occurred
Handles all edge cases with proper messaging and termination.

📁 File Structure
```pgsql
backend/
  index.php
  Dockerfile
frontend/
  src/App.js
  Dockerfile
  package.json
docker-compose.yml
README.md
```

⏱️ Time Spent
Backend Logic & Validation: 1.5 hours
Frontend UI & Integration: 1.5 hours
Docker & Testing: 1 hour
Total: ~4 hours

⚠️ Notes
All code is UTF-8 with LF line endings
Comments included for clarity
Reproduction or redistribution of this code is prohibited

📎 License
© 2025 — All rights reserved. For programming test use only.
