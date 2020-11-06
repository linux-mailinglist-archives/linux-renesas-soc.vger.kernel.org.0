Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2A02A9040
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Nov 2020 08:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgKFHZ5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Nov 2020 02:25:57 -0500
Received: from www.zeus03.de ([194.117.254.33]:41468 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726190AbgKFHZ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Nov 2020 02:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=u8BmXfQE8Q7zzy
        pkikRD2J/m3RuKZ3y+1kFKMF9gU3w=; b=RD8v87mI75VZ0yGVE7/QfLx5e+FKLx
        5aKyWYGcnG4JJjfBxNfFzzMxJpn+468QgJXwFxq9l588uFx/9S+v6VgPgCv/2zQI
        fUbki/ZBK16xvUPiHpRxXEuZ628yEPEcHH4X37n/kHVWiFLz1sUkiohW4TH+2yni
        qG+mlPCHaI1Fo=
Received: (qmail 858618 invoked from network); 6 Nov 2020 08:25:54 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Nov 2020 08:25:54 +0100
X-UD-Smtp-Session: l3s3148p1@26KAH2uzVoggAwDPXwt7AGjsMIC0/1f/
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: [PATCH 2/3] mmc: tmio: bring tuning HW to a sane state with MMC_POWER_OFF
Date:   Fri,  6 Nov 2020 08:25:48 +0100
Message-Id: <20201106072549.1495-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106072549.1495-1-wsa+renesas@sang-engineering.com>
References: <20201106072549.1495-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When powering off a card, we need to disable the tuning HW (like SCC for
the Renesas SDHI) to get to a sane state and allow for re-tuning new
cards. This was hidden before because we wrongly did that in hw_reset()
before which was an unintended use of hw_reset(). Now that we corrected
the use of hw_reset() meanwhile, we revealed this shortcoming and need
to fix it properly by explicitly calling the downgrade callback.

Fixes: 6e7d4de10890 ("mmc: renesas_sdhi: move wrong 'hw_reset' to 'reset'")
Suggested-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
Reviewed-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index cfb53d7c63d7..cb4149fd12e0 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -927,6 +927,9 @@ static void tmio_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	switch (ios->power_mode) {
 	case MMC_POWER_OFF:
 		tmio_mmc_power_off(host);
+		/* Downgrade ensures a sane state for tuning HW (e.g. SCC) */
+		if (host->mmc->ops->hs400_downgrade)
+			host->mmc->ops->hs400_downgrade(host->mmc);
 		host->set_clock(host, 0);
 		break;
 	case MMC_POWER_UP:
-- 
2.28.0

