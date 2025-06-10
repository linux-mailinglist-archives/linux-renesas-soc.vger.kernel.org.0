Return-Path: <linux-renesas-soc+bounces-18015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E061AD2EB0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 09:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D57E216F93E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 07:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E538427B51A;
	Tue, 10 Jun 2025 07:31:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D431D5CC7;
	Tue, 10 Jun 2025 07:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540669; cv=none; b=jFZ2tA1c9vhW+TDvQ9KLu+2sGhxTjY4Wnlbh0pyTHMJOm2XJqGXOxp4mdmxDrs6xaore/pSuWRCoJIGNyPyXvbJE7Zbz/HIesy1uJbnVsDWK2uVLstSX91QUZn4965pIVYzcvMVOcoIXqwIlkmrlmE+u45dRtlm0P9KxKeHmo5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540669; c=relaxed/simple;
	bh=OBtVgU8vgs3cWwHr8KKNaK9220wgxe+RjiUrt+hp8Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Laa9yqtlzh5VdSPSRoryCnptXfD1vMIZkPIyPkCAT5N+lcnmsMHJzkBz/rvzTuomDbJirbm/TiPMhyoPfXHgMtm95gViSPwp7FpGnN6y04+TDYilBqoz8MJJM+Mb48vQs71coAxeCut2kA5388rGH5nwF7MW03ODZTAdMqG4KmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 5e+y066YQpWSRutAOD9EsA==
X-CSE-MsgGUID: prp5yKFfToG3qJS+Wk1Pbg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jun 2025 16:25:55 +0900
Received: from shimoda-ggear.. (unknown [10.166.13.45])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 08B6241791AE;
	Tue, 10 Jun 2025 16:25:55 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] mmc: host: renesas_sdhi: Fix incorrect auto retuning for an SDIO card
Date: Tue, 10 Jun 2025 16:25:45 +0900
Message-ID: <20250610072545.2001435-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610072545.2001435-1-yoshihiro.shimoda.uh@renesas.com>
References: <20250610072545.2001435-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This host controller is possible to change incorrect tap if an SDIO
card is used because DAT1 is used for interrupt signal on SDIO standard
but the controller doesn't take care of it. So, in the worst case,
this behavior causes a CRC error.

To resolve the issue, this driver uses manual correction mode instead
of auto correction if an SDIO card is used. Also, even if DAT1 is
mismatched on an SDIO card, this driver will not change the TAP.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi.h      |  1 +
 drivers/mmc/host/renesas_sdhi_core.c | 48 ++++++++++++++++++++++++----
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 291ddb4ad9bed..084964cecf9d8 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -85,6 +85,7 @@ struct renesas_sdhi {
 	u32 scc_tappos_hs400;
 	const u8 *adjust_hs400_calib_table;
 	bool needs_adjust_hs400;
+	bool card_is_sdio;
 
 	/* Tuning values: 1 for success, 0 for failure */
 	DECLARE_BITMAP(taps, BITS_PER_LONG);
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index e6fa3ed425606..c49e3faa0ef3b 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -686,9 +686,8 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 	/* Set SCC */
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, priv->tap_set);
 
-	/* Enable auto re-tuning */
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
-		       SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN |
+		       (priv->card_is_sdio ? 0 : SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN) |
 		       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
 
 	return 0;
@@ -778,6 +777,14 @@ static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_
 		if (bad_taps & BIT(new_tap % priv->tap_num))
 			return test_bit(error_tap % priv->tap_num, priv->smpcmp);
 	} else {
+		if (!priv->card_is_sdio &&
+		    !(val & SH_MOBILE_SDHI_SCC_RVSREQ_RVSERR)) {
+			u32 smpcmp = sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_SMPCMP);
+
+			/* DAT1 is unmatched because of an SDIO irq */
+			if (smpcmp & (BIT(17) | BIT(1)))
+				return false;
+		}
 		if (val & SH_MOBILE_SDHI_SCC_RVSREQ_RVSERR)
 			return true;    /* need retune */
 		else if (val & SH_MOBILE_SDHI_SCC_RVSREQ_REQTAPUP)
@@ -828,11 +835,14 @@ static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host,
 	if (mmc_doing_tune(host->mmc))
 		return false;
 
-	if (((mrq->cmd->error == -ETIMEDOUT) ||
-	     (mrq->data && mrq->data->error == -ETIMEDOUT)) &&
-	    ((host->mmc->caps & MMC_CAP_NONREMOVABLE) ||
-	     (host->ops.get_cd && host->ops.get_cd(host->mmc))))
-		ret |= true;
+	/* mrq can be NULL to check SCC error on SDIO irq without any request */
+	if (mrq) {
+		if (((mrq->cmd->error == -ETIMEDOUT) ||
+		     (mrq->data && mrq->data->error == -ETIMEDOUT)) &&
+		    ((host->mmc->caps & MMC_CAP_NONREMOVABLE) ||
+		     (host->ops.get_cd && host->ops.get_cd(host->mmc))))
+			ret |= true;
+	}
 
 	if (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL) &
 	    SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN)
@@ -843,6 +853,28 @@ static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host,
 	return ret;
 }
 
+static void renesas_sdhi_init_card(struct mmc_host *mmc, struct mmc_card *card)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+	struct renesas_sdhi *priv = host_to_priv(host);
+
+	/*
+	 * This controller cannot do auto-retune with SDIO irqs, so we
+	 * then need to enforce manual correction. However, when tuning,
+	 * mmc->card is not populated yet, so we don't know if the card
+	 * is SDIO. init_card provides this information earlier, so we
+	 * keep a copy of it.
+	 */
+	priv->card_is_sdio = mmc_card_sdio(card);
+}
+
+static void renesas_sdhi_sdio_irq(struct tmio_mmc_host *host)
+{
+	/* This controller requires retune when an SDIO irq occurs */
+	if (renesas_sdhi_check_scc_error(host, NULL))
+		mmc_retune_needed(host->mmc);
+}
+
 static int renesas_sdhi_wait_idle(struct tmio_mmc_host *host, u32 bit)
 {
 	int timeout = 1000;
@@ -1227,6 +1259,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 			dev_warn(&host->pdev->dev, "Unknown clock rate for tuning\n");
 
 		host->check_retune = renesas_sdhi_check_scc_error;
+		host->sdio_irq = renesas_sdhi_sdio_irq;
+		host->ops.init_card = renesas_sdhi_init_card;
 		host->ops.execute_tuning = renesas_sdhi_execute_tuning;
 		host->ops.prepare_hs400_tuning = renesas_sdhi_prepare_hs400_tuning;
 		host->ops.hs400_downgrade = renesas_sdhi_disable_scc;
-- 
2.43.0


