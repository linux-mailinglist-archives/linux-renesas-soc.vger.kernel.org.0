Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7EC15987D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728713AbgBKS0Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:26:16 -0500
Received: from newton.telenet-ops.be ([195.130.132.45]:35814 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729169AbgBKS0Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:26:16 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 48H9z66hSGzMrJSs
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2020 19:19:30 +0100 (CET)
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id 1WKV2200F5USYZQ06WKWPB; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0002pI-G8; Tue, 11 Feb 2020 19:19:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0003zZ-El; Tue, 11 Feb 2020 19:19:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 31/34] crypto: ccree - use existing dev helper in init_cc_resources()
Date:   Tue, 11 Feb 2020 19:19:25 +0100
Message-Id: <20200211181928.15178-32-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the existing dev helper variable instead of plat_dev->dev.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_driver.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/ccree/cc_driver.c b/drivers/crypto/ccree/cc_driver.c
index bd9db53c68ab4381..2d50991b9a17756b 100644
--- a/drivers/crypto/ccree/cc_driver.c
+++ b/drivers/crypto/ccree/cc_driver.c
@@ -331,13 +331,13 @@ static int init_cc_resources(struct platform_device *plat_dev)
 
 	init_completion(&new_drvdata->hw_queue_avail);
 
-	if (!plat_dev->dev.dma_mask)
-		plat_dev->dev.dma_mask = &plat_dev->dev.coherent_dma_mask;
+	if (!dev->dma_mask)
+		dev->dma_mask = &dev->coherent_dma_mask;
 
 	dma_mask = DMA_BIT_MASK(DMA_BIT_MASK_LEN);
 	while (dma_mask > 0x7fffffffUL) {
-		if (dma_supported(&plat_dev->dev, dma_mask)) {
-			rc = dma_set_coherent_mask(&plat_dev->dev, dma_mask);
+		if (dma_supported(dev, dma_mask)) {
+			rc = dma_set_coherent_mask(dev, dma_mask);
 			if (!rc)
 				break;
 		}
-- 
2.17.1

