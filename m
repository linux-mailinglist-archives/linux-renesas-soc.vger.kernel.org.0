Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC51A110578
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 20:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbfLCTtN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 14:49:13 -0500
Received: from sauhun.de ([88.99.104.3]:34146 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726564AbfLCTtN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 14:49:13 -0500
Received: from localhost (p54B33759.dip0.t-ipconnect.de [84.179.55.89])
        by pokefinder.org (Postfix) with ESMTPSA id A588E2C020F;
        Tue,  3 Dec 2019 20:49:10 +0100 (CET)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: renesas_sdhi: remove whitelist for internal DMAC
Date:   Tue,  3 Dec 2019 20:48:59 +0100
Message-Id: <20191203194859.917-1-wsa@the-dreams.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

We know now that there won't be Gen3 SoCs with both, SYS-DMAC and
internal DMAC. We removed the blacklisting for SYS-DMAC already, so we
can remove the whitelisting for internal DMAC, too. This makes adding
new SoCs easier. We keep the quirk handling, of course.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 23 ++++---------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 68fb39a74b8b..47ac53e91241 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -298,38 +298,23 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
  * Whitelist of specific R-Car Gen3 SoC ES versions to use this DMAC
  * implementation as others may use a different implementation.
  */
-static const struct soc_device_attribute soc_whitelist[] = {
-	/* specific ones */
+static const struct soc_device_attribute soc_dma_quirks[] = {
 	{ .soc_id = "r7s9210",
 	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY) },
 	{ .soc_id = "r8a7795", .revision = "ES1.*",
 	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
 	{ .soc_id = "r8a7796", .revision = "ES1.0",
 	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
-	/* generic ones */
-	{ .soc_id = "r8a774a1" },
-	{ .soc_id = "r8a774b1" },
-	{ .soc_id = "r8a774c0" },
-	{ .soc_id = "r8a77470" },
-	{ .soc_id = "r8a7795" },
-	{ .soc_id = "r8a7796" },
-	{ .soc_id = "r8a77965" },
-	{ .soc_id = "r8a77970" },
-	{ .soc_id = "r8a77980" },
-	{ .soc_id = "r8a77990" },
-	{ .soc_id = "r8a77995" },
 	{ /* sentinel */ }
 };
 
 static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
 {
-	const struct soc_device_attribute *soc = soc_device_match(soc_whitelist);
+	const struct soc_device_attribute *soc = soc_device_match(soc_dma_quirks);
 	struct device *dev = &pdev->dev;
 
-	if (!soc)
-		return -ENODEV;
-
-	global_flags |= (unsigned long)soc->data;
+	if (soc)
+		global_flags |= (unsigned long)soc->data;
 
 	dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms), GFP_KERNEL);
 	if (!dev->dma_parms)
-- 
2.20.1

