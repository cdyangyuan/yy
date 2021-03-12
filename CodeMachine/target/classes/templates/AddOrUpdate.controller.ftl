/**
* @author ${author}
* @date ${date}
* @Description ${table_annotation}
*/
angular.module('corpsyslandApp')
.controller('${var_name}AddOrUpdateController' ,function ($scope, $location, $http) {
    var urlParams={};
    var ids = $location.search().id !=null?Crypt.desEncrypt($location.search().id):null;

    $scope.detailInfo = {};
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
            $scope.detailInfo = data;
        }).error(function(){
            console.log(data);
        });
    })();

    /**
     * @author ${author}
     * @date ${date}
     * @Description 根据id查询${table_annotation}
     */
    ($scope.saveOrUpdate${table_name} = function(){
        var config = {
            url: '/${var_name}/saveOrUpdate${table_name}',
            method: 'POST',
            data: null,
            params: urlParams
        }
        $http(config).success(function(data){
            console.log(data);
        }).error(function(){
            console.log(data);
        });
    })();
});