Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B112AD898
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 15:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730909AbgKJOVM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 09:21:12 -0500
Received: from www.zeus03.de ([194.117.254.33]:57726 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730059AbgKJOVL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 09:21:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=8OLicZQ4BYdeYN
        CFQUqWfWQAugaY3wMaaYirved77f0=; b=uMVYRaSDHFpxGa94WvjhN/p1auOpdL
        K4olKpQsXE2zRe+OGuCqJLjaOS1Qo/lUVJLpYQmCBooeeJCeaQvW6u7nMNWMUOr+
        Hf/lsMQZFe5qAzWODT8ZEHZU0/a9kO2D+resKtYFINa0D3PtEgsRhiJgUrhwFC+u
        +s9HneXtJ7OM0=
Received: (qmail 2195616 invoked from network); 10 Nov 2020 15:21:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2020 15:21:09 +0100
X-UD-Smtp-Session: l3s3148p1@SzfdY8GzXMogAwDPXxAvAEQD26z+TKuA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 1/4] mmc: renesas_sdhi: only reset SCC when its pointer is populated
Date:   Tue, 10 Nov 2020 15:20:55 +0100
Message-Id: <20201110142058.36393-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
References: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Only re-initialize SCC and tuning when an SCC was found during probe().
This is currently a noop because all R-Car Gen2+ are considered to have
an SCC. But this will change in a later patch, so we need this
preparation.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index acb9c81a4e45..a395f835e836 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -556,16 +556,18 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 
-	renesas_sdhi_reset_scc(host, priv);
-	renesas_sdhi_reset_hs400_mode(host, priv);
-	priv->needs_adjust_hs400 = false;
+	if (priv->scc_ctl) {
+		renesas_sdhi_reset_scc(host, priv);
+		renesas_sdhi_reset_hs400_mode(host, priv);
+		priv->needs_adjust_hs400 = false;
 
-	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
-			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+		sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
+				sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 
-	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
-		       ~SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &
-		       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
+			       ~SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &
+			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
+	}
 
 	if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
 		sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK,
-- 
2.28.0

