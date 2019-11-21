Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F28C8105140
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2019 12:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfKULRl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Nov 2019 06:17:41 -0500
Received: from sauhun.de ([88.99.104.3]:59262 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726230AbfKULRl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 06:17:41 -0500
Received: from localhost (p54B33AAB.dip0.t-ipconnect.de [84.179.58.171])
        by pokefinder.org (Postfix) with ESMTPSA id BC7CB2C044D;
        Thu, 21 Nov 2019 12:17:38 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] Revert "mmc: tmio: remove workaround for NON_REMOVABLE"
Date:   Thu, 21 Nov 2019 12:17:33 +0100
Message-Id: <20191121111733.23738-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This reverts commit 7a7dab237027939cb95dc07c4647b80bad5fbbde. We found
out that there is still a race with RuntimePM. This can lead to a hang
when accessing the eMMC in some situations. Revert this change until the
RPM issue is fixed.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc_core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 75f16ff65ac5..c4a1d49fbea4 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1209,6 +1209,15 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	if (!_host->reset)
 		_host->reset = tmio_mmc_reset;
 
+	/*
+	 * On Gen2+, eMMC with NONREMOVABLE currently fails because native
+	 * hotplug gets disabled. It seems RuntimePM related yet we need further
+	 * research. Since we are planning a PM overhaul anyway, let's enforce
+	 * for now the device being active by enabling native hotplug always.
+	 */
+	if (pdata->flags & TMIO_MMC_MIN_RCAR2)
+		_host->native_hotplug = true;
+
 	/*
 	 * While using internal tmio hardware logic for card detection, we need
 	 * to ensure it stays powered for it to work.
-- 
2.20.1

