#!/bin/bash

# script na spustenie buildu my_scada_ofz 
# script treba spustat v hlavnom priecinku app "my_scada_ofz"
# pri zmene suborov Reactu je vzdy potrebne spustit tento script aby sa zmeny prejavili v prehliadaci.

echo "🌐 Nastavujem REACT_APP_API_URL..."
export REACT_APP_API_URL=http://xxx.xxx.xxx.xxx:8000  # xxx. IP Adresa servera kde bezi aplikacia

echo "⚙️  Spúšťam build React aplikácie..."
cd frontend
npm run build

echo "🧹 Čistím starý frontend_static..."
rm -rf ../frontend_static/*

echo "📁 Kopírujem nový build do frontend_static..."
cp -r build/* ../frontend_static/

echo "🔁 Reštartujem Gunicorn a Nginx..."
sudo systemctl restart gunicorn
sudo systemctl restart nginx

echo "✅ Hotovo. Nový build nasadený a server reštartovaný."
