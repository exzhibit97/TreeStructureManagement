//$((function () {
//    var url;
//    var redirectUrl;
//    var target;


//    //$('#modalBody').html
//    //$('body').append(`
//    //        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
//    //        <div class="modal-dialog" role="document">
//    //            <div class="modal-content">
//    //                <div class="modal-header">  
//    //                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
//    //                    <h4 class="modal-title" id="myModalLabel">Warning</h4>
//    //                </div>
//    //                <div class="modal-body edit-modal-body">
//    //                    <div class="row">
//    //                    <div class="col-md-4">
//    //                        <form id="edit-form" asp-action="Edit">
//    //                            <div asp-validation-summary="ModelOnly" class="text-danger"></div>
//    //                            <div class="form-group">
//    //                                <label for="Name">Name</label>
//    //                                <input class="form-control valid" type="text" data-val="true" id="Name" name="Name">
//    //                            </div>
//    //                            <div class="form-group">
//    //                               <input class="form-control valid" type="text" data-val="true" id="ParentID" name="ParentID">
//    //                            </div>
//    //                            <div class="form-group">
//    //                                <input type="submit" value="Edit" class="btn btn-primary" />
//    //                            </div>
//    //                        </form>
//    //                    </div>
//    //                </div> 
//    //                </div>
//    //                    <div class="modal-footer">
//    //                        <button type="button" class="btn btn-default" data-dismiss="modal" id="cancel-edit">Cancel</button>
//    //                        <button type="button" class="btn btn-danger" id="confirm-edit">Edit</button>
//    //                    </div>
//    //                </div>
//    //        </div>
//    //        </div>`);

//    //Edit Action
//    //$(".edit").on('click', (e) => {
//    //    e.preventDefault();

//    //    target = e.target;
//    //    var Id = $(target).data('id');
//    //    var controller = $(target).data('controller');
//    //    var action = $(target).data('action');
//    //    var bodyMessage = $(target).data('body-message');
//    //    redirectUrl = $(target).data('redirect-url');

//    //    url = "/" + controller + "/" + action + "/" + Id;
//    //    //$(".edit-modal-body").text(bodyMessage);
//    //    $("#editModal").modal('show');
//    //});

//    $("#confirm-edit").on('click', () => {
        
//        var id = $(target).data('id');
//        console.log(id);
//        var parentWhole = $('#li-' + id).parent('ul').attr('id');
//        var parentSplit = parentWhole.split('-');
//        var parentID = parseInt(parentSplit[1]);
//        console.log(parentID);
//        var categoryObj = {
//            Id: id,
//            Name: $('#Name').val(),
//            ParentID: parentID,
//        };

//        $.ajax({
//            url: "/Categories/Edit",
//            data: JSON.stringify(categoryObj),
//            type: "POST",
//            contentType: "application/json:charset=UTF-8",
//            dataType: "json",
//            success: function (data) {
//                console.log(data);
//                $("#editModal").modal('hide');
//                $('#li-' + id).children('a').text(categoryObj.Name);
                
//            },
//            error: function (data) {
//                console.log("error" + data);
//                $("#editModal").modal('hide');
//            }
//        });
        
//    });

//}()));