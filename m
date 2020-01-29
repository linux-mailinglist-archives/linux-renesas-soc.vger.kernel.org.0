Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37A1914D1F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2020 21:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgA2Uh0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jan 2020 15:37:26 -0500
Received: from sauhun.de ([88.99.104.3]:41370 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbgA2Uh0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jan 2020 15:37:26 -0500
Received: from localhost (p5486CF2C.dip0.t-ipconnect.de [84.134.207.44])
        by pokefinder.org (Postfix) with ESMTPSA id 427C62C28B0;
        Wed, 29 Jan 2020 21:37:24 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 2/6] mmc: renesas_sdhi: complain loudly if driver needs update
Date:   Wed, 29 Jan 2020 21:37:05 +0100
Message-Id: <20200129203709.30493-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
References: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When the tap array in the driver is too low, this is not a warning but
an error. Also _once is not helpful, we should make sure it is
prominently in the logs. It is safe to do this because this will only
show up during SoC enablement when we a new SoCs needs more taps (if
that ever will happen).

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Note: 'unsigned long' seems big enough for a while. But, famous last
words(tm). We could handle this at runtime by reallocating a bigger
buffer. Very unsure if it is worth it, though.

 drivers/mmc/host/renesas_sdhi_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index b3ab66f963f8..d63aeb35bd0b 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -499,9 +499,9 @@ static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
 		return 0; /* Tuning is not supported */
 
 	if (host->tap_num * 2 >= sizeof(host->taps) * BITS_PER_BYTE) {
-		dev_warn_once(&host->pdev->dev,
-			"Too many taps, skipping tuning. Please consider updating size of taps field of tmio_mmc_host\n");
-		return 0;
+		dev_err(&host->pdev->dev,
+			"Too many taps, please update 'taps' in tmio_mmc_host!\n");
+		return -EINVAL;
 	}
 
 	priv->doing_tune = true;
-- 
2.20.1

