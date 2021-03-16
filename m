Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3AB33D038
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 09:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbhCPI5z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 04:57:55 -0400
Received: from www.zeus03.de ([194.117.254.33]:33834 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235582AbhCPI5X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 04:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=1rxyPzF/KBHScf
        8FUZZGAZ4mXvdSvnzxFslpRz19tHo=; b=Y57UHFHuf4XRhjrgCJYHUQCpfrkyxf
        ivhdO6xCiMl+hW5Ex4H42h5KAdv7Bc3Cmc+/0gwueWZjdZvjCsMh0ys3ni23YGqH
        2iDF+Am55brST/SkXhhU4ix92AKlbpjM/EgOD69DV/vPpiYH4jICgmYJMfVFyT8W
        7Tm/umMl0pfvE=
Received: (qmail 1697766 invoked from network); 16 Mar 2021 09:57:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Mar 2021 09:57:21 +0100
X-UD-Smtp-Session: l3s3148p1@N3jojaO9dpwgARa4ReUdAWIPBxWmfbkD
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: [PATCH RFT 2/2] mmc: tmio: always flag retune when resetting and a card is present
Date:   Tue, 16 Mar 2021 09:57:17 +0100
Message-Id: <20210316085717.7276-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210316085717.7276-1-wsa+renesas@sang-engineering.com>
References: <20210316085717.7276-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

After reset, we manually flagged retune in runtime resume, but missed it
in the workqueue. To fix that and avoid the problem in the future, let's
flag retune in the reset handler directly whenever a card is present.

Reported-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 3755f606b8db..2e85e40f50f9 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -198,6 +198,9 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host)
 		sd_ctrl_write16(host, CTL_SDIO_IRQ_MASK, host->sdio_irq_mask);
 		sd_ctrl_write16(host, CTL_TRANSACTION_CTL, 0x0001);
 	}
+
+	if (host->mmc->card)
+		mmc_retune_needed(host->mmc);
 }
 
 static void tmio_mmc_reset_work(struct work_struct *work)
@@ -1290,8 +1293,6 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
 
 	tmio_mmc_enable_dma(host, true);
 
-	mmc_retune_needed(host->mmc);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(tmio_mmc_host_runtime_resume);
-- 
2.30.0

