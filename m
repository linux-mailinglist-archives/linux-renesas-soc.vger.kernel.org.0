Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91532268A10
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Sep 2020 13:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgINL3o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Sep 2020 07:29:44 -0400
Received: from www.zeus03.de ([194.117.254.33]:53750 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726066AbgINL3a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 07:29:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=XPrUpzZcI6zAUwBIMzTlj+kRvbi
        IVarVQu3FWwEnimY=; b=M/+hanlCVbp3fOaRQQuOHLaYuJNUEcYDjCPR9d5V0Qq
        Hw17Fgml2yfQYkoyNOLpINGhjbfJDa4uODFGVOllvMd2NPichnfKKNt4XYJaOeCf
        8xxMd+Ws3mNciSGZezOljP04vmkD7Ab13C4ydNEu4sbbhDoELLX5mYb/coklntIw
        =
Received: (qmail 1841945 invoked from network); 14 Sep 2020 13:28:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Sep 2020 13:28:49 +0200
X-UD-Smtp-Session: l3s3148p1@psSjVkSv8uIgAwDPXwXYAPlEQEA0NVnc
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: core: clear 'doing_init_tune' also after failures
Date:   Mon, 14 Sep 2020 13:28:45 +0200
Message-Id: <20200914112845.21855-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Reorganize the code, so that the flag is always cleared independently of
a good or bad case.

Fixes: 97a7d87e96b0 ("mmc: core: add a 'doing_init_tune' flag and a 'mmc_doing_tune' helper")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Sorry for overlooking this :(

 drivers/mmc/core/mmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 67e95eba0e82..ff3063ce2acd 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -1766,14 +1766,14 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
 		host->doing_init_tune = 1;
 
 		err = mmc_hs200_tuning(card);
-		if (err)
-			goto free_card;
+		if (!err)
+			err = mmc_select_hs400(card);
+
+		host->doing_init_tune = 0;
 
-		err = mmc_select_hs400(card);
 		if (err)
 			goto free_card;
 
-		host->doing_init_tune = 0;
 	} else if (!mmc_card_hs400es(card)) {
 		/* Select the desired bus width optionally */
 		err = mmc_select_bus_width(card);
-- 
2.20.1

