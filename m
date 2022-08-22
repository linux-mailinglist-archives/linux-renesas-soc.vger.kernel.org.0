Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1BA59C01A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 15:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234915AbiHVNFb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 09:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234893AbiHVNFb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 09:05:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D451D1E3CE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 06:05:30 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04C1D3F1;
        Mon, 22 Aug 2022 15:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661173529;
        bh=ggAkbBrc69fZBdc3E7G2PLBsQNNp8l7FlY0iX3fB/fA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jSfeCSQ+KEyXRwKMu1G6bjFJVOzSxT32IclGeQ/lR7Ea026fM9ccCHY4e6d88dvu9
         PaNlw83UZyJsxlHAHIzhtOeJNVZRXld3tuNjMTGep9bFxPBm3a0GMG0vFDbHqpS2HH
         ffJaRFGej6CLmOPKr7OlD+uzDCH7I2NKPKxGdFuA=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v2 1/4] drm: rcar-du: dsi: Properly stop video mode TX
Date:   Mon, 22 Aug 2022 16:05:09 +0300
Message-Id: <20220822130513.119029-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822130513.119029-1-tomi.valkeinen@ideasonboard.com>
References: <20220822130513.119029-1-tomi.valkeinen@ideasonboard.com>
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

