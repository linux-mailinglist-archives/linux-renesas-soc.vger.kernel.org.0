Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92DB11105F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 21:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbfLCUdI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 15:33:08 -0500
Received: from sauhun.de ([88.99.104.3]:34616 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbfLCUdI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 15:33:08 -0500
Received: from localhost (p54B33759.dip0.t-ipconnect.de [84.179.55.89])
        by pokefinder.org (Postfix) with ESMTPSA id A31C62C0667;
        Tue,  3 Dec 2019 21:33:06 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 2/2] mmc: renesas_sdhi: enfore manual correction for Gen3
Date:   Tue,  3 Dec 2019 21:33:00 +0100
Message-Id: <20191203203301.2202-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191203203301.2202-1-wsa+renesas@sang-engineering.com>
References: <20191203203301.2202-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

HW engineers say that automatic tap correction cannot be used for HS400
in all R-Car Gen3 SoCs. So, check for that SDHI variant and disable it
when HS400 is about to be enabled.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

The BSP handles this differently and adds a quirk entry to every
soc_device_match and checks the quirk entry. I chose this less intrusive
method because all Gen3 SoCs are affected. But not all SDHI instances,
only those which can access eMMC, of course. So, I likes this approach a
tad better. If you think all quirks should be centralized in the quirks
structure, I am open for discussion.

 drivers/mmc/host/renesas_sdhi_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 903da3ba399b..a29290ee2051 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -343,6 +343,12 @@ static void renesas_sdhi_hs400_complete(struct tmio_mmc_host *host)
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF,
 		       priv->scc_tappos_hs400);
 
+	/* Gen3 can't do automatic tap correction with HS400, so disable it */
+	if (sd_ctrl_read16(host, CTL_VERSION) == SDHI_VER_GEN3_SDMMC)
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
+			       ~SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &
+			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
+
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       (SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
 			SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
-- 
2.20.1

