# Script Manager For Apple

## What

An application to manage your chaos shell commands

### Target

1. Fluent

2. Editable

3. Clever
## Technology

Native Mac OS Application
## Design
### DataModel
Store the persist data
#### Fields
1. script

2. group_name

3. is_favorite

4. usage_count

5. created_at

6. last_used_at

#### Operation
1. add

2. update

3. delete

### ViewModel

The user interface

#### Page

1. Grouping

2. Favorite

3. Recent
#### Filter

1. is favorite

2. in 10 days

### SystemModel

#### Clipboard
1. write to clipboard

2. listen at clipboard

#### Notification