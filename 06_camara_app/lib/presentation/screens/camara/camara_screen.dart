import 'package:camara_app/presentation/widgets/photo_preview.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

/// CameraApp is the Main Application.
class CamaraScreen extends StatefulWidget {
  /// Default Constructor
  const CamaraScreen({super.key, required this.cameras});
  final List<CameraDescription> cameras;

  @override
  State<CamaraScreen> createState() => _CamaraScreenState();
}

class _CamaraScreenState extends State<CamaraScreen> {
  CameraController? controller;
  bool cameraIsMounted = true;
  int selectedCameraIndex = 0;

  Future _initCameraController(CameraDescription cameraSelected) async {
    // if (controller != null) {
    //   await controller!.dispose();
    //   setState(() {
    //     cameraIsMounted = false;
    //   });
    // }
    controller = CameraController(cameraSelected, ResolutionPreset.max);

    controller!.addListener(() {
      if (mounted) {
        setState(() {
          cameraIsMounted = true;
        });
      }
      if (controller!.value.hasError) {
        print("Camera error ${controller!.value.errorDescription}");
      }
    });

    try {
      await controller!.initialize();
    } on CameraException catch (e) {
      String errorText = "Error ${e.code}\nError Message ${e.description}";
      print(errorText);
    }
  }

  @override
  void initState() {
    super.initState();
    _initCameraController(widget.cameras[selectedCameraIndex])
        .then((void v) {});
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          SizedBox.expand(
            child: !cameraIsMounted
                ? Container()
                : CameraPreview(
                    controller!,
                  ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.cameras
                    .map(
                      (e) => TextButton.icon(
                        onPressed: () {
                          setState(() {
                            selectedCameraIndex = int.parse(e.name);
                            _initCameraController(
                                widget.cameras[selectedCameraIndex]);
                          });
                        },
                        icon: const Icon(Icons.camera_alt_outlined),
                        label: Text(e.name),
                      ),
                    )
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () async {
                      controller!.takePicture().then((photoFile) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PhotoPreview(photoUrl: photoFile.path)));
                      });
                    },
                    child: const Text("Tomar foto"),
                  ),
                  // MaterialButton(
                  //   onPressed: () async {
                  //     await controller!.startVideoRecording();
                  //   },
                  //   child: const Text("Grabar"),
                  // ),
                  // MaterialButton(
                  //   onPressed: () async {
                  //     XFile video = await controller!.stopVideoRecording();
                  //     print(video.name);
                  //     print(video.path);
                  //   },
                  //   child: const Text("Grabar"),
                  // ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
