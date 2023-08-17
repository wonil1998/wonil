$('#example').DataTable({
    initComplete: function () {
        this.api()
            .columns()
            .every(function () {
                var column = this;
                var title = column.footer().textContent;
 
                // Create input element and add event listener
                $('<input type="text" placeholder="검색 ' + title + '" />')
                    .appendTo($(column.footer()).empty())
                    .on('keyup change clear', function () {
                        if (column.search() !== this.value) {
                            column.search(this.value).draw();
                        }
                    });
            });
    },
});
