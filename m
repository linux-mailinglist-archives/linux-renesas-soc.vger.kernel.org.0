Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 279A52AEE5A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Nov 2020 11:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgKKKCy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Nov 2020 05:02:54 -0500
Received: from www.zeus03.de ([194.117.254.33]:47534 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726395AbgKKKCy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Nov 2020 05:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=n8Gi3QPLhRpJD0
        CXun5HzOY47PMuSQ9DGAr0KyEXrlE=; b=MjzU5vGEcc0zSFoH2uh5i46XNxDEHH
        2Q2qNbH/sC4owKqbLBBywyiKKwWFVdfAAzGOZG4JKM0o8lzebEGg1WutwUF2hdi/
        3T5FmapguVpXziTb342G37ZREhMVByu35bDWbibejQns1chH3Xp9Ed9iamr0CdXe
        zTrQhKdH7krqc=
Received: (qmail 2440301 invoked from network); 11 Nov 2020 11:02:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Nov 2020 11:02:51 +0100
X-UD-Smtp-Session: l3s3148p1@Elr75dGzVpMgAwDPXwjxAOzndPPvnXZD
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] mmc: renesas_sdhi: improve HOST_MODE usage
Date:   Wed, 11 Nov 2020 11:02:42 +0100
Message-Id: <20201111100244.15823-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111100244.15823-1-wsa+renesas@sang-engineering.com>
References: <20201111100244.15823-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

HOST_MODE should have a CTL_ prefix, too. This makes the code more
readable because we immediately know what it is. Also, remove the
hardcoded values with something readable, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 25c6a1993f8e..b3eb0182c4af 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -39,7 +39,15 @@
 #include "renesas_sdhi.h"
 #include "tmio_mmc.h"
 
-#define HOST_MODE		0xe4
+#define CTL_HOST_MODE	0xe4
+#define HOST_MODE_GEN2_SDR50_WMODE	BIT(0)
+#define HOST_MODE_GEN2_SDR104_WMODE	BIT(0)
+#define HOST_MODE_GEN3_WMODE		BIT(0)
+#define HOST_MODE_GEN3_BUSWIDTH		BIT(8)
+
+#define HOST_MODE_GEN3_16BIT	HOST_MODE_GEN3_WMODE
+#define HOST_MODE_GEN3_32BIT	(HOST_MODE_GEN3_WMODE | HOST_MODE_GEN3_BUSWIDTH)
+#define HOST_MODE_GEN3_64BIT	0
 
 #define SDHI_VER_GEN2_SDR50	0x490c
 #define SDHI_VER_RZ_A1		0x820b
@@ -60,26 +68,26 @@ static void renesas_sdhi_sdbuf_width(struct tmio_mmc_host *host, int width)
 	 */
 	switch (sd_ctrl_read16(host, CTL_VERSION)) {
 	case SDHI_VER_GEN2_SDR50:
-		val = (width == 32) ? 0x0001 : 0x0000;
+		val = (width == 32) ? HOST_MODE_GEN2_SDR50_WMODE : 0;
 		break;
 	case SDHI_VER_GEN2_SDR104:
-		val = (width == 32) ? 0x0000 : 0x0001;
+		val = (width == 32) ? 0 : HOST_MODE_GEN2_SDR104_WMODE;
 		break;
 	case SDHI_VER_GEN3_SD:
 	case SDHI_VER_GEN3_SDMMC:
 		if (width == 64)
-			val = 0x0000;
+			val = HOST_MODE_GEN3_64BIT;
 		else if (width == 32)
-			val = 0x0101;
+			val = HOST_MODE_GEN3_32BIT;
 		else
-			val = 0x0001;
+			val = HOST_MODE_GEN3_16BIT;
 		break;
 	default:
 		/* nothing to do */
 		return;
 	}
 
-	sd_ctrl_write16(host, HOST_MODE, val);
+	sd_ctrl_write16(host, CTL_HOST_MODE, val);
 }
 
 static int renesas_sdhi_clk_enable(struct tmio_mmc_host *host)
@@ -795,7 +803,7 @@ static int renesas_sdhi_write16_hook(struct tmio_mmc_host *host, int addr)
 	case CTL_SD_MEM_CARD_OPT:
 	case CTL_TRANSACTION_CTL:
 	case CTL_DMA_ENABLE:
-	case HOST_MODE:
+	case CTL_HOST_MODE:
 		if (host->pdata->flags & TMIO_MMC_HAVE_CBSY)
 			bit = TMIO_STAT_CMD_BUSY;
 		fallthrough;
-- 
2.28.0

