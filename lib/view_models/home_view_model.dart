import 'package:booked_ai/models/deals_model.dart';
import 'package:booked_ai/repositories/deals_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class HomeViewModelNotifier extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final DealsRepository _repository;

  List<DealsModel> _deals = [];
  List<DealsModel> get deals => _deals;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool isScrollingUp = false;
  bool hasReachedTop = true;

  bool isVideoInitializing = false;

  double initialScrollOffset = 0.0;

  ScrollController? scrollController;

  ScrollController get controller => scrollController!;

  late VideoPlayerController _videoController;

  VideoPlayerController? get videoController => _videoController;

  HomeViewModelNotifier(this._repository) {
    fetchDeals();

    initializeVideo();

    scrollController = ScrollController(initialScrollOffset: initialScrollOffset);
    scrollController!.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController!.removeListener(_onScroll);
    scrollController!.dispose();
    _videoController.dispose();
    super.dispose();
  }

  Future<void> initializeVideo() async {
    isVideoInitializing = false;
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15%2F672049aa2301e32949611920_BA00005_9x16_DifferentAngleBookedAI-transcode.mp4'),
    );
    await _videoController.initialize().then((_) async {
      isVideoInitializing = true;
      _videoController.setVolume(0);
      _videoController.setLooping(true);

      _videoController.play();

      print('Video Player');
    });

    notifyListeners();
  }

  void togglePlayPause() {
    if (_videoController.value.isPlaying) {
      _videoController.pause();
    } else {
      _videoController.play();
    }
    notifyListeners();
  }

  // Fetch deals from Firestore
  Future<void> fetchDeals() async {
    print('Fetching Deals');
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _deals = await _repository.fetchDeals();
    } catch (e) {
      _errorMessage = 'Failed to load deals: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void scrolPos() {
    print('Deals Page');
    scrollController = ScrollController(initialScrollOffset: initialScrollOffset);
    scrollController!.addListener(_onScroll);
    notifyListeners();
  }

  void _onScroll() {
    if (scrollController!.position.userScrollDirection == ScrollDirection.forward) {
      // User is scrolling up
      isScrollingUp = false;
    } else if (scrollController!.position.userScrollDirection == ScrollDirection.reverse) {
      // User is scrolling down
      isScrollingUp = false;
    }

    // Detect if the user has reached the top edge
    if (scrollController!.position.pixels == 0) {
      hasReachedTop = true; // At the top
    } else {
      hasReachedTop = false; // Not at the top
    }

    initialScrollOffset = scrollController!.offset;

    notifyListeners();
  }
}

final dealsRepositoryProvider = Provider<DealsRepository>((ref) {
  return DealsRepository();
});

// Define the provider for DealsViewModelNotifier
final homeViewModelProvider = ChangeNotifierProvider<HomeViewModelNotifier>((ref) {
  final repository = ref.read(dealsRepositoryProvider);

  return HomeViewModelNotifier(repository);
});

// final videoControllerProvider = StateNotifierProvider<VideoControllerNotifier, VideoPlayerController?>(
//   (ref) => VideoControllerNotifier(),
// );

// class VideoControllerNotifier extends StateNotifier<VideoPlayerController?> {
//   VideoControllerNotifier() : super(null) {
//     initializeVideo();
//   }

//   Future<void> initializeVideo() async {
//     final controller = VideoPlayerController.networkUrl(
//       Uri.parse(
//           'https://cdn.prod.website-files.com/66135eefe155eff203cd2c15%2F672049aa2301e32949611920_BA00005_9x16_DifferentAngleBookedAI-transcode.mp4'),
//     );
//     await controller.initialize();
//     controller.setLooping(true);
//     controller.play();
//     state = controller;

//     print('Video Player');
//   }

//   @override
//   void dispose() {
//     state?.dispose();
//     super.dispose();
//   }
// }
