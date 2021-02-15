Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8118931B6F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Feb 2021 11:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhBOKSr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Feb 2021 05:18:47 -0500
Received: from www.zeus03.de ([194.117.254.33]:49952 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229913AbhBOKSq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Feb 2021 05:18:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=SwC8ZQ2lGMQe9rbx5GhQQJ061X5
        m2MXxmSPNRz1dgQE=; b=ch6RNffeYj0PFwmBR6iWaMBdo1YxwueHS2jwJ3GDAdP
        ssWZkzHKmBwK2vrIrCpJ7FlymsbEV5c2XgMH00lIakv+sTpPMX+Y8IF2j4wQ5/pA
        uEHkzaSj8oFzs2eeIdZngObBrlkU5ds3Pm4G7+cfEv8OiBXQM0DmNiTBZVxNEYNQ
        =
Received: (qmail 2108447 invoked from network); 15 Feb 2021 11:18:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2021 11:18:04 +0100
X-UD-Smtp-Session: l3s3148p1@MjMjTV27hocgAwDPXwQ9AOdZIXQ5fSTr
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT only] mmc: tmio: remove workaround for NON_REMOVABLE
Date:   Mon, 15 Feb 2021 11:17:54 +0100
Message-Id: <20210215101754.6725-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RPM handling has been improved twice since this comment, and also SCC
handling has been improved a lot. Time to test if we the workaround can
be removed!

Not-yet-Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I'd be very grateful if you guys could have this patch boot-tested with
your boardfarms. If the failure is still there, then it used to hang
when detecting the eMMC. Maybe these days eMMC will just not show up.
But hopefully all is well now. This always was difficult to trigger, so
a wide test coverage would be highly appreciated. It works for me(tm),
but that is not enough here.

 drivers/mmc/host/tmio_mmc_core.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 49c2d406c48e..2478a91e84b2 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1160,15 +1160,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 				  mmc->caps & MMC_CAP_NEEDS_POLL ||
 				  !mmc_card_is_removable(mmc));
 
-	/*
-	 * On Gen2+, eMMC with NONREMOVABLE currently fails because native
-	 * hotplug gets disabled. It seems RuntimePM related yet we need further
-	 * research. Since we are planning a PM overhaul anyway, let's enforce
-	 * for now the device being active by enabling native hotplug always.
-	 */
-	if (pdata->flags & TMIO_MMC_MIN_RCAR2)
-		_host->native_hotplug = true;
-
 	/*
 	 * While using internal tmio hardware logic for card detection, we need
 	 * to ensure it stays powered for it to work.
-- 
2.30.0

