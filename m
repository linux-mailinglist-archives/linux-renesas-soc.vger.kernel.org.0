Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12D1E3B126F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 05:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbhFWDuB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 23:50:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57852 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhFWDuB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:50:01 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79D7029E7;
        Wed, 23 Jun 2021 05:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420060;
        bh=rSTtmWixdLA3FBsze6N5XovpQK8KaBQP+VKI12RtQto=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iah+DQ3yFrbHFCtsP9T4iZuRd56/t9bUeNx5H2mTNltPl6gFj4cewvQoIA/E4kMhl
         EXz+21KUxzrHhpKtfO0bxfSbv2vjp7hx++1ygJfioHhZrNf+TAIJ8GEk8A033QDfov
         LIXUCazqCqHlKohLP5rf/lnzIuo+nKnUwScN9JL8=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 14/15] drm: rcar-du: dsi: Use read_poll_timeout()
Date:   Wed, 23 Jun 2021 06:46:55 +0300
Message-Id: <20210623034656.10316-15-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 114 +++++++++---------------
 1 file changed, 43 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 2ac4171e6c6a..381b5bc9bce1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -145,25 +146,21 @@ static void rcar_mipi_dsi_set(struct rcar_mipi_dsi *dsi, u32 reg, u32 set)
 
 static int rcar_mipi_dsi_phtw_test(struct rcar_mipi_dsi *dsi, u32 phtw)
 {
-	unsigned int timeout;
 	u32 status;
+	int ret;
 
 	rcar_mipi_dsi_write(dsi, PHTW, phtw);
 
-	for (timeout = 10; timeout > 0; --timeout) {
-		status = rcar_mipi_dsi_read(dsi, PHTW);
-		if (!(status & PHTW_DWEN) && !(status & PHTW_CWEN))
-			break;
-
-		usleep_range(1000, 2000);
-	}
-
-	if (!timeout) {
-		dev_err(dsi->dev, "failed to test phtw with data %x\n", phtw);
-		return -ETIMEDOUT;
+	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+				!(status & (PHTW_DWEN | PHTW_CWEN)),
+				2000, 10000, false, dsi, PHTW);
+	if (ret < 0) {
+		dev_err(dsi->dev, "PHY test interface write timeout (0x%08x)\n",
+			phtw);
+		return ret;
 	}
 
-	return timeout;
+	return ret;
 }
 
 /* -----------------------------------------------------------------------------
@@ -458,86 +455,61 @@ static int rcar_mipi_dsi_start_hs_clock(struct rcar_mipi_dsi *dsi)
 	 * In HW manual, we need to check TxDDRClkHS-Q Stable? but it dont
 	 * write how to check. So we skip this check in this patch
 	 */
-	unsigned int timeout;
 	u32 status;
+	int ret;
 
-	/* Start HS clock */
+	/* Start HS clock. */
 	rcar_mipi_dsi_set(dsi, PPICLCR, PPICLCR_TXREQHS);
 
-	for (timeout = 10; timeout > 0; --timeout) {
-		status = rcar_mipi_dsi_read(dsi, PPICLSR);
-
-		if (status & PPICLSR_TOHS) {
-			rcar_mipi_dsi_set(dsi, PPICLSCR, PPICLSCR_TOHS);
-			break;
-		}
-
-		usleep_range(1000, 2000);
-	}
-
-	if (!timeout) {
+	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+				status & PPICLSR_TOHS,
+				2000, 10000, false, dsi, PPICLSR);
+	if (ret < 0) {
 		dev_err(dsi->dev, "failed to enable HS clock\n");
-		return -ETIMEDOUT;
+		return ret;
 	}
 
-	dev_dbg(dsi->dev, "Start High Speed Clock");
+	rcar_mipi_dsi_set(dsi, PPICLSCR, PPICLSCR_TOHS);
 
 	return 0;
 }
 
 static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *dsi)
 {
-	unsigned int timeout;
 	u32 status;
-
-	/* Check status of Tranmission */
-	for (timeout = 10; timeout > 0; --timeout) {
-		status = rcar_mipi_dsi_read(dsi, LINKSR);
-		if (!(status & LINKSR_LPBUSY) && !(status & LINKSR_HSBUSY)) {
-			rcar_mipi_dsi_clr(dsi, TXVMCR, TXVMCR_VFCLR);
-			break;
-		}
-
-		usleep_range(1000, 2000);
+	int ret;
+
+	/* Wait for the link to be ready. */
+	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+				!(status & (LINKSR_LPBUSY | LINKSR_HSBUSY)),
+				2000, 10000, false, dsi, LINKSR);
+	if (ret < 0) {
+		dev_err(dsi->dev, "Link failed to become ready\n");
+		return ret;
 	}
 
-	if (!timeout) {
-		dev_err(dsi->dev, "Failed to enable Video clock\n");
-		return -ETIMEDOUT;
-	}
+	/* De-assert video FIFO clear. */
+	rcar_mipi_dsi_clr(dsi, TXVMCR, TXVMCR_VFCLR);
 
-	/* Check Clear Video mode FIFO */
-	for (timeout = 10; timeout > 0; --timeout) {
-		status = rcar_mipi_dsi_read(dsi, TXVMSR);
-		if (status & TXVMSR_VFRDY) {
-			rcar_mipi_dsi_set(dsi, TXVMCR, TXVMCR_EN_VIDEO);
-			break;
-		}
-
-		usleep_range(1000, 2000);
+	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+				status & TXVMSR_VFRDY,
+				2000, 10000, false, dsi, TXVMSR);
+	if (ret < 0) {
+		dev_err(dsi->dev, "Failed to de-assert video FIFO clear\n");
+		return ret;
 	}
 
-	if (!timeout) {
-		dev_err(dsi->dev, "Failed to enable Video clock\n");
-		return -ETIMEDOUT;
-	}
+	/* Enable transmission in video mode. */
+	rcar_mipi_dsi_set(dsi, TXVMCR, TXVMCR_EN_VIDEO);
 
-	/* Check Video transmission */
-	for (timeout = 10; timeout > 0; --timeout) {
-		status = rcar_mipi_dsi_read(dsi, TXVMSR);
-		if (status & TXVMSR_RDY)
-			break;
-
-		usleep_range(1000, 2000);
-	}
-
-	if (!timeout) {
-		dev_err(dsi->dev, "Failed to enable Video clock\n");
-		return -ETIMEDOUT;
+	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+				status & TXVMSR_RDY,
+				2000, 10000, false, dsi, TXVMSR);
+	if (ret < 0) {
+		dev_err(dsi->dev, "Failed to enable video transmission\n");
+		return ret;
 	}
 
-	dev_dbg(dsi->dev, "Start video transferring");
-
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

