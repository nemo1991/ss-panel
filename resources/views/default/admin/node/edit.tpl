{include file='admin/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            编辑节点 #{$node->id}
            <small>Edit Node</small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-sm-12">
                <div id="msg-success" class="alert alert-success alert-dismissable" style="display: none;">
                    <button type="button" class="close" id="ok-close" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-info"></i> 成功!</h4>

                    <p id="msg-success-p"></p>
                </div>
                <div id="msg-error" class="alert alert-warning alert-dismissable" style="display: none;">
                    <button type="button" class="close" id="error-close" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-warning"></i> 出错了!</h4>

                    <p id="msg-error-p"></p>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-horizontal">
                            <div class="row">
                                <fieldset class="col-sm-6">
                                    <legend>连接信息</legend>
                                    <div class="form-group">
                                        <label for="title" class="col-sm-3 control-label">节点名称</label>

                                        <div class="col-sm-9">
                                            <input class="form-control" id="name" value="{$node->name}">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="server" class="col-sm-3 control-label">节点地址</label>

                                        <div class="col-sm-9">
                                            <input class="form-control" id="server" value="{$node->server}">
                                        </div>
                                    </div>
                                    
									<div class="form-group">
                                        <label for="protocol" class="col-sm-3 control-label">协议插件</label>

                                        <div class="col-sm-9">
                                            <select class="form-control" id="protocol">
                                                <option value="origin" {if $user->protocol=="origin"}selected="selected"{/if}>origin</option>
                                                <option value="verify_simple" {if $user->protocol=="verify_simple"}selected="selected"{/if}>verify_simple</option>
	                                            <option value="verify_deflate" {if $user->protocol=="verify_deflate"}selected="selected"{/if}>verify_deflate</option>
                                                <option value="verify_sha1" {if $user->protocol=="verify_sha1"}selected="selected"{/if}>verify_sha1</option>												
                                                <option value="auth_simple" {if $user->protocol=="auth_simple"}selected="selected"{/if}>auth_simple</option>
                                                <option value="auth_sha1" {if $user->protocol=="auth_sha1"}selected="selected"{/if}>auth_sha1</option>
                                                <option value="auth_sha1_compatible" {if $user->protocol=="auth_sha1_compatible"}selected="selected"{/if}>auth_sha1_compatible</option>
                                                <option value="auth_sha1_v2" {if $user->protocol=="auth_sha1_v2"}selected="selected"{/if}>auth_sha1_v2</option> 
                                                <option value="auth_sha1_v2_compatible" {if $user->protocol=="auth_sha1_v2_compatible"}selected="selected"{/if}>auth_sha1_v2_compatible</option>												
                                            </select>	
                                        </div>
                                    </div>
									<div class="form-group">
									    <label class="col-sm-3 control-label" for="protocol_param">自定义协议参数</label>
										<div class="col-sm-9">
									        <input class="form-control" id="protocol_param" type="text" value="{$user->protocol_param}">
										</div>
								    </div>
                                    
                                    <div class="form-group">
                                        <label for="obfs" class="col-sm-3 control-label">混淆插件</label>

                                        <div class="col-sm-9">
                                            <select class="form-control" id="obfs">
                                                <option value="plain" {if $user->obfs=="plain"}selected="selected"{/if}>plain</option>
                                                <option value="http_simple" {if $user->obfs=="http_simple"}selected="selected"{/if}>http_simple</option>
                                                <option value="http_simple_compatible" {if $user->obfs=="http_simple_compatible"}selected="selected"{/if}>http_simple_compatible</option>
						                        <option value="tls_simple" {if $user->obfs=="tls_simple"}selected="selected"{/if}>tls_simple</option>
                                                <option value="random_head" {if $user->obfs=="random_head"}selected="selected"{/if}>random_head</option>												
                                                <option value="tls1.0_session_auth" {if $user->obfs=="tls1.0_session_auth"}selected="selected"{/if}>tls1.0_session_auth</option>
                                                <option value="tls1.0_session_auth_compatible" {if $user->obfs=="tls1.0_session_auth_compatible"}selected="selected"{/if}>tls1.0_session_auth_compatible</option>
                                                <option value="tls1.2_ticket_auth" {if $user->obfs=="tls1.2_ticket_auth"}selected="selected"{/if}>tls1.2_ticket_auth</option>
                                                <option value="tls1.2_ticket_auth_compatible" {if $user->obfs=="tls1.2_ticket_auth_compatible"}selected="selected"{/if}>tls1.2_ticket_auth_compatible</option>										
                                            </select>
                                        </div>
                                    </div>
									<div class="form-group">
									    <label class="col-sm-3 control-label" for="obfs_param">自定义混淆参数</label>
										<div class="col-sm-9">
									        <input class="form-control" id="obfs_param" type="text" value="{$user->obfs_param}">
										</div>
								    </div>
									
                                    <div class="form-group">
                                        <label for="method" class="col-sm-3 control-label">加密方式</label>

                                        <div class="col-sm-9">
                                            <select class="form-control" id="method">
                                                <option value="rc4-md5" {if $node->method=="rc4-md5"}selected="selected"{/if}>rc4-md5</option>
                                                <option value="aes-256-cfb" {if $node->method=="aes-256-cfb"}selected="selected"{/if}>aes-256-cfb</option>
						                        <option value="chacha20" {if $node->method=="chacha20"}selected="selected"{/if}>chacha20</option>
                                                <option value="chacha20-ietf" {if $node->method=="chacha20-ietf"}selected="selected"{/if}>chacha20-ietf</option>		             										
                                            </select>	
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="rate" class="col-sm-3 control-label">流量比例</label>

                                        <div class="col-sm-9">
                                            <input class="form-control" id="rate" value="{$node->traffic_rate}">
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label for="method" class="col-sm-3 control-label">自定义加密</label>

                                        <div class="col-sm-9">
                                            <select class="form-control" id="custom_method">
                                                <option value="0" {if $node->custom_method==0}selected="selected"{/if}>不支持</option>
                                                <option value="1" {if $node->custom_method==1}selected="selected"{/if}>支持</option>
                                            </select>

                                            <p class="help-block">
                                                <a href="https://github.com/orvice/ss-panel/wiki/v3-custom-method">如何使用自定义加密?</a>
                                            </p>
                                        </div>
                                    </div>
									
									<div class="form-group">
                                        <label for="custom_rss" class="col-sm-3 control-label">自定义协议&混淆</label>

                                        <div class="col-sm-9">
                                            <select class="form-control" id="custom_rss">
                                                <option value="0" {if $node->custom_rss==0}selected="selected"{/if}>不支持</option>
                                                <option value="1" {if $node->custom_rss==0}selected="selected"{/if}>支持</option>
                                            </select>
                                        </div>
                                    </div>								
									
                                </fieldset>
                                <fieldset class="col-sm-6">
                                    <legend>描述信息</legend>
                                    <div class="form-group">
                                        <label for="type" class="col-sm-3 control-label">是否显示</label>

                                        <div class="col-sm-9">
                                            <select class="form-control" id="type">
                                                <option value="1" {if $node->type==1}selected="selected"{/if}>显示</option>
                                                <option value="0" {if $node->type==0}selected="selected"{/if}>隐藏</option>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label for="status" class="col-sm-3 control-label">节点状态</label>

                                        <div class="col-sm-9">
                                            <select class="form-control" id="status">
                                                <option value="可用" {if $node->status=="可用"}selected="selected"{/if}>可用</option>
                                                <option value="不可用" {if $node->status=="不可用"}selected="selected"{/if}>不可用</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="sort" class="col-sm-3 control-label">排序</label>

                                        <div class="col-sm-9">
                                            <input class="form-control" id="sort" type="number" value="{$node->sort}">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="info" class="col-sm-3 control-label">节点描述</label>

                                        <div class="col-sm-9">
                                            <textarea class="form-control" id="info" rows="3">{$node->info}</textarea>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <button type="submit" id="submit" name="action" value="add" class="btn btn-primary">修改</button>
                    </div>
                </div>
            </div>
            <!-- /.box -->
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
</div><!-- /.content-wrapper -->

<script>
    $(document).ready(function () {
        function submit() {
            $.ajax({
                type: "PUT",
                url: "/admin/node/{$node->id}",
                dataType: "json",
                data: {
                    name: $("#name").val(),
                    server: $("#server").val(),
                    protocol: $("#protocol").val(),
					protocol_param: $("#protocol_param").val(),
                    obfs: $("#obfs").val(),
					obfs_param: $("#obfs_param").val(),					
                    method: $("#method").val(),
                    custom_method: $("#custom_method").val(),
                    rate: $("#rate").val(),
                    info: $("#info").val(),
                    type: $("#type").val(),
                    status: $("#status").val(),
                    sort: $("#sort").val(),
					custom_rss: $("#custom_rss").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#msg-error").hide(100);
                        $("#msg-success").show(100);
                        $("#msg-success-p").html(data.msg);
                        window.setTimeout("location.href='/admin/node'", 2000);
                    } else {
                        $("#msg-error").hide(10);
                        $("#msg-error").show(100);
                        $("#msg-error-p").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#msg-error").hide(10);
                    $("#msg-error").show(100);
                    $("#msg-error-p").html("发生错误：" + jqXHR.status);
                }
            });
        }

        $("html").keydown(function (event) {
            if (event.keyCode == 13) {
                login();
            }
        });
        $("#submit").click(function () {
            submit();
        });
        $("#ok-close").click(function () {
            $("#msg-success").hide(100);
        });
        $("#error-close").click(function () {
            $("#msg-error").hide(100);
        });
    })
</script>


{include file='admin/footer.tpl'}
