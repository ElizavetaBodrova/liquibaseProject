package ru.bodrova;

import liquibase.Liquibase;
import liquibase.database.jvm.JdbcConnection;
import liquibase.resource.ClassLoaderResourceAccessor;
import liquibase.resource.ResourceAccessor;
import oracle.jdbc.pool.OracleDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) throws SQLException {
        OracleDataSource ds = new OracleDataSource();
        ds.setURL("jdbc:oracle:thin:@//localhost:1521/orclpdb1");
        ds.setUser("simpleUser");
        ds.setPassword("app");
        String changelogFilePath = "liquibase/changelog-master.xml";
        //Or FileSystemResourceAccessor
        ResourceAccessor resourceAccessor = new ClassLoaderResourceAccessor();

        try (Connection con = ds.getConnection()) {
                JdbcConnection connection = new JdbcConnection(con);
                Liquibase liquibase = new Liquibase(changelogFilePath, resourceAccessor, connection);
                liquibase.update("main");
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
    }
}
