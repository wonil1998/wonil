const express = require("express"); //express를 설치했기 때문에 가져올 수 있다.
const app = express();

const cors = require("cors");
const PORT = process.env.PORT || 5000;
app.use(cors());

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.listen(PORT, () => console.log("server running.."));
