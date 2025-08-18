# Responsive Architecture Documentation

## Overview

This Flutter application implements a sophisticated responsive design pattern that separates UI presentation from business logic. The architecture allows the same screen to display different layouts based on device screen size while maintaining shared state and functionality.

## Core Components

### 1. Responsive Widget (`lib/services/responsive.dart`)

The `Responsive` widget is the foundation of our responsive system. It uses Bootstrap-inspired breakpoints to determine which UI layout to display.

#### Breakpoints

```dart
static bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < 576;

static bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width >= 576 &&
    MediaQuery.of(context).size.width < 768;

static bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 768;
```

- **Mobile**: < 576px width
- **Tablet**: 576px - 767px width  
- **Desktop**: ≥ 768px width

#### Usage Pattern

```dart
Responsive(
  mobile: _Mobile(),    // Widget for mobile screens
  tablet: _Tablet(),    // Widget for tablet screens  
  desktop: _Desktop(),  // Widget for desktop screens
)
```

### 2. Screen Architecture Pattern

Each screen in the application follows a consistent structure that promotes code reusability and maintainability.

## Case Study: Tasks Screen (`lib/screens/tasks/`)

The Tasks screen demonstrates the power of this responsive architecture:

### File Structure
```
tasks/
├── tasks.dart           # Main screen entry point
├── _state.dart          # Shared state management
├── views/
│   ├── _desktop.dart    # Desktop-specific UI
│   ├── _mobile.dart     # Mobile-specific UI
│   └── _tablet.dart     # Tablet-specific UI
└── widgets/
    ├── _categories_list.dart
    ├── _task_details.dart
    └── _tasks_list.dart
```

### Shared State Management

The `_ScreenState` class in `_state.dart` contains all the business logic and state that is shared across all device layouts:

```dart
class _ScreenState extends ChangeNotifier {
  // Service locator method for easy access
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  // Shared state variables
  Category category = mockCategories.first;
  Task? currentTask;
  
  // Shared business logic methods
  void setCategory(Category category) {
    this.category = category;
    notifyListeners();
  }

  void setCurrentTask(Task? task) {
    currentTask = task;
    notifyListeners();
  }

  void addTask(String title) {
    final task = Task(
      id: Random().nextInt(1000000),
      title: title,
      completed: false,
      createdAt: DateTime.now(),
    );
    category.tasks.add(task);
    notifyListeners();
  }

  void updateCurrentTask(String title, String? description, [bool? completed]) {
    currentTask = currentTask?.copyWith(
      title: title,
      description: description,
      completed: completed,
    );
    final index = category.tasks.indexWhere((t) => t.id == currentTask?.id);
    if (index != -1) {
      category.tasks[index] = currentTask!;
    }
    notifyListeners();
  }
}
```

**Key Benefits:**
- ✅ **Single Source of Truth**: All devices share the same data and business logic
- ✅ **Consistent Behavior**: Actions perform the same regardless of device
- ✅ **Easy Maintenance**: Bug fixes and features update all platforms simultaneously

### Device-Specific UI Implementations

Each view file contains only UI layout code tailored for that device category:

#### Desktop View (`views/_desktop.dart`)
```dart
class _Desktop extends StatelessWidget {
  const _Desktop();

  @override
  Widget build(BuildContext context) {
    return Screen(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _CategoriesList()),
          Expanded(flex: 2, child: _TasksList()),
          Expanded(child: _TaskDetails()),
        ],
      ),
    );
  }
}
```

#### Tablet View (`views/_tablet.dart`)
```dart
class _Tablet extends StatelessWidget {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    final currentTask = screenState.currentTask;
    return Screen(
      endDrawer: Drawer(
        child: currentTask == null
            ? null
            : _TaskDetailsForm(
                task: currentTask,
              ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _CategoriesList()),
          Expanded(flex: 2, child: _TasksList()),
        ],
      ),
    );
  }
}
```

#### Mobile View (`views/_mobile.dart`)
```dart
class _Mobile extends StatelessWidget {
  const _Mobile();

  @override
  Widget build(BuildContext context) {
    return Screen(
      bottomBar: true,
      drawer: Drawer(
        child: SafeArea(child: _CategoriesList()),
      ),
      body: SafeArea(child: _TasksList()),
    );
  }
}
```

## Architecture Benefits

### 1. **Shared State, Different Presentations**
- The same `_ScreenState` instance is provided to all device views
- Data fetching, filtering, and manipulation logic is written once
- UI layouts are optimized for each device category

### 2. **Responsive Layout Strategies**

| Device | Layout Strategy | UI Pattern |
|--------|----------------|------------|
| **Desktop** | Multi-column layout | Categories + Tasks + Details (3 columns) |
| **Tablet** | Two-column with drawer | Categories + Tasks with drawer details (2 columns) |
| **Mobile** | Single view with drawer | Tasks with categories drawer and modal details |

### 3. **Code Reusability**
```dart
// Shared widgets used across all device types
part 'widgets/_categories_list.dart';  // Used by all devices
part 'widgets/_task_details.dart';     // Used by all devices  
part 'widgets/_tasks_list.dart';       // Used by all devices
```

### 4. **State Provider Pattern**
```dart
// Main screen setup
class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _ScreenState(),  // Single state instance
      child: Responsive(
        mobile: _Mobile(),    // All access same state
        tablet: _Tablet(),    // via Consumer widgets
        desktop: _Desktop(),
      ),
    );
  }
}
```

## Implementation Guidelines

### 1. **Creating a New Responsive Screen**

```dart
// 1. Create main screen file
class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _ScreenState(),
      child: Responsive(
        mobile: _Mobile(),
        tablet: _Tablet(), 
        desktop: _Desktop(),
      ),
    );
  }
}

// 2. Create shared state
class _ScreenState extends ChangeNotifier {
  // Shared data and logic here
}

// 3. Create device-specific views
// views/_desktop.dart, _mobile.dart, _tablet.dart
```

### 2. **Best Practices**

#### ✅ **Do:**
- Keep all business logic in the shared state class
- Use `Consumer` widgets to access state in UI files
- Design layouts that make sense for each device category
- Share common widgets between device views
- Use meaningful breakpoints that align with your design

#### ❌ **Don't:**
- Put business logic in view files
- Duplicate state management across device views
- Create device-specific widgets that could be shared
- Ignore the natural interaction patterns of each device type

### 3. **State Management Patterns**

#### Service Locator Pattern
```dart
// Access state using the service locator method
final screenState = _ScreenState.s(context, true); // listen: true
final category = screenState.category;
final currentTask = screenState.currentTask;
```

#### Selector Pattern for Optimized Rebuilds
```dart
// Only rebuild when specific state changes
Selector<_ScreenState, Task?>(
  selector: (context, state) => state.currentTask,
  builder: (context, task, child) {
    if (task == null) return const SizedBox.shrink();
    return _TaskDetailsForm(task: task);
  },
)
```

#### Task Details Widget Example
```dart
class _TaskDetailsForm extends StatefulWidget {
  final Task task;
  const _TaskDetailsForm({required this.task});

  @override
  State<_TaskDetailsForm> createState() => _TaskDetailsFormState();
}

class _TaskDetailsFormState extends State<_TaskDetailsForm> {
  late final TextEditingController _titleController;
  
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    
    _titleController.addListener(() {
      final screenState = _ScreenState.s(context);
      screenState.updateCurrentTask(
        _titleController.text,
        widget.task.description,
      );
    });
  }
  
  // ... rest of implementation
}
```

## Performance Considerations

1. **Efficient Rebuilds**: Only UI components that depend on changed state will rebuild
2. **Lazy Loading**: Views are only built when the screen size matches their breakpoint
3. **Shared Widgets**: Common components are reused across device types
4. **Memory Efficiency**: Single state instance serves all device layouts
5. **Selector Optimization**: Use `Selector` widgets to rebuild only when specific state properties change

## Conclusion

This responsive architecture provides:
- **Consistency**: Shared state ensures uniform behavior across devices
- **Flexibility**: Each device gets an optimized UI experience  
- **Maintainability**: Changes to business logic automatically apply everywhere
- **Scalability**: Easy to add new device categories or modify existing ones
- **Developer Experience**: Clear separation of concerns and predictable patterns

The pattern scales well as your application grows and provides a solid foundation for building truly responsive Flutter applications that work great on any device size.
