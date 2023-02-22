Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82CF569FFB4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Feb 2023 00:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbjBVXmU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Feb 2023 18:42:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjBVXmU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Feb 2023 18:42:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9853644F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Feb 2023 15:42:19 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73047A25;
        Thu, 23 Feb 2023 00:42:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677109337;
        bh=ll0dCdMfig4EdfwuYaFy0YTdw2/zakHYXS2N1zzzjSM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UNnzAe0W+q9SWO8eboAPEdjh72VNI4sE2NPuMF3eKat4B1MAYTzxWSTLSaZRkNkMd
         fMOq+y6yUnTTR4IF8DOQdF+JSYXD3mIAKqU/H0SoTQa1Q9g5zONG8p1wA967FBJDjm
         xnoZTkyI5tdi1wgoU9mz/72MrKtNJNpQdMZ/UHkw=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 2/2] drm: rcar-du: Write correct values in DORCR reserved fields
Date:   Thu, 23 Feb 2023 01:42:12 +0200
Message-Id: <20230222234212.5461-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222234212.5461-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20230222234212.5461-1-laurent.pinchart+renesas@ideasonboard.com>
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

The DORCR register controls the routing of clocks and data between DU
channels within a group. For groups that contain a single channel,
there's no routing option to control, and some fields of the register
are then reserved. On Gen2 those reserved fields are documented as
required to be set to 0, while on Gen3 and newer the PG1T, DK1S and PG1D
reserved fields must be set to 1.

The DU driver initializes the DORCR register in rcar_du_group_setup(),
where it ignores the PG1T, DK1S and PG1D, and then configures those
fields to the correct value in rcar_du_group_set_routing(). This hasn't
been shown to cause any issue, but prevents certifying that the driver
complies with the documentation in safety-critical use cases.

As there is no reasonable change that the documentation will be updated
to clarify that those reserved fields can be written to 0 temporarily
before starting the hardware, make sure that the registers are always
set to valid values.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index b5950749d68a..2ccd2581f544 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -138,6 +138,7 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 {
 	struct rcar_du_device *rcdu = rgrp->dev;
 	u32 defr7 = DEFR7_CODE;
+	u32 dorcr;
 
 	/* Enable extended features */
 	rcar_du_group_write(rgrp, DEFR, DEFR_CODE | DEFR_DEFE);
@@ -174,8 +175,15 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 	/*
 	 * Use DS1PR and DS2PR to configure planes priorities and connects the
 	 * superposition 0 to DU0 pins. DU1 pins will be configured dynamically.
+	 *
+	 * Groups that have a single channel have a hardcoded configuration. On
+	 * Gen3 and newer, the documentation requires PG1T, DK1S and PG1D_DS1 to
+	 * always be set in this case.
 	 */
-	rcar_du_group_write(rgrp, DORCR, DORCR_PG0D_DS0 | DORCR_DPRS);
+	dorcr = DORCR_PG0D_DS0 | DORCR_DPRS;
+	if (rcdu->info->gen >= 3 && rgrp->num_crtcs == 1)
+		dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
+	rcar_du_group_write(rgrp, DORCR, dorcr);
 
 	/* Apply planes to CRTCs association. */
 	mutex_lock(&rgrp->lock);
-- 
Regards,

Laurent Pinchart

