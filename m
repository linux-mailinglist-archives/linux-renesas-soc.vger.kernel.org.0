Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9361F15987E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727764AbgBKS0R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:26:17 -0500
Received: from newton.telenet-ops.be ([195.130.132.45]:36118 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729358AbgBKS0R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:26:17 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 48H9z702SBzMrJd7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2020 19:19:31 +0100 (CET)
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id 1WKV2200H5USYZQ06WKWPD; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0002pC-E6; Tue, 11 Feb 2020 19:19:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0003zT-CF; Tue, 11 Feb 2020 19:19:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 29/34] crypto: ccree - spelling s/Crytpcell/Cryptocell/
Date:   Tue, 11 Feb 2020 19:19:23 +0100
Message-Id: <20200211181928.15178-30-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix a typo in a comment.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/ccree/cc_driver.c b/drivers/crypto/ccree/cc_driver.c
index 02442596310cd98d..bd9db53c68ab4381 100644
--- a/drivers/crypto/ccree/cc_driver.c
+++ b/drivers/crypto/ccree/cc_driver.c
@@ -367,7 +367,7 @@ static int init_cc_resources(struct platform_device *plat_dev)
 		goto post_pm_err;
 	}
 
-	/* wait for Crytpcell reset completion */
+	/* Wait for Cryptocell reset completion */
 	if (!cc_wait_for_reset_completion(new_drvdata)) {
 		dev_err(dev, "Cryptocell reset not completed");
 	}
-- 
2.17.1

