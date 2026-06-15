import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          final currentPlan = plans.firstWhere(
            (p) => p.name == widget.plan.name,
            orElse: () => widget.plan,
          );
          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    currentPlan.completenessMessage,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        final currentPlan = planNotifier.value.firstWhere(
          (p) => p.name == widget.plan.name,
          orElse: () => widget.plan,
        );
        final planIndex = planNotifier.value.indexOf(currentPlan);
        
        if (planIndex != -1) {
          final updatedTasks = List<Task>.from(currentPlan.tasks)..add(const Task());
          final updatedPlan = Plan(
            name: currentPlan.name,
            tasks: updatedTasks,
          );
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = updatedPlan;
        }
      },
    );
  }

  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index], index, context),
    );
  }

  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          final currentPlan = planNotifier.value.firstWhere(
            (p) => p.name == widget.plan.name,
            orElse: () => widget.plan,
          );
          final planIndex = planNotifier.value.indexOf(currentPlan);

          if (planIndex != -1) {
            final updatedTasks = List<Task>.from(currentPlan.tasks)
              ..[index] = Task(
                description: task.description,
                complete: selected ?? false,
              );
            final updatedPlan = Plan(
              name: currentPlan.name,
              tasks: updatedTasks,
            );
            planNotifier.value = List<Plan>.from(planNotifier.value)
              ..[planIndex] = updatedPlan;
          }
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          final currentPlan = planNotifier.value.firstWhere(
            (p) => p.name == widget.plan.name,
            orElse: () => widget.plan,
          );
          final planIndex = planNotifier.value.indexOf(currentPlan);

          if (planIndex != -1) {
            final updatedTasks = List<Task>.from(currentPlan.tasks)
              ..[index] = Task(
                description: text,
                complete: task.complete,
              );
            final updatedPlan = Plan(
              name: currentPlan.name,
              tasks: updatedTasks,
            );
            planNotifier.value = List<Plan>.from(planNotifier.value)
              ..[planIndex] = updatedPlan;
          }
        },
      ),
    );
  }
}
