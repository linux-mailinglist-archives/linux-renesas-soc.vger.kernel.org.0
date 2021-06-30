Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42EC23B7C7B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 06:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhF3ETd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 00:19:33 -0400
Received: from www.zeus03.de ([194.117.254.33]:59974 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230200AbhF3ETd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 00:19:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=8oL9qBJzZUaUjaMCCsiWjrKJaYK
        YHhBgZQIKKOtoo8w=; b=Gm6CGkfwDxoQtwFkMaKHklLQVpPJxtPsWde9VyUw86G
        rmVN5C0miR1Q4onUPFEVh7/522abTCPKWD6mAw9BVh7fZjtA9Ajum3Y0Oda18B92
        xtYY9+mnGhKRpS2Q+PgdITdeXFaJWsv2jQdheIyp2kl9hEj5F1Zt6zatnKdUowrU
        =
Received: (qmail 719645 invoked from network); 30 Jun 2021 06:17:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jun 2021 06:17:03 +0200
X-UD-Smtp-Session: l3s3148p1@zvyh/vPFFtUgAwDPXwaiAGDoJRk6bv4I
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] mmc: only print retune error when we don't check for card removal
Date:   Wed, 30 Jun 2021 06:16:58 +0200
Message-Id: <20210630041658.7574-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Skip printing a retune error when we scan for a removed card because we
then expect a failed command.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

In my tests, detect_change was only set when a card was removed.
Inserting a card or resuming from RPM would print an error. Did I
overlook somethign or is this good to go?

 drivers/mmc/core/core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index b039dcff17f8..b7e6e5640640 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -937,11 +937,13 @@ int mmc_execute_tuning(struct mmc_card *card)
 
 	err = host->ops->execute_tuning(host, opcode);
 
-	if (err)
+	if (!err)
+		mmc_retune_enable(host);
+
+	/* Only print error when we don't check for card removal */
+	if (err && !host->detect_change)
 		pr_err("%s: tuning execution failed: %d\n",
 			mmc_hostname(host), err);
-	else
-		mmc_retune_enable(host);
 
 	return err;
 }
-- 
2.30.2

