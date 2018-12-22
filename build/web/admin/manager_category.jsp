<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý danh mục</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="../css/mos-style.css" rel='stylesheet' type='text/css' />

    </head>
    <body>

        <%
            CategoryDAO categoryDAO = new CategoryDAO();
            ArrayList<Category> listCategory = categoryDAO.getAllCategories();
        %>

        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Quản lý danh mục</h3>
                    
                    <a href="../admin/insert_category.jsp">Thêm danh mục</a>

                    <table class="data">

                        <tr class="data">
                            <th class="data" width="30px">STT</th>
                            <th class="data">Mã danh mục</th>
                            <th class="data">Tên danh mục</th>
                            <th class="data" width="90px">Tùy chọn</th>
                        </tr>

                        <%
                            int count = 0;
                            for(Category category : listCategory){
                                count++;
                        %>
                        <tr class="data">
                            <td class="data" width="30px"><%=count%></td>
                            <td class="data"><%=category.getCategoryID()%></td>
                            <td class="data"><%=category.getCategoryName()%></td>
                            <td class="data" width="90px">
                            <center>
                                <a href="../admin/update_category.jsp?command=update&category_id=<%=category.getCategoryID()%>">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
                                <a href="/shop/ManagerCategoryServlet?command=delete&category_id=<%=category.getCategoryID()%>">Xóa</a>
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
