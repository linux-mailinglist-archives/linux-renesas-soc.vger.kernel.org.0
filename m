Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E851445EB2F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 11:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348127AbhKZKWi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 05:22:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49810 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376671AbhKZKUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 05:20:37 -0500
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65D5D1269;
        Fri, 26 Nov 2021 11:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637921723;
        bh=sHtu4YZjz1duGU3+mxBG0gSBUA7LlDf0Si/PgC3rKYg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VPJe0VExl9vnJC/1txZPwDwwcwu9Ku4mPlx1l1giIS2YgUNvSRcKIs8zkxFn6X7J4
         AlDrMO7TIGIqrIseVDPqgwTPdyxO6KnH7Ar31Syoxr8TsVTpPItuTq95zqzsZzu0ho
         +8UB0hG0NWdSKuNV8Nkm+C9KOhABEm0xU9LhOpS8=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 3/4] drm: rcar-du: mipi-dsi: Ensure correct fout is reported
Date:   Fri, 26 Nov 2021 10:15:17 +0000
Message-Id: <20211126101518.938783-4-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
References: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The debug reporting for the clock calculations was erroneously reporting
the last calculation of fout, rather than the fout that was determined
to have the least error, and therefore be the values chosen to operate
with.

Fix the reporting to show the correct output by storing the determined
fout, along with the error value.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---

I spent /way/ too long confused why my clock values didn't make sense
before I noticed this.. :-(


 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index e94245029f95..833f4480bdf3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -168,6 +168,7 @@ static int rcar_mipi_dsi_phtw_test(struct rcar_mipi_dsi *dsi, u32 phtw)
  */
 
 struct dsi_setup_info {
+	unsigned long fout;
 	unsigned int err;
 	u16 vco_cntrl;
 	u16 prop_cntrl;
@@ -247,6 +248,7 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
 				setup_info->m = m - 2;
 				setup_info->n = n - 1;
 				setup_info->err = err;
+				setup_info->fout = fout;
 				if (err == 0)
 					goto done;
 			}
@@ -256,7 +258,7 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
 done:
 	dev_dbg(dsi->dev,
 		"%pC %lu Hz -> Fout %lu Hz (target %lu Hz, error %d.%02u%%), PLL M/N/DIV %u/%u/%u\n",
-		clk, fin, fout, fout_target, setup_info->err / 100,
+		clk, fin, setup_info->fout, fout_target, setup_info->err / 100,
 		setup_info->err % 100, setup_info->m,
 		setup_info->n, setup_info->div);
 	dev_dbg(dsi->dev,
-- 
2.30.2

