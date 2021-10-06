Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5044243D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Oct 2021 19:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239279AbhJFRSE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Oct 2021 13:18:04 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:17495 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233287AbhJFRSE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 13:18:04 -0400
X-IronPort-AV: E=Sophos;i="5.85,352,1624287600"; 
   d="scan'208";a="96161009"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Oct 2021 02:16:10 +0900
Received: from localhost.localdomain (unknown [10.226.92.216])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 52F484007F47;
        Thu,  7 Oct 2021 02:16:08 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-mmc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mmc: renesas_sdhi: Fix internal cd irq miss with hard reset
Date:   Wed,  6 Oct 2021 18:16:05 +0100
Message-Id: <20211006171605.6861-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


This patch fixes internal cd irq miss after hard reset by enabling
internal card insertion/removal interrupts.

Fixes: b4d86f37eacb ("mmc: renesas_sdhi: do hard reset if possible")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Hi All,

On RZ/G2M board, if i enable internal cd, then it is missing irq after hard reset.
Please find my test logs with card inserted during boot,

case 1:- current case (no internal cd interrupt)
root@hihope-rzg2m:~# cat /proc/interrupts | grep mmc
162:          0          0          0          0          0          0     GIC-0 197 Level     ee100000.mmc
163:        151          0          0          0          0          0     GIC-0 199 Level     ee140000.mmc
164:       1500          0          0          0          0          0     GIC-0 200 Level     ee160000.mmc
root@hihope-rzg2m:~#


case 2:- current case + patch
root@hihope-rzg2m:~# cat /proc/interrupts | grep mmc
162:       1107          0          0          0          0          0     GIC-0 197 Level     ee100000.mmc
163:        151          0          0          0          0          0     GIC-0 199 Level     ee140000.mmc
164:       1106          0          0          0          0          0     GIC-0 200 Level     ee160000.mmc
root@hihope-rzg2m:~#

case 3:- with cd nterrupt as gpio
root@hihope-rzg2m:~# cat /proc/interrupts | grep mmc
162:        796          0          0          0          0          0     GIC-0 197 Level     ee100000.mmc
163:        151          0          0          0          0          0     GIC-0 199 Level     ee140000.mmc
164:       1010          0          0          0          0          0     GIC-0 200 Level     ee160000.mmc
197:          0          0          0          0          0          0  gpio-rcar  12 Edge      ee100000.mmc cd
root@hihope-rzg2m:~# 
---
 drivers/mmc/host/renesas_sdhi.h      | 1 +
 drivers/mmc/host/renesas_sdhi_core.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 0c45e82ff0de..1199693690da 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -68,6 +68,7 @@ struct renesas_sdhi {
 	u32 scc_tappos_hs400;
 	const u8 *adjust_hs400_calib_table;
 	bool needs_adjust_hs400;
+	bool internal_cd;
 
 	/* Tuning values: 1 for success, 0 for failure */
 	DECLARE_BITMAP(taps, BITS_PER_LONG);
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index a4407f391f66..9d828094169a 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -561,6 +561,11 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 		/* Unknown why but without polling reset status, it will hang */
 		read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
 				  false, priv->rstc);
+
+		if (priv->internal_cd)
+			tmio_mmc_enable_mmc_irqs(host, TMIO_STAT_CARD_REMOVE |
+						 TMIO_STAT_CARD_INSERT);
+
 		/* At least SDHI_VER_GEN2_SDR50 needs manual release of reset */
 		sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
 		priv->needs_adjust_hs400 = false;
@@ -1017,6 +1022,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (IS_ERR(priv->rstc))
 		return PTR_ERR(priv->rstc);
 
+	if (priv->rstc && !(host->mmc->caps & MMC_CAP_NONREMOVABLE) &&
+	    !mmc_can_gpio_cd(host->mmc))
+		priv->internal_cd = true;
+
 	ver = sd_ctrl_read16(host, CTL_VERSION);
 	/* GEN2_SDR104 is first known SDHI to use 32bit block count */
 	if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
-- 
2.17.1

