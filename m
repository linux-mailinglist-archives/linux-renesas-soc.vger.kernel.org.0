Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD5E59C1AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 16:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235488AbiHVOfN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 10:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235500AbiHVOfM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 10:35:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B9252B626
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 07:35:11 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF4516BB;
        Mon, 22 Aug 2022 16:35:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661178908;
        bh=SUwR7JJReefh06KPVq8xcaWvlofbEY1j3jKAt2Cwh+Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dWgRZa8/yMryJzCl8LTzkYocXZ8YFvN6tZhQBkI+Dyh36GKZZraCJTVjKRz477rJj
         CmthJifsfpRtG0gV/zTQhtxjbU4S3sreGzOBShGK/U1unRaKY/CUPK9p0R8HEyD/+f
         gW721TYb/UfweCvwaMCuChAaS8VmRmqGXjmlZSYs=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v3 3/5] drm: rcar-du: dsi: Improve DSI shutdown
Date:   Mon, 22 Aug 2022 17:33:59 +0300
Message-Id: <20220822143401.135081-4-tomi.valkeinen@ideasonboard.com>
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

Improve the DSI shutdown procedure by clearing various bits that were
set while enabling the DSI output. There has been no clear issues caused
by these, but it's safer to ensure that the features are disabled at the
start of the next DSI enable.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 7f2be490fcf8..9c79fe2fc70b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -441,9 +441,21 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 
 static void rcar_mipi_dsi_shutdown(struct rcar_mipi_dsi *dsi)
 {
+	/* Disable VCLKEN */
+	rcar_mipi_dsi_write(dsi, VCLKSET, 0);
+
+	/* Disable DOT clock */
+	rcar_mipi_dsi_write(dsi, VCLKSET, 0);
+
 	rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_RSTZ);
 	rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
 
+	/* CFGCLK disable */
+	rcar_mipi_dsi_clr(dsi, CFGCLKSET, CFGCLKSET_CKEN);
+
+	/* LPCLK disable */
+	rcar_mipi_dsi_clr(dsi, LPCLKSET, LPCLKSET_CKEN);
+
 	dev_dbg(dsi->dev, "DSI device is shutdown\n");
 }
 
-- 
2.34.1

