Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9AC32AD89E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 15:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730819AbgKJOVN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 09:21:13 -0500
Received: from www.zeus03.de ([194.117.254.33]:57746 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730465AbgKJOVL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 09:21:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=AhBRC8nOnnNfZ3
        gEQt+jO9KwYoIZByJQCL9SvzXz1Go=; b=ByzJLg4eJ6bO7dN2fCXprchWJOWB6t
        AlMe6yO8RhVMlKPUPgUVApweH5CXggNYl9I5oIeJ9u3KsQZPdZJYk4fbj+9D6FXN
        XoBe7iLlEHMbo9Sk1ktOxeqn81ihf1tySDoZKKa1+UvWfTBUXyTPoVGiHOxSGeFo
        msyCp+GfIxcmg=
Received: (qmail 2195654 invoked from network); 10 Nov 2020 15:21:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2020 15:21:09 +0100
X-UD-Smtp-Session: l3s3148p1@ZiDjY8GzXsogAwDPXxAvAEQD26z+TKuA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 2/4] mmc: renesas_sdhi: probe into TMIO after SCC parameters have been setup
Date:   Tue, 10 Nov 2020 15:20:56 +0100
Message-Id: <20201110142058.36393-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
References: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Setting up the SCC parameters does not need a probed TMIO device. But in
the near future, probing the TMIO device needs the SCC parameters setup.
So, fix the ordering.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index a395f835e836..17ebaa324ca1 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1067,10 +1067,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 			quirks->hs400_calib_table + 1);
 	}
 
-	ret = tmio_mmc_host_probe(host);
-	if (ret < 0)
-		goto edisclk;
-
 	/* Enable tuning iff we have an SCC and a supported mode */
 	if (of_data && of_data->scc_offset &&
 	    (host->mmc->caps & MMC_CAP_UHS_SDR104 ||
@@ -1102,6 +1098,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		host->ops.hs400_complete = renesas_sdhi_hs400_complete;
 	}
 
+	ret = tmio_mmc_host_probe(host);
+	if (ret < 0)
+		goto edisclk;
+
 	num_irqs = platform_irq_count(pdev);
 	if (num_irqs < 0) {
 		ret = num_irqs;
-- 
2.28.0

