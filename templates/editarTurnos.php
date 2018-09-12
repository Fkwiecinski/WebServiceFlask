<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- Meta tags Obrigatórias -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <nav class="navbar navbar-expand navbar-dark" style="background-color: #215E21;">
            <a class="navbar-brand" href="/">RMA</a>

            <div class="" id="conteudoNavbarSuportado">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">Inicio<span class="sr-only"></span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/maquina/listar">Maquina</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/turnos/listar">Turno</a>
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
                    var Turno = new Object();
                    Turno = {{dadosTurno}};
                    console.log(Turno);
                    document.write('<table class="table">');
                    document.write('    <thead>');
                    document.write('       <tr>');
                    document.write('            <th scope="col" >'+Turno[1].id+'</th>');
                    document.write('            <th scope="col" >Dia</th>');
                    document.write('            <th scope="col" >Hora</th>');
                    document.write('        </tr>');
                    document.write('    </thead>');
                    document.write('    <tbody>');
                    document.write('        <tr>');
                    document.write('                <td>Inicio</td>');
                    document.write('                <td class="id" style="display:none;">'+Turno[0].id+'</td>');
                    document.write('                <td><input type="date" max="3000-12-31" min="1000-01-01" name="inicioData" class="form-control mr-sm-4" value="'+Turno[0].inicioData+'"></td>');
                    document.write('                <td><input type="time" name="inicioHora" class="form-control mr-sm-4" value="'+Turno[0].inicioHora+'"></td>');
                    document.write('        </tr>');
                    document.write('        <tr>');
                    document.write('                <td>Fim</td>');
                    document.write('                <td><input type="date" max="3000-12-31" min="1000-01-01" name="fimData" class="form-control mr-sm-4" value="'+Turno[0].fimData+'"></td>');
                    document.write('                <td><input type="time" name="fimHora" class="form-control mr-sm-4" value="'+Turno[0].fimHora+'"></td>');
                    document.write('        </tr>');
                    document.write('    </tbody>');
                    document.write('</table>');
                </script>
                <br>
                <button type="submit" class="btn btn-primary" onclick="window.history.go(-2)">Concluir</button>
            </form>
        </div>
    </body>
</html>