package com.ironSource.ironsource_mediation

import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import com.ironsource.mediationsdk.ads.nativead.LevelPlayMediaView
import com.ironsource.mediationsdk.ads.nativead.LevelPlayNativeAd
import com.ironsource.mediationsdk.ads.nativead.NativeAdLayout
import io.flutter.plugin.common.BinaryMessenger

/**
 * Factory class for creating instances of LevelPlayNativeAdView with build-in templates.
 * This factory is responsible for creating instances of LevelPlayNativeAdView and bind their views
 * to the native ad created. The class extend LevelPlayFactoryView which handles the native ad logic
 * and expose only the method bindNativeAdToView for controlling the view.
 *
 * @param levelPlayBinaryMessenger The binary messenger used for communication between Flutter and native code.
 */
class LevelPlayNativeAdViewFactoryTemplate(
    private var levelPlayBinaryMessenger: BinaryMessenger,
): LevelPlayNativeAdViewFactory(levelPlayBinaryMessenger) {
    override fun bindNativeAdToView(nativeAd: LevelPlayNativeAd?, nativeAdLayout: NativeAdLayout) {
        // Extract views
        val titleView = nativeAdLayout.findViewById<TextView>(R.id.adTitle)
        val bodyView = nativeAdLayout.findViewById<TextView>(R.id.adBody)
        val advertiserView = nativeAdLayout.findViewById<TextView>(R.id.adAdvertiser)
        val callToActionView = nativeAdLayout.findViewById<Button>(R.id.adCallToAction)
        val iconView = nativeAdLayout.findViewById<ImageView>(R.id.adAppIcon)
        val mediaView: LevelPlayMediaView? = nativeAdLayout.findViewById(R.id.adMedia)

        // Bind native ad to view
        if (nativeAd != null) {
            if (nativeAd.title != null) {
                titleView.text = nativeAd.title
                nativeAdLayout.setTitleView(titleView)
            }

            if (nativeAd.body != null) {
                bodyView.text = nativeAd.body
                nativeAdLayout.setBodyView(bodyView)
            }

            if (nativeAd.advertiser != null) {
                advertiserView.text = nativeAd.advertiser
                nativeAdLayout.setAdvertiserView(advertiserView)
            }

            if (nativeAd.callToAction != null) {
                callToActionView.text = nativeAd.callToAction
                nativeAdLayout.setCallToActionView(callToActionView)
            }

            if (nativeAd.icon != null) {
                iconView!!.setImageDrawable(nativeAd.icon!!.drawable)
                nativeAdLayout.setIconView(iconView)
            }

            if (mediaView != null) {
                nativeAdLayout.setMediaView(mediaView)
            }

            nativeAdLayout.registerNativeAdViews(nativeAd)
        }
    }
}