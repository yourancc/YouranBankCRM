<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<div class="col-md-3 left_col">
	<div class="left_col scroll-view">
		<div class="navbar nav_title" style="border: 0;">
			<a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>youran crm!</span></a>
		</div>

		<div class="clearfix"></div>

		<!-- menu profile quick info -->
		<div class="profile clearfix">
			<div class="profile_pic">
				<s:if test="#user==null">
					<img src="${pageContext.request.contextPath}/images/user.png" alt="..." class="img-circle profile_img">
				</s:if>
				<s:else>
				
					<img src="${pageContext.request.contextPath}/<s:property value='#user.user_profile_photo'/>" alt="..." class="img-circle profile_img">
				</s:else>
				
			</div>	
			<div class="profile_info">
				<span>Welcome,</span>
				<h2>

				<s:if test="#user == null">Guest</s:if>
				<s:else>
					<s:property value="#user.user_name"/>
				</s:else>
				</h2>
			</div>
		</div>
		<!-- /menu profile quick info -->

		<br />

		<!-- 左侧导航菜单 -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			<div class="menu_section">
				<h3>General</h3>
				<ul class="nav side-menu">
					<li>
						<a><i class="fa fa-home"></i> 控制台 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">	
							<li>
								<a href="${pageContext.request.contextPath}/console_pandect">总览</a>
							</li>

						</ul>
					</li>
					<li>
						<a><i class="fa fa-edit"></i>客户管理<span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li>
								<a href="${pageContext.request.contextPath}/customer_toAddPage">添加客户</a>
							</li>						
							<li>
								<a href="${pageContext.request.contextPath}/customer_list">客户列表</a>
							</li>			
							<li>
								<a href="${pageContext.request.contextPath}/chance_analyse">客户分析</a>
							</li>	
						</ul>
					</li>
					<li>
						<a><i class="fa fa-desktop"></i>联系人管理 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li>
								<a href="${pageContext.request.contextPath}/linkman_toAddPage">新增联系人</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/linkman_list">联系人列表</a>
							</li>							
						</ul>
					</li>
					<li>
						<a><i class="fa fa-table"></i> 客户更进管理 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li>
								<a href="${pageContext.request.contextPath}/visit_toAddPage">新增拜访</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/visit_list">拜访列表</a>
							</li>						
						</ul>
					</li>

					<li>
						<a><i class="fa fa-table"></i> 机遇管理 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li>
								<a href="${pageContext.request.contextPath}/chance_toAddPage">添加线索</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/chance_list">机遇管理</a>
							</li>

						</ul>
					</li>

					<li>
						<a><i class="fa fa-clone"></i>统计分析 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">						
							<li>
								<a href="${pageContext.request.contextPath}/chance_analyse">客户分析</a>
							</li>	
						</ul>
					</li>
					<s:if test="#user.user_state>1">
					<li>
						<a><i class="fa fa-clone"></i>系统管理 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
						<!-- 
							<li>
								<a href="fixed_sidebar.html">角色管理</a>
							</li>
							<li>
								<a href="fixed_footer.html">用户管理</a>
							</li>
							 -->
							<li>
								<a href="${pageContext.request.contextPath}/system_listDic">数据字典</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/user_list">用户管理</a>
							</li>							
						</ul>
					</li>
					
					</s:if>
					
				</ul>
			</div>

		</div>
		<!-- /sidebar menu -->

		<!-- /menu footer buttons -->
		<div class="sidebar-footer hidden-small">
			<a data-toggle="tooltip" data-placement="top" title="Settings">
				<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
			</a>
			<a data-toggle="tooltip" data-placement="top" title="FullScreen">
				<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
			</a>
			<a data-toggle="tooltip" data-placement="top" title="Lock">
				<span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
			</a>
			<a data-toggle="tooltip" data-placement="top" title="Logout" href="${pageContext.request.contextPath}/login.jsp">
				<span class="glyphicon glyphicon-off" aria-hidden="true"></span>
			</a>
		</div>
		<!-- /menu footer buttons -->
	</div>
</div>