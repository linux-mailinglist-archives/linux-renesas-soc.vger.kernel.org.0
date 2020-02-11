Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22396159811
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731097AbgBKSTp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:19:45 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:45466 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730857AbgBKSTf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:35 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id 1WKW220035USYZQ01WKWwT; Tue, 11 Feb 2020 19:19:31 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0002ov-9t; Tue, 11 Feb 2020 19:19:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0003zK-8W; Tue, 11 Feb 2020 19:19:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 26/34] crypto: ccree - improve kerneldoc in cc_hash.[ch]
Date:   Tue, 11 Feb 2020 19:19:20 +0100
Message-Id: <20200211181928.15178-27-geert+renesas@glider.be>
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
  - Add missing function names to kerneldoc headers,
  - Add missing parameter descriptions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_hash.c | 11 ++++++-----
 drivers/crypto/ccree/cc_hash.h | 24 ++++++++++++------------
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/crypto/ccree/cc_hash.c b/drivers/crypto/ccree/cc_hash.c
index f3adc1ab0e01abec..738f0debee98ebf1 100644
--- a/drivers/crypto/ccree/cc_hash.c
+++ b/drivers/crypto/ccree/cc_hash.c
@@ -2238,14 +2238,15 @@ static const void *cc_larval_digest(struct device *dev, u32 mode)
 	}
 }
 
-/*!
- * Gets the address of the initial digest in SRAM
+/**
+ * cc_larval_digest_addr() - Get the address of the initial digest in SRAM
  * according to the given hash mode
  *
- * \param drvdata
- * \param mode The Hash mode. Supported modes: MD5/SHA1/SHA224/SHA256
+ * @drvdata: Associated device driver context
+ * @mode: The Hash mode. Supported modes: MD5/SHA1/SHA224/SHA256
  *
- * \return u32 The address of the initial digest in SRAM
+ * Return:
+ * The address of the initial digest in SRAM
  */
 u32 cc_larval_digest_addr(void *drvdata, u32 mode)
 {
diff --git a/drivers/crypto/ccree/cc_hash.h b/drivers/crypto/ccree/cc_hash.h
index d76ecae996ca3fa0..3d0f2179e07ec1ce 100644
--- a/drivers/crypto/ccree/cc_hash.h
+++ b/drivers/crypto/ccree/cc_hash.h
@@ -80,26 +80,26 @@ int cc_hash_alloc(struct cc_drvdata *drvdata);
 int cc_init_hash_sram(struct cc_drvdata *drvdata);
 int cc_hash_free(struct cc_drvdata *drvdata);
 
-/*!
- * Gets the initial digest length
+/**
+ * cc_digest_len_addr() - Gets the initial digest length
  *
- * \param drvdata
- * \param mode The Hash mode. Supported modes:
- *             MD5/SHA1/SHA224/SHA256/SHA384/SHA512
+ * @drvdata: Associated device driver context
+ * @mode: The Hash mode. Supported modes: MD5/SHA1/SHA224/SHA256/SHA384/SHA512
  *
- * \return u32 returns the address of the initial digest length in SRAM
+ * Return:
+ * Returns the address of the initial digest length in SRAM
  */
 u32 cc_digest_len_addr(void *drvdata, u32 mode);
 
-/*!
- * Gets the address of the initial digest in SRAM
+/**
+ * cc_larval_digest_addr() - Gets the address of the initial digest in SRAM
  * according to the given hash mode
  *
- * \param drvdata
- * \param mode The Hash mode. Supported modes:
- *             MD5/SHA1/SHA224/SHA256/SHA384/SHA512
+ * @drvdata: Associated device driver context
+ * @mode: The Hash mode. Supported modes: MD5/SHA1/SHA224/SHA256/SHA384/SHA512
  *
- * \return u32 The address of the initial digest in SRAM
+ * Return:
+ * The address of the initial digest in SRAM
  */
 u32 cc_larval_digest_addr(void *drvdata, u32 mode);
 
-- 
2.17.1

