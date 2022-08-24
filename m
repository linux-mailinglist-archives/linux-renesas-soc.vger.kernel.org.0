Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B06A59FA54
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 14:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237189AbiHXMru (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 08:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237377AbiHXMrq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 08:47:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8099E9353F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 05:47:44 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 372C7A42;
        Wed, 24 Aug 2022 14:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661345259;
        bh=0ZKn8A8NZffnPKKGKfeXL3ev8QEusBBlb7dR3SmdfG8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qMoKIv+zlvQ7eTKmZ3lCODov0OaRvFAAaWYXAmlxhvYMdZfvmT64hawa5Z5oSB4U2
         yM+o25XVzan0FFZnK7o6um4wCvw6iBn23Qqy/Fg1qvDAEtbXnxq6mIL/AOOYYzl5Ia
         KudCzYjX2IuBqXyVoZRoM2xzSIYh02T27ugZ1D/0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v4 5/5] drm: rcar-du: dsi: Fix VCLKSET write
Date:   Wed, 24 Aug 2022 15:47:26 +0300
Message-Id: <20220824124726.187224-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824124726.187224-1-tomi.valkeinen@ideasonboard.com>
References: <20220824124726.187224-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

rcar_mipi_dsi_startup() writes correct values to VCLKSET, but as it uses
or-operation to add the new values to the current value in the register,
it should first make sure the fields are cleared.

Do this by using rcar_mipi_dsi_write() to write the VCLKSET register
with a variable that has all the unused bits zeroed.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 06250f2f3499..90128d5e3d17 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -414,7 +414,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 
 	/* Enable DOT clock */
 	vclkset = VCLKSET_CKEN;
-	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
+	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
 
 	if (dsi_format == 24)
 		vclkset |= VCLKSET_BPP_24;
@@ -429,7 +429,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_DIV(setup_info.div)
 		|  VCLKSET_LANE(dsi->lanes - 1);
 
-	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
+	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
 
 	/* After setting VCLKSET register, enable VCLKEN */
 	rcar_mipi_dsi_set(dsi, VCLKEN, VCLKEN_CKEN);
-- 
2.34.1

