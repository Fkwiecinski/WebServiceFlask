<script>
    function PegarData(){
        mes = 0;
        dia = 0;
        data = new Date();
        if(data.getMonth()<9){
            mes = "0" + (data.getMonth()+1) + '-';
        }
        else{
            mes = (data.getMonth()+1) + '-';
        }
        if(data.getDate()<10){
            dia = '0' + data.getDate();
        }
        else{
            dia = data.getDate();
        }
        hoje = data.getFullYear() + '-' + mes + dia;
        return hoje;
    }
</script>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- Meta tags Obrigatórias -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

        <nav class="navbar navbar-expand navbar-dark" style="background-color: #215E21;">
            <a class="navbar-brand" href="/turnos/listar">Turnos</a>

            <div class="" id="conteudoNavbarSuportado">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">Inicio<span class="sr-only"></span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/maquinas/listar">Maquinas</a>
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
                        <th scope="col">Filtro</th>
                    </tr>
                </thead>
            </table>
            <form class="form-inline">
                <label class="mr-sm-2">Data:</label>
                <script>
                    document.write('<input type="date" name="bday" max="3000-12-31" min="1000-01-01" class="form-control mr-sm-4"  value="'+PegarData()+'">');
                </script>
                <label class="mr-sm-2">Maquina:</label>
                <select class="form-control mr-sm-5" name="maquina" id="maquina">
                    <option value="0">Todas</option>
                    <script>    
                        var meuObj = new Object();
                        meuObj = {{dadosMaquina}};
                        console.log(meuObj);
                        for(x in meuObj){
                            document.write('<option value="'+meuObj[x].id+'">'+meuObj[x].descricao+'</option>');
                        }
                    </script>    
                </select>
                <button btn type="submit" class="btn btn-success mr-sm-2">Pesquisar</button>
                <button btn type="button" class="limpar btn btn-warning">Limpar Filtro</button>
            </form>
            <br>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Adicionar turno</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <form class="form-inline">
                    <tr>
                        <td><label class="mr-sm-2">Inicio:</label></td> 
                        <td><label class="mr-sm-2">Data:</label></td>      
                        <td><script>
                            document.write('<input type="date" name="bdayIni" max="3000-12-31" min="1000-01-01" class="form-control mr-sm-4"  value="'+PegarData()+'">');
                        </script></td>
                        <td><label class="mr-sm-2">Hora:</label></td>
                        <td><input type="time" name="btimeIni" class="form-control mr-sm-4"></td>
                    </tr>
                    <tr>
                        <td><label class="mr-sm-2">Fim:</label></td>
                        <td><label class="mr-sm-2">Data:</label></td>
                        <td><script>
                            document.write('<input type="date" name="bdayFim" max="3000-12-31" min="1000-01-01" class="form-control mr-sm-4"  value="'+PegarData()+'">');
                        </script></td>
                        <td><label class="mr-sm-2">Hora:</label></td>
                        <td><input type="time" name="btimeFim" class="form-control mr-sm-4"></td>
                    </tr>
                    <tr>
                        <td></td><td><label class="mr-sm-2">Maquina:</label></td>
                        <td><select class="form-control mr-sm-5" name="maquina" id="maquina">
                            <option selected>Todas</option>
                            <script>    
                                var meuObj = new Object();
                                meuObj = {{dadosMaquina}};
                                console.log(meuObj);
                                for(x in meuObj){
                                    document.write('<option value="'+meuObj[x].id+'">'+meuObj[x].descricao+'</option>');
                                }
                            </script>
                        </select></td>
                        <td></td><td><button btn type="submit" class="btn btn-success">Adicionar</button></td>
                    </tr>
                </form>
            </table>
            <br>
            <table class="table table-striped table-hover">
            <script>
                var Turnos = new Object();
                var Maquina = new Object();
                Turnos = {{dadosTurnos}};
                Maquinas = {{dadosMaquina}};
                console.log(Turnos);
                console.log(Maquinas);
                for (x in Maquinas){ 
                    document.write('    <thead>');
                    document.write('       <tr>');
                    document.write('            <th scope="col" >'+Maquinas[x].descricao+'</th>');
                    document.write('            <th scope="col" >Inicio</th>');
                    document.write('            <th scope="col" >Fim</th>');
                    document.write('            <th scope="col" ></th>');
                    document.write('            <th scope="col" ></th>');
                    document.write('        </tr>');
                    document.write('    </thead>');
                    document.write('    <tbody>');
                            for(y in Turnos){
                    document.write('        <tr>');
                                if(Turnos[y].maquina == Maquinas[x].id){
                    document.write('                <td class="id" style="display:none;">'+Turnos[y].id+'</td><td></td>');
                    document.write('                <td>'+Turnos[y].inicio+'</td>');
                    document.write('                <td>'+Turnos[y].fim+'</td>');
                    document.write('                <td><button class="editar btn btn-warning mr-sm-2">Editar</button><button class="excluir btn btn-danger">Excluir</button></td>');
                                }
                    document.write('        </tr>');
                            }
                    document.write('    </tbody>');
                }
            </script>
            </table>
        </div>
    </body>
</html>


<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>   
<script>
$(".limpar").click(function() {
                            window.open("/turnos/listar", "_self");
                        });

$(".excluir").click(function(){
                            var valor = $(this).parent().parent().find('.id');
                            var r=window.confirm("Tem certeza que deseja excluir esse turno?");
                            if (r==true){
                                console.log(valor.html());
                                window.open("/turnos/listar/excluir/"+valor.html(), "_self");
                            } else {
                                console.log("Recusou");
                            }
                            });

$(".editar").click(function() {
                            var valor = $(this).parent().parent().find('.id');
                            console.log(valor.html());
                            window.open("/turnos/listar/editar/"+valor.html(), "_self");
                        });
</script>