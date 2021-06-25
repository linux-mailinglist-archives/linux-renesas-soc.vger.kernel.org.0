Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C22783B4914
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 21:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhFYTDi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 15:03:38 -0400
Received: from www.zeus03.de ([194.117.254.33]:51880 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229759AbhFYTDi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 15:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=xbeeBB5Mp9udtSX6atpEVfdXnpk
        dIZsPDWpgQpyP1uY=; b=2n1O+JN4anxX1CD4onqmuwsyMM0qxhemMdjSAJeOL5Q
        kclbkzrO5BxkSaW835FEUn1HdWnaw1cRygcDTr5D1QKTe551/eTmIszYf1EHJ4Tb
        7bYfNmWlf/PdhOI80Vfz+LQ+oqSqS6EU4PvnSTA7Xgbb+1d8BPZlUsoos8hwTJg0
        =
Received: (qmail 3402476 invoked from network); 25 Jun 2021 21:01:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2021 21:01:15 +0200
X-UD-Smtp-Session: l3s3148p1@44hcw5vFnIkgAwDPXwSbABaL5ZbYSJxc
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] mmc: core: ensure flags are always cleared when retune gets enabled
Date:   Fri, 25 Jun 2021 21:01:07 +0200
Message-Id: <20210625190107.8160-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move the call to clear the retune flags into mmc_retune_enable() to
ensure they are always cleared. With current code, there is no
functional change. But it is more future-proof this way.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

After reviewing my own code, I thought this is even a tad better. What
do you guys think? Based on the series "[PATCH 0/3] mmc: avoid vicious
circle when retuning", of course.

 drivers/mmc/core/core.c | 6 ++----
 drivers/mmc/core/host.c | 1 +
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 84f39a59a28e..b039dcff17f8 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -937,13 +937,11 @@ int mmc_execute_tuning(struct mmc_card *card)
 
 	err = host->ops->execute_tuning(host, opcode);
 
-	if (err) {
+	if (err)
 		pr_err("%s: tuning execution failed: %d\n",
 			mmc_hostname(host), err);
-	} else {
-		mmc_retune_clear(host);
+	else
 		mmc_retune_enable(host);
-	}
 
 	return err;
 }
diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 52d37587cf45..8ca1db6413f8 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -101,6 +101,7 @@ void mmc_unregister_host_class(void)
  */
 void mmc_retune_enable(struct mmc_host *host)
 {
+	mmc_retune_clear(host);
 	host->can_retune = 1;
 	if (host->retune_period)
 		mod_timer(&host->retune_timer,
-- 
2.30.2

