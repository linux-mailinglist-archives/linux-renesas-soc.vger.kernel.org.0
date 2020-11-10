Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8209A2AD89C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 15:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730703AbgKJOVN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 09:21:13 -0500
Received: from www.zeus03.de ([194.117.254.33]:57760 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730783AbgKJOVM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 09:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=WPEWoLpcwsLE8K
        a4vlELROgQsuASC9VPEWSV868h1KY=; b=XXy8V+diaXLOL8RkkT6dpxnrIJVFMZ
        /Ron9o4e0E5HCzCy/1fTOMIIbK9tNtbJhZdVLtJSSZl7tK8yOyZpm0NsOjXTcJNR
        JCV7EaPnoTobv6n15C67oAMDpUg0Y9tgbb1lr76kEQeGPnyENKPf9sH94FghaAhW
        Msx9rxVNeCeck=
Received: (qmail 2195699 invoked from network); 10 Nov 2020 15:21:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2020 15:21:09 +0100
X-UD-Smtp-Session: l3s3148p1@BwvpY8GzYMogAwDPXxAvAEQD26z+TKuA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 3/4] mmc: renesas_sdhi: populate SCC pointer at the proper place
Date:   Tue, 10 Nov 2020 15:20:57 +0100
Message-Id: <20201110142058.36393-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
References: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SCC pointer is currently filled whenever the SoC is Gen2+. This is
wrong because there is a Gen2-variant without SCC (SDHI_VER_GEN2_SDR50).
We have been lucky because the writes to unintended registers have not
caused problems so far. But further refactoring work exposed the
problem. So, move the pointer initialization to the place where we know
that the SDHI instance supports tuning. And also populate the 'reset'
pointer unconditionally to make sure the interrupt enable register is
always properly set for Gen2+.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 17ebaa324ca1..4a1ed5bf216c 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1007,11 +1007,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		host->ops.start_signal_voltage_switch =
 			renesas_sdhi_start_signal_voltage_switch;
 		host->sdcard_irq_setbit_mask = TMIO_STAT_ALWAYS_SET_27;
-
-		if (of_data && of_data->scc_offset) {
-			priv->scc_ctl = host->ctl + of_data->scc_offset;
-			host->reset = renesas_sdhi_reset;
-		}
+		host->reset = renesas_sdhi_reset;
 	}
 
 	/* Orginally registers were 16 bit apart, could be 32 or 64 nowadays */
@@ -1091,6 +1087,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		if (!hit)
 			dev_warn(&host->pdev->dev, "Unknown clock rate for tuning\n");
 
+		priv->scc_ctl = host->ctl + of_data->scc_offset;
 		host->check_retune = renesas_sdhi_check_scc_error;
 		host->ops.execute_tuning = renesas_sdhi_execute_tuning;
 		host->ops.prepare_hs400_tuning = renesas_sdhi_prepare_hs400_tuning;
-- 
2.28.0

