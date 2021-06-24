Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36023B325F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 17:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbhFXPSz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 11:18:55 -0400
Received: from www.zeus03.de ([194.117.254.33]:46200 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232191AbhFXPSt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 11:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=Ctnyo7FR/EpyGS
        M4KZQLOcMnfSc0Qj51FzAJKVmK8Lg=; b=Q4VVo47fVtAevEs2Y19Bk2OFE9Y22o
        Vj3jLCBJ+2j8gZVkqtrgiFfUn1mcECPi9Nc4P4Qd1zivVXZ/KfOSuD145S1jsnzf
        q129Ou89z3XvNJt9fnbYnyRJJTAoOpi949FeFHFmzsCTA1U0krI0Ws5Zvl1hTYpM
        c/IsRYxMFzAr8=
Received: (qmail 3016653 invoked from network); 24 Jun 2021 17:16:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jun 2021 17:16:26 +0200
X-UD-Smtp-Session: l3s3148p1@6zWygYTFUskgARa4RWOqASgLlirhLBBp
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Adrian Hunter <adrian.hunter@intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] mmc: core: clear flags before allowing to retune
Date:   Thu, 24 Jun 2021 17:16:14 +0200
Message-Id: <20210624151616.38770-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624151616.38770-1-wsa+renesas@sang-engineering.com>
References: <20210624151616.38770-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It might be that something goes wrong during tuning so the MMC core will
immediately trigger a retune. In our case it was:

 - we sent a tuning block
 - there was an error so we need to send an abort cmd to the eMMC
 - the abort cmd had a CRC error
 - retune was set by the MMC core

This lead to a vicious circle causing a performance regression of 75%.
So, clear retuning flags before we enable retuning to start with a known
cleared state.

Reported-by Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/core/core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 4e52eb14198a..f397cf051b8d 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -937,11 +937,14 @@ int mmc_execute_tuning(struct mmc_card *card)
 
 	err = host->ops->execute_tuning(host, opcode);
 
-	if (err)
+	if (err) {
 		pr_err("%s: tuning execution failed: %d\n",
 			mmc_hostname(host), err);
-	else
+	} else {
+		host->retune_now = 0;
+		host->need_retune = 0;
 		mmc_retune_enable(host);
+	}
 
 	return err;
 }
-- 
2.30.2

