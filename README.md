# 🌍 World Papers

**Mission:** World Papers translates headlines from top newspapers worldwide into English, providing a neutral, global perspective on current events.

---

## 📌 Project Overview
- **Primary Language:** Python 🐍
- **Tech Stack:** Selected for performance, scalability, and Microsoft-based hosting
  - **Backend:** FastAPI (high-performance API framework for Python)
  - **Scraping:** Scrapy + Playwright (for fetching headlines)
  - **Translation:** Google Translate API / DeepL API
  - **Database:** PostgreSQL (hosted on Azure)
  - **Frontend:** Next.js (React-based, deployed on Azure)
  - **Deployment:** Azure App Services, Azure Functions, Azure PostgreSQL
  - **Caching & Queuing:** Redis + Celery

---

## 🚀 Getting Started

### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/world-papers.git
cd world-papers
```

### **2️⃣ Create a Virtual Environment**
```bash
python -m venv venv
source venv/bin/activate   # macOS/Linux
venv\Scripts\activate     # Windows
```

### **3️⃣ Install Dependencies**
```bash
pip install -r requirements.txt
```

### **4️⃣ Set Up Environment Variables**
Create a `.env` file in the root directory:
```ini
DATABASE_URL="postgresql://username:password@localhost:5432/world_papers"
TRANSLATION_API_KEY="your_google_translate_or_deepl_key"
SCRAPING_SCHEDULE="every 30 minutes"
```

### **5️⃣ Run the Backend Server**
```bash
uvicorn app.main:app --reload
```
The API will be available at **http://127.0.0.1:8000**

---

## 📂 Project Structure
```
world-papers/
│── app/
│   ├── main.py           # FastAPI application entry point
│   ├── database.py       # PostgreSQL database connection
│   ├── models.py         # Database models
│   ├── scraping.py       # Web scraping logic (Scrapy + Playwright)
│   ├── translation.py    # Translation module (Google Translate API)
│   ├── routes/
│   │   ├── headlines.py  # API routes for fetching headlines
│   │   ├── health.py     # API health check
│── frontend/             # Next.js frontend
│── tests/                # Unit tests
│── .env                  # Environment variables (not committed)
│── requirements.txt       # Python dependencies
│── README.md              # Project documentation
```

---

## 🛠️ Contributing
1. **Fork the repository** & create a new branch.
2. **Make your changes**, ensuring code follows best practices.
3. **Run tests** using:
   ```bash
   pytest tests/
   ```
4. **Submit a pull request** for review.

---

## 📅 Roadmap & Next Steps
- ✅ Sprint 1: Initial research & tech stack selection
- 🚧 Sprint 2: Implementing news scraping & API integration
- 🔜 Sprint 3: Translation module
- 🔜 Sprint 4: Backend API development
- 🔜 Sprint 5: Frontend UI

---

### 🌐 Stay Updated
For real-time updates and discussions, join the **GitHub Project Board** (TBD).

🚀 Let's build the future of global news accessibility together!
