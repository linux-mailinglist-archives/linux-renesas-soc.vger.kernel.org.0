Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17F60159819
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729743AbgBKSTu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:19:50 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:45394 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730865AbgBKSTe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:34 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id 1WKW220035USYZQ01WKWvy; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0002oi-4H; Tue, 11 Feb 2020 19:19:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0003z8-2u; Tue, 11 Feb 2020 19:19:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 22/34] crypto: ccree - extract cc_init_copy_sram()
Date:   Tue, 11 Feb 2020 19:19:16 +0100
Message-Id: <20200211181928.15178-23-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Extract the copy to SRAM of the initial values for a hash algorithm into
its own function, to improve readability and ease maintenance.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_hash.c | 91 ++++++++++++++--------------------
 1 file changed, 36 insertions(+), 55 deletions(-)

diff --git a/drivers/crypto/ccree/cc_hash.c b/drivers/crypto/ccree/cc_hash.c
index 0b179aafd484738b..f3adc1ab0e01abec 100644
--- a/drivers/crypto/ccree/cc_hash.c
+++ b/drivers/crypto/ccree/cc_hash.c
@@ -1865,104 +1865,85 @@ static struct cc_hash_alg *cc_alloc_hash_alg(struct cc_hash_template *template,
 	return t_crypto_alg;
 }
 
+static int cc_init_copy_sram(struct cc_drvdata *drvdata, const u32 *data,
+			     unsigned int size, u32 *sram_buff_ofs)
+{
+	struct cc_hw_desc larval_seq[CC_DIGEST_SIZE_MAX / sizeof(u32)];
+	unsigned int larval_seq_len = 0;
+	int rc;
+
+	cc_set_sram_desc(data, *sram_buff_ofs, size / sizeof(*data),
+			 larval_seq, &larval_seq_len);
+	rc = send_request_init(drvdata, larval_seq, larval_seq_len);
+	if (rc)
+		return rc;
+
+	*sram_buff_ofs += size;
+	return 0;
+}
+
 int cc_init_hash_sram(struct cc_drvdata *drvdata)
 {
 	struct cc_hash_handle *hash_handle = drvdata->hash_handle;
 	u32 sram_buff_ofs = hash_handle->digest_len_sram_addr;
-	unsigned int larval_seq_len = 0;
-	struct cc_hw_desc larval_seq[CC_DIGEST_SIZE_MAX / sizeof(u32)];
 	bool large_sha_supported = (drvdata->hw_rev >= CC_HW_REV_712);
 	bool sm3_supported = (drvdata->hw_rev >= CC_HW_REV_713);
 	int rc = 0;
 
 	/* Copy-to-sram digest-len */
-	cc_set_sram_desc(cc_digest_len_init, sram_buff_ofs,
-			 ARRAY_SIZE(cc_digest_len_init), larval_seq,
-			 &larval_seq_len);
-	rc = send_request_init(drvdata, larval_seq, larval_seq_len);
+	rc = cc_init_copy_sram(drvdata, cc_digest_len_init,
+			       sizeof(cc_digest_len_init), &sram_buff_ofs);
 	if (rc)
 		goto init_digest_const_err;
 
-	sram_buff_ofs += sizeof(cc_digest_len_init);
-	larval_seq_len = 0;
-
 	if (large_sha_supported) {
 		/* Copy-to-sram digest-len for sha384/512 */
-		cc_set_sram_desc(cc_digest_len_sha512_init, sram_buff_ofs,
-				 ARRAY_SIZE(cc_digest_len_sha512_init),
-				 larval_seq, &larval_seq_len);
-		rc = send_request_init(drvdata, larval_seq, larval_seq_len);
+		rc = cc_init_copy_sram(drvdata, cc_digest_len_sha512_init,
+				       sizeof(cc_digest_len_sha512_init),
+				       &sram_buff_ofs);
 		if (rc)
 			goto init_digest_const_err;
-
-		sram_buff_ofs += sizeof(cc_digest_len_sha512_init);
-		larval_seq_len = 0;
 	}
 
 	/* The initial digests offset */
 	hash_handle->larval_digest_sram_addr = sram_buff_ofs;
 
 	/* Copy-to-sram initial SHA* digests */
-	cc_set_sram_desc(cc_md5_init, sram_buff_ofs, ARRAY_SIZE(cc_md5_init),
-			 larval_seq, &larval_seq_len);
-	rc = send_request_init(drvdata, larval_seq, larval_seq_len);
+	rc = cc_init_copy_sram(drvdata, cc_md5_init, sizeof(cc_md5_init),
+			       &sram_buff_ofs);
 	if (rc)
 		goto init_digest_const_err;
-	sram_buff_ofs += sizeof(cc_md5_init);
-	larval_seq_len = 0;
 
-	cc_set_sram_desc(cc_sha1_init, sram_buff_ofs,
-			 ARRAY_SIZE(cc_sha1_init), larval_seq,
-			 &larval_seq_len);
-	rc = send_request_init(drvdata, larval_seq, larval_seq_len);
+	rc = cc_init_copy_sram(drvdata, cc_sha1_init, sizeof(cc_sha1_init),
+			       &sram_buff_ofs);
 	if (rc)
 		goto init_digest_const_err;
-	sram_buff_ofs += sizeof(cc_sha1_init);
-	larval_seq_len = 0;
 
-	cc_set_sram_desc(cc_sha224_init, sram_buff_ofs,
-			 ARRAY_SIZE(cc_sha224_init), larval_seq,
-			 &larval_seq_len);
-	rc = send_request_init(drvdata, larval_seq, larval_seq_len);
+	rc = cc_init_copy_sram(drvdata, cc_sha224_init, sizeof(cc_sha224_init),
+			       &sram_buff_ofs);
 	if (rc)
 		goto init_digest_const_err;
-	sram_buff_ofs += sizeof(cc_sha224_init);
-	larval_seq_len = 0;
 
-	cc_set_sram_desc(cc_sha256_init, sram_buff_ofs,
-			 ARRAY_SIZE(cc_sha256_init), larval_seq,
-			 &larval_seq_len);
-	rc = send_request_init(drvdata, larval_seq, larval_seq_len);
+	rc = cc_init_copy_sram(drvdata, cc_sha256_init, sizeof(cc_sha256_init),
+			       &sram_buff_ofs);
 	if (rc)
 		goto init_digest_const_err;
-	sram_buff_ofs += sizeof(cc_sha256_init);
-	larval_seq_len = 0;
 
 	if (sm3_supported) {
-		cc_set_sram_desc(cc_sm3_init, sram_buff_ofs,
-				 ARRAY_SIZE(cc_sm3_init), larval_seq,
-				 &larval_seq_len);
-		rc = send_request_init(drvdata, larval_seq, larval_seq_len);
+		rc = cc_init_copy_sram(drvdata, cc_sm3_init,
+				       sizeof(cc_sm3_init), &sram_buff_ofs);
 		if (rc)
 			goto init_digest_const_err;
-		sram_buff_ofs += sizeof(cc_sm3_init);
-		larval_seq_len = 0;
 	}
 
 	if (large_sha_supported) {
-		cc_set_sram_desc(cc_sha384_init, sram_buff_ofs,
-				 ARRAY_SIZE(cc_sha384_init), larval_seq,
-				 &larval_seq_len);
-		rc = send_request_init(drvdata, larval_seq, larval_seq_len);
+		rc = cc_init_copy_sram(drvdata, cc_sha384_init,
+				       sizeof(cc_sha384_init), &sram_buff_ofs);
 		if (rc)
 			goto init_digest_const_err;
-		sram_buff_ofs += sizeof(cc_sha384_init);
-		larval_seq_len = 0;
 
-		cc_set_sram_desc(cc_sha512_init, sram_buff_ofs,
-				 ARRAY_SIZE(cc_sha512_init), larval_seq,
-				 &larval_seq_len);
-		rc = send_request_init(drvdata, larval_seq, larval_seq_len);
+		rc = cc_init_copy_sram(drvdata, cc_sha512_init,
+				       sizeof(cc_sha512_init), &sram_buff_ofs);
 		if (rc)
 			goto init_digest_const_err;
 	}
-- 
2.17.1

