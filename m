Return-Path: <linux-renesas-soc+bounces-4756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 719F28ACAA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 12:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0147D1F22261
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 10:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB3B144D11;
	Mon, 22 Apr 2024 10:30:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AE51448C8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713781855; cv=none; b=RIWfkMpZB3Xt5BDehwddmEddpYCFwTZm04qdmwLfZYQdKM6fpmLO+mspLng2p7lm6WYtz/hcv3ic+MMNOIqCUT+8TuDL5nDHadJoT+IAdrmNbzmX6JKTIm2RRWSNf+yxLfuuVGxbHRUVDpDyHo2OY5UJ7t12fchsCDXqfDZkCAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713781855; c=relaxed/simple;
	bh=e9yzCZSkoKfFI2A60BEa4YXSN0o8qE36WDz+vVN09nc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F8tuMqC5wWeKNhq6qNyEG947TaIHz8YxQ7AaM4I0/OOzsUW5cFEp0yZVCLvwssvhiRXlZJngVI+v/c+sLe/3skGgbqOXaj/45lj/LYyg2CcbR/rilcdVZFiGVlYZbq6i0WUY+nZbtvV40YCaWzYMD+1KGAhgc/NBYYdy8BmlLog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by andre.telenet-ops.be with bizsmtp
	id EAWj2C00R0SSLxL01AWj4d; Mon, 22 Apr 2024 12:30:45 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1ryqw1-001cwQ-E1;
	Mon, 22 Apr 2024 12:30:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1ryqwd-005i4B-FG;
	Mon, 22 Apr 2024 12:30:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 10/11] Revert "drm: Make drivers depends on DRM_DW_HDMI"
Date: Mon, 22 Apr 2024 12:30:38 +0200
Message-Id: <bd93d43b07f8ed6368119f4a5ddac2ee80debe53.1713780345.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713780345.git.geert+renesas@glider.be>
References: <cover.1713780345.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit c0e0f139354c01e0213204e4a96e7076e5a3e396, as helper
code should always be selected by the driver that needs it, for the
convenience of the final user configuring a kernel.

The user who configures a kernel should not need to know which helpers
are needed for the driver he is interested in.  Making a driver depend
on helper code means that the user needs to know which helpers to enable
first, which is very user-unfriendly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/bridge/imx/Kconfig      | 4 ++--
 drivers/gpu/drm/imx/ipuv3/Kconfig       | 5 ++---
 drivers/gpu/drm/ingenic/Kconfig         | 2 +-
 drivers/gpu/drm/meson/Kconfig           | 2 +-
 drivers/gpu/drm/renesas/rcar-du/Kconfig | 2 +-
 drivers/gpu/drm/rockchip/Kconfig        | 2 +-
 drivers/gpu/drm/sun4i/Kconfig           | 2 +-
 7 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 7687ed652df5b9d3..5965e8027529a19c 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -5,9 +5,9 @@ config DRM_IMX_LDB_HELPER
 
 config DRM_IMX8MP_DW_HDMI_BRIDGE
 	tristate "Freescale i.MX8MP HDMI-TX bridge support"
-	depends on COMMON_CLK
-	depends on DRM_DW_HDMI
 	depends on OF
+	depends on COMMON_CLK
+	select DRM_DW_HDMI
 	select DRM_IMX8MP_HDMI_PVI
 	select PHY_FSL_SAMSUNG_HDMI_PHY
 	help
diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index 5d810ac02171d9c5..bacf0655ebaf3f5f 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -35,8 +35,7 @@ config DRM_IMX_LDB
 
 config DRM_IMX_HDMI
 	tristate "Freescale i.MX DRM HDMI"
-	depends on DRM_DW_HDMI
-	depends on DRM_IMX
-	depends on OF
+	select DRM_DW_HDMI
+	depends on DRM_IMX && OF
 	help
 	  Choose this if you want to use HDMI on i.MX6.
diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index 23effeb2ac721749..3db117c5edd9161b 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -27,8 +27,8 @@ config DRM_INGENIC_IPU
 
 config DRM_INGENIC_DW_HDMI
 	tristate "Ingenic specific support for Synopsys DW HDMI"
-	depends on DRM_DW_HDMI
 	depends on MACH_JZ4780
+	select DRM_DW_HDMI
 	help
 	  Choose this option to enable Synopsys DesignWare HDMI based driver.
 	  If you want to enable HDMI on Ingenic JZ4780 based SoC, you should
diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
index 5520b9e3f0107c4d..615fdd0ce41b433a 100644
--- a/drivers/gpu/drm/meson/Kconfig
+++ b/drivers/gpu/drm/meson/Kconfig
@@ -13,9 +13,9 @@ config DRM_MESON
 
 config DRM_MESON_DW_HDMI
 	tristate "HDMI Synopsys Controller support for Amlogic Meson Display"
-	depends on DRM_DW_HDMI
 	depends on DRM_MESON
 	default y if DRM_MESON
+	select DRM_DW_HDMI
 	imply DRM_DW_HDMI_I2S_AUDIO
 
 config DRM_MESON_DW_MIPI_DSI
diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
index 2dc739db2ba33b99..53c356aed5d52070 100644
--- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
@@ -25,8 +25,8 @@ config DRM_RCAR_CMM
 config DRM_RCAR_DW_HDMI
 	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
 	depends on DRM && OF
-	depends on DRM_DW_HDMI
 	depends on DRM_RCAR_DU || COMPILE_TEST
+	select DRM_DW_HDMI
 	help
 	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
 
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 0d5260e10f272d3b..1bf3e2829cd07b6b 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -7,6 +7,7 @@ config DRM_ROCKCHIP
 	select DRM_PANEL
 	select VIDEOMODE_HELPERS
 	select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
+	select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
 	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
 	select GENERIC_PHY if ROCKCHIP_DW_MIPI_DSI
 	select GENERIC_PHY_MIPI_DPHY if ROCKCHIP_DW_MIPI_DSI
@@ -56,7 +57,6 @@ config ROCKCHIP_CDN_DP
 
 config ROCKCHIP_DW_HDMI
 	bool "Rockchip specific extensions for Synopsys DW HDMI"
-	depends on DRM_DW_HDMI
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the Synopsys DesignWare HDMI driver. If you want to
diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index 5b19c7cb7b7ebf53..4741d9f6544c201b 100644
--- a/drivers/gpu/drm/sun4i/Kconfig
+++ b/drivers/gpu/drm/sun4i/Kconfig
@@ -57,8 +57,8 @@ config DRM_SUN6I_DSI
 config DRM_SUN8I_DW_HDMI
 	tristate "Support for Allwinner version of DesignWare HDMI"
 	depends on DRM_SUN4I
-	depends on DRM_DW_HDMI
 	default DRM_SUN4I
+	select DRM_DW_HDMI
 	help
 	  Choose this option if you have an Allwinner SoC with the
 	  DesignWare HDMI controller. SoCs that support HDMI and
-- 
2.34.1


