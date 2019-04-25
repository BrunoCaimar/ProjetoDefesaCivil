<?php
    include 'database.php';
    
    $pesquisa_usuario = '';
    if(isset($_POST['pesquisa_usuario']))
        $pesquisa_usuario = $_POST['pesquisa_usuario'];

    $items_por_pagina = 10;
    $pagina = intval($_GET['n']);

    $consulta_usuarios = pg_query($connection, 
    "SELECT id_usuario,nome FROM usuario WHERE nome LIKE '%$pesquisa_usuario%' 
    LIMIT $items_por_pagina OFFSET $pagina") or die(preg_last_error());
    
    $numero_total = pg_num_rows(pg_query($connection, "SELECT id_usuario,nome FROM usuario"));
    $numero_de_paginas = ceil($numero_total / $items_por_pagina);
?>
<div class="container positioning">
    <div class="jumbotron">
        <div class="box">
            <form class="input-group" method="post">
                <input type="text" class="form-control" name="pesquisa_usuario" placeholder="Pesquisa" value="<?php echo $_POST['pesquisa_usuario']; ?>">
                <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
            </form>
        </div>    
        <?php
            $i = 0;
            while($linha = pg_fetch_array($consulta_usuarios, $i)){
                echo '<div class="box">';
                echo '<nav><span>ID: '.$linha['id_usuario'].'</span></nav>';
                echo '<nav><span>Nome: '.$linha['nome'].'</span></nav>';
                echo '</div>';
                $i += 1;
            }
        ?>
        <nav aria-label="Page navigation">
        <ul class="pagination">
            <li>
            <a href="index.php?pagina=consultarUsuario&n=0">
                <span>Inicio</span>
            </a>
            </li>
            <?php for($i=0; $i<$numero_de_paginas;$i++){ 
                $estilo = "";
                if($pagina == $i)
                    $estilo = 'class="active"';
            ?>
            <li <?php echo $estilo; ?> ><a href="index.php?pagina=consultarUsuario&n=<?php echo $i; ?>"><?php echo $i+1; ?></a></li>
            
            <li>
            <?php } ?>
            <a href="index.php?pagina=consultarUsuario&n=<?php echo $numero_de_paginas-1 ?>">
                <span>Fim</span>
            </a>
            
            </li>
        </ul>
        </nav>
    </div>
</div>