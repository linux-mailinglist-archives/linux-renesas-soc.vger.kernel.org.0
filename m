Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36846321539
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Feb 2021 12:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhBVLkr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Feb 2021 06:40:47 -0500
Received: from www.zeus03.de ([194.117.254.33]:48276 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230169AbhBVLkq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Feb 2021 06:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=E+pybpdAuxH/6U
        XJ5b9GeEbg6z+r6asi3e43nyjtNao=; b=D8jMJnn7w12+27Vl1NCteMLA1QCIAy
        baT4PBpW5jEsHrN40vFRbLWQUw4Gz1Wrd1scsJc3oGXvMy2LSOGKSEP6sC4DNSpl
        vWl0GDIdncKUh0fbYzQD1/07TbH4svajzKo06pU2hcBUcakN2wo0jJMDYAgk1x7b
        XqIqP61WS7bxs=
Received: (qmail 2216186 invoked from network); 22 Feb 2021 12:40:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Feb 2021 12:40:04 +0100
X-UD-Smtp-Session: l3s3148p1@2/hKQ+u7RMAgARa4RXmUARZp+YIgYjUK
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 1/2] mmc: tmio: abort DMA before reset
Date:   Mon, 22 Feb 2021 12:39:54 +0100
Message-Id: <20210222113955.7779-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210222113955.7779-1-wsa+renesas@sang-engineering.com>
References: <20210222113955.7779-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We will soon allow resetting the whole IP core via a reset controller.
For this case, DMA must be terminated before the actual reset. For the
other cases, it is probably better, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 2478a91e84b2..0e7a2faa5238 100644
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

