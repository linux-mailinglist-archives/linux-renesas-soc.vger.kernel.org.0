Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3821D9D12
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 18:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729402AbgESQm6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 12:42:58 -0400
Received: from www.zeus03.de ([194.117.254.33]:42466 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729254AbgESQm5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 12:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=gKch7uJ/fXf6oc1psmQOODM3VA6
        THZ6qEwcwZoTcP38=; b=pd1PnPCgH3ukS1z7qioTyD1eDwOXaFu4GbbcLB8ODGw
        0zZ4g62fr5Ls3ju4DGJij0qAEAkWmYwOQgWMQ8EESkWAzpeg0uTn9h0pCUs9nnzr
        CpVjZgyFRgN85MUKhVu2SjxwKjZe7kqVuL0txGCLgmhVxP95B8UTF1B9sVR7jp5I
        =
Received: (qmail 330267 invoked from network); 19 May 2020 18:42:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2020 18:42:55 +0200
X-UD-Smtp-Session: l3s3148p1@8TSr+AKmBOogAwDPXxCmAFNwG0mTH/5q
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] mmc: renesas_sdhi: remove manual clk handling
Date:   Tue, 19 May 2020 18:42:51 +0200
Message-Id: <20200519164251.5430-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SDHI driver en-/disabled its main clock on its own, e.g. during
probe() and remove(). Now, we leave all handling to RPM.

clk_summary before:
sd0                   1        1        0    12480000          0     0  50000
   sdif0              2        2        0    12480000          0     0  50000

clk_summary after:
sd0                   1        1        0    12480000          0     0  50000
   sdif0              1        1        0    12480000          0     0  50000

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Depends on mmc/next + "[PATCH 2/2] mmc: tmio: Make sure the PM domain is
'started' while probing" from Ulf

Changes since v1:

* reworded commit message
* don't remove the en-/disable calls themselves but only the clk_* calls
  to the main clock


 drivers/mmc/host/renesas_sdhi_core.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index dcba9ad35dd1..15e21894bd44 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -83,16 +83,11 @@ static int renesas_sdhi_clk_enable(struct tmio_mmc_host *host)
 {
 	struct mmc_host *mmc = host->mmc;
 	struct renesas_sdhi *priv = host_to_priv(host);
-	int ret = clk_prepare_enable(priv->clk);
-
-	if (ret < 0)
-		return ret;
+	int ret;
 
 	ret = clk_prepare_enable(priv->clk_cd);
-	if (ret < 0) {
-		clk_disable_unprepare(priv->clk);
+	if (ret < 0)
 		return ret;
-	}
 
 	/*
 	 * The clock driver may not know what maximum frequency
@@ -198,7 +193,6 @@ static void renesas_sdhi_clk_disable(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 
-	clk_disable_unprepare(priv->clk);
 	clk_disable_unprepare(priv->clk_cd);
 }
 
-- 
2.20.1

