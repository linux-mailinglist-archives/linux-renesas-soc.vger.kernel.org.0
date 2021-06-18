Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF963AC519
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 09:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbhFRHmE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 03:42:04 -0400
Received: from www.zeus03.de ([194.117.254.33]:33112 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230433AbhFRHmE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 03:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=M1/6jrE9gs9xYYoGvWvSGf2tW2G
        9Il7kbShj7a94xqs=; b=DkEn+d62K/XzIoUZ2Ms7EFBJ6WpHbz5FEhE4KJ/RL5p
        43rJy48WgLrtTWSJzqvk+dowxkHfMMIeAsN2a2+oM7InpEGNWI9t8uFpvIGQBx13
        b4GY3ey2zRfCC1EKGDKH1f7ldwJ3/lCGFjDTLGY1uYAK3G4vsXxSN8CuyFfDWD74
        =
Received: (qmail 634354 invoked from network); 18 Jun 2021 09:39:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jun 2021 09:39:54 +0200
X-UD-Smtp-Session: l3s3148p1@o+f6bQXFqrIgAwDPXwaEABQIKHLDvKpZ
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] mmc: disable retuning when tuning
Date:   Fri, 18 Jun 2021 09:39:50 +0200
Message-Id: <20210618073950.46154-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
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
So, disable retuning while we tune. Let the tuning complete and see then
if it worked out or not.

Reported-by Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Hi Ulf, this patch is marked as RFC because I think this is a generic
issue. Lots of things could happen in the driver callback which cause a
retune, so I'd think it makes sense to deactivate it globally here. If
you think this is a driver specific issue, just let me know. I can
provide a small patch to create the issue for SDHI hardware, created
by Shimoda-san. We couldn't think of an easy way to reproduce it with
the fault injector, sadly. Let me know if you want to see that patch.

 drivers/mmc/core/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index b039dcff17f8..54f0814f110c 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -927,6 +927,8 @@ int mmc_execute_tuning(struct mmc_card *card)
 	if (!host->ops->execute_tuning)
 		return 0;
 
+	mmc_retune_disable(host);
+
 	if (host->cqe_on)
 		host->cqe_ops->cqe_off(host);
 
-- 
2.30.2

