Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B578641541D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 01:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238546AbhIVXtF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 19:49:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33100 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238535AbhIVXtE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 19:49:04 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F38EB1544;
        Thu, 23 Sep 2021 01:47:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632354452;
        bh=CJER95kuqVQg+IWr5D3fMe8U43dXHsjjYXDswSJYd88=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vWQUBbHCX+o8KFwzIGhNz1YT7X73SHO6cBbtlSbH5dXZrV9XPDuWskcbpk0MuGzni
         Omklkc4SIlReS/oj7e0XYUQrc7yTjvr1fyqgYC66WJ89xX6/6NrYTdJ6OHVqgTkNbP
         ZqkDVMKg98taoCYa38mJY+H30jCHQ4I4enuMilyk=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/6] drm: rcar-du: Only initialise TVM_TVSYNC mode when supported
Date:   Thu, 23 Sep 2021 00:47:23 +0100
Message-Id: <20210922234726.3337265-4-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210922234726.3337265-1-kieran.bingham@ideasonboard.com>
References: <20210922234726.3337265-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R-Car DU as found on the D3, E3, and V3U do not have support
for an external synchronisation method.

In these cases, the dsysr cached register should not be initialised
in DSYSR_TVM_TVSYNC, but instead should be left clear to configure as
DSYSR_TVM_MASTER by default.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

---
v2:
 - Remove parenthesis

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index ea7e39d03545..a0f837e8243a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -1243,7 +1243,10 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 	rcrtc->group = rgrp;
 	rcrtc->mmio_offset = mmio_offsets[hwindex];
 	rcrtc->index = hwindex;
-	rcrtc->dsysr = (rcrtc->index % 2 ? 0 : DSYSR_DRES) | DSYSR_TVM_TVSYNC;
+	rcrtc->dsysr = rcrtc->index % 2 ? 0 : DSYSR_DRES;
+
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_TVM_SYNC))
+		rcrtc->dsysr |= DSYSR_TVM_TVSYNC;
 
 	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
 		primary = &rcrtc->vsp->planes[rcrtc->vsp_pipe].plane;
-- 
2.30.2

