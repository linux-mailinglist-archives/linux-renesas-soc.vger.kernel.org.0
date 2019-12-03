Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7031105F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 21:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbfLCUdI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 15:33:08 -0500
Received: from sauhun.de ([88.99.104.3]:34602 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727118AbfLCUdI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 15:33:08 -0500
Received: from localhost (p54B33759.dip0.t-ipconnect.de [84.179.55.89])
        by pokefinder.org (Postfix) with ESMTPSA id E7F892C064F;
        Tue,  3 Dec 2019 21:33:05 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 1/2] mmc: renesas_sdhi: Add manual correction
Date:   Tue,  3 Dec 2019 21:32:59 +0100
Message-Id: <20191203203301.2202-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191203203301.2202-1-wsa+renesas@sang-engineering.com>
References: <20191203203301.2202-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Saito <takeshi.saito.xv@renesas.com>

This patch adds a manual correction mechanism for SDHI. Currently, SDHI
uses automatic TAP position correction. However, TAP position can also
be corrected manually via correction error status flags.

Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Pretty much like the BSP patch. Just some rebasing, refactorization and
updates of the commit message. I especially changed the original
calculation from:

+               host->tap_set = (host->tap_set +
+                                host->tap_num + 1) % host->tap_num;

 to:

+		host->tap_set = (host->tap_set + 1) % host->tap_num;

(same for -1). Because "+ tap_num % tap_num" is a NOOP. Or did I miss
something?


 drivers/mmc/host/renesas_sdhi.h      |  1 +
 drivers/mmc/host/renesas_sdhi_core.c | 62 +++++++++++++++++++++++-----
 2 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index f524251d5113..11a0b2bca3aa 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -57,6 +57,7 @@ struct renesas_sdhi {
 	void __iomem *scc_ctl;
 	u32 scc_tappos;
 	u32 scc_tappos_hs400;
+	bool doing_tune;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 282c133defd6..903da3ba399b 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -263,6 +263,8 @@ static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
 #define SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN	BIT(0)
 /* Definitions for values the SH_MOBILE_SDHI_SCC_RVSREQ register */
 #define SH_MOBILE_SDHI_SCC_RVSREQ_RVSERR	BIT(2)
+#define SH_MOBILE_SDHI_SCC_RVSREQ_REQTAPUP	BIT(1)
+#define SH_MOBILE_SDHI_SCC_RVSREQ_REQTAPDOWN	BIT(0)
 /* Definitions for values the SH_MOBILE_SDHI_SCC_TMPPORT2 register */
 #define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL	BIT(4)
 #define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN	BIT(31)
@@ -321,6 +323,8 @@ static void renesas_sdhi_prepare_tuning(struct tmio_mmc_host *host,
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 
+	priv->doing_tune = true;
+
 	/* Set sampling clock position */
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, tap);
 }
@@ -426,6 +430,8 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 	unsigned long ntap;     /* temporary counter of tuning success */
 	unsigned long i;
 
+	priv->doing_tune = false;
+
 	/* Clear SCC_RVSREQ */
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ, 0);
 
@@ -485,12 +491,52 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 	return 0;
 }
 
+static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_4tap)
+{
+	struct renesas_sdhi *priv = host_to_priv(host);
+	u32 val;
+
+	val = sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ);
+	if (!val)
+		return false;
+
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ, 0);
+
+	/* Change TAP position according to correction status */
+	if (val & SH_MOBILE_SDHI_SCC_RVSREQ_RVSERR)
+		return true;    /* Need re-tune */
+	else if (val & SH_MOBILE_SDHI_SCC_RVSREQ_REQTAPUP)
+		host->tap_set = (host->tap_set + 1) % host->tap_num;
+	else if (val & SH_MOBILE_SDHI_SCC_RVSREQ_REQTAPDOWN)
+		host->tap_set = (host->tap_set - 1) % host->tap_num;
+	else
+		return false;
+
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET,
+		       host->tap_set / (use_4tap ? 2 : 1));
+
+	return false;
+}
+
+static bool renesas_sdhi_auto_correction(struct tmio_mmc_host *host)
+{
+	struct renesas_sdhi *priv = host_to_priv(host);
+
+	/* Check SCC error */
+	if (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ) &
+	    SH_MOBILE_SDHI_SCC_RVSREQ_RVSERR) {
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ, 0);
+		return true;
+	}
+
+	return false;
+}
+
 static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 	bool use_4tap = priv->quirks && priv->quirks->hs400_4taps;
 
-
 	/*
 	 * Skip checking SCC errors when running on 4 taps in HS400 mode as
 	 * any retuning would still result in the same 4 taps being used.
@@ -500,20 +546,14 @@ static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
 	    !(host->mmc->ios.timing == MMC_TIMING_MMC_HS400 && !use_4tap))
 		return false;
 
-	if (mmc_doing_retune(host->mmc))
+	if (mmc_doing_retune(host->mmc) || priv->doing_tune)
 		return false;
 
-	/* Check SCC error */
 	if (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL) &
-	    SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &&
-	    sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ) &
-	    SH_MOBILE_SDHI_SCC_RVSREQ_RVSERR) {
-		/* Clear SCC error */
-		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ, 0);
-		return true;
-	}
+	    SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN)
+		return renesas_sdhi_auto_correction(host);
 
-	return false;
+	return renesas_sdhi_manual_correction(host, use_4tap);
 }
 
 static void renesas_sdhi_hw_reset(struct tmio_mmc_host *host)
-- 
2.20.1

