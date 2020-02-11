Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84A9E159853
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:21:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731085AbgBKSVL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:21:11 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:59516 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731172AbgBKSTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:33 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id 1WKW2200H5USYZQ06WKWab; Tue, 11 Feb 2020 19:19:31 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002nw-IC; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003yP-Gg; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 07/34] crypto: ccree - remove empty cc_sram_mgr_fini()
Date:   Tue, 11 Feb 2020 19:19:01 +0100
Message-Id: <20200211181928.15178-8-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

cc_sram_mgr_fini() doesn't do anything, so it can just be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_driver.c   |  7 ++-----
 drivers/crypto/ccree/cc_sram_mgr.c | 10 ----------
 drivers/crypto/ccree/cc_sram_mgr.h |  7 -------
 3 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/crypto/ccree/cc_driver.c b/drivers/crypto/ccree/cc_driver.c
index 599936a0b0a2cc63..f8aba89e48730e4d 100644
--- a/drivers/crypto/ccree/cc_driver.c
+++ b/drivers/crypto/ccree/cc_driver.c
@@ -478,13 +478,13 @@ static int init_cc_resources(struct platform_device *plat_dev)
 		cc_sram_alloc(new_drvdata, MAX_MLLI_BUFF_SIZE);
 	if (new_drvdata->mlli_sram_addr == NULL_SRAM_ADDR) {
 		rc = -ENOMEM;
-		goto post_sram_mgr_err;
+		goto post_fips_init_err;
 	}
 
 	rc = cc_req_mgr_init(new_drvdata);
 	if (rc) {
 		dev_err(dev, "cc_req_mgr_init failed\n");
-		goto post_sram_mgr_err;
+		goto post_fips_init_err;
 	}
 
 	rc = cc_buffer_mgr_init(new_drvdata);
@@ -538,8 +538,6 @@ static int init_cc_resources(struct platform_device *plat_dev)
 	 cc_buffer_mgr_fini(new_drvdata);
 post_req_mgr_err:
 	cc_req_mgr_fini(new_drvdata);
-post_sram_mgr_err:
-	cc_sram_mgr_fini(new_drvdata);
 post_fips_init_err:
 	cc_fips_fini(new_drvdata);
 post_debugfs_err:
@@ -568,7 +566,6 @@ static void cleanup_cc_resources(struct platform_device *plat_dev)
 	cc_pm_fini(drvdata);
 	cc_buffer_mgr_fini(drvdata);
 	cc_req_mgr_fini(drvdata);
-	cc_sram_mgr_fini(drvdata);
 	cc_fips_fini(drvdata);
 	cc_debugfs_fini(drvdata);
 	fini_cc_regs(drvdata);
diff --git a/drivers/crypto/ccree/cc_sram_mgr.c b/drivers/crypto/ccree/cc_sram_mgr.c
index 62c885e6e791cfe1..a3c13b37adce4641 100644
--- a/drivers/crypto/ccree/cc_sram_mgr.c
+++ b/drivers/crypto/ccree/cc_sram_mgr.c
@@ -12,16 +12,6 @@ struct cc_sram_ctx {
 	cc_sram_addr_t sram_free_offset;
 };
 
-/**
- * cc_sram_mgr_fini() - Cleanup SRAM pool.
- *
- * @drvdata: Associated device driver context
- */
-void cc_sram_mgr_fini(struct cc_drvdata *drvdata)
-{
-	/* Nothing needed */
-}
-
 /**
  * cc_sram_mgr_init() - Initializes SRAM pool.
  *      The pool starts right at the beginning of SRAM.
diff --git a/drivers/crypto/ccree/cc_sram_mgr.h b/drivers/crypto/ccree/cc_sram_mgr.h
index 1d14de9ee8c344ba..971029b0e2a16c36 100644
--- a/drivers/crypto/ccree/cc_sram_mgr.h
+++ b/drivers/crypto/ccree/cc_sram_mgr.h
@@ -29,13 +29,6 @@ typedef u64 cc_sram_addr_t;
  */
 int cc_sram_mgr_init(struct cc_drvdata *drvdata);
 
-/*!
- * Uninits SRAM pool.
- *
- * \param drvdata
- */
-void cc_sram_mgr_fini(struct cc_drvdata *drvdata);
-
 /*!
  * Allocated buffer from SRAM pool.
  * Note: Caller is responsible to free the LAST allocated buffer.
-- 
2.17.1

