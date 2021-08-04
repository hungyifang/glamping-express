const express = require("express");
const router = express.Router();
const path = require("path");

router.post("/:id", (req, res) => {
  try {
    if (req.files === null) {
      return res.status(400).json({ msg: "上傳失敗" });
    }
    const file = req.files.avatar;
    const extensionName = file.mimetype.split("/").pop();
    const allowedExtension = ["jpeg", "png"];
    if (!allowedExtension.includes(extensionName)) {
      return res.status(422).json({ message: "無效的檔案類型" });
    }
    const rootPath = path.join(__dirname, "../");
    file.mv(
      `${rootPath}/public/images/avatar/${req.params.id}.${extensionName}`
    );
    res.json({ status:1, msg: "個人資料相片已更新" });
  } catch (err) {
    res.status(500).json(err);
  }
});

module.exports = router;
