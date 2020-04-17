Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 082701AE1AF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 17:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729581AbgDQP4y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 11:56:54 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:41815 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729282AbgDQP4y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 11:56:54 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MFK8N-1jRQDg3bmT-00FgfB; Fri, 17 Apr 2020 17:56:25 +0200
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
Subject: [PATCH 6/8] drm: decouple from CONFIG_FB
Date:   Fri, 17 Apr 2020 17:55:51 +0200
Message-Id: <20200417155553.675905-7-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200417155553.675905-1-arnd@arndb.de>
References: <20200417155553.675905-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0qBimtVr705+b3+OOeW9OcV+w70RcJb1UeeaRbsNFpRNaBBA8AJ
 DaMmbf5nUHQLmix18sFU8v0VJkd/IDerpbZDn/IECtMjar9Es06QzoINPu703Pqn4v497Hu
 Kyq33XSua3Qat0fv0xZ5BALWucGHzs0QGvmZPx+CHew3kGGMaoHKKxm4O4g4ZJkCvZ5G08p
 Ki8A8j7F9Ysk0P9bf3Q2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:z3HrAeTyxKs=:dlFdue1DLLnlyYwhRUUq7F
 iRC6wwHUO48gl2J87xagem97WQclhaIjem3X5f/11XxouIvB+zt9wAARD2S7OeEA5cDurc/Qm
 j7k7cUlBRsPkUe4J6AUBIeri42SZ3z+Uqa726SqkttH0jsQqumq4jz85/kkZQcEZypC2Y8xja
 V0rA3bUX0m7vm4TxWx9LrbY7Gr8U2XCX7yZVyOzcrWFVX7v0alBYTuPYhcYOtHRPK6mWesybb
 JsZzGF3sfZRBHQ1xKGjt45hQy01i7EH09CmBTS/mt6CrUPc9P7ro/3mrbRzw+m9RnwpwCZU1M
 5NwNC29DOe45bA6mAQm2EZF17ge6d2Tgiv3zRaR2ylgYyCHpIIbiJ5Sv2p4J1OgQeX24kF2sP
 EGMMK/xqNtmvdKUrO8dBtNGVVAMjuqwuuT5pZ+t99QV8YlyoyWOmVup7HFYZm9n/xP44u9MYp
 g1Z2u2BTgX27SeMofxGAkBikDxEvOdxyIZk4R8Tz5S/Qzqlxd+T+kcoh4a0MyoR3YFLkgycob
 4O5ij7WMQbXD3UHb+s40r8EP7nHIC6xWqTAuHHQdy8rvvXecQkorwWucRr1AulIgpl4t0Ib9F
 GwJT6CVh2m8XBm06TDqcZ7lvPgyaKmgLhC/f/nq13VVtfsQCejPq312RKGmDddLcbDC9zK8TI
 QhxAmBMqJdMvSb0yA/GrOnPQoC+x9DDhnHLoa8k1AQlG6ovCK9eoG7UtE3a8tqqoOOzQuvWM8
 LHXuiLGETHoNTmQhAn/nWZj7hWEwg22nGyVaNBXCVjMNZdHHDxa044E9oc+KF/Fa5jWTWmIF9
 jOJJOrcw2qzvZZ8lO0s3eouIekb3UuHz5DmfANQ2r34YjG3i8A=
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CONFIG_DRM_KMS_FB_HELPER selects CONFIG_FB, which is something it
really should not, to avoid circular dependencies and accidentally
including potentially dangerous user interfaces in the kernel,
so change this into a 'depends on' check.

Two device drivers currently select CONFIG_DRM_KMS_FB_HELPER, but
as far as I can tell, they do not really need to any more, so those
selects can be removed.

This leaves DRM_FBDEV_EMULATION as the only thing that rightfully
selects CONFIG_DRM_KMS_FB_HELPER, and this now has to depend on
CONFIG_FB and its dependencies.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/Kconfig       | 5 +++--
 drivers/gpu/drm/mxsfb/Kconfig | 1 -
 drivers/gpu/drm/zte/Kconfig   | 1 -
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 43594978958e..7c3109133685 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -80,7 +80,7 @@ config DRM_KMS_HELPER
 config DRM_KMS_FB_HELPER
 	bool
 	depends on DRM_KMS_HELPER
-	select FB
+	depends on FB
 	select FRAMEBUFFER_CONSOLE if !EXPERT
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
 	select FB_SYS_FOPS
@@ -111,7 +111,8 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
 
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
-	depends on DRM
+	depends on DRM && FB
+	depends on FB=y || DRM=m
 	select DRM_KMS_HELPER
 	select DRM_KMS_FB_HELPER
 	default y
diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index 0dca8f27169e..33916b7b2c50 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -10,7 +10,6 @@ config DRM_MXSFB
 	depends on COMMON_CLK
 	select DRM_MXS
 	select DRM_KMS_HELPER
-	select DRM_KMS_FB_HELPER
 	select DRM_KMS_CMA_HELPER
 	select DRM_PANEL
 	help
diff --git a/drivers/gpu/drm/zte/Kconfig b/drivers/gpu/drm/zte/Kconfig
index 90ebaedc11fd..aa8594190b50 100644
--- a/drivers/gpu/drm/zte/Kconfig
+++ b/drivers/gpu/drm/zte/Kconfig
@@ -3,7 +3,6 @@ config DRM_ZTE
 	tristate "DRM Support for ZTE SoCs"
 	depends on DRM && ARCH_ZX
 	select DRM_KMS_CMA_HELPER
-	select DRM_KMS_FB_HELPER
 	select DRM_KMS_HELPER
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select VIDEOMODE_HELPERS
-- 
2.26.0

