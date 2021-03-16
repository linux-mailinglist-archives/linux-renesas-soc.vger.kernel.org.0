Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101EC33D03C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 09:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235888AbhCPI5y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 04:57:54 -0400
Received: from www.zeus03.de ([194.117.254.33]:33822 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235875AbhCPI5X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 04:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=2jf7WpVhnhNxeK
        oaj2cTy81yqf4BV+6pvdt6z9+A6xA=; b=chMCHRg5QaLIWo6XZXoutJ+fEPAN7q
        EhMFybbycuqp0dffSDTnt0xKgmrRbiE7GzgfDgTlS/wyZK+jutar5LpBCTp4IN2x
        rbE8iyBr1V/vpVg57bUBHh51FgDv9EvWESDL5McT2RL+0NPhmHNjC6cliWV3T/Pq
        rbEVmbzztX/rM=
Received: (qmail 1697738 invoked from network); 16 Mar 2021 09:57:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Mar 2021 09:57:21 +0100
X-UD-Smtp-Session: l3s3148p1@Kn7ijaO9dJwgARa4ReUdAWIPBxWmfbkD
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT 1/2] mmc: tmio: restore bus width when resetting
Date:   Tue, 16 Mar 2021 09:57:16 +0100
Message-Id: <20210316085717.7276-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210316085717.7276-1-wsa+renesas@sang-engineering.com>
References: <20210316085717.7276-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Saito <takeshi.saito.xv@renesas.com>

Resetting the IP core will lose the bus width information and not all
code paths recover it. So, make sure the latest bus width gets restored
in the reset routine. For that, tmio_mmc_set_bus_width() is moved, but
not modified.

Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
[wsa: reworded commit message]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc_core.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index eca767dcabba..3755f606b8db 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -164,6 +164,21 @@ static void tmio_mmc_enable_sdio_irq(struct mmc_host *mmc, int enable)
 	}
 }
 
+static void tmio_mmc_set_bus_width(struct tmio_mmc_host *host,
+				   unsigned char bus_width)
+{
+	u16 reg = sd_ctrl_read16(host, CTL_SD_MEM_CARD_OPT)
+				& ~(CARD_OPT_WIDTH | CARD_OPT_WIDTH8);
+
+	/* reg now applies to MMC_BUS_WIDTH_4 */
+	if (bus_width == MMC_BUS_WIDTH_1)
+		reg |= CARD_OPT_WIDTH;
+	else if (bus_width == MMC_BUS_WIDTH_8)
+		reg |= CARD_OPT_WIDTH8;
+
+	sd_ctrl_write16(host, CTL_SD_MEM_CARD_OPT, reg);
+}
+
 static void tmio_mmc_reset(struct tmio_mmc_host *host)
 {
 	/* FIXME - should we set stop clock reg here */
@@ -177,6 +192,8 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host)
 	if (host->reset)
 		host->reset(host);
 
+	tmio_mmc_set_bus_width(host, host->mmc->ios.bus_width);
+
 	if (host->pdata->flags & TMIO_MMC_SDIO_IRQ) {
 		sd_ctrl_write16(host, CTL_SDIO_IRQ_MASK, host->sdio_irq_mask);
 		sd_ctrl_write16(host, CTL_TRANSACTION_CTL, 0x0001);
@@ -874,21 +891,6 @@ static void tmio_mmc_power_off(struct tmio_mmc_host *host)
 		host->set_pwr(host->pdev, 0);
 }
 
-static void tmio_mmc_set_bus_width(struct tmio_mmc_host *host,
-				   unsigned char bus_width)
-{
-	u16 reg = sd_ctrl_read16(host, CTL_SD_MEM_CARD_OPT)
-				& ~(CARD_OPT_WIDTH | CARD_OPT_WIDTH8);
-
-	/* reg now applies to MMC_BUS_WIDTH_4 */
-	if (bus_width == MMC_BUS_WIDTH_1)
-		reg |= CARD_OPT_WIDTH;
-	else if (bus_width == MMC_BUS_WIDTH_8)
-		reg |= CARD_OPT_WIDTH8;
-
-	sd_ctrl_write16(host, CTL_SD_MEM_CARD_OPT, reg);
-}
-
 static unsigned int tmio_mmc_get_timeout_cycles(struct tmio_mmc_host *host)
 {
 	u16 val = sd_ctrl_read16(host, CTL_SD_MEM_CARD_OPT);
-- 
2.30.0

