import './video.dart';
class VideoDao {

  static final List<Video> videos = [
    const Video(
      id: "1",
      title: "Muratla Akmacalar",
      desc: "Aqtık",
      link: "url",
      seen: "240",
     
    ),
    const Video(
      id: "2",
      title: "Yalçınla Akmacalar",
      desc: "Aqtık",
      link: "url",
      seen: "240",
     
    ),
    const Video(
      id: "3",
      title: "Babamla Akmacalar",
      desc: "Aqtık",
      link: "url",
      seen: "240",
     
    ),
    const Video(
      id: "4",
      title: "Zeyeple Akmacalar",
      desc: "Aqtık",
      link: "url",
      seen: "240",
     
    ),
    const Video(
      id: "5",
      title: "Fakoyla Akmacalar",
      desc: "Aqtık",
      link: "url",
      seen: "240",
     
    ),
  ];

  static Video getvideobyid(id) {
    return videos
        .where((p) => p.id == id)
        .first;
  }
}