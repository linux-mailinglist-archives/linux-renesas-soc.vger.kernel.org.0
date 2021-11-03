Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20BD4444176
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Nov 2021 13:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhKCM30 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Nov 2021 08:29:26 -0400
Received: from www.zeus03.de ([194.117.254.33]:53722 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231804AbhKCM30 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 08:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=dalSsZMZGXDNwurXXr+ILQFzvpH
        zhGeUPZpij+Gllzs=; b=K+1rR447VYfDG/6W1FjsNwevQgbh2coFSeRBw5L9Sct
        NP1n07k6rbQF3Ahvjz127r3gZZJMZt5/f0EDmB6Xtjx3gZ8qo8XV9+tys1brDMHy
        pYXIp4E8Y5aKO6ZlBJ3NqXZxbDCxhMY17sAO6n+NnNN7FriKRYvfL5ICOW1vOlw0
        =
Received: (qmail 3844152 invoked from network); 3 Nov 2021 13:26:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2021 13:26:48 +0100
X-UD-Smtp-Session: l3s3148p1@PBEahuHPBJkgAQnoAGqXAf+bVXO+JoZP
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: tmio: reinit card irqs in reset routine
Date:   Wed,  3 Nov 2021 13:26:46 +0100
Message-Id: <20211103122646.64422-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das.jz@bp.renesas.com>

Refactor the code so that card detect irqs are always reenabled after a
reset. This avoids doing it manually all over the code or forgetting to
do this in the future.

Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
[wsa: added a comment when 'native_hotplug' has to be set]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc_core.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index e2affa52ef46..a5850d83908b 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -960,14 +960,8 @@ static void tmio_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	case MMC_POWER_OFF:
 		tmio_mmc_power_off(host);
 		/* For R-Car Gen2+, we need to reset SDHI specific SCC */
-		if (host->pdata->flags & TMIO_MMC_MIN_RCAR2) {
-			host->reset(host);
-
-			if (host->native_hotplug)
-				tmio_mmc_enable_mmc_irqs(host,
-						TMIO_STAT_CARD_REMOVE |
-						TMIO_STAT_CARD_INSERT);
-		}
+		if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
+			tmio_mmc_reset(host);
 
 		host->set_clock(host, 0);
 		break;
@@ -1175,6 +1169,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	if (mmc_can_gpio_cd(mmc))
 		_host->ops.get_cd = mmc_gpio_get_cd;
 
+	/* must be set before tmio_mmc_reset() */
 	_host->native_hotplug = !(mmc_can_gpio_cd(mmc) ||
 				  mmc->caps & MMC_CAP_NEEDS_POLL ||
 				  !mmc_card_is_removable(mmc));
@@ -1295,10 +1290,6 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
 	if (host->clk_cache)
 		host->set_clock(host, host->clk_cache);
 
-	if (host->native_hotplug)
-		tmio_mmc_enable_mmc_irqs(host,
-				TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT);
-
 	tmio_mmc_enable_dma(host, true);
 
 	return 0;
-- 
2.30.2

