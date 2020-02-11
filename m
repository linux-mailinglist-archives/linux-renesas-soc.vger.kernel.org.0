Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E71F15982A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731136AbgBKSTe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:19:34 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:34404 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730135AbgBKSTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:33 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id 1WKV2200W5USYZQ01WKWUG; Tue, 11 Feb 2020 19:19:31 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0002p9-CW; Tue, 11 Feb 2020 19:19:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0003zQ-Ab; Tue, 11 Feb 2020 19:19:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 28/34] crypto: ccree - improve kerneldoc in cc_sram_mgr.[ch]
Date:   Tue, 11 Feb 2020 19:19:22 +0100
Message-Id: <20200211181928.15178-29-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Miscellaneous improvements:
  - Start comment blocks with "/**" to enable kerneldoc,
  - Mark parameters using "@" instead of "\param",
  - Fix typos in parameter names,
  - Add missing function names to kerneldoc headers,
  - Add missing parameter and return value descriptions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_sram_mgr.c | 16 +++++++++++-----
 drivers/crypto/ccree/cc_sram_mgr.h | 22 +++++++++++++---------
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/crypto/ccree/cc_sram_mgr.c b/drivers/crypto/ccree/cc_sram_mgr.c
index 38f36cbc05b3cf6f..37a95856361fc52c 100644
--- a/drivers/crypto/ccree/cc_sram_mgr.c
+++ b/drivers/crypto/ccree/cc_sram_mgr.c
@@ -10,6 +10,9 @@
  *      Returns zero for success, negative value otherwise.
  *
  * @drvdata: Associated device driver context
+ *
+ * Return:
+ * 0 for success, negative error code for failure.
  */
 int cc_sram_mgr_init(struct cc_drvdata *drvdata)
 {
@@ -29,11 +32,14 @@ int cc_sram_mgr_init(struct cc_drvdata *drvdata)
 	return 0;
 }
 
-/*!
- * Allocated buffer from SRAM pool.
+/**
+ * cc_sram_alloc() - Allocate buffer from SRAM pool.
+ *
+ * @drvdata: Associated device driver context
+ * @size: The requested numer of bytes to allocate
  *
- * \param drvdata
- * \param size The requested bytes to allocate
+ * Return:
+ * Address offset in SRAM or NULL_SRAM_ADDR for failure.
  */
 u32 cc_sram_alloc(struct cc_drvdata *drvdata, u32 size)
 {
@@ -64,7 +70,7 @@ u32 cc_sram_alloc(struct cc_drvdata *drvdata, u32 size)
  *
  * @src:	  A pointer to array of words to set as consts.
  * @dst:	  The target SRAM buffer to set into
- * @nelements:	  The number of words in "src" array
+ * @nelement:	  The number of words in "src" array
  * @seq:	  A pointer to the given IN/OUT descriptor sequence
  * @seq_len:	  A pointer to the given IN/OUT sequence length
  */
diff --git a/drivers/crypto/ccree/cc_sram_mgr.h b/drivers/crypto/ccree/cc_sram_mgr.h
index 04a857259d4148eb..1c965ef83002a631 100644
--- a/drivers/crypto/ccree/cc_sram_mgr.h
+++ b/drivers/crypto/ccree/cc_sram_mgr.h
@@ -12,22 +12,26 @@ struct cc_drvdata;
 
 #define NULL_SRAM_ADDR ((u32)-1)
 
-/*!
- * Initializes SRAM pool.
+/**
+ * cc_sram_mgr_init() - Initializes SRAM pool.
  * The first X bytes of SRAM are reserved for ROM usage, hence, pool
  * starts right after X bytes.
  *
- * \param drvdata
+ * @drvdata: Associated device driver context
  *
- * \return int Zero for success, negative value otherwise.
+ * Return:
+ * Zero for success, negative value otherwise.
  */
 int cc_sram_mgr_init(struct cc_drvdata *drvdata);
 
-/*!
- * Allocate buffer from SRAM pool.
+/**
+ * cc_sram_alloc() - Allocate buffer from SRAM pool.
+ *
+ * @drvdata: Associated device driver context
+ * @size: The requested bytes to allocate
  *
- * \param drvdata
- * \param size The requested bytes to allocate
+ * Return:
+ * Address offset in SRAM or NULL_SRAM_ADDR for failure.
  */
 u32 cc_sram_alloc(struct cc_drvdata *drvdata, u32 size);
 
@@ -38,7 +42,7 @@ u32 cc_sram_alloc(struct cc_drvdata *drvdata, u32 size);
  *
  * @src:	  A pointer to array of words to set as consts.
  * @dst:	  The target SRAM buffer to set into
- * @nelements:	  The number of words in "src" array
+ * @nelement:	  The number of words in "src" array
  * @seq:	  A pointer to the given IN/OUT descriptor sequence
  * @seq_len:	  A pointer to the given IN/OUT sequence length
  */
-- 
2.17.1

