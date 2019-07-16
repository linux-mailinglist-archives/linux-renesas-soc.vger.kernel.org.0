Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6753B6AB3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2019 17:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbfGPPBV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Jul 2019 11:01:21 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:18387 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387857AbfGPPBV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jul 2019 11:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1563289279;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=/oKBVysnS6pnsgJqnvc4PKg6WVXy4zXMetDOoCMTtvs=;
        b=FlbvAbobE01Z3+0air5cdR69ZKm8FW9Y/GfbwC24BIZOtXpe1deYOdHJ0EoCo9p6th
        9TQJNl8aqoVlVWIIpLo4nedZOaMFFZ+xLtw2kUd/lscZmofgtqcsvQt0jnELp5dILQLG
        mtoHdcE61W1QLfzuwtD2xq25g7CNxowCs38YKyHgdpO7pqocmEE1GPxz4vLSoteYexyZ
        kkCwHS2jX8j+mhFFiPdwDKB5tq7WFshLfEREZr9vFsoU3NngJTBs4gN892IOEy9yqZhs
        i9bxiSsEGAuEbt9eX2SXbbNeuieqUvXqQVYGqLIgbvDBWDF8NeuXYs3eem/XgTbbJ5eA
        5LXg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82dYd7rJSdw="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id h0a328v6GF1Ed5I
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Tue, 16 Jul 2019 17:01:14 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org
Cc:     niklas.soderlund@ragnatech.se, wsa@the-dreams.de,
        yamada.masahiro@socionext.com, geert@linux-m68k.org,
        ulf.hansson@linaro.org, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 2/2] mmc: tmio: remove obsolete PM workaround
Date:   Tue, 16 Jul 2019 17:01:04 +0200
Message-Id: <1563289264-26432-3-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563289264-26432-1-git-send-email-uli+renesas@fpond.eu>
References: <1563289264-26432-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Obsoleted by
"mmc: tmio: move runtime PM enablement to the driver implementations".

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/mmc/host/tmio_mmc_core.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 26dcbba..29c0d2c 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1221,15 +1221,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 		_host->reset = tmio_mmc_reset;
 
 	/*
-	 * On Gen2+, eMMC with NONREMOVABLE currently fails because native
-	 * hotplug gets disabled. It seems RuntimePM related yet we need further
-	 * research. Since we are planning a PM overhaul anyway, let's enforce
-	 * for now the device being active by enabling native hotplug always.
-	 */
-	if (pdata->flags & TMIO_MMC_MIN_RCAR2)
-		_host->native_hotplug = true;
-
-	/*
 	 * While using internal tmio hardware logic for card detection, we need
 	 * to ensure it stays powered for it to work.
 	 */
-- 
2.7.4

