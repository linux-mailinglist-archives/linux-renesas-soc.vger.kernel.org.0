Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48DE54BE20F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 18:54:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381514AbiBUROU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 12:14:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343840AbiBUROU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 12:14:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5A12611D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 09:13:56 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 250DA484;
        Mon, 21 Feb 2022 18:13:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645463634;
        bh=8uVdwcIdzkcXbXDLonFcwLYb96Gj/nV6lHspa8jiTxI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XuVWxbvbcIfa2+2Qtx+L2i5a+9rl92iPtPdcN+tbQcEpaS5qNPT2TtjiHBkmdnp/Q
         qL0bLe3VW2P04th+boCV69euNJRf7AVn/qWBAdDvcOMxYOOQQxF/LitOdin5J5IdlN
         OA+hb7lvHWgGQYMIL182rwDzQiYz7D4E+wj7et3A=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Michael Rodin <mrodin@de.adit-jv.com>, michael@rodin.online,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com
Subject: [PATCH 1/2] drm: rcar-du: Don't select VSP1 sink on Gen3
Date:   Mon, 21 Feb 2022 19:13:39 +0200
Message-Id: <20220221171340.11113-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220221171340.11113-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220221171340.11113-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The VSP1 sink selection through register DEFR8 is only available on Gen2
hardware. Skip it on Gen3.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 862197be1e01..9b058d6cb032 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -549,8 +549,10 @@ void __rcar_du_plane_setup(struct rcar_du_group *rgrp,
 		rcar_du_plane_setup_format(rgrp, (state->hwindex + 1) % 8,
 					   state);
 
-	if (rcdu->info->gen < 3)
-		rcar_du_plane_setup_scanout(rgrp, state);
+	if (rcdu->info->gen >= 3)
+		return;
+
+	rcar_du_plane_setup_scanout(rgrp, state);
 
 	if (state->source == RCAR_DU_PLANE_VSPD1) {
 		unsigned int vspd1_sink = rgrp->index ? 2 : 0;
-- 
Regards,

Laurent Pinchart

