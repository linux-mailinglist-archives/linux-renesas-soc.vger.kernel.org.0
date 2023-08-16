Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D85877DF7B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Aug 2023 12:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244176AbjHPKpu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Aug 2023 06:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244175AbjHPKpV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2023 06:45:21 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 113AB2737
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2023 03:45:10 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d0c:f209:12a7:4ce5])
        by andre.telenet-ops.be with bizsmtp
        id aAkh2A01745ualL01AkhDM; Wed, 16 Aug 2023 12:44:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qWE0x-000osY-4Z;
        Wed, 16 Aug 2023 12:44:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qWDAw-00675D-Km;
        Wed, 16 Aug 2023 11:50:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sui Jingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v3 14/41] drm: renesas: shmobile: Rename input clocks
Date:   Wed, 16 Aug 2023 11:50:21 +0200
Message-Id: <30f5232942b285ecde4e20873497304b2bf18ebc.1692178020.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692178020.git.geert+renesas@glider.be>
References: <cover.1692178020.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Prepare for DT bindings by using more appropriate names for the input
clocks.

Note that all LDDCKR_ICKSEL_* definitions but the one for the bus clock
are valid only for SH7724, so the clock selection code needs to be
updated when extending clock support to other SoCs.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
[geert: Add note]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
v3:
  - No changes,

v2:
  - Add Reviewed-by.
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 64fc3fb02e6c6dc8..1157b4894ff319cd 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -74,15 +74,15 @@ static int shmob_drm_setup_clocks(struct shmob_drm_device *sdev,
 
 	switch (clksrc) {
 	case SHMOB_DRM_CLK_BUS:
-		clkname = "bus_clk";
+		clkname = "fck";
 		sdev->lddckr = LDDCKR_ICKSEL_BUS;
 		break;
 	case SHMOB_DRM_CLK_PERIPHERAL:
-		clkname = "peripheral_clk";
+		clkname = "media";
 		sdev->lddckr = LDDCKR_ICKSEL_MIPI;
 		break;
 	case SHMOB_DRM_CLK_EXTERNAL:
-		clkname = NULL;
+		clkname = "lclk";
 		sdev->lddckr = LDDCKR_ICKSEL_HDMI;
 		break;
 	default:
-- 
2.34.1

