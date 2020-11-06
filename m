Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C38D2A9039
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Nov 2020 08:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgKFHZ4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Nov 2020 02:25:56 -0500
Received: from www.zeus03.de ([194.117.254.33]:41452 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725842AbgKFHZ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Nov 2020 02:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=2YW8An1DBe+NNP
        SWVLGuVoEIEfzNzbqtC+jRBe9FCe0=; b=SADMdHqbAhlW0pjmIgVKvCTWDsKREy
        Sx/U3lDWudw0f9w3sH59+9obNUEbDupvHrG0ugiB9Cf/GdBlzS9zhw60dUhnXqS2
        Zj3Mh1sYvNFTbeyEnxNF95Dgneh8JvubIM588Ql1qskb8rcmRetK1aOkTxxAP4H7
        rgUwgVUG0rB/k=
Received: (qmail 858584 invoked from network); 6 Nov 2020 08:25:54 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Nov 2020 08:25:54 +0100
X-UD-Smtp-Session: l3s3148p1@iNt6H2uzVIggAwDPXwt7AGjsMIC0/1f/
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] mmc: tmio: when resetting, reset DMA controller, too
Date:   Fri,  6 Nov 2020 08:25:47 +0100
Message-Id: <20201106072549.1495-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106072549.1495-1-wsa+renesas@sang-engineering.com>
References: <20201106072549.1495-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When applying a revert, the assumption that DMA only needs to be cleared
in specific cases was wrong. We want to reset the DMA controller every
time the rest of the HW gets reset, too.

Fixes: 34e3211e5492 ("Revert "mmc: tmio: fix reset operation"")
Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 2fce0518632d..cfb53d7c63d7 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -175,6 +175,8 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host)
 	if (host->reset)
 		host->reset(host);
 
+	tmio_mmc_abort_dma(host);
+
 	if (host->pdata->flags & TMIO_MMC_SDIO_IRQ) {
 		sd_ctrl_write16(host, CTL_SDIO_IRQ_MASK, host->sdio_irq_mask);
 		sd_ctrl_write16(host, CTL_TRANSACTION_CTL, 0x0001);
@@ -223,8 +225,6 @@ static void tmio_mmc_reset_work(struct work_struct *work)
 
 	/* Ready for new calls */
 	host->mrq = NULL;
-
-	tmio_mmc_abort_dma(host);
 	mmc_request_done(host->mmc, mrq);
 }
 
-- 
2.28.0

