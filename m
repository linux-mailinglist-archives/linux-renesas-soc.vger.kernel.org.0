Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA36B1EE349
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2020 13:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgFDLUx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Jun 2020 07:20:53 -0400
Received: from www.zeus03.de ([194.117.254.33]:58162 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727025AbgFDLUx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jun 2020 07:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=fy0N5v6dMpnuMO
        xPYW0BamAucP2Gatl8R92TW/mjjgs=; b=u13yUz494e1+srkMiGdtJSW+sRd8dS
        t3GK2hPoFdKaCahOLt6VlS6JEyOzVaNmmw3yMuQ+qQwRIczVNoH18/Ixt0pWwaQm
        U63qknRKtatUpWQRN27YVQ8x2wlX5a0flgGwhCSkSh+ZKL1TBgFu0AF1EimLZmQX
        X9tEI867k5rwI=
Received: (qmail 1656146 invoked from network); 4 Jun 2020 13:20:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2020 13:20:51 +0200
X-UD-Smtp-Session: l3s3148p1@+g9OVkCncOUgAwDPXw1XANux7yWtmp4Z
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] mmc: core: when downgrading HS400, callback into drivers earlier
Date:   Thu,  4 Jun 2020 13:20:39 +0200
Message-Id: <20200604112040.22144-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200604112040.22144-1-wsa+renesas@sang-engineering.com>
References: <20200604112040.22144-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The driver specific downgrade function makes more sense if we run it
before we switch anything, not after we already switched. Otherwise some
non-HS400 communication has already happened.

No need to convert users. There is only one currenty which needs this
change in a later patchset.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/core/mmc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 4203303f946a..f97994eace3b 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -1156,6 +1156,10 @@ static int mmc_select_hs400(struct mmc_card *card)
 	      host->ios.bus_width == MMC_BUS_WIDTH_8))
 		return 0;
 
+	/* Prepare host to downgrade to HS timing */
+	if (host->ops->hs400_downgrade)
+		host->ops->hs400_downgrade(host);
+
 	/* Switch card to HS mode */
 	val = EXT_CSD_TIMING_HS;
 	err = __mmc_switch(card, EXT_CSD_CMD_SET_NORMAL,
@@ -1171,10 +1175,6 @@ static int mmc_select_hs400(struct mmc_card *card)
 	/* Set host controller to HS timing */
 	mmc_set_timing(card->host, MMC_TIMING_MMC_HS);
 
-	/* Prepare host to downgrade to HS timing */
-	if (host->ops->hs400_downgrade)
-		host->ops->hs400_downgrade(host);
-
 	/* Reduce frequency to HS frequency */
 	max_dtr = card->ext_csd.hs_max_dtr;
 	mmc_set_clock(host, max_dtr);
@@ -1241,6 +1241,9 @@ int mmc_hs400_to_hs200(struct mmc_card *card)
 	int err;
 	u8 val;
 
+	if (host->ops->hs400_downgrade)
+		host->ops->hs400_downgrade(host);
+
 	/* Reduce frequency to HS */
 	max_dtr = card->ext_csd.hs_max_dtr;
 	mmc_set_clock(host, max_dtr);
@@ -1268,9 +1271,6 @@ int mmc_hs400_to_hs200(struct mmc_card *card)
 
 	mmc_set_timing(host, MMC_TIMING_MMC_HS);
 
-	if (host->ops->hs400_downgrade)
-		host->ops->hs400_downgrade(host);
-
 	err = mmc_switch_status(card, true);
 	if (err)
 		goto out_err;
-- 
2.20.1

