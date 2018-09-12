<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- Meta tags Obrigatórias -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <nav class="navbar navbar-expand navbar-dark" style="background-color: #215E21;">
            <a class="navbar-brand" href="">Editor de Máquina</a>

            <div class="" id="conteudoNavbarSuportado">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">Inicio<span class="sr-only"></span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/maquinas/listar">Listar</a>
                    </li>
                </ul>
            </div>
        </nav>
    </head>
    <body>
        <div class="container">
            <br>
            <form method="POST">
                <script>
                    var meuObj = new Object();
                    meuObj = {{dados}};
                    console.log(meuObj[0].id);
                    document.write('<div class="form-group">');
                    document.write('<label>ID</label>');
                    document.write('<input class="form-control" readonly name="id" id="id" value="'+meuObj[0].id+'">');
                    document.write('</div>');
                    document.write('<div class="form-group">');
                    document.write('<label>Breve descrição da máquina</label>');
                    document.write('<input type="text" class="form-control" name="descricao" id="descricao" value="'+meuObj[0].descricao+'">');
                    document.write('</div>');
                    document.write('<div class="form-group">');
                    document.write('<label>Capacidade Nominal</label>');
                    document.write('<input type="number" class="form-control" name="capacidadeNominal" id="capacidadeNominal" value="'+meuObj[0].capacidadeNominal+'">');
                    document.write('<div class="form-group">');
                    document.write('<label>Escala de Capacidade</label>');
                    document.write('<input type="number" class="form-control" name="escalaCapacidade" id="escalaCapacidade" value="'+meuObj[0].escalaCapacidade+'">');
                    document.write('<div class="form-group">');
                    document.write('<label>Unidade</label>');
                    document.write('<input type="text" class="form-control" name="unidade" id="unidade" value="'+meuObj[0].unidade+'">');
                    document.write('<div class="form-group">');
                    document.write('<label>Setor</label>');
                    document.write('<input type="text" class="form-control" name="setor" id="setor" value="'+meuObj[0].setor+'">');
                    document.write('<div class="form-group">');
                    document.write('<label>Timeout de Produção</label>');
                    document.write('<input type="number" class="form-control" name="timeoutProducao" id="timeoutProducao" value="'+meuObj[0].timeoutProducao+'">');
                </script>
                <br>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </body>
</html>