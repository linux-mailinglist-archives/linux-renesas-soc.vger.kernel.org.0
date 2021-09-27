Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 023A9419648
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Sep 2021 16:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234754AbhI0O2L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Sep 2021 10:28:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:36674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234706AbhI0O2K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Sep 2021 10:28:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4AE646108E;
        Mon, 27 Sep 2021 14:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632752792;
        bh=y6jw05z4kqvX74jByJ76pgtBYsAxaKJp1OXc0rrAQIA=;
        h=From:To:Cc:Subject:Date:From;
        b=st7NCBdKMvzmR5kG/s+a8GNTFBZzte2stbYbwFXbYrwvJ4bECDw5i5UWoNRkBtAhm
         jzIzmSta6cC76Ae1SEynZxETxkJoRj8JOv06Ar8C6+DkRCM6gzkARLSCg/ftCU9TZU
         3oUPnRFKzOreNeJ00YBDYyzNIyJf209giWOj+ptLISUsIJHjbDte9l9Lzn8joT2HxW
         8t+2hCTpMJWNJBlmD8P6rArks9eDltTDHJQg2VyJ+YwcwZzJTIKEOeKg4yePws5HHE
         x2XGgC07NMqVextP59WHXN9Ads+PSxtmwNou/1Tu2b1RdFpd8QVuv9UL0LkdbRRfi9
         DeZVUHFQLlfOA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [RESEND] drm/rcar: stop using 'imply' for dependencies
Date:   Mon, 27 Sep 2021 16:26:23 +0200
Message-Id: <20210927142629.2016647-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The meaning of the 'imply' keyword has changed recently, and neither the
old meaning (select the symbol if its dependencies are met) nor the new
meaning (enable it by default, but let the user set any other setting)
is what we want here.

Work around this by adding two more Kconfig options that lead to
the correct behavior: if DRM_RCAR_USE_CMM and DRM_RCAR_USE_LVDS
are enabled, that portion of the driver becomes usable, and no
configuration results in a link error.

This avoids a link failure:

arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_begin':
rcar_du_crtc.c:(.text+0x1444): undefined reference to `rcar_cmm_setup'
arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
rcar_du_crtc.c:(.text+0x14d4): undefined reference to `rcar_cmm_enable'
arm-linux-gnueabi-ld: rcar_du_crtc.c:(.text+0x1548): undefined reference to `rcar_cmm_setup'
arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
rcar_du_crtc.c:(.text+0x18b8): undefined reference to `rcar_cmm_disable'
arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_kms.o: in function `rcar_du_modeset_init':

Link: https://lore.kernel.org/all/20200417155553.675905-5-arnd@arndb.de/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This was last posted as part of a longer series to rework the
DRM dependencies in a more logical way. The rest of the series
is still open, but this one is needed as a bug fix regardless of
the rest.
---
 drivers/gpu/drm/rcar-du/Kconfig | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index b47e74421e34..3e588ddba245 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -4,8 +4,6 @@ config DRM_RCAR_DU
 	depends on DRM && OF
 	depends on ARM || ARM64
 	depends on ARCH_RENESAS || COMPILE_TEST
-	imply DRM_RCAR_CMM
-	imply DRM_RCAR_LVDS
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
@@ -14,13 +12,17 @@ config DRM_RCAR_DU
 	  Choose this option if you have an R-Car chipset.
 	  If M is selected the module will be called rcar-du-drm.
 
-config DRM_RCAR_CMM
-	tristate "R-Car DU Color Management Module (CMM) Support"
-	depends on DRM && OF
+config DRM_RCAR_USE_CMM
+	bool "R-Car DU Color Management Module (CMM) Support"
 	depends on DRM_RCAR_DU
+	default DRM_RCAR_DU
 	help
 	  Enable support for R-Car Color Management Module (CMM).
 
+config DRM_RCAR_CMM
+	def_tristate DRM_RCAR_DU
+	depends on DRM_RCAR_USE_CMM
+
 config DRM_RCAR_DW_HDMI
 	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
 	depends on DRM && OF
@@ -28,15 +30,20 @@ config DRM_RCAR_DW_HDMI
 	help
 	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
 
+config DRM_RCAR_USE_LVDS
+	bool "R-Car DU LVDS Encoder Support"
+	depends on DRM_BRIDGE && OF
+	default DRM_RCAR_DU
+	help
+	  Enable support for the R-Car Display Unit embedded LVDS encoders.
+
 config DRM_RCAR_LVDS
-	tristate "R-Car DU LVDS Encoder Support"
-	depends on DRM && DRM_BRIDGE && OF
+	def_tristate DRM_RCAR_DU
+	depends on DRM_RCAR_USE_LVDS
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select OF_FLATTREE
 	select OF_OVERLAY
-	help
-	  Enable support for the R-Car Display Unit embedded LVDS encoders.
 
 config DRM_RCAR_VSP
 	bool "R-Car DU VSP Compositor Support" if ARM
-- 
2.29.2

