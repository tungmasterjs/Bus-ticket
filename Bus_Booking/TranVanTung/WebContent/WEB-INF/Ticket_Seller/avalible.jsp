<jsp:include page="header.jsp"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="${pageContext.request.contextPath}/resouce/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Bus Ticket</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="${pageContext.request.contextPath}/resouce/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">${USER.getName()}</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/ticket/booked" class="nav-link">
              <p>
                Views all ticket booked
              </p>
            </a>
          </li>
          <li class="nav-item has-treeview">
            <a href="${pageContext.request.contextPath}/ticket/avalible" class="nav-link active">
              <p>
               View all of available seat
              </p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">View all ticked Available</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">View all ticked Available</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
<div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Name_Bus</th>
                    <th>Road</th>
                    <th>Price</th>
                    <th>Seat</th>
                    <th>Status</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Edit</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${LISTALL}" var = "list">
	                  <tr>
	                    <td class="name_bus">${list.getName_bus()}</td>
	                    <td class="road">${list.getRoad()}</td>
	                    <td class="price">${list.getPrice()}</td>
	                    <td class="seat">${list.getSeat()}</td>
	                    <td>
	                    	<c:forEach items="${STATUS}" var="status">
	                    	
	                    		<c:if test="${status.getValue()==list.getStatus()}">
	                    			<span class="status">${status}</span><input class="abc" type ="hidden" name="id" value="${list.getId()}"/></i>
	                    		</c:if>
	                    	</c:forEach>
	                    </td>
	                    <td class="date">${list.getDate()}</td>
	                    <td class="time">${list.getTime()}</td>
	                    <td><span><i class="fas fa-edit cursor complexConfirm text-primary"></i></span></td>
	                  </tr>
                  </c:forEach>
                 
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Name_Bus</th>
                    <th>Road</th>
                    <th>Price</th>
                    <th>Seat</th>
                    <th>Status</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Edit</th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
          </div>
        </div>
        <!-- /.row -->
      <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <jsp:include page="footer.jsp"/>