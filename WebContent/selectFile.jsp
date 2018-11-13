<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
  <center><b><h1>文件上传</h1></b></center>
  <form name="selectfile" enctype="multipart/form-data" method="post" action="servlet/Upload.java">
    <p>文件名称：
    <input type="file" name="ulfile" size="20" maxlength="80">
    </p>
    <p>
    <input type="submit" value="上传"> <input type="reset" value="清除">
    </p>
  </form>

</body>
</html>