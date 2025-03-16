import React, { useState } from 'react';

function App() {
  const [people, setPeople] = useState('');
  const [output, setOutput] = useState('');

  const handleDistribute = async () => {
    if (!people || isNaN(people) || parseInt(people) < 0) {
      setOutput("Input value does not exist or value is invalid");
      return;
    }

    try {
      const response = await fetch(`http://localhost:8000?people=${people}`);
      const text = await response.text();
      setOutput(text);
    } catch (err) {
      setOutput("Irregularity occurred");
    }
  };

  return (
    <div style={{ padding: 20 }}>
      <h2>Card Distribution</h2>
      <input type="number" value={people} onChange={e => setPeople(e.target.value)} />
      <button onClick={handleDistribute}>Distribute</button>
      <pre>{output}</pre>
    </div>
  );
}

export default App;
