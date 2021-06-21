Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C973AE397
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 09:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbhFUHCs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 03:02:48 -0400
Received: from www.zeus03.de ([194.117.254.33]:56956 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229583AbhFUHCo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 03:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=A9dRsXCaYnIasu+H+nbPiLdt0Rm
        bsXpIzdZ6dEsD4JA=; b=HbFbCXLo19D5ytdfWRObIuU7jALT/0KGcVbkEltCoQU
        WUuB7rMaj+9e01fqMXku3uyKYm80CVDPxDPPMx5FgvTZjGXzVeJK6lqOxwwDE8SL
        ekfcWMpDNqYyxULwG/UEs5ir9fivBoqpO4ARxAg05U4v9kBGJgNfEo7vCQrS46ko
        =
Received: (qmail 1651335 invoked from network); 21 Jun 2021 09:00:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2021 09:00:18 +0200
X-UD-Smtp-Session: l3s3148p1@7cClOUHF7r8gAwDPXwSyANzZOjko0laY
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mmc: renesas_sdhi: sys_dmac: abort DMA synced to avoid timeouts
Date:   Mon, 21 Jun 2021 09:00:09 +0200
Message-Id: <20210621070009.13655-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When aborting DMA, we terminate the transfer without waiting for it to
succeed. This may lead to races which can e.g. lead to timeout problems
when tuning. Remove the deprecated dmaengine_terminate_all() function
and use the explicit dmaengine_terminate_sync().

Fixes: e3de2be7368d ("mmc: tmio_mmc: fix card eject during IO with DMA")
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Geert, this fixes the issue you have seen on your Koelsch board on my
Lager board. Can you test again with this patch please?

I noticed that Renesas driver are quite an active user of this
deprecated dmaengine function. I will audit and improve the other
drivers meanwhile.

 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index ffa64211f4de..6956b83469c8 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -108,9 +108,9 @@ static void renesas_sdhi_sys_dmac_abort_dma(struct tmio_mmc_host *host)
 	renesas_sdhi_sys_dmac_enable_dma(host, false);
 
 	if (host->chan_rx)
-		dmaengine_terminate_all(host->chan_rx);
+		dmaengine_terminate_sync(host->chan_rx);
 	if (host->chan_tx)
-		dmaengine_terminate_all(host->chan_tx);
+		dmaengine_terminate_sync(host->chan_tx);
 
 	renesas_sdhi_sys_dmac_enable_dma(host, true);
 }
-- 
2.30.2

