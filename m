Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99ECC415420
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 01:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238521AbhIVXtF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 19:49:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33080 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238537AbhIVXtE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 19:49:04 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 806F5E52;
        Thu, 23 Sep 2021 01:47:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632354452;
        bh=ZydzftsYaAUgiQ3QnGiZrwolWAwMZMRyP23CyfGYQ0Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qCb8N16G31AUa7SUEzEMTSwOe1h4j5/M77mkGHMpYwQzbc/m8NdmvPaVrMOGxHpqv
         Sn+YCziqlGyv4DWynKVKaX5Jr1Y5Su321uhkBT1C9/AURFO4ailgrhnqdQbb9NfWpd
         Bz6E1JVlIlKYWKz6ocEQjONpU/ZwsNoEpySiYtTo=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 4/6] drm: rcar-du: Fix DIDSR field name
Date:   Thu, 23 Sep 2021 00:47:24 +0100
Message-Id: <20210922234726.3337265-5-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210922234726.3337265-1-kieran.bingham@ideasonboard.com>
References: <20210922234726.3337265-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DIDSR fields named LDCS were incorrectly defined as LCDS.
Both the Gen2 and Gen3 documentation refer to the fields as the "LVDS
Dot Clock Select".

Correct the definitions.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

---
v2:
 - New patch

v3:
 - Collect tag

 drivers/gpu/drm/rcar-du/rcar_du_group.c | 4 ++--
 drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 88a783ceb3e9..a984eef265d2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -122,10 +122,10 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
 	didsr = DIDSR_CODE;
 	for (i = 0; i < num_crtcs; ++i, ++rcrtc) {
 		if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index))
-			didsr |= DIDSR_LCDS_LVDS0(i)
+			didsr |= DIDSR_LDCS_LVDS0(i)
 			      |  DIDSR_PDCS_CLK(i, 0);
 		else
-			didsr |= DIDSR_LCDS_DCLKIN(i)
+			didsr |= DIDSR_LDCS_DCLKIN(i)
 			      |  DIDSR_PDCS_CLK(i, 0);
 	}
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
index fb9964949368..fb7c467aa484 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
@@ -257,10 +257,10 @@
 
 #define DIDSR			0x20028
 #define DIDSR_CODE		(0x7790 << 16)
-#define DIDSR_LCDS_DCLKIN(n)	(0 << (8 + (n) * 2))
-#define DIDSR_LCDS_LVDS0(n)	(2 << (8 + (n) * 2))
-#define DIDSR_LCDS_LVDS1(n)	(3 << (8 + (n) * 2))
-#define DIDSR_LCDS_MASK(n)	(3 << (8 + (n) * 2))
+#define DIDSR_LDCS_DCLKIN(n)	(0 << (8 + (n) * 2))
+#define DIDSR_LDCS_LVDS0(n)	(2 << (8 + (n) * 2))
+#define DIDSR_LDCS_LVDS1(n)	(3 << (8 + (n) * 2))
+#define DIDSR_LDCS_MASK(n)	(3 << (8 + (n) * 2))
 #define DIDSR_PDCS_CLK(n, clk)	(clk << ((n) * 2))
 #define DIDSR_PDCS_MASK(n)	(3 << ((n) * 2))
 
-- 
2.30.2

