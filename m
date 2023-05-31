Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52163717770
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 May 2023 09:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234508AbjEaHBQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 May 2023 03:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234535AbjEaHBI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 May 2023 03:01:08 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9CD1B1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 May 2023 00:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=3zOA1Ng8ml+Jxut42knxJBpcbKp
        RYIcOnPqsVqfufC0=; b=0cXm6AyQ4cnn6lSMXFwCjxVHNli4vV4NKkp9dyJnuHu
        I/QTE5FDAhZblWiCBZNnmbw4MWYW6KLv+RwrPOt54nTw7bJt8kfVLu4FOvNAzdjj
        Yxue0+/4b/rSBlNgg1tyhelS98RnXz/QU96TXSVwlZuFFgdSmzhFKqrz+TNcyAhI
        =
Received: (qmail 1184180 invoked from network); 31 May 2023 09:00:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 May 2023 09:00:53 +0200
X-UD-Smtp-Session: l3s3148p1@T+J54ff82JoujnsI
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Adam Ford <aford173@gmail.com>
Subject: [RFC/RFT PATCH] mmc: renesas_sdhi: add delay between tuning cmds
Date:   Wed, 31 May 2023 09:00:49 +0200
Message-Id: <20230531070049.11806-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some SD cards failed to tune SDR104 occasionally. Adding a delay between
tuning commands makes the cards work although it is not yet known why.
It seems to be host dependent, only a few need such a delay (I found AMD
SDHCI and Freescale eSDHC so far). 25us is not enough, 50us never failed
up to now, so let's double that value until we know what is going on.
Extra thank you to Adam for sending me a problematic SD card to test.

Reported-by: Adam Ford <aford173@gmail.com>
Closes: https://lore.kernel.org/all/CAHCN7xK_fr_gREVsOzN=atcS08mwufr-=7q1JAN=CCyVk_k-dA@mail.gmail.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This is one of the patches which look simple but took quite a while to
come up with. Part of it was identifying the issue, part of it was
trying to understand the issue. But I am stuck now, so I need help:

@Adam: could you kindly test this patch with your setup? First, we need
to make sure it helps your case as well.

@Shimoda: If it helps for Adam's case, maybe we could ask the HW team if
they see a reason for this delay? I already scanned the SD/MMC/SDHI specs
without finding any trace, Marek helped as well. My gut feeling says it
is host controller specific. But first, let's hope it works for Adam.

 drivers/mmc/host/renesas_sdhi_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 345934e4f59e..6088cf94e1d3 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -711,6 +711,9 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
 
 		if (cmd_error)
 			mmc_send_abort_tuning(mmc, opcode);
+
+		/* FIXME: Needed for some SD cards. The reason is not known yet */
+		usleep_range(100, 250);
 	}
 
 	ret = renesas_sdhi_select_tuning(host);
-- 
2.30.2

