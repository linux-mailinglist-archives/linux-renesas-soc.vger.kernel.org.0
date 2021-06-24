Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C333B3262
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 17:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbhFXPS5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 11:18:57 -0400
Received: from www.zeus03.de ([194.117.254.33]:46230 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232206AbhFXPSt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 11:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=xUE4EbDuo9xFDk
        J25+s0Hrzl6p4tAZUiuKfTE4SgLfQ=; b=o6fMjws2XkYqXy0bb2sZQknGOBuIlV
        E2GfUNfPQANRPe7HJfiFz42J5UAu2V022FYTEOzsaW7aGK+MBP/DJ6yM36HYX8Mp
        hcwMZkRG4squRvMt7mXNVi9o8wMY3PWcm9zuexYns5dDdHnej8PDNDkmDupp2c35
        X+vz2lsWYoXqQ=
Received: (qmail 3016735 invoked from network); 24 Jun 2021 17:16:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jun 2021 17:16:27 +0200
X-UD-Smtp-Session: l3s3148p1@PNPBgYTFVskgARa4RWOqASgLlirhLBBp
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Adrian Hunter <adrian.hunter@intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] mmc: host: factor out clearing the retune state
Date:   Thu, 24 Jun 2021 17:16:16 +0200
Message-Id: <20210624151616.38770-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624151616.38770-1-wsa+renesas@sang-engineering.com>
References: <20210624151616.38770-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We have this in two places, so let's have a dedicated function. It is
also more readable.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/core/core.c | 3 +--
 drivers/mmc/core/host.c | 3 +--
 drivers/mmc/core/host.h | 6 ++++++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index f397cf051b8d..469bc58c2113 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -941,8 +941,7 @@ int mmc_execute_tuning(struct mmc_card *card)
 		pr_err("%s: tuning execution failed: %d\n",
 			mmc_hostname(host), err);
 	} else {
-		host->retune_now = 0;
-		host->need_retune = 0;
+		mmc_retune_clear(host);
 		mmc_retune_enable(host);
 	}
 
diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 0f084c9b2684..52d37587cf45 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -141,8 +141,7 @@ void mmc_retune_disable(struct mmc_host *host)
 	mmc_retune_unpause(host);
 	host->can_retune = 0;
 	del_timer_sync(&host->retune_timer);
-	host->retune_now = 0;
-	host->need_retune = 0;
+	mmc_retune_clear(host);
 }
 
 void mmc_retune_timer_stop(struct mmc_host *host)
diff --git a/drivers/mmc/core/host.h b/drivers/mmc/core/host.h
index ba407617ed23..48c4952512a5 100644
--- a/drivers/mmc/core/host.h
+++ b/drivers/mmc/core/host.h
@@ -21,6 +21,12 @@ int mmc_retune(struct mmc_host *host);
 void mmc_retune_pause(struct mmc_host *host);
 void mmc_retune_unpause(struct mmc_host *host);
 
+static inline void mmc_retune_clear(struct mmc_host *host)
+{
+	host->retune_now = 0;
+	host->need_retune = 0;
+}
+
 static inline void mmc_retune_hold_now(struct mmc_host *host)
 {
 	host->retune_now = 0;
-- 
2.30.2

