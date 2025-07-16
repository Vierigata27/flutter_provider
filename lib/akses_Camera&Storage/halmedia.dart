import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class Halmedia extends StatefulWidget {
  const Halmedia({super.key});

  @override
  State<Halmedia> createState() => _HalmediaState();
}

class _HalmediaState extends State<Halmedia> {
  File? file;
  File? fileVideo;
  VideoPlayerController? videoPlayer;

  @override
  void initState() {
    super.initState();
    // Panggil pengecekan izin saat initState
    checkPermissions();
  }

  // ADDED: Metode dispose untuk melepaskan resource controller video
  @override
  void dispose() {
    videoPlayer?.dispose();
    super.dispose();
  }

  Future<void> pickMedia(bool isCamera, bool isVideo) async {
    final imagePicker = ImagePicker();

    // FIX: Logika pemilihan source (Camera/Gallery) sudah benar
    final source = isCamera ? ImageSource.camera : ImageSource.gallery;

    final XFile? pickedFile = isVideo
        ? await imagePicker.pickVideo(source: source)
        : await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      if (isVideo) {
        // Hapus video lama jika ada sebelum memutar yang baru
        await videoPlayer?.dispose();

        fileVideo = File(pickedFile.path);
        videoPlayer = VideoPlayerController.file(fileVideo!);

        // FIX: Tunggu inisialisasi selesai sebelum memutar video
        await videoPlayer!.initialize();
        setState(() {
          videoPlayer!.play();
          videoPlayer!.setLooping(true); // Agar video berulang
        });
      } else {
        setState(() {
          file = File(pickedFile.path);
        });
      }
    } else {
      print('Media tidak dipilih');
    }
  }

  // UPDATED: Menggunakan izin yang lebih modern
  Future<void> checkPermissions() async {
    // Meminta beberapa izin sekaligus
    await [
      Permission.camera,
      Permission.photos, // Untuk galeri gambar di Android 13+
      Permission.videos, // Untuk galeri video di Android 13+
      Permission.storage, // Fallback untuk Android versi lama
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Agar bisa di-scroll jika konten melebihi layar
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (file != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Image.file(file!),
                ),
              CardMedia(
                iconData: Icons.image_outlined,
                isVideo: false,
                onPressed: () => pickMedia(false, false),
                onPressedCamera: () => pickMedia(true, false),
              ),
              const SizedBox(height: 10),
              if (videoPlayer != null && videoPlayer!.value.isInitialized)
                Column(
                  children: [
                    AspectRatio(
                      aspectRatio: videoPlayer!.value.aspectRatio,
                      child: VideoPlayer(videoPlayer!),
                    ),
                    const SizedBox(height: 10),
                    // IMPROVEMENT: Tombol kontrol dalam satu baris
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FilledButton.icon(
                          onPressed: () => setState(() {
                            videoPlayer!.value.isPlaying ? videoPlayer!.pause() : videoPlayer!.play();
                          }),
                          icon: Icon(videoPlayer!.value.isPlaying ? Icons.pause : Icons.play_arrow),
                          label: Text(videoPlayer!.value.isPlaying ? 'Pause' : 'Play'),
                        ),
                        const SizedBox(width: 10),
                        FilledButton.icon(
                          onPressed: () {
                            // FIX: Reset state setelah dispose
                            setState(() {
                              videoPlayer?.dispose();
                              videoPlayer = null;
                            });
                          },
                          icon: const Icon(Icons.stop_circle_outlined),
                          label: const Text('Hapus'),
                          style: FilledButton.styleFrom(backgroundColor: Colors.red),
                        )
                      ],
                    ),
                  ],
                )
              else
                CardMedia(
                  iconData: Icons.videocam_outlined,
                  isVideo: true,
                  onPressed: () => pickMedia(false, true),
                  onPressedCamera: () => pickMedia(true, true),
                )
            ],
          ),
        ),
      ),
    );
  }
}


// Widget CardMedia tidak perlu diubah, sudah bagus
class CardMedia extends StatelessWidget {
  const CardMedia({
    super.key, required this.iconData,
    required this.isVideo, this.onPressed, this.onPressedCamera,
  });

  final IconData iconData;
  final bool isVideo;
  final Function()? onPressed;
  final Function()? onPressedCamera;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ]
      ),
      child: Column(
        children: [
          Icon(iconData, size: 60,),
          const SizedBox(height: 10),
          Text('Pilih ${isVideo ? 'Video' : 'Gambar'}'),
          const SizedBox(height: 20),
          FilledButton.icon(icon: const Icon(Icons.folder_open_outlined), onPressed: onPressed, label: const Text('Ambil dari Galeri')),
          const SizedBox(height: 10),
          FilledButton.icon(icon: const Icon(Icons.camera_alt_outlined), onPressed: onPressedCamera, label: const Text('Ambil dari Kamera'))
        ],
      ),
    );
  }
}