<jsp:include page="header.jsp"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/admin/home" id="viewallUser" class="nav-link">
              <p>
                Views all User
              </p>
            </a>
          </li>
          <li class="nav-item has-treeview">
            <a href="${pageContext.request.contextPath}/admin/create" id="viewallUser2" class="nav-link active">
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
            <h1 class="m-0 text-dark">Create new user</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item ư">Create new user</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
<div class="content">
        <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Quick Example</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="formCreate">
                <div class="card-body">
                  <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" class="form-control" name="name" id="" placeholder="Enter Full Name">
                  </div>
                  <div class="form-group">
                    <label>Username</label>
                    <input type="text" class="form-control" name="username" id="" placeholder="Enter Username">
                  </div>
                  <div class="form-group">
                    <label>Password</label>
                    <input type="text" class="form-control" name="password" id="" placeholder="Enter Password">
                  </div>
                  <div class="form-group">
                    <label>Email</label>
                    <input type="text" class="form-control" name="email" id="" placeholder="Enter Email">
                  </div>
                  <div class="form-group">
                    <label>Phone</label>
                    <input type="text" class="form-control" name="phone" id="" placeholder="Enter Phone">
                  </div>
                  <div class="form-group">
                    <label>CMND</label>
                    <input type="text" class="form-control" name="cmnd" id="" placeholder="Enter CMND">
                  </div>
                    <!-- radio -->
                   <div class="form-group">
                       <label for="exampleInputFile">Role User</label>
                       <div class="custom-control custom-radio">
                           <input class="custom-control-input" type="radio"  value= "0" id="customRadio1" name="roleUser" checked>
                           <label for="customRadio1" class="custom-control-label">CUS</label>
                       </div>
                       <div class="custom-control custom-radio">
                           <input class="custom-control-input" type="radio" value= "1" id="customRadio2" name="roleUser">
                           <label for="customRadio2" class="custom-control-label">TICKET_SELLER</label>
                       </div>
                       <div class="custom-control custom-radio">
                           <input class="custom-control-input" type="radio" value= "2" id="customRadio3" name="roleUser" >
                           <label for="customRadio3" class="custom-control-label">ADMIN</label>
                       </div>
                   </div>
                </div>
                </form>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button class="btn btn-primary" id="submitFormCreate">Submit</button>
                </div>
              
            </div>
            <!-- /.card -->

          </div>
        </div>
        <!-- /.row -->
      <!-- /.container-fluid -->
    </div>
    </div>
<jsp:include page="footer.jsp"/>