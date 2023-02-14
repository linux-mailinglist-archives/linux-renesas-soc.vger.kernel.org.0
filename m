Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2F8169556B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 01:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjBNAhm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 19:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbjBNAhl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 19:37:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B754B1A49B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Feb 2023 16:37:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1E76496;
        Tue, 14 Feb 2023 01:37:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676335059;
        bh=vV8Poz7KcFFrPKJ+Q0B5tIcg0ixBf9vRYs7KQYoOV0o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e5+W+SsSUzMLjVvDRrL4UGU5Fqy3PaRFcRdGklw7zrldgnn5KGH/upNqZk8GE0zdy
         ryJNITN+tc4qmDdR2jH2+59MN/y9CploqDsYlDMcKJTcQobsGJAdekA8qTvjKW2QOp
         ONOEhjfmGf5cfVpI59dPEf0sZ/w4GCVkiM9Hx4Wc=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 1/3] drm: rcar-du: lvds: Call function directly instead of through pointer
Date:   Tue, 14 Feb 2023 02:37:34 +0200
Message-Id: <20230214003736.18871-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214003736.18871-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20230214003736.18871-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When disabling the companion bridge in rcar_lvds_atomic_disable(),
there's no need to go through the bridge's operations to call
.atomic_disable(). Call rcar_lvds_atomic_disable() on the companion
directly.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 260ea5d8624e..61de18af62e6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -582,8 +582,7 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
 
 	/* Disable the companion LVDS encoder in dual-link mode. */
 	if (lvds->link_type != RCAR_LVDS_SINGLE_LINK && lvds->companion)
-		lvds->companion->funcs->atomic_disable(lvds->companion,
-						       old_bridge_state);
+		rcar_lvds_atomic_disable(lvds->companion, old_bridge_state);
 
 	pm_runtime_put_sync(lvds->dev);
 }
-- 
Regards,

Laurent Pinchart

