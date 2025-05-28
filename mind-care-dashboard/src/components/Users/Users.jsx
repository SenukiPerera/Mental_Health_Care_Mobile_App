import React, { useEffect, useState } from "react";
import { collection, getDocs } from "firebase/firestore";
import { db } from "../../firebase";
import Sidebar from '../Sidebar/Sidebar';
import "./Users.css";

const UserInfo = () => {
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchUsers = async () => {
      try {
        const querySnapshot = await getDocs(collection(db, "Users"));
        const usersData = querySnapshot.docs.map(doc => ({
          id: doc.id,
          ...doc.data(),
        }));
        setUsers(usersData);
      } catch (error) {
        console.error("Error fetching users:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchUsers();
  }, []);

  return (
    <div className="user-info-container">
      <Sidebar />
      <div className="content">
        <h2>All Registered Users</h2>
        {loading ? (
          <p>Loading...</p>
        ) : users.length > 0 ? (
          users.map(user => (
            <div key={user.id} className="user-card">
              <p><strong>Email:</strong> {user.email}</p>
              <p><strong>Name:</strong> {user.fullName}</p>
              <p><strong>Phone:</strong> {user.phoneNo}</p>
            </div>
          ))
        ) : (
          <p className="no-user">No users found.</p>
        )}
      </div>
    </div>
  );
};

export default UserInfo;
