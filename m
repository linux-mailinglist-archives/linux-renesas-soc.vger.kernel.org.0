Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C725744152E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Nov 2021 09:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbhKAIU2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Nov 2021 04:20:28 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:42566 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbhKAIU1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Nov 2021 04:20:27 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id AA8A821940;
        Mon,  1 Nov 2021 08:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1635754673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4EzLk3mwa187FL/XE7jeS9GSjupmN43r6Vq/C6Y2LPU=;
        b=yLm4gpNm1iYNSayrPo3XWs3850JPpJ9CEs1muvDr8ldl0ZQqkPuFBa1+qvHZpKLHJE075S
        fEg2zGrFnKisP4jQ3AftjudvlZSW/Di30OPh8AW0yPKiTm/2wYGNIirMHnZXM5lC4gSNnf
        gQDTzKVG/oSQV6dQRpTf65jVjVD9XMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1635754673;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4EzLk3mwa187FL/XE7jeS9GSjupmN43r6Vq/C6Y2LPU=;
        b=D7lKLuF8jyweDDEF9uzozML3ERrhCgCblvEvmTLye+vWySc8JC7B3T4xgnm8BbsYXgGOtp
        xJv3RI/bKXeWsyBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5173813AA1;
        Mon,  1 Nov 2021 08:17:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id wNHOErGif2EIIAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 01 Nov 2021 08:17:53 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, noralf@tronnes.org,
        marcel@ziswiler.com, naresh.kamboju@linaro.org
Cc:     dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] drm: Remove CONFIG_DRM_KMS_CMA_HELPER option
Date:   Mon,  1 Nov 2021 09:17:51 +0100
Message-Id: <20211101081751.24613-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101081751.24613-1-tzimmermann@suse.de>
References: <20211101081751.24613-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Link drm_fb_cma_helper.o into drm_cma_helper.ko if CONFIG_DRM_KMS_HELPER
has been set. Remove CONFIG_DRM_KMS_CMA_HELPER config option. Selecting
KMS helpers and CMA will now automatically enable CMA KMS helpers.

Some drivers' Kconfig files did not correctly select KMS or CMA helpers.
Fix this as part of the change.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig                 |  7 -------
 drivers/gpu/drm/Makefile                |  2 +-
 drivers/gpu/drm/arm/Kconfig             |  2 --
 drivers/gpu/drm/arm/display/Kconfig     |  1 -
 drivers/gpu/drm/aspeed/Kconfig          |  1 -
 drivers/gpu/drm/atmel-hlcdc/Kconfig     |  1 -
 drivers/gpu/drm/fsl-dcu/Kconfig         |  1 -
 drivers/gpu/drm/hisilicon/kirin/Kconfig |  1 -
 drivers/gpu/drm/imx/Kconfig             |  2 +-
 drivers/gpu/drm/imx/dcss/Kconfig        |  2 +-
 drivers/gpu/drm/ingenic/Kconfig         |  1 -
 drivers/gpu/drm/kmb/Kconfig             |  1 -
 drivers/gpu/drm/mcde/Kconfig            |  1 -
 drivers/gpu/drm/meson/Kconfig           |  1 -
 drivers/gpu/drm/mxsfb/Kconfig           |  2 +-
 drivers/gpu/drm/panel/Kconfig           |  2 +-
 drivers/gpu/drm/pl111/Kconfig           |  1 -
 drivers/gpu/drm/rcar-du/Kconfig         |  1 -
 drivers/gpu/drm/shmobile/Kconfig        |  1 -
 drivers/gpu/drm/sti/Kconfig             |  1 -
 drivers/gpu/drm/stm/Kconfig             |  1 -
 drivers/gpu/drm/sun4i/Kconfig           |  1 -
 drivers/gpu/drm/tidss/Kconfig           |  1 -
 drivers/gpu/drm/tilcdc/Kconfig          |  1 -
 drivers/gpu/drm/tiny/Kconfig            | 20 ++++++++++----------
 drivers/gpu/drm/tve200/Kconfig          |  1 -
 drivers/gpu/drm/vc4/Kconfig             |  1 -
 drivers/gpu/drm/xlnx/Kconfig            |  1 -
 28 files changed, 15 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index fb144617055b..5e147593bb6c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -217,13 +217,6 @@ config DRM_GEM_CMA_HELPER
 	help
 	  Choose this if you need the GEM CMA helper functions
 
-config DRM_KMS_CMA_HELPER
-	bool
-	depends on DRM
-	select DRM_GEM_CMA_HELPER
-	help
-	  Choose this if you need the KMS CMA helper functions
-
 config DRM_GEM_SHMEM_HELPER
 	tristate
 	depends on DRM && MMU
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 1c41156deb5f..7125318d6c95 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -34,6 +34,7 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.
 obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
 
 drm_cma_helper-y := drm_gem_cma_helper.o
+drm_cma_helper-$(CONFIG_DRM_KMS_HELPER) += drm_fb_cma_helper.o
 obj-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_cma_helper.o
 
 drm_shmem_helper-y := drm_gem_shmem_helper.o
@@ -58,7 +59,6 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
 
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
-drm_kms_helper-$(CONFIG_DRM_KMS_CMA_HELPER) += drm_fb_cma_helper.o
 drm_kms_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_kms_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
 
diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
index 3a9e966e0e78..58a242871b28 100644
--- a/drivers/gpu/drm/arm/Kconfig
+++ b/drivers/gpu/drm/arm/Kconfig
@@ -6,7 +6,6 @@ config DRM_HDLCD
 	depends on DRM && OF && (ARM || ARM64 || COMPILE_TEST)
 	depends on COMMON_CLK
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	help
 	  Choose this option if you have an ARM High Definition Colour LCD
 	  controller.
@@ -27,7 +26,6 @@ config DRM_MALI_DISPLAY
 	depends on DRM && OF && (ARM || ARM64 || COMPILE_TEST)
 	depends on COMMON_CLK
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
 	select VIDEOMODE_HELPERS
 	help
diff --git a/drivers/gpu/drm/arm/display/Kconfig b/drivers/gpu/drm/arm/display/Kconfig
index cec0639e3aa1..e91598b60781 100644
--- a/drivers/gpu/drm/arm/display/Kconfig
+++ b/drivers/gpu/drm/arm/display/Kconfig
@@ -4,7 +4,6 @@ config DRM_KOMEDA
 	depends on DRM && OF
 	depends on COMMON_CLK
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
 	select VIDEOMODE_HELPERS
 	help
diff --git a/drivers/gpu/drm/aspeed/Kconfig b/drivers/gpu/drm/aspeed/Kconfig
index 5e95bcea43e9..36c4a7e86981 100644
--- a/drivers/gpu/drm/aspeed/Kconfig
+++ b/drivers/gpu/drm/aspeed/Kconfig
@@ -5,7 +5,6 @@ config DRM_ASPEED_GFX
 	depends on (COMPILE_TEST || ARCH_ASPEED)
 	depends on MMU
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DMA_CMA if HAVE_DMA_CONTIGUOUS
 	select CMA if HAVE_DMA_CONTIGUOUS
 	select MFD_SYSCON
diff --git a/drivers/gpu/drm/atmel-hlcdc/Kconfig b/drivers/gpu/drm/atmel-hlcdc/Kconfig
index 5f67f001553b..8ae679f1a518 100644
--- a/drivers/gpu/drm/atmel-hlcdc/Kconfig
+++ b/drivers/gpu/drm/atmel-hlcdc/Kconfig
@@ -4,7 +4,6 @@ config DRM_ATMEL_HLCDC
 	depends on DRM && OF && COMMON_CLK && MFD_ATMEL_HLCDC && ARM
 	select DRM_GEM_CMA_HELPER
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_PANEL
 	help
 	  Choose this option if you have an ATMEL SoC with an HLCDC display
diff --git a/drivers/gpu/drm/fsl-dcu/Kconfig b/drivers/gpu/drm/fsl-dcu/Kconfig
index d7dd8ba90e3a..2a13ea5c8539 100644
--- a/drivers/gpu/drm/fsl-dcu/Kconfig
+++ b/drivers/gpu/drm/fsl-dcu/Kconfig
@@ -4,7 +4,6 @@ config DRM_FSL_DCU
 	depends on DRM && OF && ARM && COMMON_CLK
 	select BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_PANEL
 	select REGMAP_MMIO
 	select VIDEOMODE_HELPERS
diff --git a/drivers/gpu/drm/hisilicon/kirin/Kconfig b/drivers/gpu/drm/hisilicon/kirin/Kconfig
index 290553e2f6b4..b770f7662830 100644
--- a/drivers/gpu/drm/hisilicon/kirin/Kconfig
+++ b/drivers/gpu/drm/hisilicon/kirin/Kconfig
@@ -4,7 +4,6 @@ config DRM_HISI_KIRIN
 	depends on DRM && OF && ARM64
 	select DRM_KMS_HELPER
 	select DRM_GEM_CMA_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_MIPI_DSI
 	help
 	  Choose this option if you have a hisilicon Kirin chipsets(hi6220).
diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
index b5fa0e45a839..bb9738c7c825 100644
--- a/drivers/gpu/drm/imx/Kconfig
+++ b/drivers/gpu/drm/imx/Kconfig
@@ -4,7 +4,7 @@ config DRM_IMX
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
 	select DRM_GEM_CMA_HELPER
-	select DRM_KMS_CMA_HELPER
+	select DRM_KMS_HELPER
 	depends on DRM && (ARCH_MXC || ARCH_MULTIPLATFORM || COMPILE_TEST)
 	depends on IMX_IPUV3_CORE
 	help
diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
index 2b17a964ff05..7374f1952762 100644
--- a/drivers/gpu/drm/imx/dcss/Kconfig
+++ b/drivers/gpu/drm/imx/dcss/Kconfig
@@ -1,7 +1,7 @@
 config DRM_IMX_DCSS
 	tristate "i.MX8MQ DCSS"
 	select IMX_IRQSTEER
-	select DRM_KMS_CMA_HELPER
+	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
 	depends on DRM && ARCH_MXC && ARM64
 	help
diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index 3b57f8be007c..001f59fb06d5 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -8,7 +8,6 @@ config DRM_INGENIC
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
 	select VT_HW_CONSOLE_BINDING if FRAMEBUFFER_CONSOLE
 	help
diff --git a/drivers/gpu/drm/kmb/Kconfig b/drivers/gpu/drm/kmb/Kconfig
index bc4cb5e1cd8a..5fdd43dad507 100644
--- a/drivers/gpu/drm/kmb/Kconfig
+++ b/drivers/gpu/drm/kmb/Kconfig
@@ -3,7 +3,6 @@ config DRM_KMB_DISPLAY
 	depends on DRM
 	depends on ARCH_KEEMBAY || COMPILE_TEST
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
 	select DRM_MIPI_DSI
 	help
diff --git a/drivers/gpu/drm/mcde/Kconfig b/drivers/gpu/drm/mcde/Kconfig
index 71c689b573c9..d0bf1bc8da3f 100644
--- a/drivers/gpu/drm/mcde/Kconfig
+++ b/drivers/gpu/drm/mcde/Kconfig
@@ -10,7 +10,6 @@ config DRM_MCDE
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
 	select VT_HW_CONSOLE_BINDING if FRAMEBUFFER_CONSOLE
 	help
diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
index 9f9281dd49f8..df0da9e03000 100644
--- a/drivers/gpu/drm/meson/Kconfig
+++ b/drivers/gpu/drm/meson/Kconfig
@@ -4,7 +4,6 @@ config DRM_MESON
 	depends on DRM && OF && (ARM || ARM64)
 	depends on ARCH_MESON || COMPILE_TEST
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
 	select VIDEOMODE_HELPERS
 	select REGMAP_MMIO
diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index ee22cd25d3e3..987170e16ebd 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -10,7 +10,7 @@ config DRM_MXSFB
 	depends on COMMON_CLK
 	select DRM_MXS
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
 	select DRM_PANEL
 	select DRM_PANEL_BRIDGE
 	help
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7770b1802291..434c2861bb40 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -152,7 +152,7 @@ config DRM_PANEL_ILITEK_ILI9341
 	tristate "Ilitek ILI9341 240x320 QVGA panels"
 	depends on OF && SPI
 	depends on DRM_KMS_HELPER
-	depends on DRM_KMS_CMA_HELPER
+	depends on DRM_GEM_CMA_HELPER
 	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_MIPI_DBI
 	help
diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
index 3aae387a96af..91ee05b01303 100644
--- a/drivers/gpu/drm/pl111/Kconfig
+++ b/drivers/gpu/drm/pl111/Kconfig
@@ -6,7 +6,6 @@ config DRM_PL111
 	depends on VEXPRESS_CONFIG || VEXPRESS_CONFIG=n
 	depends on COMMON_CLK
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index b47e74421e34..71a4611e1557 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -7,7 +7,6 @@ config DRM_RCAR_DU
 	imply DRM_RCAR_CMM
 	imply DRM_RCAR_LVDS
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
 	select VIDEOMODE_HELPERS
 	help
diff --git a/drivers/gpu/drm/shmobile/Kconfig b/drivers/gpu/drm/shmobile/Kconfig
index e2a6c82c8252..288b838a904a 100644
--- a/drivers/gpu/drm/shmobile/Kconfig
+++ b/drivers/gpu/drm/shmobile/Kconfig
@@ -5,7 +5,6 @@ config DRM_SHMOBILE
 	depends on ARCH_SHMOBILE || COMPILE_TEST
 	select BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
 	help
 	  Choose this option if you have an SH Mobile chipset.
diff --git a/drivers/gpu/drm/sti/Kconfig b/drivers/gpu/drm/sti/Kconfig
index d0cfdd36b38f..246a94afbe74 100644
--- a/drivers/gpu/drm/sti/Kconfig
+++ b/drivers/gpu/drm/sti/Kconfig
@@ -5,7 +5,6 @@ config DRM_STI
 	select RESET_CONTROLLER
 	select DRM_KMS_HELPER
 	select DRM_GEM_CMA_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_PANEL
 	select FW_LOADER
 	select SND_SOC_HDMI_CODEC if SND_SOC
diff --git a/drivers/gpu/drm/stm/Kconfig b/drivers/gpu/drm/stm/Kconfig
index b7d66915a2be..e0379488cd0d 100644
--- a/drivers/gpu/drm/stm/Kconfig
+++ b/drivers/gpu/drm/stm/Kconfig
@@ -4,7 +4,6 @@ config DRM_STM
 	depends on DRM && (ARCH_STM32 || ARCH_MULTIPLATFORM)
 	select DRM_KMS_HELPER
 	select DRM_GEM_CMA_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_PANEL_BRIDGE
 	select VIDEOMODE_HELPERS
 	select FB_PROVIDE_GET_FB_UNMAPPED_AREA if FB
diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index 5755f0432e77..92651f6a9e7d 100644
--- a/drivers/gpu/drm/sun4i/Kconfig
+++ b/drivers/gpu/drm/sun4i/Kconfig
@@ -5,7 +5,6 @@ config DRM_SUN4I
 	depends on ARCH_SUNXI || COMPILE_TEST
 	select DRM_GEM_CMA_HELPER
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_PANEL
 	select REGMAP_MMIO
 	select VIDEOMODE_HELPERS
diff --git a/drivers/gpu/drm/tidss/Kconfig b/drivers/gpu/drm/tidss/Kconfig
index f790a5215302..bc4fa59b6fa9 100644
--- a/drivers/gpu/drm/tidss/Kconfig
+++ b/drivers/gpu/drm/tidss/Kconfig
@@ -3,7 +3,6 @@ config DRM_TIDSS
 	depends on DRM && OF
 	depends on ARM || ARM64 || COMPILE_TEST
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
 	help
 	  The TI Keystone family SoCs introduced a new generation of
diff --git a/drivers/gpu/drm/tilcdc/Kconfig b/drivers/gpu/drm/tilcdc/Kconfig
index 9f505a149990..e315591eb36b 100644
--- a/drivers/gpu/drm/tilcdc/Kconfig
+++ b/drivers/gpu/drm/tilcdc/Kconfig
@@ -3,7 +3,6 @@ config DRM_TILCDC
 	tristate "DRM Support for TI LCDC Display Controller"
 	depends on DRM && OF && ARM
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 4ca309f80dee..712e0004e96e 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -3,7 +3,7 @@
 config DRM_ARCPGU
 	tristate "ARC PGU"
 	depends on DRM && OF
-	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
 	select DRM_KMS_HELPER
 	help
 	  Choose this option if you have an ARC PGU controller.
@@ -71,7 +71,7 @@ config TINYDRM_HX8357D
 	tristate "DRM support for HX8357D display panels"
 	depends on DRM && SPI
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
 	select DRM_MIPI_DBI
 	select BACKLIGHT_CLASS_DEVICE
 	help
@@ -84,7 +84,7 @@ config TINYDRM_ILI9163
 	tristate "DRM support for ILI9163 display panels"
 	depends on DRM && SPI
 	select BACKLIGHT_CLASS_DEVICE
-	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DBI
 	help
@@ -97,7 +97,7 @@ config TINYDRM_ILI9225
 	tristate "DRM support for ILI9225 display panels"
 	depends on DRM && SPI
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
 	select DRM_MIPI_DBI
 	help
 	  DRM driver for the following Ilitek ILI9225 panels:
@@ -109,7 +109,7 @@ config TINYDRM_ILI9341
 	tristate "DRM support for ILI9341 display panels"
 	depends on DRM && SPI
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
 	select DRM_MIPI_DBI
 	select BACKLIGHT_CLASS_DEVICE
 	help
@@ -122,7 +122,7 @@ config TINYDRM_ILI9486
 	tristate "DRM support for ILI9486 display panels"
 	depends on DRM && SPI
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
 	select DRM_MIPI_DBI
 	select BACKLIGHT_CLASS_DEVICE
 	help
@@ -136,7 +136,7 @@ config TINYDRM_MI0283QT
 	tristate "DRM support for MI0283QT"
 	depends on DRM && SPI
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
 	select DRM_MIPI_DBI
 	select BACKLIGHT_CLASS_DEVICE
 	help
@@ -147,7 +147,7 @@ config TINYDRM_REPAPER
 	tristate "DRM support for Pervasive Displays RePaper panels (V231)"
 	depends on DRM && SPI
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
 	help
 	  DRM driver for the following Pervasive Displays panels:
 	  1.44" TFT EPD Panel (E1144CS021)
@@ -161,7 +161,7 @@ config TINYDRM_ST7586
 	tristate "DRM support for Sitronix ST7586 display panels"
 	depends on DRM && SPI
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
 	select DRM_MIPI_DBI
 	help
 	  DRM driver for the following Sitronix ST7586 panels:
@@ -173,7 +173,7 @@ config TINYDRM_ST7735R
 	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
 	depends on DRM && SPI
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
 	select DRM_MIPI_DBI
 	select BACKLIGHT_CLASS_DEVICE
 	help
diff --git a/drivers/gpu/drm/tve200/Kconfig b/drivers/gpu/drm/tve200/Kconfig
index e2d163c74ed6..47a7dbe6c114 100644
--- a/drivers/gpu/drm/tve200/Kconfig
+++ b/drivers/gpu/drm/tve200/Kconfig
@@ -8,7 +8,6 @@ config DRM_TVE200
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
 	select VT_HW_CONSOLE_BINDING if FRAMEBUFFER_CONSOLE
 	help
diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index 345a5570a3da..de3424fed2fc 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -6,7 +6,6 @@ config DRM_VC4
 	depends on SND && SND_SOC
 	depends on COMMON_CLK
 	select DRM_KMS_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
 	select DRM_PANEL_BRIDGE
 	select SND_PCM
diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
index c3d08269faa9..d8d38d86d5c6 100644
--- a/drivers/gpu/drm/xlnx/Kconfig
+++ b/drivers/gpu/drm/xlnx/Kconfig
@@ -7,7 +7,6 @@ config DRM_ZYNQMP_DPSUB
 	depends on XILINX_ZYNQMP_DPDMA
 	select DMA_ENGINE
 	select DRM_GEM_CMA_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_KMS_HELPER
 	select GENERIC_PHY
 	help
-- 
2.33.1

