Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D17E32CFAA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Mar 2021 10:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237610AbhCDJaG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Mar 2021 04:30:06 -0500
Received: from www.zeus03.de ([194.117.254.33]:43656 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237605AbhCDJ3t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Mar 2021 04:29:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=8VDebSV70EU6MeZw/eFEPNeY3b0
        jl26IjDn43vtbvj0=; b=tMW/l3t+IUpz0oKrL/6uZVUsW0UBnBuZetOlmwLDuF+
        SB6BgS0ynwSI6m/J52BncOlkWpYWT1NvnBrPCUKoLwhuX+k/h8q7C0kYbcg9s0IZ
        oer9rIq1pavrDcOFgzJXI1JbMhumQz3ukUrNOf3na9nryoymzrEEV73UWtrYnppw
        =
Received: (qmail 1778763 invoked from network); 4 Mar 2021 10:29:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Mar 2021 10:29:07 +0100
X-UD-Smtp-Session: l3s3148p1@o6VkmbK8IoJQT+F6
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] mmc: renesas_sdhi: use custom mask for TMIO_MASK_ALL
Date:   Thu,  4 Mar 2021 10:29:03 +0100
Message-Id: <20210304092903.8534-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Populate the new member for custom mask values to make sure this value
is applied whenever needed. Also, rename the define holding the value
because this is not only about initialization anymore.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Changes since v1:
* removed outdated comment from header
* added Shimoda-san's tags (thanks!)

 drivers/mmc/host/renesas_sdhi_core.c | 3 ++-
 drivers/mmc/host/tmio_mmc.h          | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index a1de5c431f07..734442dacdfa 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -582,7 +582,7 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
 	}
 
-	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, TMIO_MASK_INIT_RCAR2);
+	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, TMIO_MASK_ALL_RCAR2);
 
 	if (sd_ctrl_read16(host, CTL_VERSION) >= SDHI_VER_GEN3_SD) {
 		val = sd_ctrl_read16(host, CTL_SD_MEM_CARD_OPT);
@@ -1043,6 +1043,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		host->ops.start_signal_voltage_switch =
 			renesas_sdhi_start_signal_voltage_switch;
 		host->sdcard_irq_setbit_mask = TMIO_STAT_ALWAYS_SET_27;
+		host->sdcard_irq_mask_all = TMIO_MASK_ALL_RCAR2;
 		host->reset = renesas_sdhi_reset;
 	}
 
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 7d5201d6a006..f936aad945ce 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -100,8 +100,8 @@
 
 /* Define some IRQ masks */
 /* This is the mask used at reset by the chip */
-#define TMIO_MASK_INIT_RCAR2	0x8b7f031d /* Initial value for R-Car Gen2+ */
 #define TMIO_MASK_ALL           0x837f031d
+#define TMIO_MASK_ALL_RCAR2	0x8b7f031d
 #define TMIO_MASK_READOP  (TMIO_STAT_RXRDY | TMIO_STAT_DATAEND)
 #define TMIO_MASK_WRITEOP (TMIO_STAT_TXRQ | TMIO_STAT_DATAEND)
 #define TMIO_MASK_CMD     (TMIO_STAT_CMDRESPEND | TMIO_STAT_CMDTIMEOUT | \
-- 
2.29.2

