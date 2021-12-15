Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0891747552A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Dec 2021 10:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241174AbhLOJ14 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Dec 2021 04:27:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241185AbhLOJ1z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 04:27:55 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7580C061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 01:27:54 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id WZTq2600r4C55Sk06ZTqzH; Wed, 15 Dec 2021 10:27:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxQZi-0056TI-1e; Wed, 15 Dec 2021 10:27:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxQZh-009ahy-BX; Wed, 15 Dec 2021 10:27:49 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Arnd Bergmann <arnd@arndb.de>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] drm: rcar-du: DRM_RCAR_USE_LVDS should depend on DRM_RCAR_DU
Date:   Wed, 15 Dec 2021 10:27:46 +0100
Message-Id: <b1fa94f611a5c32c5d70516d1a39973f518fb06a.1639559338.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639559338.git.geert+renesas@glider.be>
References: <cover.1639559338.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas R-Car LVDS encoder driver is a subdriver of the R-Car
Display Unit driver, and enabling DRM_RCAR_USE_LVDS while DRM_RCAR_DU is
disabled doesn't have any impact on the kernel built.  Hence add a
dependency on DRM_RCAR_DU, to prevent asking the user about this driver
when configuring a kernel without R-Car Display Unit support, like is
already done for DRM_RCAR_CMM.

Fixes: 42d95d1b3a9c649b ("drm/rcar: stop using 'imply' for dependencies")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The problem pre-existed before commit 42d95d1b3a9c649b, as the
dependency of DRM_RCAR_LVDS on DRM_RCAR_DU was accidentally removed
before.
Fixes: c6a27fa41fabb35f ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
---
 drivers/gpu/drm/rcar-du/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 65d72be50f46f19e..a7aa556e301d1087 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -32,7 +32,7 @@ config DRM_RCAR_DW_HDMI
 
 config DRM_RCAR_USE_LVDS
 	bool "R-Car DU LVDS Encoder Support"
-	depends on DRM_BRIDGE && OF
+	depends on DRM_BRIDGE && OF && DRM_RCAR_DU
 	default DRM_RCAR_DU
 	help
 	  Enable support for the R-Car Display Unit embedded LVDS encoders.
-- 
2.25.1

