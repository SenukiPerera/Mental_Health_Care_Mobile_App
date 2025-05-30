import React, { useEffect, useState } from 'react';
import { collection, getDocs } from 'firebase/firestore';
import { db } from '../../firebase'; // make sure `db` is exported in firebase.js
import './Dashboard.css';
import Sidebar from '../Sidebar/Sidebar';

const Dashboard = () => {
  const [userCount, setUserCount] = useState(0);

  useEffect(() => {
    const fetchUserCount = async () => {
      try {
        const snapshot = await getDocs(collection(db, "Users"));
        setUserCount(snapshot.size); // number of docs = total users
      } catch (error) {
        console.error("Error fetching user count:", error);
      }
    };

    fetchUserCount();
  }, []);

  return (
    <div className="dashboard-container">
      <Sidebar />
      <div className="dashboard">
        <div className="profile-icon">
          <img src="path/to/profile-icon.png" alt="Profile" />
        </div>
        <h3>Dashboard</h3>
        <div className="stats-card">
          <h4>Total Users</h4>
          <p>{userCount}</p>
        </div>
      </div>
    </div>
  );
}

export default Dashboard;
