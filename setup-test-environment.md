# Setting Up a Test Environment for API

## Objective

Set up a test environment for the API on OpenShift that replicates the existing production database's schema and contents. The production database uses Crunchy Postgres Operator version 5.4.3 with Postgres version 15.

## Approach

### 1. **Review the Existing Environment**

1. **Production Database Details:**

   - **Operator:** Crunchy Postgres Operator 5.4.3
   - **Postgres Version:** 15
   - **Tables and Records:**
     - `housing`: 1.5 million rows
     - `housing_type`: 10 rows
     - `ownership`: 1.75 million rows
     - `owners`: 1.25 million rows
2. **ER Diagram Analysis:**

   - **Tables and Relationships:**
     - `housing_type` (1:M with `housing`)
     - `housing` (1:M with `ownership`)
     - `ownership` (M:1 with `owners`)

### 2. **Prepare the Test Environment**

1. **Provision the Test Database:**

   - **Namespace:** Ensure that the namespace in OpenShift for the test environment is correctly set up.
   - **Database Instance:** Deploy a PostgreSQL instance using Crunchy Postgres Operator in the test namespace. Ensure it matches the version (Postgres 15) used in production.
2. **Database Schema Setup:**

   - Create the tables (`housing`, `housing_type`, `ownership`, `owners`) with the same schema as the production database. Use the ER diagram to ensure accuracy.
   - Define foreign key constraints according to the relationships described.

### 3. **Data Migration and Setup**

1. **Extract Data from Production:**

   - Use PostgreSQL tools (e.g., `pg_dump`, `pg_restore`) or custom scripts to extract data from the production database.
   - For large datasets, consider using data dumps or incremental backups.
2. **Load Data into Test Database:**

   - **Initial Setup:**
     - Import the schema into the test database.
     - Load sample data for `housing_type`, `ownership`, and `owners` tables.
   - **Data Migration:**
     - Due to the large size of the data, use efficient methods to load the data into the test database. Tools like `pg_bulkload` or parallelized data loading scripts might be necessary.

### 4. **Verification and Validation**

1. **Verify Data Integrity:**

   - Ensure that the data in the test environment accurately reflects the production environment. Check row counts and data consistency.
2. **Test Functionality:**

   - Run tests against the API to ensure that it operates correctly with the test database. Validate that the data interactions (e.g., queries, joins) work as expected.
3. **Performance Testing:**

   - Given the volume of data, perform performance tests to ensure that the test environment can handle the load and that queries perform efficiently.

### 5. **Documentation and Maintenance**

1. **Document the Setup:**

   - Provide detailed documentation of the setup process, including how data was migrated and any configurations or scripts used.
2. **Regular Updates:**

   - Plan for regular updates to the test environment to keep it in sync with production data, if necessary.
