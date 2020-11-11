Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360C52AEE5D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Nov 2020 11:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgKKKCz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Nov 2020 05:02:55 -0500
Received: from www.zeus03.de ([194.117.254.33]:47556 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726719AbgKKKCy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Nov 2020 05:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=YCy8wxg1ufxHfZ
        ISYOWIDzjZu1g2JJvtQZltsM1gT/0=; b=V6L3CBRSm11S+DClWWr0p9iMu5PFGi
        prNNqxnf9/jAsrUMx+IoWM8t2ThvKYvakjEIfAQzooMg277hEiQPNt+vgUVeczli
        pu9oH/meb0An5y/EWzhzoMnAO+CLLP20arL39HpL6IzXtpvK+42R4F2FGCUCD7IB
        lu4T5VbLLYb9o=
Received: (qmail 2440327 invoked from network); 11 Nov 2020 11:02:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Nov 2020 11:02:51 +0100
X-UD-Smtp-Session: l3s3148p1@rq0A5tGzWJMgAwDPXwjxAOzndPPvnXZD
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] mmc: renesas_sdhi: don't hardcode SDIF values
Date:   Wed, 11 Nov 2020 11:02:43 +0100
Message-Id: <20201111100244.15823-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111100244.15823-1-wsa+renesas@sang-engineering.com>
References: <20201111100244.15823-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use a macro to name the hardcoded values. Also, move the SDIF register
definition into the SDHI driver because this is an SDHI extension.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 7 +++++--
 drivers/mmc/host/tmio_mmc.h          | 1 -
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index b3eb0182c4af..55633826d38c 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -49,6 +49,9 @@
 #define HOST_MODE_GEN3_32BIT	(HOST_MODE_GEN3_WMODE | HOST_MODE_GEN3_BUSWIDTH)
 #define HOST_MODE_GEN3_64BIT	0
 
+#define CTL_SDIF_MODE	0xe6
+#define SDIF_MODE_HS400		BIT(0)
+
 #define SDHI_VER_GEN2_SDR50	0x490c
 #define SDHI_VER_RZ_A1		0x820b
 /* very old datasheets said 0x490c for SDR104, too. They are wrong! */
@@ -381,7 +384,7 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 
 	/* Set HS400 mode */
-	sd_ctrl_write16(host, CTL_SDIF_MODE, 0x0001 |
+	sd_ctrl_write16(host, CTL_SDIF_MODE, SDIF_MODE_HS400 |
 			sd_ctrl_read16(host, CTL_SDIF_MODE));
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF,
@@ -529,7 +532,7 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 
 	/* Reset HS400 mode */
-	sd_ctrl_write16(host, CTL_SDIF_MODE, ~0x0001 &
+	sd_ctrl_write16(host, CTL_SDIF_MODE, ~SDIF_MODE_HS400 &
 			sd_ctrl_read16(host, CTL_SDIF_MODE));
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF, priv->scc_tappos);
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 9546e542619c..7ff41185896a 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -42,7 +42,6 @@
 #define CTL_DMA_ENABLE 0xd8
 #define CTL_RESET_SD 0xe0
 #define CTL_VERSION 0xe2
-#define CTL_SDIF_MODE 0xe6
 
 /* Definitions for values the CTL_STOP_INTERNAL_ACTION register can take */
 #define TMIO_STOP_STP		BIT(0)
-- 
2.28.0

