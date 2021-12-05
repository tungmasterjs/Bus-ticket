<jsp:include page="header.jsp"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/admin/home" id="viewallUser" class="nav-link active">
              <p>
                Views all User
              </p>
            </a>
          </li>
          <li class="nav-item has-treeview">
            <a href="${pageContext.request.contextPath}/admin/create" id="viewallUser2" class="nav-link">
              <p>
               Creat New User
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
            <h1 class="m-0 text-dark">View all User</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item ư">View all User</li>
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
                    <th>Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>CMND</th>
                    <th>Role</th>
                    <th>Edit</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${LISTALL}" var = "list">
	                  <tr>
						
	                    <td class="nameUser">${list.getName()}</td>
	                    <td class="usernameUser">${list.getUsername()}</td>
	                    <td class="emailUser">${list.getEmail()}</td>
	                    <td class="phoneUser">${list.getPhone()}</td>
	                    <td class="cmndUser">${list.getIdentify()}</td>
	                    <td>
	                    	<c:forEach items="${USERS}" var="user">
	                    		<c:if test="${user.getValue()==list.getRole()}">
	                    			<span class="roleUser">${user}</span>
	                    		</c:if>
	                    	</c:forEach>
	                    </td>
	                    <td>
	                    	<button class="btn btn-warning btn-sm mr-3 changeRole">Set Role</button>
	                    	<span><i class="fas fa-edit userUpdate cursor text-primary"></i></span>
	                    	<input type="hidden" class="idUser" name="idUser" value="${list.getId()}"/>
	                    	<input type="hidden" class="passwordUpdate" value="${list.getPassword()}"/>
	                    </td>
	                  </tr>
                  </c:forEach>
                 
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>CMND</th>
                    <th>Role</th>
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