Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2662ADB87
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 17:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgKJQWB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 11:22:01 -0500
Received: from www.zeus03.de ([194.117.254.33]:35252 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728272AbgKJQWA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 11:22:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=SSXs46EzPXYPx9
        SGm1G0SOpukRkazKgNENaRTW8PUUk=; b=BVXXlAoLP93vJNbtn+SBL32VNdWh4f
        NOyhdw1YoAh2ISWvQRsnxku03S7Jv6GvPm2K+4W7hcdZ0jD3FYtHhcpCNbMs16em
        Edd+LpQLJyPfsdPTV8mtNqMpiqBQmfZjeCLcY7EknHkyeJUQmoen7V6/r03KDbDK
        2s1/DfihUT8b8=
Received: (qmail 2226069 invoked from network); 10 Nov 2020 17:21:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2020 17:21:58 +0100
X-UD-Smtp-Session: l3s3148p1@2Ab8E8OzTMsgAwDPXxAvAEQD26z+TKuA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] mmc: renesas_sdhi: merge the SCC reset functions
Date:   Tue, 10 Nov 2020 17:21:50 +0100
Message-Id: <20201110162151.37622-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110162151.37622-1-wsa+renesas@sang-engineering.com>
References: <20201110162151.37622-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is no user of renesas_sdhi_reset_scc() anymore, only
renesas_sdhi_disable_scc() so merge these functions into one. I guess
the seperation was cruft anyhow. The BSP doesn't have it anymore and I
can't recall the reason we had it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 476a0c0198c6..a77dc9b46041 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -424,9 +424,11 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 		priv->needs_adjust_hs400 = true;
 }
 
-static void renesas_sdhi_reset_scc(struct tmio_mmc_host *host,
-				   struct renesas_sdhi *priv)
+static void renesas_sdhi_disable_scc(struct mmc_host *mmc)
 {
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+	struct renesas_sdhi *priv = host_to_priv(host);
+
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 
@@ -434,14 +436,6 @@ static void renesas_sdhi_reset_scc(struct tmio_mmc_host *host,
 		       ~SH_MOBILE_SDHI_SCC_CKSEL_DTSEL &
 		       sd_scc_read32(host, priv,
 				     SH_MOBILE_SDHI_SCC_CKSEL));
-}
-
-static void renesas_sdhi_disable_scc(struct mmc_host *mmc)
-{
-	struct tmio_mmc_host *host = mmc_priv(mmc);
-	struct renesas_sdhi *priv = host_to_priv(host);
-
-	renesas_sdhi_reset_scc(host, priv);
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
 		       ~SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN &
-- 
2.28.0

