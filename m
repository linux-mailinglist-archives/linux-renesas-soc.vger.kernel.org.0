Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C093AC5EA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 10:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbhFRIZe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 04:25:34 -0400
Received: from www.zeus03.de ([194.117.254.33]:45118 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232000AbhFRIZe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 04:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=EDKkxblE31HPghaYHC48NkPq20A
        afB4OuEB4xnBpG/g=; b=HOGsIp6T1pLAQefA383uraryb6SpPevVrozyVl/DzKb
        ADgAKfVqOZ95z4tbnX0YzmYhItZihLB2t0gcT7QyrlBGEJIk8J+6tl+1yAKvAsUo
        JR6256Iv1WvpFr4LHh3BwOsYoB1gUaw5WsswBRBwAynzLZ36uqJqLvNB70erWqPw
        =
Received: (qmail 648657 invoked from network); 18 Jun 2021 10:23:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jun 2021 10:23:23 +0200
X-UD-Smtp-Session: l3s3148p1@TZN9CQbFdIJUhs4s
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH] mmc: disable tuning when checking card presence
Date:   Fri, 18 Jun 2021 10:23:17 +0200
Message-Id: <20210618082317.58408-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When we use the alive callback, we expect a command to fail if the card
is not present. We should not trigger a retune then which will confuse
users with a failed retune on a removed card:

 mmc2: tuning execution failed: -5
 mmc2: card 0001 removed

Disable retuning in this code path.

Reported-by: Ulrich Hecht <uli+renesas@fpond.eu>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/core/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 54f0814f110c..eb792dd845a3 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -2088,6 +2088,9 @@ int _mmc_detect_card_removed(struct mmc_host *host)
 	if (!host->card || mmc_card_removed(host->card))
 		return 1;
 
+	/* we expect a failure if the card is removed */
+	mmc_retune_disable(host);
+
 	ret = host->bus_ops->alive(host);
 
 	/*
@@ -2107,6 +2110,8 @@ int _mmc_detect_card_removed(struct mmc_host *host)
 		pr_debug("%s: card remove detected\n", mmc_hostname(host));
 	}
 
+	mmc_retune_enable(host);
+
 	return ret;
 }
 
-- 
2.30.2

