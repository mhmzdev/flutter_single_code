import 'package:flutter_single_code/models/task.dart';
import 'package:flutter_single_code/models/category.dart';

// Work Tasks
final List<Task> workTasks = [
  Task(
    id: 1,
    title: "Complete Flutter project setup",
    description:
        "Set up the basic Flutter project structure with proper routing and state management",
    createdAt: DateTime(2024, 1, 15, 9, 0),
    completed: true,
  ),
  Task(
    id: 2,
    title: "Design app UI mockups",
    description:
        "Create wireframes and mockups for the main screens of the task management app",
    createdAt: DateTime(2024, 1, 16, 14, 30),
    completed: false,
  ),
  Task(
    id: 3,
    title: "Implement user authentication",
    description:
        "Add login and registration functionality with proper validation",
    createdAt: DateTime(2024, 1, 17, 10, 15),
    completed: false,
  ),
  Task(
    id: 4,
    title: "Write unit tests",
    description:
        "Create comprehensive unit tests for all major components and business logic",
    createdAt: DateTime(2024, 1, 20, 13, 10),
    completed: false,
  ),
  Task(
    id: 5,
    title: "Deploy to app stores",
    description:
        "Prepare and submit the app to Google Play Store and Apple App Store",
    createdAt: DateTime(2024, 1, 21, 15, 0),
    completed: false,
  ),
  Task(
    id: 6,
    title: "Code review meeting",
    description:
        "Review pull requests and discuss implementation approaches with team",
    createdAt: DateTime(2024, 1, 22, 10, 30),
    completed: false,
  ),
];

// Personal Tasks
final List<Task> personalTasks = [
  Task(
    id: 7,
    title: "Go for morning run",
    description:
        "Complete 5km morning run in the local park to maintain fitness",
    createdAt: DateTime(2024, 1, 15, 6, 30),
    completed: true,
  ),
  Task(
    id: 8,
    title: "Read 30 pages of book",
    description:
        "Continue reading 'Clean Code' by Robert Martin - current chapter on functions",
    createdAt: DateTime(2024, 1, 16, 20, 0),
    completed: false,
  ),
  Task(
    id: 9,
    title: "Call parents",
    description: "Weekly check-in call with parents to catch up on family news",
    createdAt: DateTime(2024, 1, 17, 18, 0),
    completed: true,
  ),
  Task(
    id: 10,
    title: "Grocery shopping",
    description:
        "Buy groceries for the week including vegetables, fruits, and essentials",
    createdAt: DateTime(2024, 1, 18, 16, 0),
    completed: false,
  ),
  Task(
    id: 11,
    title: "Plan weekend trip",
    description:
        "Research and book accommodations for upcoming weekend getaway",
    createdAt: DateTime(2024, 1, 19, 19, 30),
    completed: false,
  ),
  Task(
    id: 12,
    title: "Organize workspace",
    description: "Clean and organize home office desk and filing system",
    createdAt: DateTime(2024, 1, 20, 14, 0),
    completed: false,
  ),
  Task(
    id: 13,
    title: "Practice guitar",
    description:
        "Practice new chord progressions and work on fingerpicking technique",
    createdAt: DateTime(2024, 1, 21, 17, 0),
    completed: false,
  ),
];

// Health & Fitness Tasks
final List<Task> healthTasks = [
  Task(
    id: 14,
    title: "Drink 8 glasses of water",
    description:
        "Maintain proper hydration by drinking at least 8 glasses of water throughout the day",
    createdAt: DateTime(2024, 1, 15, 8, 0),
    completed: true,
  ),
  Task(
    id: 15,
    title: "Yoga session",
    description:
        "Complete 30-minute morning yoga routine focusing on flexibility and mindfulness",
    createdAt: DateTime(2024, 1, 16, 7, 0),
    completed: false,
  ),
  Task(
    id: 16,
    title: "Meal prep for the week",
    description:
        "Prepare healthy meals for Monday through Friday including proteins and vegetables",
    createdAt: DateTime(2024, 1, 17, 15, 0),
    completed: false,
  ),
  Task(
    id: 17,
    title: "Take vitamins",
    description:
        "Remember to take daily multivitamin and vitamin D supplements",
    createdAt: DateTime(2024, 1, 18, 8, 30),
    completed: true,
  ),
  Task(
    id: 18,
    title: "Evening walk",
    description:
        "Take a relaxing 20-minute walk around the neighborhood after dinner",
    createdAt: DateTime(2024, 1, 19, 19, 0),
    completed: false,
  ),
];

// Categories with their respective tasks
final List<Category> mockCategories = [
  Category(
    id: 1,
    name: "Work",
    tasks: workTasks,
  ),
  Category(
    id: 2,
    name: "Personal",
    tasks: personalTasks,
  ),
  Category(
    id: 3,
    name: "Health & Fitness",
    tasks: healthTasks,
  ),
];

// Legacy list for backward compatibility
final List<Task> mockTasks = [
  ...workTasks,
  ...personalTasks,
  ...healthTasks,
];
