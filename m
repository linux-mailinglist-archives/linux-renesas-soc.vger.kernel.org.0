Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF9B12C49E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 22:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732168AbgKYVaR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 16:30:17 -0500
Received: from www.zeus03.de ([194.117.254.33]:50282 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732181AbgKYVaQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 16:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=aE3wqLs30NB8bR
        VMcLLuxzHypyiCP75iOyI8qCJmj5A=; b=ywxJmmf4XrJsz4tAQVBQRIwxNLnv3g
        O9c3EqMtQGu1Kckg/g7i6aaNweLgY5RgWDqqU3cVk7fZBNi//i3uyXFz+MLqa6bp
        4i5gEJHKApRwOvgHUFVVT/rhE6UbyWEfzgO9eOW/Cc8ATJWsVVwEJNVnmK4JamCS
        KWFxI7n7BQW3E=
Received: (qmail 3441497 invoked from network); 25 Nov 2020 22:30:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Nov 2020 22:30:14 +0100
X-UD-Smtp-Session: l3s3148p1@7JQKIvW0kL8gAwDPXwZjAA625bO7DiyS
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] mmc: tmio: add hook for custom busy_wait calculation
Date:   Wed, 25 Nov 2020 22:30:00 +0100
Message-Id: <20201125213001.15003-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125213001.15003-1-wsa+renesas@sang-engineering.com>
References: <20201125213001.15003-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Wolfram Sang <wsa@kernel.org>

Newer SDHI variants can 'wait while busy' longer than the generic TMIO.
Provide a hook to get the maximum cycle count to wait for. If the hook
is not populated, fall back to a generic version which works well with
all older TMIO/SDHI variants.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc.h      |  1 +
 drivers/mmc/host/tmio_mmc_core.c | 17 ++++++++++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 819198af17f4..f60559bc413a 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -181,6 +181,7 @@ struct tmio_mmc_host {
 	void (*reset)(struct tmio_mmc_host *host);
 	bool (*check_retune)(struct tmio_mmc_host *host);
 	void (*fixup_request)(struct tmio_mmc_host *host, struct mmc_request *mrq);
+	unsigned int (*get_timeout_cycles)(struct tmio_mmc_host *host);
 
 	void (*prepare_hs400_tuning)(struct tmio_mmc_host *host);
 	void (*hs400_downgrade)(struct tmio_mmc_host *host);
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index da9a6243f146..f0711f4c1e5b 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -887,16 +887,20 @@ static void tmio_mmc_set_bus_width(struct tmio_mmc_host *host,
 	sd_ctrl_write16(host, CTL_SD_MEM_CARD_OPT, reg);
 }
 
-static void tmio_mmc_max_busy_timeout(struct tmio_mmc_host *host)
+static unsigned int tmio_mmc_get_timeout_cycles(struct tmio_mmc_host *host)
 {
 	u16 val = sd_ctrl_read16(host, CTL_SD_MEM_CARD_OPT);
-	unsigned int clk_rate = host->mmc->actual_clock ?: host->mmc->f_max;
-	unsigned int cycles;
 
 	val = (val & CARD_OPT_TOP_MASK) >> CARD_OPT_TOP_SHIFT;
-	cycles = 1 << (13 + val);
+	return 1 << (13 + val);
+}
+
+static void tmio_mmc_max_busy_timeout(struct tmio_mmc_host *host)
+{
+	unsigned int clk_rate = host->mmc->actual_clock ?: host->mmc->f_max;
 
-	host->mmc->max_busy_timeout = cycles / (clk_rate / MSEC_PER_SEC);
+	host->mmc->max_busy_timeout = host->get_timeout_cycles(host) /
+				      (clk_rate / MSEC_PER_SEC);
 }
 
 /* Set MMC clock / power.
@@ -1116,6 +1120,9 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	if (!(pdata->flags & TMIO_MMC_HAS_IDLE_WAIT))
 		_host->write16_hook = NULL;
 
+	if (pdata->flags & TMIO_MMC_USE_BUSY_TIMEOUT && !_host->get_timeout_cycles)
+		_host->get_timeout_cycles = tmio_mmc_get_timeout_cycles;
+
 	_host->set_pwr = pdata->set_pwr;
 
 	ret = tmio_mmc_init_ocr(_host);
-- 
2.28.0

