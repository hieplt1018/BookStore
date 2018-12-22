
<%@page import="java.util.ArrayList"%>
<%@page import="model.Book"%>
<%@page import="DAO.BookDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Product</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="../css/mos-style.css" rel='stylesheet' type='text/css' />

    </head>
    <body>
        <%
            BookDAO bookDAO = new BookDAO();
            ArrayList<Book> listBook = bookDAO.getAllBook();
        %>
        
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Quản lý sản phẩm</h3>
                    
                    <a href="../admin/insert_product.jsp">Thêm sản phẩm</a>

                    <table class="data">

                        <tr class="data">
                            <th class="data" width="30px">STT</th>
                            <th class="data">Mã Sách</th>
                            <th class="data">Tên Sách</th>
                            <th class="data">Tác giả</th>
                            <th class="data">Nhà xuất bản</th>
                            <th class="data">Giá</th>
                            <th class="data" width="90px">Tùy chọn</th>
                        </tr>

                        <%
                            int count = 0;
                            for(Book b : listBook){
                                count++;
                        %>
                        <tr class="data">
                            <td class="data" width="30px"><%=count%></td>
                            <td class="data"><%=b.getBookId()%></td>
                            <td class="data"><%=b.getCategoryId() %></td>
                            <td class="data"><%=b.getBookName() %></td>
                            <td class="data"><%=b.getBookAuthor() %></td>
                            <td class="data"><%=b.getBookPulisher() %></td>
                            <td class="data"><%=b.getBookPrice() %></td>
                            <td class="data" width="90px">
                            <center>
                                <a href="../admin/update_category.jsp?command=update&book_id=<%=b.getBookId() %>">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
                                <a href="/BookStore2/ManagerCategoryServlet?command=delete&book_id=<%=b.getBookId() %>">Xóa</a>
                            </center>
                            </td>
                        </tr>
                        <%}%>

                    </table>
                </div>
                <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>

        </div>


    </body>
</html>
