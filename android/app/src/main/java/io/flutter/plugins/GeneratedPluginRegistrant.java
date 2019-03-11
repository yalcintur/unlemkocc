package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import io.github.ponnamkarthik.flutteryoutube.FlutterYoutubePlugin;
import io.flutter.plugins.pathprovider.PathProviderPlugin;
import com.example.pdfviewerplugin.PdfViewerPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    FlutterYoutubePlugin.registerWith(registry.registrarFor("io.github.ponnamkarthik.flutteryoutube.FlutterYoutubePlugin"));
    PathProviderPlugin.registerWith(registry.registrarFor("io.flutter.plugins.pathprovider.PathProviderPlugin"));
    PdfViewerPlugin.registerWith(registry.registrarFor("com.example.pdfviewerplugin.PdfViewerPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}