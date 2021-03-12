/**
* @author ${author}
* @date ${date}
* @Description ${table_annotation}
*/
angular.module('corpsyslandApp')
.controller('${var_name}Controller' ,function ($scope, $location, $http) {

    /**
    * @author ${author}
    * @date ${date}
    * @Description 根据id查询${table_annotation}
    */
    ($scope.find${table_name}ByIds = function(ids){
        var config = {
            url: '/${var_name}/find${table_name}ByIds',
            method: 'GET',
            data: ids,
            params: null
        }
        $http(config).success(function(data){
            console.log(data);
            }).error(function(){
            console.log(data);
        });
    })();
});