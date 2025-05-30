// Sidebar.jsx
import React from 'react';
import { Link } from 'react-router-dom';
import './Sidebar.css';

const Sidebar = () => {
  return (
    <div className="sidebar">
      <div className="sidebar-header">
        <h2>Mind Care</h2>
      </div>
      <div className="sidebar-menu">
        <Link to="/dashboard" className="menu-item">
          <span className="menu-icon">🏠</span>
          <span>Dashboard</span>
        </Link>
        <Link to="/users" className="menu-item">
          <span className="menu-icon">👥</span>
          <span>Users</span>
        </Link>
        {/* <Link to="/settings" className="menu-item">
          <span className="menu-icon">⚙️</span>
          <span>Setting</span>
        </Link> */}
      </div>
    </div>
  );
};

export default Sidebar;
