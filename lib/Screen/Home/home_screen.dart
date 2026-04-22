import 'package:flutter/material.dart';
import 'package:youtube_liteee/Screen/youtube/youtube_screen.dart';
import 'package:youtube_liteee/core/constants/app_color.dart';
import 'package:youtube_liteee/core/constants/app_string.dart';
import 'package:youtube_liteee/core/constants/youtube_url.dart';
import 'package:youtube_liteee/core1/widget/youtube_nav_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  void openUrl(String title,String url){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>YoutubeScreen(title: title, url: url)));
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 35,
              height: 25,
              decoration: BoxDecoration(
                color: AppColors.youtubePrimary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Center(
                child: Icon(Icons.play_arrow, color: Colors.white),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              AppStrings.appName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),

      // BODY
      body: ListView(
        children: [
          _buildSectionHeader(AppStrings.sectionBrowse),
          YoutubeNavTile(
            icon: Icons.home,
            label: AppStrings.navHome,
            onTap: () => openUrl(AppStrings.navHome, YoutubeUrls.home ),
          ),

          YoutubeNavTile(
            icon: Icons.slideshow,
            label: AppStrings.navShorts,
            onTap: () => openUrl(AppStrings.navShorts, YoutubeUrls.shorts ),
          ),

          YoutubeNavTile(
            icon: Icons.subscriptions,
            label: AppStrings.navSubscriptions,
            onTap: () => openUrl(AppStrings.navSubscriptions, YoutubeUrls.subscriptions ),
          ),

          YoutubeNavTile(
            icon: Icons.explore,
            label: AppStrings.navExplore,
            onTap: () => openUrl(AppStrings.navExplore, YoutubeUrls.explore ),
          ),

          YoutubeNavTile(
            icon: Icons.trending_up,
            label: AppStrings.navTrending,
            onTap: () => openUrl(AppStrings.navTrending, YoutubeUrls.trending ),
          ),


          _buildSectionHeader(AppStrings.sectionLibrary),

          YoutubeNavTile(
            icon: Icons.history,
            label: AppStrings.navHistory,
            onTap: () => openUrl(AppStrings.navHistory, YoutubeUrls.history ),
          ),

          YoutubeNavTile(
            icon: Icons.watch_later,
            label: AppStrings.navWatchLater,
            onTap: () => openUrl(AppStrings.navWatchLater, YoutubeUrls.watchLater ),
          ),

          YoutubeNavTile(
            icon: Icons.thumb_up,
            label: AppStrings.navLikedVideos,
            onTap: () => openUrl(AppStrings.navLikedVideos, YoutubeUrls.likedVideos ),
          ),

          _buildSectionHeader(AppStrings.sectionMore),
          YoutubeNavTile(
            icon: Icons.settings,
            label: AppStrings.navSettings,
            onTap: () => openUrl(AppStrings.navSettings, YoutubeUrls.settings ),
          ),

          YoutubeNavTile(
            icon: Icons.help,
            label: AppStrings.navHelp,
            onTap: () => openUrl(AppStrings.navHelp, YoutubeUrls.help ),
          ),


        ],
      ),
    );
  }

  // SECTION HEADER WIDGET
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,top: 15,bottom: 15),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.textHint,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}