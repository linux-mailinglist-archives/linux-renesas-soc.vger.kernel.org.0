Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 167C46F40B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 May 2023 12:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbjEBKJm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 May 2023 06:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233747AbjEBKJd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2023 06:09:33 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 079915257
        for <linux-renesas-soc@vger.kernel.org>; Tue,  2 May 2023 03:09:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,243,1677510000"; 
   d="scan'208";a="157939698"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 May 2023 19:09:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.229])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CFA8441C9BD5;
        Tue,  2 May 2023 19:09:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Peter Robinson <pbrobinson@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dan Carpenter <error27@gmail.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Takanari Hayama <taki@igel.co.jp>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Marek Vasut <marex@denx.de>, Liviu Dudau <liviu.dudau@arm.com>,
        Stephen Kitt <steve@sk2.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Paul Cercueil <paul@crapouillou.net>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 RESEND 1/5] drm: Place Renesas drivers in a separate dir
Date:   Tue,  2 May 2023 11:09:08 +0100
Message-Id: <20230502100912.143114-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230502100912.143114-1-biju.das.jz@bp.renesas.com>
References: <20230502100912.143114-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Create vendor specific renesas directory and move renesas drivers
to that directory.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v8->v9:
 * Added Rb tag from Laurent and Acked-by tag from Kieran.
v8:
 * New patch
---
 MAINTAINERS                                                  | 3 +--
 drivers/gpu/drm/Kconfig                                      | 4 +---
 drivers/gpu/drm/Makefile                                     | 3 +--
 drivers/gpu/drm/renesas/Kconfig                              | 4 ++++
 drivers/gpu/drm/renesas/Makefile                             | 4 ++++
 drivers/gpu/drm/{ => renesas}/rcar-du/Kconfig                | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/Makefile               | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_cmm.c             | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_cmm.h             | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_crtc.c         | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_crtc.h         | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_drv.c          | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_drv.h          | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_encoder.c      | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_encoder.h      | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_group.c        | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_group.h        | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_kms.c          | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_kms.h          | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_plane.c        | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_plane.h        | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_regs.h         | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_vsp.c          | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_vsp.h          | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_writeback.c    | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_writeback.h    | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_dw_hdmi.c         | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds.c            | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds.h            | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds_regs.h       | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi.c        | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi.h        | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi_regs.h   | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rzg2l_mipi_dsi.c       | 0
 drivers/gpu/drm/{ => renesas}/rcar-du/rzg2l_mipi_dsi_regs.h  | 0
 drivers/gpu/drm/{ => renesas}/shmobile/Kconfig               | 0
 drivers/gpu/drm/{ => renesas}/shmobile/Makefile              | 0
 drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_backlight.c | 0
 drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_backlight.h | 0
 drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_crtc.c      | 0
 drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_crtc.h      | 0
 drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_drv.c       | 0
 drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_drv.h       | 0
 drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_kms.c       | 0
 drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_kms.h       | 0
 drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_plane.c     | 0
 drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_plane.h     | 0
 drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_regs.h      | 0
 48 files changed, 11 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/renesas/Kconfig
 create mode 100644 drivers/gpu/drm/renesas/Makefile
 rename drivers/gpu/drm/{ => renesas}/rcar-du/Kconfig (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/Makefile (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_cmm.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_cmm.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_crtc.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_crtc.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_drv.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_drv.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_encoder.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_encoder.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_group.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_group.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_kms.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_kms.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_plane.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_plane.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_regs.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_vsp.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_vsp.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_writeback.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_writeback.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_dw_hdmi.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds_regs.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi_regs.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rzg2l_mipi_dsi.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rzg2l_mipi_dsi_regs.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/Kconfig (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/Makefile (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_backlight.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_backlight.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_crtc.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_crtc.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_drv.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_drv.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_kms.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_kms.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_plane.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_plane.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_regs.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 276298cfc7ee..1218a2ec6d97 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6959,8 +6959,7 @@ F:	Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
 F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
 F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
 F:	Documentation/devicetree/bindings/display/renesas,du.yaml
-F:	drivers/gpu/drm/rcar-du/
-F:	drivers/gpu/drm/shmobile/
+F:	drivers/gpu/drm/renesas/
 F:	include/linux/platform_data/shmob_drm.h
 
 DRM DRIVERS FOR ROCKCHIP
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ba3fb04bb691..41aa8b07252b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -295,9 +295,7 @@ source "drivers/gpu/drm/armada/Kconfig"
 
 source "drivers/gpu/drm/atmel-hlcdc/Kconfig"
 
-source "drivers/gpu/drm/rcar-du/Kconfig"
-
-source "drivers/gpu/drm/shmobile/Kconfig"
+source "drivers/gpu/drm/renesas/Kconfig"
 
 source "drivers/gpu/drm/sun4i/Kconfig"
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index a33257d2bc7f..982d9e06168a 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -156,8 +156,7 @@ obj-$(CONFIG_DRM_UDL) += udl/
 obj-$(CONFIG_DRM_AST) += ast/
 obj-$(CONFIG_DRM_ARMADA) += armada/
 obj-$(CONFIG_DRM_ATMEL_HLCDC)	+= atmel-hlcdc/
-obj-y			+= rcar-du/
-obj-$(CONFIG_DRM_SHMOBILE) +=shmobile/
+obj-y			+= renesas/
 obj-y			+= omapdrm/
 obj-$(CONFIG_DRM_SUN4I) += sun4i/
 obj-y			+= tilcdc/
diff --git a/drivers/gpu/drm/renesas/Kconfig b/drivers/gpu/drm/renesas/Kconfig
new file mode 100644
index 000000000000..3777dad17f81
--- /dev/null
+++ b/drivers/gpu/drm/renesas/Kconfig
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+source "drivers/gpu/drm/renesas/rcar-du/Kconfig"
+source "drivers/gpu/drm/renesas/shmobile/Kconfig"
diff --git a/drivers/gpu/drm/renesas/Makefile b/drivers/gpu/drm/renesas/Makefile
new file mode 100644
index 000000000000..ec0e89e7a592
--- /dev/null
+++ b/drivers/gpu/drm/renesas/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y += rcar-du/
+obj-$(CONFIG_DRM_SHMOBILE) += shmobile/
diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
similarity index 100%
rename from drivers/gpu/drm/rcar-du/Kconfig
rename to drivers/gpu/drm/renesas/rcar-du/Kconfig
diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/renesas/rcar-du/Makefile
similarity index 100%
rename from drivers/gpu/drm/rcar-du/Makefile
rename to drivers/gpu/drm/renesas/rcar-du/Makefile
diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_cmm.c
rename to drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.h b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.h
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_cmm.h
rename to drivers/gpu/drm/renesas/rcar-du/rcar_cmm.h
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_crtc.c
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_crtc.h
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_drv.c
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_drv.h
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_encoder.c
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_encoder.h
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_group.c
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.h
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_group.h
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_group.h
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_kms.c
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.h
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_kms.h
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.h
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_plane.c
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_plane.h
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_regs.h
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_regs.h
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_regs.h
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_vsp.c
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_vsp.h
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_writeback.c
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.h
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_du_writeback.h
rename to drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.h
diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_dw_hdmi.c
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
rename to drivers/gpu/drm/renesas/rcar-du/rcar_dw_hdmi.c
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_lvds.c
rename to drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.h b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.h
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_lvds.h
rename to drivers/gpu/drm/renesas/rcar-du/rcar_lvds.h
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds_regs.h
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_lvds_regs.h
rename to drivers/gpu/drm/renesas/rcar-du/rcar_lvds_regs.h
diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
rename to drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.h
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
rename to drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.h
diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
rename to drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
rename to drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi_regs.h
similarity index 100%
rename from drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
rename to drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi_regs.h
diff --git a/drivers/gpu/drm/shmobile/Kconfig b/drivers/gpu/drm/renesas/shmobile/Kconfig
similarity index 100%
rename from drivers/gpu/drm/shmobile/Kconfig
rename to drivers/gpu/drm/renesas/shmobile/Kconfig
diff --git a/drivers/gpu/drm/shmobile/Makefile b/drivers/gpu/drm/renesas/shmobile/Makefile
similarity index 100%
rename from drivers/gpu/drm/shmobile/Makefile
rename to drivers/gpu/drm/renesas/shmobile/Makefile
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_backlight.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_backlight.c
similarity index 100%
rename from drivers/gpu/drm/shmobile/shmob_drm_backlight.c
rename to drivers/gpu/drm/renesas/shmobile/shmob_drm_backlight.c
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_backlight.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_backlight.h
similarity index 100%
rename from drivers/gpu/drm/shmobile/shmob_drm_backlight.h
rename to drivers/gpu/drm/renesas/shmobile/shmob_drm_backlight.h
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
similarity index 100%
rename from drivers/gpu/drm/shmobile/shmob_drm_crtc.c
rename to drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
similarity index 100%
rename from drivers/gpu/drm/shmobile/shmob_drm_crtc.h
rename to drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
similarity index 100%
rename from drivers/gpu/drm/shmobile/shmob_drm_drv.c
rename to drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
similarity index 100%
rename from drivers/gpu/drm/shmobile/shmob_drm_drv.h
rename to drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
similarity index 100%
rename from drivers/gpu/drm/shmobile/shmob_drm_kms.c
rename to drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_kms.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.h
similarity index 100%
rename from drivers/gpu/drm/shmobile/shmob_drm_kms.h
rename to drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.h
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
similarity index 100%
rename from drivers/gpu/drm/shmobile/shmob_drm_plane.c
rename to drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_plane.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h
similarity index 100%
rename from drivers/gpu/drm/shmobile/shmob_drm_plane.h
rename to drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_regs.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_regs.h
similarity index 100%
rename from drivers/gpu/drm/shmobile/shmob_drm_regs.h
rename to drivers/gpu/drm/renesas/shmobile/shmob_drm_regs.h
-- 
2.25.1

