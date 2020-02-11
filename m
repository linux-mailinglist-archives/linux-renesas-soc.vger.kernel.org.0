Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD8915981F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731222AbgBKST6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:19:58 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:60420 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728720AbgBKSTe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:34 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id 1WKV2200H5USYZQ06WKVNM; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002nq-Fw; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003yJ-E2; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 05/34] crypto: ccree - swap SHA384 and SHA512 larval hashes at build time
Date:   Tue, 11 Feb 2020 19:18:59 +0100
Message-Id: <20200211181928.15178-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Due to the way the hardware works, every double word in the SHA384 and
SHA512 larval hashes must be swapped.  Currently this is done at run
time, during driver initialization.

However, this swapping can easily be done at build time.  Treating each
double word as two words has the benefit of changing the larval hashes'
types from u64[] to u32[], like for all other hashes, and allows
dropping the casts and size doublings when calling cc_set_sram_desc().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_driver.c |  1 -
 drivers/crypto/ccree/cc_hash.c   | 49 +++++++++++---------------------
 drivers/crypto/ccree/cc_hash.h   |  2 --
 3 files changed, 17 insertions(+), 35 deletions(-)

diff --git a/drivers/crypto/ccree/cc_driver.c b/drivers/crypto/ccree/cc_driver.c
index 532bc95a83736f94..fc34d152f42090fc 100644
--- a/drivers/crypto/ccree/cc_driver.c
+++ b/drivers/crypto/ccree/cc_driver.c
@@ -653,7 +653,6 @@ static struct platform_driver ccree_driver = {
 
 static int __init ccree_init(void)
 {
-	cc_hash_global_init();
 	cc_debugfs_global_init();
 
 	return platform_driver_register(&ccree_driver);
diff --git a/drivers/crypto/ccree/cc_hash.c b/drivers/crypto/ccree/cc_hash.c
index 36ce015716c317df..c3146f550268e7ab 100644
--- a/drivers/crypto/ccree/cc_hash.c
+++ b/drivers/crypto/ccree/cc_hash.c
@@ -39,12 +39,19 @@ static const u32 cc_sha256_init[] = {
 	SHA256_H3, SHA256_H2, SHA256_H1, SHA256_H0 };
 static const u32 cc_digest_len_sha512_init[] = {
 	0x00000080, 0x00000000, 0x00000000, 0x00000000 };
-static u64 cc_sha384_init[] = {
-	SHA384_H7, SHA384_H6, SHA384_H5, SHA384_H4,
-	SHA384_H3, SHA384_H2, SHA384_H1, SHA384_H0 };
-static u64 cc_sha512_init[] = {
-	SHA512_H7, SHA512_H6, SHA512_H5, SHA512_H4,
-	SHA512_H3, SHA512_H2, SHA512_H1, SHA512_H0 };
+
+/*
+ * Due to the way the HW works, every double word in the SHA384 and SHA512
+ * larval hashes must be stored in hi/lo order
+ */
+#define hilo(x)	upper_32_bits(x), lower_32_bits(x)
+static const u32 cc_sha384_init[] = {
+	hilo(SHA384_H7), hilo(SHA384_H6), hilo(SHA384_H5), hilo(SHA384_H4),
+	hilo(SHA384_H3), hilo(SHA384_H2), hilo(SHA384_H1), hilo(SHA384_H0) };
+static const u32 cc_sha512_init[] = {
+	hilo(SHA512_H7), hilo(SHA512_H6), hilo(SHA512_H5), hilo(SHA512_H4),
+	hilo(SHA512_H3), hilo(SHA512_H2), hilo(SHA512_H1), hilo(SHA512_H0) };
+
 static const u32 cc_sm3_init[] = {
 	SM3_IVH, SM3_IVG, SM3_IVF, SM3_IVE,
 	SM3_IVD, SM3_IVC, SM3_IVB, SM3_IVA };
@@ -1942,8 +1949,8 @@ int cc_init_hash_sram(struct cc_drvdata *drvdata)
 	}
 
 	if (large_sha_supported) {
-		cc_set_sram_desc((u32 *)cc_sha384_init, sram_buff_ofs,
-				 (ARRAY_SIZE(cc_sha384_init) * 2), larval_seq,
+		cc_set_sram_desc(cc_sha384_init, sram_buff_ofs,
+				 ARRAY_SIZE(cc_sha384_init), larval_seq,
 				 &larval_seq_len);
 		rc = send_request_init(drvdata, larval_seq, larval_seq_len);
 		if (rc)
@@ -1951,8 +1958,8 @@ int cc_init_hash_sram(struct cc_drvdata *drvdata)
 		sram_buff_ofs += sizeof(cc_sha384_init);
 		larval_seq_len = 0;
 
-		cc_set_sram_desc((u32 *)cc_sha512_init, sram_buff_ofs,
-				 (ARRAY_SIZE(cc_sha512_init) * 2), larval_seq,
+		cc_set_sram_desc(cc_sha512_init, sram_buff_ofs,
+				 ARRAY_SIZE(cc_sha512_init), larval_seq,
 				 &larval_seq_len);
 		rc = send_request_init(drvdata, larval_seq, larval_seq_len);
 		if (rc)
@@ -1963,28 +1970,6 @@ int cc_init_hash_sram(struct cc_drvdata *drvdata)
 	return rc;
 }
 
-static void __init cc_swap_dwords(u32 *buf, unsigned long size)
-{
-	int i;
-	u32 tmp;
-
-	for (i = 0; i < size; i += 2) {
-		tmp = buf[i];
-		buf[i] = buf[i + 1];
-		buf[i + 1] = tmp;
-	}
-}
-
-/*
- * Due to the way the HW works we need to swap every
- * double word in the SHA384 and SHA512 larval hashes
- */
-void __init cc_hash_global_init(void)
-{
-	cc_swap_dwords((u32 *)&cc_sha384_init, (ARRAY_SIZE(cc_sha384_init) * 2));
-	cc_swap_dwords((u32 *)&cc_sha512_init, (ARRAY_SIZE(cc_sha512_init) * 2));
-}
-
 int cc_hash_alloc(struct cc_drvdata *drvdata)
 {
 	struct cc_hash_handle *hash_handle;
diff --git a/drivers/crypto/ccree/cc_hash.h b/drivers/crypto/ccree/cc_hash.h
index 0d6dc61484d79bc8..3dbd0abefea0546c 100644
--- a/drivers/crypto/ccree/cc_hash.h
+++ b/drivers/crypto/ccree/cc_hash.h
@@ -104,6 +104,4 @@ cc_digest_len_addr(void *drvdata, u32 mode);
  */
 cc_sram_addr_t cc_larval_digest_addr(void *drvdata, u32 mode);
 
-void cc_hash_global_init(void);
-
 #endif /*__CC_HASH_H__*/
-- 
2.17.1

