Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2694CBE27
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 13:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233431AbiCCMuJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 07:50:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbiCCMuI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 07:50:08 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6BF1480F2
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Mar 2022 04:49:22 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6495:14e6:1343:3ecb])
        by albert.telenet-ops.be with bizsmtp
        id 1opL2700S5ER6nL06opLui; Thu, 03 Mar 2022 13:49:21 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nPktU-002Xsp-1f; Thu, 03 Mar 2022 13:49:20 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nPktT-008DJh-H7; Thu, 03 Mar 2022 13:49:19 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mmc: Drop commas after SoC match table sentinels
Date:   Thu,  3 Mar 2022 13:49:18 +0100
Message-Id: <9050fa278eaaa9e6ec719a3b158a2fad285560d0.1646311673.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It does not make sense to have a comma after a sentinel, as any new
elements must be added before the sentinel.

Add comments to clarify the purpose of the empty elements.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  2 +-
 drivers/mmc/host/sdhci-of-esdhc.c             | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 9d2c600fd4ce2484..1685df00863b941a 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -212,7 +212,7 @@ static const struct soc_device_attribute sdhi_quirks_match[]  = {
 	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
 	{ .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_r8a7796_es13 },
-	{ /* Sentinel. */ },
+	{ /* Sentinel. */ }
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_r8a7795_compatible = {
diff --git a/drivers/mmc/host/sdhci-of-esdhc.c b/drivers/mmc/host/sdhci-of-esdhc.c
index 0f3658b36513c681..d9dc41143bb35d49 100644
--- a/drivers/mmc/host/sdhci-of-esdhc.c
+++ b/drivers/mmc/host/sdhci-of-esdhc.c
@@ -934,7 +934,7 @@ static struct soc_device_attribute soc_tuning_erratum_type1[] = {
 	{ .family = "QorIQ T1040", },
 	{ .family = "QorIQ T2080", },
 	{ .family = "QorIQ LS1021A", },
-	{ },
+	{ /* sentinel */ }
 };
 
 static struct soc_device_attribute soc_tuning_erratum_type2[] = {
@@ -944,7 +944,7 @@ static struct soc_device_attribute soc_tuning_erratum_type2[] = {
 	{ .family = "QorIQ LS1080A", },
 	{ .family = "QorIQ LS2080A", },
 	{ .family = "QorIQ LA1575A", },
-	{ },
+	{ /* sentinel */ }
 };
 
 static void esdhc_tuning_block_enable(struct sdhci_host *host, bool enable)
@@ -1316,21 +1316,21 @@ static const struct sdhci_pltfm_data sdhci_esdhc_le_pdata = {
 static struct soc_device_attribute soc_incorrect_hostver[] = {
 	{ .family = "QorIQ T4240", .revision = "1.0", },
 	{ .family = "QorIQ T4240", .revision = "2.0", },
-	{ },
+	{ /* sentinel */ }
 };
 
 static struct soc_device_attribute soc_fixup_sdhc_clkdivs[] = {
 	{ .family = "QorIQ LX2160A", .revision = "1.0", },
 	{ .family = "QorIQ LX2160A", .revision = "2.0", },
 	{ .family = "QorIQ LS1028A", .revision = "1.0", },
-	{ },
+	{ /* sentinel */ }
 };
 
 static struct soc_device_attribute soc_unreliable_pulse_detection[] = {
 	{ .family = "QorIQ LX2160A", .revision = "1.0", },
 	{ .family = "QorIQ LX2160A", .revision = "2.0", },
 	{ .family = "QorIQ LS1028A", .revision = "1.0", },
-	{ },
+	{ /* sentinel */ }
 };
 
 static void esdhc_init(struct platform_device *pdev, struct sdhci_host *host)
-- 
2.25.1

