Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B142859C1B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 16:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbiHVOfO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 10:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235369AbiHVOfO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 10:35:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4687D29CBB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 07:35:13 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA5429AA;
        Mon, 22 Aug 2022 16:35:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661178909;
        bh=x7IQOBok8WLpd2lre1kfQXiXqj4R6G4M2UlK51gYuBY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KUjj22yHd2+PrSxl8/dc4YUp9amhUWVROD25AjTJ88V2kSt7CIOquFmIsYnUKd+7H
         OFYKx0WA/vBTR+tcp/rT4W+Ttpf8qYXOToKhSTuMOp7DK7ySYobXSrHbuzY+Wb+wBO
         AsCwbkgvLCD4SAJgnIU22UWFd0LVmGhPpaBPuLZg=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v3 5/5] drm: rcar-du: dsi: Fix VCLKSET write
Date:   Mon, 22 Aug 2022 17:34:01 +0300
Message-Id: <20220822143401.135081-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822143401.135081-1-tomi.valkeinen@ideasonboard.com>
References: <20220822143401.135081-1-tomi.valkeinen@ideasonboard.com>
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

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

rcar_mipi_dsi_startup() writes correct values to VCLKSET, but as it uses
or-operation to add the new values to the current value in the register,
it should first make sure the fields are cleared.

Do this by using rcar_mipi_dsi_write() to write the VCLKSET_CKEN bit to
VCLKSET before the rest of the VCLKSET configuration.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 06250f2f3499..b60a6d4a5d46 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -412,9 +412,10 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 			return ret;
 	}
 
-	/* Enable DOT clock */
-	vclkset = VCLKSET_CKEN;
-	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
+	/* Clear VCLKSET and enable DOT clock */
+	rcar_mipi_dsi_write(dsi, VCLKSET, VCLKSET_CKEN);
+
+	vclkset = 0;
 
 	if (dsi_format == 24)
 		vclkset |= VCLKSET_BPP_24;
-- 
2.34.1

