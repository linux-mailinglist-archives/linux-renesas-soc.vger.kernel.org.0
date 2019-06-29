Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B75D5AD3D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2019 21:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbfF2T41 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 29 Jun 2019 15:56:27 -0400
Received: from sauhun.de ([88.99.104.3]:36192 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726950AbfF2T40 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 29 Jun 2019 15:56:26 -0400
Received: from localhost (p5486CA23.dip0.t-ipconnect.de [84.134.202.35])
        by pokefinder.org (Postfix) with ESMTPSA id 851CD3E43C6;
        Sat, 29 Jun 2019 21:56:24 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 RFT 3/4] mmc: renesas_sdhi: make quirks info accessible outside probe()
Date:   Sat, 29 Jun 2019 21:54:42 +0200
Message-Id: <20190629195443.366-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190629195443.366-1-wsa+renesas@sang-engineering.com>
References: <20190629195443.366-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We will need that for a later patch.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi.h      | 6 ++++++
 drivers/mmc/host/renesas_sdhi_core.c | 6 +-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index c0504aa90857..88d05a617d43 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -33,6 +33,11 @@ struct renesas_sdhi_of_data {
 	unsigned short max_segs;
 };
 
+struct renesas_sdhi_quirks {
+	bool hs400_disabled;
+	bool hs400_4taps;
+};
+
 struct tmio_mmc_dma {
 	enum dma_slave_buswidth dma_buswidth;
 	bool (*filter)(struct dma_chan *chan, void *arg);
@@ -46,6 +51,7 @@ struct renesas_sdhi {
 	struct clk *clk_cd;
 	struct tmio_mmc_data mmc_data;
 	struct tmio_mmc_dma dma_priv;
+	const struct renesas_sdhi_quirks *quirks;
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pins_default, *pins_uhs;
 	void __iomem *scc_ctl;
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 7e07c34b9db1..bce1779229a8 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -46,11 +46,6 @@
 #define SDHI_VER_GEN3_SD	0xcc10
 #define SDHI_VER_GEN3_SDMMC	0xcd10
 
-struct renesas_sdhi_quirks {
-	bool hs400_disabled;
-	bool hs400_4taps;
-};
-
 static void renesas_sdhi_sdbuf_width(struct tmio_mmc_host *host, int width)
 {
 	u32 val;
@@ -662,6 +657,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (!priv)
 		return -ENOMEM;
 
+	priv->quirks = quirks;
 	mmc_data = &priv->mmc_data;
 	dma_priv = &priv->dma_priv;
 
-- 
2.20.1

