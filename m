Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 343245F6DD9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Oct 2022 21:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbiJFTF2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Oct 2022 15:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbiJFTFM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Oct 2022 15:05:12 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED7012D35
        for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Oct 2022 12:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=9KxShdTj13w/Mc
        0LMm4wiI/w1D5j+XBvZbk5fx6Bnuc=; b=tGbpKy2CX0fYIAHhhG9MF6R3CL1Dz+
        SAFnn6uHiwHPqLSW6ZtDUTuVBMtmV00TCHL3XzA9oRC2QUkaUdJGLaHi0aGrZEzV
        7aCscgt+vF4ylh4+WQi2I5+HOoGSpPI6Ii2ZUiKBy/j38Lla8hF5WhMW//s4bifA
        WNh72Zg2B2B84=
Received: (qmail 1467560 invoked from network); 6 Oct 2022 21:05:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2022 21:05:03 +0200
X-UD-Smtp-Session: l3s3148p1@QCzeXmLqONoucrRL
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFC 2/6] mmc: renesas_sdhi: improve naming of DMA struct
Date:   Thu,  6 Oct 2022 21:04:48 +0200
Message-Id: <20221006190452.5316-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221006190452.5316-1-wsa+renesas@sang-engineering.com>
References: <20221006190452.5316-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Commit 058db2868cd8 ("mmc: tmio, renesas_sdhi: move struct tmio_mmc_dma
to renesas_sdhi.h") is correct. The DMA struct should be prefixed with
'renesas_sdhi' to avoid confusion about is namespace. Fix some
indentation while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi.h      | 8 ++++----
 drivers/mmc/host/renesas_sdhi_core.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index c4abfee1ebae..b661892847f6 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -53,12 +53,12 @@ struct renesas_sdhi_of_data_with_quirks {
 	const struct renesas_sdhi_quirks *quirks;
 };
 
-struct tmio_mmc_dma {
+struct renesas_sdhi_dma {
 	enum dma_slave_buswidth dma_buswidth;
 	bool (*filter)(struct dma_chan *chan, void *arg);
 	void (*enable)(struct tmio_mmc_host *host, bool enable);
-	struct completion	dma_dataend;
-	struct tasklet_struct	dma_complete;
+	struct completion dma_dataend;
+	struct tasklet_struct dma_complete;
 };
 
 struct renesas_sdhi {
@@ -66,7 +66,7 @@ struct renesas_sdhi {
 	struct clk *clkh;
 	struct clk *clk_cd;
 	struct tmio_mmc_data mmc_data;
-	struct tmio_mmc_dma dma_priv;
+	struct renesas_sdhi_dma dma_priv;
 	const struct renesas_sdhi_quirks *quirks;
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pins_default, *pins_uhs;
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index b970699743e0..0733951325e9 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -908,7 +908,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 {
 	struct tmio_mmc_data *mmd = pdev->dev.platform_data;
 	struct tmio_mmc_data *mmc_data;
-	struct tmio_mmc_dma *dma_priv;
+	struct renesas_sdhi_dma *dma_priv;
 	struct tmio_mmc_host *host;
 	struct renesas_sdhi *priv;
 	int num_irqs, irq, ret, i;
-- 
2.35.1

