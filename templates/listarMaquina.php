<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- Meta tags Obrigatórias -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <nav class="navbar navbar-expand navbar-dark" style="background-color: #215E21;">
            <a class="navbar-brand" href="/maquinas/listar">Lista de Máquinas</a>

            <div class="" id="conteudoNavbarSuportado">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">Inicio<span class="sr-only"></span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/turnos/listar">Turnos</a>
                    </li>
                </ul>
            </div>
        </nav>
    </head>
    <body>
        <div class="container">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Descrição</th>
                        <th scope="col">Capacidade Nominal</th>
                        <th scope="col">Escala de Capacidade</th>
                        <th scope="col">Unidade</th>
                        <th scope="col">Setor</th>
                        <th scope="col">Timeout de Produção</th>
                        <th scope="col">Ações</th>
                        <th scope="col"><button type="button" class="cadastrar btn btn-success">Adicionar <i class="fas fa-plus"></button></th>
                    </tr>
                </thead>
                <tbody>
                    <script>
                        var meuObj = new Object();
                        meuObj = {{dados}};
                        console.log(meuObj)
                        for(x in meuObj){
                            document.write('<tr method="POST">');
                            document.write('<th scope="row" class="id">'+meuObj[x].id+'</th>');
                            document.write('<td>'+meuObj[x].descricao+'</td>');
                            document.write('<td>'+meuObj[x].capacidadeNominal+'</td>');
                            document.write('<td>'+meuObj[x].escalaCapacidade+'</td>');
                            document.write('<td>'+meuObj[x].unidade+'</td>');
                            document.write('<td>'+meuObj[x].setor+'</td>');
                            document.write('<td>'+meuObj[x].timeoutProducao+'</td>');
                            document.write('<td><button class="iStatusVerde btn btn-warning btn-lg">  <i class="far fa-edit"></i></button></td>');
                            document.write('<td><button class="confirmar btn btn-danger btn-lg">  <i class="fas fa-trash-alt"></i></button></td>');
                            document.write('</tr>');
                        }
                    </script>
                </tbody>
            </table>
        </div>
    </body>
</html>

<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>   
<script>
$(".iStatusVerde").click(function() {
                            var valor = $(this).parent().parent().find('.id');
                            console.log(valor.html());
                            window.open("/maquinas/editar/"+valor.html(), "_self");
                        });

$(".iStatusVermelho").click(function() {
                            var valor = $(this).parent().parent().find('.id');
                            console.log(valor.html());
                            window.open("/maquinas/listar/"+valor.html(), "_self");
                        });

$(".cadastrar").click(function() {
                            window.open("/maquinas/cadastro", "_self");
                        });
                        

$(".confirmar").click(function(){
                            var valor = $(this).parent().parent().find('.id');
                            var r=window.confirm("Tem certeza que deseja excluir a máquina " + valor.html());
                            if (r==true){
                                console.log(valor.html());
                                window.open("/maquinas/listar/"+valor.html(), "_self");
                            } else {
                                console.log("Recusou");
                            }
                            });
</script>