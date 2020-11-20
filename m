Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14C3E2BABD1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Nov 2020 15:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726172AbgKTO0j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Nov 2020 09:26:39 -0500
Received: from www.zeus03.de ([194.117.254.33]:60822 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727123AbgKTO0j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Nov 2020 09:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=Y6rnl11TO/jMbY
        PkEDQWSXbVBirAewkoKRARAb8cBck=; b=xs2P9vIRNyDcfo3e95poSOHpZGoEry
        VmAjIHYIdV7jIi01yKz2a5n4evgQJ2iXe04laGqKOXxr446xNqbAwUZUVE00Lzul
        0vT4Zux6Ak/4AErXOCgIAoNCoDD1lC/Q2NnMIGZiMEp6oBjGk9170TC7HzZs/g20
        KPo/Sm8Pij8Uc=
Received: (qmail 1510293 invoked from network); 20 Nov 2020 15:26:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2020 15:26:37 +0100
X-UD-Smtp-Session: l3s3148p1@62PQoYq0uNwgAwDPXwi7AEBAgYxIRHZX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT 2/3] mmc: tmio: Add data timeout error detection
Date:   Fri, 20 Nov 2020 15:26:28 +0100
Message-Id: <20201120142629.98222-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201120142629.98222-1-wsa+renesas@sang-engineering.com>
References: <20201120142629.98222-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

Currently, busy timeout is not checked for data transfer command. But,
if the temperature condition changes, the data cannot be acquired
correctly and timeout may occur. Also, we could reproduce an issue by
using mmc_test driver (e.g. "Correct xfer_size at write (start
failure)"). Therefore, this adds timeout error check.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
[saito: rework commit message.]
Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
[shimoda: rebase, add commit description]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc.h      |  6 ++++--
 drivers/mmc/host/tmio_mmc_core.c | 17 +++++++++++------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 819198af17f4..15cf850e75d3 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -100,8 +100,10 @@
 /* This is the mask used at reset by the chip */
 #define TMIO_MASK_INIT_RCAR2	0x8b7f031d /* Initial value for R-Car Gen2+ */
 #define TMIO_MASK_ALL           0x837f031d
-#define TMIO_MASK_READOP  (TMIO_STAT_RXRDY | TMIO_STAT_DATAEND)
-#define TMIO_MASK_WRITEOP (TMIO_STAT_TXRQ | TMIO_STAT_DATAEND)
+#define TMIO_MASK_READOP  (TMIO_STAT_RXRDY | TMIO_STAT_DATAEND | \
+			   TMIO_STAT_DATATIMEOUT)
+#define TMIO_MASK_WRITEOP (TMIO_STAT_TXRQ | TMIO_STAT_DATAEND | \
+			   TMIO_STAT_DATATIMEOUT)
 #define TMIO_MASK_CMD     (TMIO_STAT_CMDRESPEND | TMIO_STAT_CMDTIMEOUT | \
 		TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT)
 #define TMIO_MASK_IRQ     (TMIO_MASK_READOP | TMIO_MASK_WRITEOP | TMIO_MASK_CMD)
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 2518fa9f9fc6..9c76bc5ac46c 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -477,8 +477,10 @@ static void tmio_mmc_data_irq(struct tmio_mmc_host *host, unsigned int stat)
 	if (!data)
 		goto out;
 
-	if (stat & TMIO_STAT_CRCFAIL || stat & TMIO_STAT_STOPBIT_ERR ||
-	    stat & TMIO_STAT_TXUNDERRUN)
+	if (stat & TMIO_STAT_DATATIMEOUT)
+		data->error = -ETIMEDOUT;
+	else if (stat & TMIO_STAT_CRCFAIL || stat & TMIO_STAT_STOPBIT_ERR ||
+		 stat & TMIO_STAT_TXUNDERRUN)
 		data->error = -EILSEQ;
 	if (host->dma_on && (data->flags & MMC_DATA_WRITE)) {
 		u32 status = sd_ctrl_read16_and_16_as_32(host, CTL_STATUS);
@@ -501,11 +503,13 @@ static void tmio_mmc_data_irq(struct tmio_mmc_host *host, unsigned int stat)
 		}
 
 		if (done) {
-			tmio_mmc_disable_mmc_irqs(host, TMIO_STAT_DATAEND);
+			tmio_mmc_disable_mmc_irqs(host, TMIO_STAT_DATAEND |
+						  TMIO_STAT_DATATIMEOUT);
 			tmio_mmc_dataend_dma(host);
 		}
 	} else if (host->dma_on && (data->flags & MMC_DATA_READ)) {
-		tmio_mmc_disable_mmc_irqs(host, TMIO_STAT_DATAEND);
+		tmio_mmc_disable_mmc_irqs(host, TMIO_STAT_DATAEND |
+					  TMIO_STAT_DATATIMEOUT);
 		tmio_mmc_dataend_dma(host);
 	} else {
 		tmio_mmc_do_data_irq(host);
@@ -619,8 +623,9 @@ static bool __tmio_mmc_sdcard_irq(struct tmio_mmc_host *host, int ireg,
 	}
 
 	/* Data transfer completion */
-	if (ireg & TMIO_STAT_DATAEND) {
-		tmio_mmc_ack_mmc_irqs(host, TMIO_STAT_DATAEND);
+	if (ireg & (TMIO_STAT_DATAEND | TMIO_STAT_DATATIMEOUT)) {
+		tmio_mmc_ack_mmc_irqs(host, TMIO_STAT_DATAEND |
+				      TMIO_STAT_DATATIMEOUT);
 		tmio_mmc_data_irq(host, status);
 		return true;
 	}
-- 
2.28.0

