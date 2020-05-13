Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B62D1D1BFB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2020 19:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389832AbgEMRMR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 May 2020 13:12:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:46090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389826AbgEMRMR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 May 2020 13:12:17 -0400
Received: from localhost (p5486CF35.dip0.t-ipconnect.de [84.134.207.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C351205ED;
        Wed, 13 May 2020 17:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589389937;
        bh=t+svHDI2LEgtKLTdSO4kWJrbAf71gAmoo+hkov3X/1o=;
        h=From:To:Cc:Subject:Date:From;
        b=0gSVQxP3wSUdmiBR9C1XXV0cigIVKqBg2kgpi3xhmO8lNDtxgAE1OmKOEmv/8Ufzh
         Q5ZqKohzSQtvSIXG9RTukdgTfzJlkcxaRlwOJh7htAIcAd9gdeUDpC8UdAxzOlP8S6
         715562B0EBjGqR9rSOThcwTzN3aLoBLhcCn9PX6E=
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC PATCH] mmc: tmio: properly balance RPM on remove
Date:   Wed, 13 May 2020 19:12:06 +0200
Message-Id: <20200513171206.6600-1-wsa@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Because we enabled the device with _noresume, we should disable it with
_noidle to match the ref counting of the clocks during remove().

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I think this is the proper fix to the problem Geert reported [1]. I am
not sure about a proper Fixes-tag, though. The corresponding _noidle
call in the probe()-error-path was added with:

aa86f1a38875 ("mmc: tmio: Fixup runtime PM management during probe")

However, from my understanding this is more fitting?

1b32999e205b ("mmc: tmio: Avoid boilerplate code in ->runtime_suspend()")

But maybe my understanding of the situation is still not perfect and
even the commit message is bogus? Ulf, since both mentioned commits are
from you, could you have a look? Thanks in advance!

   Wolfram

[1] Message-ID: <alpine.DEB.2.21.2004291630090.4052@ramsan.of.borg>

 drivers/mmc/host/tmio_mmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 9520bd94cf43..9a4ae954553b 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1235,7 +1235,7 @@ void tmio_mmc_host_remove(struct tmio_mmc_host *host)
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	if (host->native_hotplug)
 		pm_runtime_put_noidle(&pdev->dev);
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 EXPORT_SYMBOL_GPL(tmio_mmc_host_remove);
-- 
2.20.1

