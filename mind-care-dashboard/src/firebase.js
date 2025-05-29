import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";
import { getFirestore } from "firebase/firestore";

const firebaseConfig = {
  apiKey: "AIzaSyCF4oFLejl22IvbXSi6Rt7jdqM_PjOS4Iw",
  authDomain: "mental-health-care-app-ec95d.firebaseapp.com",
  projectId: "mental-health-care-app-ec95d",
  storageBucket: "mental-health-care-app-ec95d.appspot.com",
  messagingSenderId: "1094749378009",
  appId: "1:1094749378009:web:06d663c13facc6751d75c8"
};

const app = initializeApp(firebaseConfig);
export const auth = getAuth(app);
export const db = getFirestore(app);
