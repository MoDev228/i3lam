import { useState } from "react";
import "./App.css";
import { Button } from "@/components/ui/button";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <Button variant={"secondary"} size="">Cliquer ici</Button>
    </>
  );
}

export default App;
