# Centre de Bien-être FitTrack - Database Design

## Project Overview
The goal of this project is to design an efficient and well-structured database for managing the operations of the FitTrack Wellness Center. This database will support various functionalities, including the management of departments, trainers, members, training rooms, subscriptions, appointments, supplements, training programs, and administrative staff.

## Functional Description
The database is designed to meet the needs of a fitness center management system, ensuring the effective handling of data for the center's operations. It includes entities for:

- **Departments**: Different training zones.
- **Trainers**: Fitness instructors.
- **Members**: Clients of the wellness center.
- **Training Rooms**: Rooms where workouts occur.
- **Subscriptions**: Membership details.
- **Appointments**: Scheduled sessions with trainers.
- **Supplements**: Recommended products for members.
- **Training Programs**: Customized workout plans.
- **Administrative Staff**: Staff members handling operations.

## Database Design
The database schema includes several tables to manage the above entities. This design supports efficient data retrieval and is optimized for performance and scalability.

### Key Features:
- **CRUD Operations**: Manage data for members, trainers, subscriptions, etc.
- **Data Retrieval**: Select, filter, sort, and aggregate data for various use cases.
- **Constraints**: Ensure data integrity, such as unique emails and valid dates.
- **Joins**: Connect different entities to retrieve comprehensive information (e.g., appointments, trainers, members).
  
## SQL Queries
The project includes a set of SQL queries to demonstrate various operations on the database, including:
- Inserting new records (e.g., adding a new member).
- Filtering and sorting data (e.g., members born after 2000).
- Aggregating data (e.g., counting the number of trainers in each department).
- Advanced queries (e.g., handling joins for complex relationships).



