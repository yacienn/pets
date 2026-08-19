import 'package:flutter/material.dart';
import 'package:pet/core/theme/colors.dart';
import 'package:pet/presentation/home/viewmodel/home_vm.dart';
import 'package:pet/widgets/animal_card.dart';
import 'package:pet/widgets/animal_type_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Provider isn't ready during initState's build phase, so defer to
    // after the first frame.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeVm>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    final HomeVm homevm = Provider.of<HomeVm>(context);
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      drawer: Drawer(
        backgroundColor: AppColors.primaryBackground,
      ),
      appBar: AppBar(
        title: const Text("Pets"),
        centerTitle: true,
        backgroundColor: AppColors.primaryBackground,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homevm.animalType.length,
                itemBuilder: (context, index) {
                  return AnimalTypeCard(animal: homevm.animalType[index]);
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "The recent Animals",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: homevm.animal.isEmpty
                  ? const Center(child: Text("No recent animals"))
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.85,
                      ),
                      itemCount: homevm.animal.length,
                      itemBuilder: (context, index) {
                        return AnimalCard(animal: homevm.animal[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}