<#import "/spring.ftl" as spring>
<#import "/utils/table.ftl" as table>
<#import "/utils/privilege.ftl" as privilege>

<div class="ibox-content">
  <div class="sk-spinner sk-spinner-wave">
    <div class="sk-rect1"></div>
    <div class="sk-rect2"></div>
    <div class="sk-rect3"></div>
    <div class="sk-rect4"></div>
    <div class="sk-rect5"></div>
  </div>

  <div class="row">
  <@table.table
    page=responsabilities
    iconPath='fa fa-key'
    columns= {
      "role": {
        "nestedPath":["b","name"],
        "nestedIdPath":["b","id"],
        "label":"roles.role.properties.name",
        "link":"/blossom/administration/roles/{id}"
      },
      "modificationDate": {
        "label":"list.modification.date.head",
        "type":"datetime"
      }
    }
  />
  </div>
</div>

<@privilege.has currentUser=currentUser privilege="administration:responsabilities:change">
  <div class="ibox-footer">
    <div class="text-right">
      <button class="btn btn-primary btn-view" onclick="edit_user_roles_associations(this);">
      <@spring.message "edit"/>
      </button>
    </div>
  </div>

  <script>
    var edit_user_roles_associations = function (button) {
      var targetSelector = '#'+$(button).closest(".tab-pane").attr('id');
      $(targetSelector + ' > .ibox-content').addClass("sk-loading");
      var edit = $(targetSelector).data("edit");
      $.get(edit).done(function (responseText, textStatus, jqXHR) {
        if (jqXHR.status === 200) {
          $(targetSelector).html(responseText);
        }
        $(targetSelector).removeClass("sk-loading");
      });
    };
  </script>
</@privilege.has>
