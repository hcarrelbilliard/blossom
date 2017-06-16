<#import "/spring.ftl" as spring>
<#import "/master/master.ftl" as master>
<#import "/utils/civility.ftl" as gender>
<#import "/utils/buttons.ftl" as buttons>


<@master.default currentUser=currentUser>
<div class="row wrapper border-bottom white-bg page-heading">
  <div class="col-sm-8">
    <h2><i class="fa fa-user"></i> <@spring.message "users.creation"/></h2>
    <ol class="breadcrumb">
      <li>
        <a href="/blossom"><@spring.message "menu.home"/></a>
      </li>
      <li>
        <a href="/blossom/administration"><@spring.message "menu.administration"/></a>
      </li>
      <li>
        <a href="/blossom/administration/users"><@spring.message "users.title"/></a>
      </li>
      <li class="active">
        <strong><@spring.message "users.creation"/></strong>
      </li>
    </ol>
  </div>
</div>
<div class="wrapper wrapper-content">
  <form id="userCreateForm" class="form form-horizontal" novalidate method="POST">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <div class="ibox">
      <div class="ibox-title">
        <h3><@spring.message "users.creation"/></h3>
      </div>
      <div class="ibox-content">

        <@spring.bind "userCreateForm.firstname"/>
        <div class="form-group <#if spring.status.error>has-error</#if>">
          <label class="col-sm-2 control-label"><@spring.message "users.user.properties.firstname"/></label>
          <div class="col-sm-10">
            <input type="text" name="firstname" class="form-control" value="${userCreateForm.firstname}"
                   placeholder="<@spring.message "users.user.properties.firstname"/>">
            <#list spring.status.errorMessages as error>
              <span class="help-block text-danger m-b-none">${error}</span>
            </#list>
          </div>
        </div>

        <@spring.bind "userCreateForm.lastname"/>
        <div class="form-group <#if spring.status.error>has-error</#if>">
          <label class="col-sm-2 control-label"><@spring.message "users.user.properties.lastname"/></label>
          <div class="col-sm-10">
            <input type="text" name="lastname" class="form-control" value="${userCreateForm.lastname}"
                   placeholder="<@spring.message "users.user.properties.lastname"/>">
            <#list spring.status.errorMessages as error>
              <span class="help-block text-danger m-b-none">${error}</span>
            </#list>
          </div>
        </div>

        <@spring.bind "userCreateForm.civility"/>
        <div class="form-group <#if spring.status.error>has-error</#if>">
          <label class="col-sm-2 control-label"><@spring.message "users.user.properties.civility"/></label>
          <div class="col-sm-10">
            <#list civilities as civility>
              <div>
                <label>
                  <input type="radio" value="${civility}" name="civility"
                         <#if userCreateForm.civility == civility>checked</#if>>
                  <@gender.icon civility=civility/> <@gender.label civility=civility/>
                </label>
              </div>
            </#list>

            <#list spring.status.errorMessages as error>
              <span class="help-block text-danger m-b-none">${error}</span>
            </#list>
          </div>
        </div>

        <div class="hr-line-dashed"></div>

        <@spring.bind "userCreateForm.identifier"/>
        <div class="form-group <#if spring.status.error>has-error</#if>">
          <label class="col-sm-2 control-label"><@spring.message "users.user.properties.identifier"/></label>
          <div class="col-sm-10">
            <input type="text" name="identifier" class="form-control" value="${userCreateForm.identifier}"
                   placeholder="<@spring.message "users.user.properties.identifier"/>">

            <#list spring.status.errorMessages as error>
              <span class="help-block text-danger m-b-none">${error}</span>
            </#list>
          </div>
        </div>

        <div class="hr-line-dashed"></div>

        <@spring.bind "userCreateForm.email"/>
        <div class="form-group <#if spring.status.error>has-error</#if>">
          <label class="col-sm-2 control-label"><@spring.message "users.user.properties.email"/></label>
          <div class="col-sm-10">
            <input type="email" name="email" class="form-control" value="${userCreateForm.email}"
                   placeholder="<@spring.message "users.user.properties.email"/>">
            <#list spring.status.errorMessages as error>
              <span class="help-block text-danger m-b-none">${error}</span>
            </#list>
          </div>
        </div>
      </div>
      <div class="ibox-footer">
        <div class="text-right">
          <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> <@spring.message "save"/></button>
          <a href=".." class="btn btn-default btn-sm"><i class="fa fa-remove"></i> <@spring.message "cancel"/></a>
        </div>
      </div>
    </div>
  </form>
</div>


<script>
  $(document).ready(function () {
    $('#userCreateForm').formValidation({
      framework: 'bootstrap',
      icon: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
      },
      fields: {
        firstname: {
          row: '.col-xs-4',
          validators: {
            notEmpty: {
              message: 'The first name is required'
            }
          }
        },
        lastname: {
          row: '.col-xs-4',
          validators: {
            notEmpty: {
              message: 'The last name is required'
            }
          }
        },
        identifier: {
          validators: {
            notEmpty: {
              message: 'The username is required'
            },
            stringLength: {
              min: 6,
              max: 30,
              message: 'The username must be more than 6 and less than 30 characters long'
            },
            regexp: {
              regexp: /^[a-zA-Z0-9_\.]+$/,
              message: 'The username can only consist of alphabetical, number, dot and underscore'
            }
          }
        },
        email: {
          validators: {
            notEmpty: {
              message: 'The email address is required'
            },
            emailAddress: {
              message: 'The input is not a valid email address'
            }
          }
        },
        civility: {
          validators: {
            notEmpty: {
              message: 'The gender is required'
            }
          }
        }
      }
    });
  });
</script>
</@master.default>
