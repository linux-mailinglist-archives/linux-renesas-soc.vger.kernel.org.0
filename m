Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96423B048E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2019 21:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbfIKTZU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Sep 2019 15:25:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39460 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728105AbfIKTZU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Sep 2019 15:25:20 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA3BC33A;
        Wed, 11 Sep 2019 21:25:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568229918;
        bh=2zHvimOjrWy5RxcEvOUcnkpkQp9SWOPtz0B4fYTv0aI=;
        h=From:To:Cc:Subject:Date:From;
        b=gFhfY6Pq333rek0/ggUALqlewfGTA3+vF7deVusSv8Pel1bfaBfkIdBkb9VdIPEnb
         jO9BjWbIcxMpAE2AsvrjjMG2dCmuT1dSAN/HPpa6XNGfsIUO2tJXPKl25yzsoo6tX7
         yFYQ5vF4V8Q1e4G9+hQ7neo+x5aNNc6NGLO9vhYY=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm: rcar-du: Add r8a77980 support
Date:   Wed, 11 Sep 2019 20:25:01 +0100
Message-Id: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add direct support for the r8a77980 (V3H).

The V3H shares a common, compatible configuration with the r8a77970
(V3M) so that device info structure is reused.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index d1003d31cfaf..fc5b0949daf0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -374,7 +374,10 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 		  | RCAR_DU_FEATURE_TVM_SYNC,
 	.channels_mask = BIT(0),
 	.routes = {
-		/* R8A77970 has one RGB output and one LVDS output. */
+		/*
+		 * R8A77970 and R8A77980 have one RGB output and one LVDS
+		 * output.
+		 */
 		[RCAR_DU_OUTPUT_DPAD0] = {
 			.possible_crtcs = BIT(0),
 			.port = 0,
@@ -432,6 +435,7 @@ static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7796", .data = &rcar_du_r8a7796_info },
 	{ .compatible = "renesas,du-r8a77965", .data = &rcar_du_r8a77965_info },
 	{ .compatible = "renesas,du-r8a77970", .data = &rcar_du_r8a77970_info },
+	{ .compatible = "renesas,du-r8a77980", .data = &rcar_du_r8a77970_info },
 	{ .compatible = "renesas,du-r8a77990", .data = &rcar_du_r8a7799x_info },
 	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
 	{ }
-- 
2.20.1

