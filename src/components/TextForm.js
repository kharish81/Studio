import React, { useState } from "react";

export default function TextForm(props) {
   const [text, setText] = useState("");
   
  const myStyle = {
    border: "2px solid grey",
    height: "180px",
    borderRadius: "4px",

    
    
  };
  const handleCopy =() =>{
      navigator.clipboard.writeText(text);
      props.showAlert("Copied to clipboard","success");
  }
  const handleUpClick = () => {
    setText(text.toUpperCase());
    props.showAlert("Converted to Uppercase","success");
  };
  const handleLowClick = () => {
    setText(text.toLowerCase());
    props.showAlert("Converted to Lowercase","success");
  };
  const handleClearClick = () => {
    setText("");
    props.showAlert("Text cleared","success");
  };
  const handleOnChange = (event) => {
    setText(event.target.value);
  };

  return (
    <div className="container">
      <h3>{props.heading}</h3>
      <div className="mb-3">
        <textarea
          placeholder="Enter text here"
          className="form-control"
          onChange={handleOnChange}
          value={text}
          id="myBox"
          rows="8" 
        ></textarea>
      </div>
      <button className="btn btn-primary" disabled={text.length==0} onClick={handleUpClick}>
        Convert to Uppercase
      </button>
      <button className="btn btn-info mx-2 my-2" disabled={text.length==0} onClick={handleLowClick}>
        Convert to Lowercase
      </button>
      <button className="btn btn-danger" disabled={text.length==0} onClick={handleClearClick}>
        Clear
      </button>
      <button className="btn btn-danger mx-2 my-2" disabled={text.length==0} onClick={handleCopy}>
        Copy
      </button>
      <h5 className="my-3">{props.heading1}</h5>
      <p>
        {
          text.split(/\s+/).filter((element) => {
            return element.length !== 0;
          }).length
        }{" "}
        words and {text.length} characters long.
      </p>
      {/* <p>{text ? text.split(" ").length : 0} words and {text.trim().replace(/\s/g, "").length} characters long.</p> */}
      <p>
        {text
          ? `${0.008 * text.split(" ").filter((element) => {
            return element.length !==0}).length} minutes read`
          : "0 minutes read"}
      </p>
      <h4>{props.heading2}</h4>
      <div className="container my-2" id="textspace" style={myStyle}>
        <p className="my-1">{text?text:props.content}</p>
      </div>
    </div>
  );
}
