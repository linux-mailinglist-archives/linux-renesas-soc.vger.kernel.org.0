Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B083B1083
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 01:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhFVXWu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 19:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbhFVXWt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 19:22:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C7FC061574;
        Tue, 22 Jun 2021 16:20:32 -0700 (PDT)
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0D85A66;
        Wed, 23 Jun 2021 01:20:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624404030;
        bh=RUKRmqgyqz9U5gi8RB6Mid2ZJhoOlmXP7P4o2uLEwDc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=coJj0FCoteLsF2XFemV7SB+OtayQYRtpyjy8wzrGRmSHYIZJZmkLAytgWiLgknJMp
         F7f0MB+3/AOjc4TBrXAPYGPEkRHyh1jbN9uodfnfPVpiV4R9OKEQ7qCKt6AvEY0Slh
         u666184vPnJzeFio7YTRlKB0LHj/sio/Y2VCSVH0=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] drm: rcar-du: Only initialise TVM_TVSYNC mode when supported
Date:   Wed, 23 Jun 2021 00:20:23 +0100
Message-Id: <20210622232024.3215248-3-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
References: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The R-Car DU as found on the D3, E3, and V3U do not have support
for an external synchronisation method.

In these cases, the dsysr cached register should not be initialised
in DSYSR_TVM_TVSYNC, but instead should be left clear to configure as
DSYSR_TVM_MASTER by default.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index ea7e39d03545..cff0d82b9491 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -1243,7 +1243,10 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 	rcrtc->group = rgrp;
 	rcrtc->mmio_offset = mmio_offsets[hwindex];
 	rcrtc->index = hwindex;
-	rcrtc->dsysr = (rcrtc->index % 2 ? 0 : DSYSR_DRES) | DSYSR_TVM_TVSYNC;
+	rcrtc->dsysr = (rcrtc->index % 2 ? 0 : DSYSR_DRES);
+
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_TVM_SYNC))
+		rcrtc->dsysr |= DSYSR_TVM_TVSYNC;
 
 	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
 		primary = &rcrtc->vsp->planes[rcrtc->vsp_pipe].plane;
-- 
2.30.2

