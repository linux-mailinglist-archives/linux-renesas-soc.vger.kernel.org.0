Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568963321E3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 10:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbhCIJYU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 04:24:20 -0500
Received: from www.zeus03.de ([194.117.254.33]:40650 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229901AbhCIJYG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 04:24:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=GNoxppjsnNA+kD
        oqoHTrNXAvH79ZZvUbSiTMWiko7jQ=; b=lBvXfb5AdVM5CkAyMBgZzgKYip1igg
        hs4c8ZmiS+4z4n+ng/v0M/H6FP/sw+Y0xLi7gPDHEanQjFicf1G/K3BMCwH6ivrj
        Daf0denzldUlT375kSouAityesjnfC3XFgTW3l4YCwOtAZBaYw27P5KVM6fKMZoA
        Nqmsgf5Jjaf7E=
Received: (qmail 3419240 invoked from network); 9 Mar 2021 10:23:41 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Mar 2021 10:23:41 +0100
X-UD-Smtp-Session: l3s3148p1@82IpGxe9oIogAwDPXw8WAIb6kxwVO+fo
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] mmc: tmio: abort DMA before reset
Date:   Tue,  9 Mar 2021 10:23:31 +0100
Message-Id: <20210309092332.30705-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210309092332.30705-1-wsa+renesas@sang-engineering.com>
References: <20210309092332.30705-1-wsa+renesas@sang-engineering.com>
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

