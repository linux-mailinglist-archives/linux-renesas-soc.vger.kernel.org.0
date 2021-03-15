Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD4D33BF45
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 16:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234886AbhCOPAC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 11:00:02 -0400
Received: from www.zeus03.de ([194.117.254.33]:47516 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233174AbhCOO7m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 10:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=k1; bh=X
        HWdSMJT3SK/dokK4XrN9UwDTghxNOnmHFGyv7BBqJ0=; b=kkH+HyPveybhv/Csp
        +P05JsW4k6OXdFx/KrOpH2uYO7s73EdVwGWbUQ627cMhl2K3RCYCMLqkMmjsMFvc
        aekvezwvL1QFayAdfV2Fj4Arsyd31jBsU5c68t++3uzmTELtavY3XqedIZJqM8Is
        Dwx9cAhYeV/UdTKzkBAKpiLP48=
Received: (qmail 1439236 invoked from network); 15 Mar 2021 15:59:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Mar 2021 15:59:40 +0100
X-UD-Smtp-Session: l3s3148p1@JpjHf5S9DIsgARa4RYTzARykWRFxRPkz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/3] mmc: tmio: abort DMA before reset
Date:   Mon, 15 Mar 2021 15:59:36 +0100
Message-Id: <20210315145938.58565-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210315145938.58565-1-wsa+renesas@sang-engineering.com>
References: <20210315145938.58565-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We will soon allow resetting the whole IP core via a reset controller.
For this case, DMA must be terminated before the actual reset. For the
other cases, it is probably better, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/mmc/host/tmio_mmc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 5aa57640d0e6..eca767dcabba 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -172,11 +172,11 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host)
 	sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
 	usleep_range(10000, 11000);
 
+	tmio_mmc_abort_dma(host);
+
 	if (host->reset)
 		host->reset(host);
 
-	tmio_mmc_abort_dma(host);
-
 	if (host->pdata->flags & TMIO_MMC_SDIO_IRQ) {
 		sd_ctrl_write16(host, CTL_SDIO_IRQ_MASK, host->sdio_irq_mask);
 		sd_ctrl_write16(host, CTL_TRANSACTION_CTL, 0x0001);
-- 
2.30.0

