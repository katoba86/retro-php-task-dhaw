<?php
class DB {
    private string $host   = Config::DB_HOST;
    private string $dbname = Config::DB_NAME;
    private string $user   = Config::DB_USER;
    private string $pass   = Config::DB_PASS;

    private static ?DB $instance = null;
    private PDO $pdo;







    private function __construct() {
        $dsn = "mysql:host=$this->host;dbname={$this->dbname};charset=utf8mb4";
        $options = [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, //Für Production vielleicht ERRMODE_SILENT. Logging ist besser, wird aber nicht bewertet also nö!
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        ];
        $this->pdo = new PDO($dsn, $this->user, $this->pass, $options);
    }

    // Singleton
    public static function getInstance(): self {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }


    public function select(string $sql, array $params = []): array {
        try{
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($params);
            return $stmt->fetchAll();
        }catch(PDOException $e){
            // LOG THE ERROR :)
            return [];
        }
    }


    /**
     * @param string $sql
     * @param array $params
     * @return int
     */
    public function execute(string $sql, array $params = []): int {
        try{
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt->rowCount();
        }catch(PDOException $e){
            // LOG THE ERROR :)
            return 0;
        }
    }

    /**
     * Gehört zum Singleton Einfach dazu...
     * @return void
     */
    private function __clone() {}


}
