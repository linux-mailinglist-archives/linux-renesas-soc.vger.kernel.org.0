Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 842581105AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 21:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbfLCUFX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 15:05:23 -0500
Received: from sauhun.de ([88.99.104.3]:34376 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727090AbfLCUFX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 15:05:23 -0500
Received: from localhost (p54B33759.dip0.t-ipconnect.de [84.179.55.89])
        by pokefinder.org (Postfix) with ESMTPSA id 5BE312C020F;
        Tue,  3 Dec 2019 21:05:21 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH/RFT 5/5] mmc: renesas_sdhi: use recent tap values for HS400
Date:   Tue,  3 Dec 2019 21:05:13 +0100
Message-Id: <20191203200513.1758-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191203200513.1758-1-wsa+renesas@sang-engineering.com>
References: <20191203200513.1758-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

New datasheets require different and new values for HS400 with 4taps or
8taps.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This patch needs an ack from the BSP team and/or Shimoda-san. The BSP
code uses this only for M3-W ES1.3 which is not supported yet upstream.
However, H3 ES2.0 (which we do support) needs the same fix IMO because
it is also using 4taps with HS400. But that needs confirmation as I
can't recreate the error case here.

 drivers/mmc/host/renesas_sdhi.h               | 4 ++--
 drivers/mmc/host/renesas_sdhi_core.c          | 5 ++++-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 88d05a617d43..f524251d5113 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -14,8 +14,8 @@
 
 struct renesas_sdhi_scc {
 	unsigned long clk_rate;	/* clock rate for SDR104 */
-	u32 tap;		/* sampling clock position for SDR104 */
-	u32 tap_hs400;		/* sampling clock position for HS400 */
+	u32 tap;		/* sampling clock position for SDR104/HS400 (8 TAP) */
+	u32 tap_hs400_4tap;	/* sampling clock position for HS400 (4 TAP) */
 };
 
 struct renesas_sdhi_of_data {
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 8ee6298d5a51..282c133defd6 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -794,13 +794,16 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	     host->mmc->caps2 & (MMC_CAP2_HS200_1_8V_SDR |
 				 MMC_CAP2_HS400_1_8V))) {
 		const struct renesas_sdhi_scc *taps = of_data->taps;
+		bool use_4tap = priv->quirks && priv->quirks->hs400_4taps;
 		bool hit = false;
 
 		for (i = 0; i < of_data->taps_num; i++) {
 			if (taps[i].clk_rate == 0 ||
 			    taps[i].clk_rate == host->mmc->f_max) {
 				priv->scc_tappos = taps->tap;
-				priv->scc_tappos_hs400 = taps->tap_hs400;
+				priv->scc_tappos_hs400 = use_4tap ?
+							 taps->tap_hs400_4tap :
+							 taps->tap;
 				hit = true;
 				break;
 			}
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 18839a10594c..68fb39a74b8b 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -82,7 +82,7 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
 	{
 		.clk_rate = 0,
 		.tap = 0x00000300,
-		.tap_hs400 = 0x00000704,
+		.tap_hs400_4tap = 0x00000100,
 	},
 };
 
-- 
2.20.1

