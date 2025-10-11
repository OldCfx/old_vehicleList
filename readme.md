**old_vehicleList** is a modern and lightweight **staff-only vehicle catalog** for FiveM.  
It allows admins and staff members to quickly browse, search, and spawn vehicles through an elegant **NUI interface** built with React.  

---

## ✨ Features  
- 🔍 **Instant Search** — quickly find vehicles by name or model  
- 🗂️ **Categories** — organized by vehicle type (Cars, Bikes, Boats, Planes, etc.)  
- 🎨 **Custom Color Selection** before spawning  
- 🚘 **Server-side Spawn System** — no client-side spawning for security  
- 📊 **Detailed Vehicle Information**  
  - Manufacturer  
  - Class (vehicle type)  
  - Hash Hex  
  - Seat count  
  - Acceleration & braking stats  
- 💬 **Discord Logging** — optional webhook notifications for menu usage  
- 💻 **Optimized NUI** — built with React + CSS for smooth and clean visuals  

---

## 🧰 Commands  
```
/vehiclelist
/vehiclelist [keyword]
```
**Example:**  
`/vehiclelist police` → opens the menu with the “police” vehicles already filtered.  


---

## 🪄 Installation  
1. Clone or download this repository into your `resources` folder.  
2. Ensure the resource name matches your configuration (e.g. `old_vehicleList`).  
3. Add this to your `server.cfg`:  
   ```
   ensure old_vehicleList
   ```  
4. (Optional) Set up your Discord Webhook URL in the server-side script.  

---

## 📸 Preview  
![Old Vehicle List Preview](https://files.catbox.moe/ulo591.png)

---