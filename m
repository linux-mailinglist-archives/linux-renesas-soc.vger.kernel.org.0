Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84DFA287167
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Oct 2020 11:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727155AbgJHJZm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Oct 2020 05:25:42 -0400
Received: from www.zeus03.de ([194.117.254.33]:34896 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726570AbgJHJZm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Oct 2020 05:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=ZtHwBxkPlEkFhgQoVnslkmlanx6
        jHDsGXk20JC+R6AQ=; b=hN/Aj4Tuhtw23CrzDGlMax+oRUVc9zgR0AqmfFUJLnq
        6NvZGNpnrOaLq8uMbb/tuEJNbXLSIRXYptIqltuKypJOKHYC4gvrxXASd7BeLYw/
        MML7kLa7YHBNmZB0XUqPkW41G+EfWXu4uItLlMBZCNpAaIiPUvFJlcVN0UBZT060
        =
Received: (qmail 3289374 invoked from network); 8 Oct 2020 11:25:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Oct 2020 11:25:40 +0200
X-UD-Smtp-Session: l3s3148p1@VlZlaiWxxqsgAwDPXxkNANvM/oUoqgHz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc renesas_sdhi: workaround a regression when reinserting SD cards
Date:   Thu,  8 Oct 2020 11:25:33 +0200
Message-Id: <20201008092533.76588-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

After the conversions of the reset routines, re-inserting SD cards
didn't work anymore. Apply this temporary workaround to have working SD
cards during the merge window. The issue will be fixed properly until
the final release.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Hi Ulf, this regression only shows up in mmc/next, so this is *not* for
the current release. Anyhow, I'll be away for two weeks, and can't work
on it. So, I hope we can have this patch for a while to have a working
state.

 drivers/mmc/host/renesas_sdhi_core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 20e5eb63caf8..414314151d0a 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -572,6 +572,17 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 					     TMIO_MASK_INIT_RCAR2);
 }
 
+/*
+ * This is a temporary workaround! This driver used 'hw_reset' wrongly and the
+ * fix for that showed a regression. So, we mimic the old behaviour until the
+ * proper solution is found.
+ */
+static void renesas_sdhi_hw_reset(struct mmc_host *mmc)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+	renesas_sdhi_reset(host);
+}
+
 #define SH_MOBILE_SDHI_MIN_TAP_ROW 3
 
 static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
@@ -1009,6 +1020,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		if (of_data && of_data->scc_offset) {
 			priv->scc_ctl = host->ctl + of_data->scc_offset;
 			host->reset = renesas_sdhi_reset;
+			host->ops.hw_reset = renesas_sdhi_hw_reset;
+			host->mmc->caps |= MMC_CAP_HW_RESET;
 		}
 	}
 
-- 
2.28.0

