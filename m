Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3DC1AE1A5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 17:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbgDQP4u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 11:56:50 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:36869 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgDQP4t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 11:56:49 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MBDvU-1jXlsH3ZNe-00Cfzq; Fri, 17 Apr 2020 17:56:23 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     dri-devel@lists.freedesktop.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-fbdev@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Saeed Mahameed <saeedm@mellanox.com>, masahiroy@kernel.org,
        Laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@zonque.org, haojian.zhuang@gmail.com,
        robert.jarzmik@free.fr, daniel@ffwll.ch, marex@denx.de,
        stefan@agner.ch, linux-graphics-maintainer@vmware.com,
        thellstrom@vmware.com, jfrederich@gmail.com, dsd@laptop.org,
        geert@linux-m68k.org
Subject: [PATCH 3/8] fbdev: rework FB_DDC dependencies
Date:   Fri, 17 Apr 2020 17:55:48 +0200
Message-Id: <20200417155553.675905-4-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200417155553.675905-1-arnd@arndb.de>
References: <20200417155553.675905-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2U9gszbYbMjT+zyUR7sFhiOdIUZPycfMTKYG2cp0trTWIbAamkf
 JXJU/2QL4hsyz1HAy3tjg7sl9G8UVcB+oiwb7PUAAjXHy3WKwCoi6d78k/RIModYnifQMrp
 NyySFD2n64+7oJ5Hitx7uI7OtO2oWoFcEP8r3CP4qfi0rQ0dsXhJfAywuUalVLZtP61z0jC
 QSSwnzwbyzSCKvAQolKyg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XrTAd9lyPFM=:1wciv0hqbcjGrbjumwW/E7
 3WaLAFl1zx6dK+KQGgkXLYH3tLrf8+YGuDAuG9EU0rR+ga0chOOJYgsc/edXVBcei4DUtIVvR
 fZCYJtQCiFD3mPbtekRBtTW0hyGAyPSP5O7hKZLuIBu1u6rEJ8CiWaEwwstxzcMxBlWEg5eaM
 FmO7SBgN1t5+i/IR5iifChGTs7VkRIqhmbf6TDdsGZm8q5dUFGKSOePvJh/r/o675iGlZ+Q4S
 bW5n4+JEalu+krrSpEK+QIRmeUWjfdlQPxNfzoHa4F4st/lUBXDh156shwLr7w6vyUpjuH1Bb
 IuHNm7Aw4GLaS7fhq+yCiETnYncNZIteCKjaouYugDF3aBOqmb9MJ3DYyoVj3dZO/tj2u5YYG
 jOP8jx+1TX6r77BKMZTpWnhNqIrn7rUFsT+qR7HikkX3u51LSm6Uhfynf6uVNKzX4jp3RQOe5
 dcyBbB4LfBfYnXQRE3mQRLzsSzoGi+5j6Bezw1mDtIljapb+JnJogPxscRxgYMmECbTxt8jpj
 4ULLVU2RneJxVGYSbXwT8XuPW0uEEVRfqKFKthqUbDdnhgIi9CE8EG+MCtC0eWeGA0+wuSNQr
 Q9nvJSsgDd2pOnFzuc+zP8SbOhe0WmVoLY/DhX1+0vQgdgJR8BZ+JTSqecWkF2+c802ig1Gf/
 sxBYO8k2BVrMlFqAKXR4I5fo1N1hNtT4I0xPGaddsRs4GIbuH2jFHSvMKMaU3TYmDG2WMOcBr
 KbspylQfr/Yqm23y91sN6ltcQ1nFhl+4P3bWSNWQSX1+6Muf/l6WmXbJIbxC4lRavmsalbfqG
 z/RXI26Q0r2QuOs8WrZV6R9veTTOr5HUfdZ4MHkML1EniqZWe8=
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Selecting FB_DDC currently turns on CONFIG_I2C implicitly,
which is often not desired and can lead to circular dependencies.

Change this to a 'depends on' and change all drivers that
rely on FB_DDC to have an appropriate I2C dependency as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/Kconfig | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 91b0a719d221..bcf7834dbdbf 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -62,9 +62,8 @@ config FIRMWARE_EDID
 
 config FB_DDC
 	tristate
-	depends on FB
+	depends on FB && I2C
 	select I2C_ALGOBIT
-	select I2C
 
 config FB_BOOT_VESA_SUPPORT
 	bool
@@ -356,6 +355,7 @@ config FB_CYBER2000
 config FB_CYBER2000_DDC
 	bool "DDC for CyberPro support"
 	depends on FB_CYBER2000
+	depends on I2C=y || I2C=FB_CYBER2000
 	select FB_DDC
 	default y
 	help
@@ -892,6 +892,7 @@ config FB_NVIDIA
 config FB_NVIDIA_I2C
 	bool "Enable DDC Support"
 	depends on FB_NVIDIA
+	depends on I2C=y || I2C=FB_NVIDIA
 	select FB_DDC
 	help
 	  This enables I2C support for nVidia Chipsets.  This is used
@@ -938,6 +939,7 @@ config FB_RIVA
 config FB_RIVA_I2C
 	bool "Enable DDC Support"
 	depends on FB_RIVA
+	depends on I2C=y || I2C=FB_RIVA
 	select FB_DDC
 	help
 	  This enables I2C support for nVidia Chipsets.  This is used
@@ -965,7 +967,7 @@ config FB_RIVA_BACKLIGHT
 
 config FB_I740
 	tristate "Intel740 support"
-	depends on FB && PCI
+	depends on FB && PCI && I2C
 	select FB_MODE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
@@ -1019,6 +1021,7 @@ config FB_I810_GTF
 config FB_I810_I2C
 	bool "Enable DDC Support"
 	depends on FB_I810 && FB_I810_GTF
+	depends on I2C=y || I2C=FB_I810
 	select FB_DDC
 	help
 	  Add DDC/I2C support for i810fb.  This will allow the driver to get
@@ -1074,6 +1077,7 @@ config FB_INTEL_DEBUG
 config FB_INTEL_I2C
 	bool "DDC/I2C for Intel framebuffer support"
 	depends on FB_INTEL
+	depends on I2C=y || I2C=FB_INTEL
 	select FB_DDC
 	default y
 	help
@@ -1153,6 +1157,7 @@ config FB_MATROX_G
 config FB_MATROX_I2C
 	tristate "Matrox I2C support"
 	depends on FB_MATROX
+	depends on I2C=y || I2C=FB_MATROX
 	select FB_DDC
 	---help---
 	  This drivers creates I2C buses which are needed for accessing the
@@ -1218,6 +1223,7 @@ config FB_RADEON
 config FB_RADEON_I2C
 	bool "DDC/I2C for ATI Radeon support"
 	depends on FB_RADEON
+	depends on I2C=y || I2C=FB_RADEON
 	select FB_DDC
 	default y
 	help
@@ -1327,6 +1333,7 @@ config FB_S3
 config FB_S3_DDC
 	bool "DDC for S3 support"
 	depends on FB_S3
+	depends on I2C=y || I2C=FB_S3
 	select FB_DDC
 	default y
 	help
@@ -1352,6 +1359,7 @@ config FB_SAVAGE
 config FB_SAVAGE_I2C
 	bool "Enable DDC2 Support"
 	depends on FB_SAVAGE
+	depends on I2C=y || I2C=FB_SAVAGE
 	select FB_DDC
 	help
 	  This enables I2C support for S3 Savage Chipsets.  This is used
@@ -1491,6 +1499,7 @@ config FB_3DFX_ACCEL
 config FB_3DFX_I2C
 	bool "Enable DDC/I2C support"
 	depends on FB_3DFX
+	depends on I2C=y || I2C=FB_3DFX
 	select FB_DDC
 	default y
 	help
@@ -1530,7 +1539,7 @@ config FB_VT8623
 
 config FB_TRIDENT
 	tristate "Trident/CyberXXX/CyberBlade support"
-	depends on FB && PCI
+	depends on FB && PCI && I2C
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-- 
2.26.0

