Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7633A122A52
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 12:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbfLQLkp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 06:40:45 -0500
Received: from sauhun.de ([88.99.104.3]:52208 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727216AbfLQLkp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 06:40:45 -0500
Received: from localhost (p54B330AA.dip0.t-ipconnect.de [84.179.48.170])
        by pokefinder.org (Postfix) with ESMTPSA id 343CB2C2D98;
        Tue, 17 Dec 2019 12:40:44 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 4/5] mmc: renesas_sdhi: enforce manual correction for Gen3
Date:   Tue, 17 Dec 2019 12:40:33 +0100
Message-Id: <20191217114034.13290-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191217114034.13290-1-wsa+renesas@sang-engineering.com>
References: <20191217114034.13290-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

HW engineers say that automatic tap correction cannot be used for HS400
in all R-Car Gen3 SoCs. So, check for that SDHI variant and disable it
when HS400 is about to be enabled.

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index e5db96fd0a69..04f502345b91 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -348,6 +348,12 @@ static void renesas_sdhi_hs400_complete(struct tmio_mmc_host *host)
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

