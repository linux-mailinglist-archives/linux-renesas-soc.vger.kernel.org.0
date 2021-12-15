Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55DDD47552C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Dec 2021 10:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241186AbhLOJ14 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Dec 2021 04:27:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241184AbhLOJ1z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 04:27:55 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD3BC06173F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 01:27:54 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id WZTq260094C55Sk06ZTqaH; Wed, 15 Dec 2021 10:27:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxQZh-0056TH-Py; Wed, 15 Dec 2021 10:27:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxQZh-009ahr-AS; Wed, 15 Dec 2021 10:27:49 +0100
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
Subject: [PATCH 1/3] drm: rcar-du: DRM_RCAR_DW_HDMI should depend on ARCH_RENESAS
Date:   Wed, 15 Dec 2021 10:27:45 +0100
Message-Id: <0cb4593af06b64eb43a316913dc4bf83d46d7d7f.1639559338.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639559338.git.geert+renesas@glider.be>
References: <cover.1639559338.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas R-Car Gen3 and RZ/G2 internal HDMI encoder is only present
on Renesas R-Car Gen3 and RZ/G2 SoCs.  Hence add a dependency on
ARCH_RENESAS, to prevent asking the user about this driver when
configuring a kernel without Renesas SoC support.

Fixes: 40d0fa7095d06c73 ("drm: rcar-du: Add Gen3 HDMI encoder support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/rcar-du/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index f6e6a6d5d987bf95..65d72be50f46f19e 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -25,6 +25,7 @@ config DRM_RCAR_CMM
 config DRM_RCAR_DW_HDMI
 	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
 	depends on DRM && OF
+	depends on ARCH_RENESAS || COMPILE_TEST
 	select DRM_DW_HDMI
 	help
 	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
-- 
2.25.1

