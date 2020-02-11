Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3E0A15981C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731057AbgBKSTv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:19:51 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:34360 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731175AbgBKSTe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:34 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id 1WKW220015USYZQ01WKWTi; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002oV-Vs; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003yw-Uf; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 18/34] crypto: ccree - remove struct cc_sram_ctx
Date:   Tue, 11 Feb 2020 19:19:12 +0100
Message-Id: <20200211181928.15178-19-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The cc_sram_ctx structure contains only a single member, and only one
instance exists.  Simplify the code and reduce memory consumption by
moving this member to struct cc_drvdata.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_driver.h   |  2 +-
 drivers/crypto/ccree/cc_sram_mgr.c | 27 +++++----------------------
 2 files changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/crypto/ccree/cc_driver.h b/drivers/crypto/ccree/cc_driver.h
index 9e94a29d84ae61f1..7e483c22858245f9 100644
--- a/drivers/crypto/ccree/cc_driver.h
+++ b/drivers/crypto/ccree/cc_driver.h
@@ -146,7 +146,7 @@ struct cc_drvdata {
 	void *aead_handle;
 	void *request_mgr_handle;
 	void *fips_handle;
-	void *sram_mgr_handle;
+	u32 sram_free_offset;	/* offset to non-allocated area in SRAM */
 	void *debugfs;
 	struct clk *clk;
 	bool coherent;
diff --git a/drivers/crypto/ccree/cc_sram_mgr.c b/drivers/crypto/ccree/cc_sram_mgr.c
index d46aad7c8140acaa..38f36cbc05b3cf6f 100644
--- a/drivers/crypto/ccree/cc_sram_mgr.c
+++ b/drivers/crypto/ccree/cc_sram_mgr.c
@@ -4,14 +4,6 @@
 #include "cc_driver.h"
 #include "cc_sram_mgr.h"
 
-/**
- * struct cc_sram_ctx -Internal RAM context manager
- * @sram_free_offset:   the offset to the non-allocated area
- */
-struct cc_sram_ctx {
-	u32 sram_free_offset;
-};
-
 /**
  * cc_sram_mgr_init() - Initializes SRAM pool.
  *      The pool starts right at the beginning of SRAM.
@@ -21,7 +13,6 @@ struct cc_sram_ctx {
  */
 int cc_sram_mgr_init(struct cc_drvdata *drvdata)
 {
-	struct cc_sram_ctx *ctx;
 	u32 start = 0;
 	struct device *dev = drvdata_to_dev(drvdata);
 
@@ -34,14 +25,7 @@ int cc_sram_mgr_init(struct cc_drvdata *drvdata)
 		}
 	}
 
-	/* Allocate "this" context */
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
-
-	ctx->sram_free_offset = start;
-	drvdata->sram_mgr_handle = ctx;
-
+	drvdata->sram_free_offset = start;
 	return 0;
 }
 
@@ -53,7 +37,6 @@ int cc_sram_mgr_init(struct cc_drvdata *drvdata)
  */
 u32 cc_sram_alloc(struct cc_drvdata *drvdata, u32 size)
 {
-	struct cc_sram_ctx *smgr_ctx = drvdata->sram_mgr_handle;
 	struct device *dev = drvdata_to_dev(drvdata);
 	u32 p;
 
@@ -62,14 +45,14 @@ u32 cc_sram_alloc(struct cc_drvdata *drvdata, u32 size)
 			size);
 		return NULL_SRAM_ADDR;
 	}
-	if (size > (CC_CC_SRAM_SIZE - smgr_ctx->sram_free_offset)) {
+	if (size > (CC_CC_SRAM_SIZE - drvdata->sram_free_offset)) {
 		dev_err(dev, "Not enough space to allocate %u B (at offset %u)\n",
-			size, smgr_ctx->sram_free_offset);
+			size, drvdata->sram_free_offset);
 		return NULL_SRAM_ADDR;
 	}
 
-	p = smgr_ctx->sram_free_offset;
-	smgr_ctx->sram_free_offset += size;
+	p = drvdata->sram_free_offset;
+	drvdata->sram_free_offset += size;
 	dev_dbg(dev, "Allocated %u B @ %u\n", size, p);
 	return p;
 }
-- 
2.17.1

