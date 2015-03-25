<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>   
    <!-- Modal Dialog for confirmation of delete action -->
    <div class="modal fade" id="confirmDelete" role="dialog" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
            <h4 class="modal-title">Delete</h4>
          </div>
          <div class="modal-body">
              <p>Delete ?</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="deleteconfirm.button.cancel" /></button>
            <a class="btn btn-danger" id="confirmDel"><spring:message code="deleteconfirm.button.confirm" /></a>
          </div>
        </div>
      </div>
    </div>