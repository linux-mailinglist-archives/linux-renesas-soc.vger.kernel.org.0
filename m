Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 966FE159830
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731049AbgBKSTd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:19:33 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:52112 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730673AbgBKSTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:33 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id 1WKV2200M5USYZQ01WKV6z; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002nt-Gy; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003yM-Fc; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 06/34] crypto: ccree - drop duplicated error message on SRAM exhaustion
Date:   Tue, 11 Feb 2020 19:19:00 +0100
Message-Id: <20200211181928.15178-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When no SRAM can be allocated, cc_sram_alloc() already prints an error
message.  Hence there is no need to duplicate this in all callers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_aead.c   | 1 -
 drivers/crypto/ccree/cc_driver.c | 1 -
 drivers/crypto/ccree/cc_hash.c   | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/crypto/ccree/cc_aead.c b/drivers/crypto/ccree/cc_aead.c
index 7a62fb023d8d3769..db89144ce6c5e974 100644
--- a/drivers/crypto/ccree/cc_aead.c
+++ b/drivers/crypto/ccree/cc_aead.c
@@ -2682,7 +2682,6 @@ int cc_aead_alloc(struct cc_drvdata *drvdata)
 							 MAX_HMAC_DIGEST_SIZE);
 
 	if (aead_handle->sram_workspace_addr == NULL_SRAM_ADDR) {
-		dev_err(dev, "SRAM pool exhausted\n");
 		rc = -ENOMEM;
 		goto fail1;
 	}
diff --git a/drivers/crypto/ccree/cc_driver.c b/drivers/crypto/ccree/cc_driver.c
index fc34d152f42090fc..599936a0b0a2cc63 100644
--- a/drivers/crypto/ccree/cc_driver.c
+++ b/drivers/crypto/ccree/cc_driver.c
@@ -477,7 +477,6 @@ static int init_cc_resources(struct platform_device *plat_dev)
 	new_drvdata->mlli_sram_addr =
 		cc_sram_alloc(new_drvdata, MAX_MLLI_BUFF_SIZE);
 	if (new_drvdata->mlli_sram_addr == NULL_SRAM_ADDR) {
-		dev_err(dev, "Failed to alloc MLLI Sram buffer\n");
 		rc = -ENOMEM;
 		goto post_sram_mgr_err;
 	}
diff --git a/drivers/crypto/ccree/cc_hash.c b/drivers/crypto/ccree/cc_hash.c
index c3146f550268e7ab..defeb35a16a626ff 100644
--- a/drivers/crypto/ccree/cc_hash.c
+++ b/drivers/crypto/ccree/cc_hash.c
@@ -2001,7 +2001,6 @@ int cc_hash_alloc(struct cc_drvdata *drvdata)
 
 	sram_buff = cc_sram_alloc(drvdata, sram_size_to_alloc);
 	if (sram_buff == NULL_SRAM_ADDR) {
-		dev_err(dev, "SRAM pool exhausted\n");
 		rc = -ENOMEM;
 		goto fail;
 	}
-- 
2.17.1

