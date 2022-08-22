Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0410059C1AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 16:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbiHVOfL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 10:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235495AbiHVOfL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 10:35:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B7C27CE3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 07:35:10 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61760505;
        Mon, 22 Aug 2022 16:35:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661178907;
        bh=NeDjKSj7CgAFaLVdNG/L7G3drRUEDiz6lACW+xO4fl4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UU1gsPPzby3HO92Qdd1ZfuOF7CeTRkI0qEEFlx7rTtXgwa6WwpBpQFGLcnQ3+bXk7
         VprOfNx7KvisvFwKxviZ1zCvBkQ+JWjC+Dz4l4y3fMRqz5ril0Mj6jzb68GMXii/dY
         IRdCLyZF7sa3BUiEaWdO2/szLSPqLhjgFFQCl9so=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v3 2/5] drm: rcar-du: dsi: Properly stop video mode TX
Date:   Mon, 22 Aug 2022 17:33:58 +0300
Message-Id: <20220822143401.135081-3-tomi.valkeinen@ideasonboard.com>
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

The driver does not explicitly stop the video mode transmission when
disabling the output. While this doesn't seem to be causing any issues,
lets follow the steps described in the documentation and add a
rcar_mipi_dsi_stop_video() which stop the video mode transmission. This
function will also be used in later patches to stop the video
transmission even if the DSI IP is not shut down.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 62f7eb84ab01..7f2be490fcf8 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -542,6 +542,34 @@ static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *dsi)
 	return 0;
 }
 
+static void rcar_mipi_dsi_stop_video(struct rcar_mipi_dsi *dsi)
+{
+	u32 status;
+	int ret;
+
+	/* Disable transmission in video mode. */
+	rcar_mipi_dsi_clr(dsi, TXVMCR, TXVMCR_EN_VIDEO);
+
+	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+				!(status & TXVMSR_ACT),
+				2000, 100000, false, dsi, TXVMSR);
+	if (ret < 0) {
+		dev_err(dsi->dev, "Failed to disable video transmission\n");
+		return;
+	}
+
+	/* Assert video FIFO clear. */
+	rcar_mipi_dsi_set(dsi, TXVMCR, TXVMCR_VFCLR);
+
+	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+				!(status & TXVMSR_VFRDY),
+				2000, 100000, false, dsi, TXVMSR);
+	if (ret < 0) {
+		dev_err(dsi->dev, "Failed to assert video FIFO clear\n");
+		return;
+	}
+}
+
 /* -----------------------------------------------------------------------------
  * Bridge
  */
@@ -601,6 +629,7 @@ static void rcar_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
 {
 	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
 
+	rcar_mipi_dsi_stop_video(dsi);
 	rcar_mipi_dsi_shutdown(dsi);
 	rcar_mipi_dsi_clk_disable(dsi);
 }
-- 
2.34.1

