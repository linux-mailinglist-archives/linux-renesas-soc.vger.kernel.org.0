Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C10A159891
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731271AbgBKS05 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:26:57 -0500
Received: from leibniz.telenet-ops.be ([195.130.137.77]:36200 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731302AbgBKS05 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:26:57 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 48H9z71HzyzMtgrg
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2020 19:19:31 +0100 (CET)
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id 1WKV2200K5USYZQ01WKV6t; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002nk-ES; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003yG-Ck; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 04/34] crypto: ccree - remove unneeded casts
Date:   Tue, 11 Feb 2020 19:18:58 +0100
Message-Id: <20200211181928.15178-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Unneeded casts prevent the compiler from performing valuable checks.
This is especially true for function pointers.

Remove these casts, to prevent silently introducing bugs when a
variable's type might be changed in the future.

No change in generated code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_aead.c       |  7 +++----
 drivers/crypto/ccree/cc_buffer_mgr.c |  7 +++----
 drivers/crypto/ccree/cc_cipher.c     | 10 +++++-----
 drivers/crypto/ccree/cc_hash.c       | 24 ++++++++++++------------
 4 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/crypto/ccree/cc_aead.c b/drivers/crypto/ccree/cc_aead.c
index 0d95bda4de702a4a..7a62fb023d8d3769 100644
--- a/drivers/crypto/ccree/cc_aead.c
+++ b/drivers/crypto/ccree/cc_aead.c
@@ -448,8 +448,7 @@ static int cc_get_plain_hmac_key(struct crypto_aead *tfm, const u8 *authkey,
 		if (!key)
 			return -ENOMEM;
 
-		key_dma_addr = dma_map_single(dev, (void *)key, keylen,
-					      DMA_TO_DEVICE);
+		key_dma_addr = dma_map_single(dev, key, keylen, DMA_TO_DEVICE);
 		if (dma_mapping_error(dev, key_dma_addr)) {
 			dev_err(dev, "Mapping key va=0x%p len=%u for DMA failed\n",
 				key, keylen);
@@ -1921,8 +1920,8 @@ static int cc_proc_aead(struct aead_request *req,
 	}
 
 	/* Setup request structure */
-	cc_req.user_cb = (void *)cc_aead_complete;
-	cc_req.user_arg = (void *)req;
+	cc_req.user_cb = cc_aead_complete;
+	cc_req.user_arg = req;
 
 	/* Setup request context */
 	areq_ctx->gen_ctx.op_type = direct;
diff --git a/drivers/crypto/ccree/cc_buffer_mgr.c b/drivers/crypto/ccree/cc_buffer_mgr.c
index 954f14bddf1d7852..1e335abd744024d8 100644
--- a/drivers/crypto/ccree/cc_buffer_mgr.c
+++ b/drivers/crypto/ccree/cc_buffer_mgr.c
@@ -118,7 +118,7 @@ void cc_copy_sg_portion(struct device *dev, u8 *dest, struct scatterlist *sg,
 	u32 nents;
 
 	nents = sg_nents_for_len(sg, end);
-	sg_copy_buffer(sg, nents, (void *)dest, (end - to_skip + 1), to_skip,
+	sg_copy_buffer(sg, nents, dest, (end - to_skip + 1), to_skip,
 		       (direct == CC_SG_TO_BUF));
 }
 
@@ -415,10 +415,9 @@ int cc_map_cipher_request(struct cc_drvdata *drvdata, void *ctx,
 
 	/* Map IV buffer */
 	if (ivsize) {
-		dump_byte_array("iv", (u8 *)info, ivsize);
+		dump_byte_array("iv", info, ivsize);
 		req_ctx->gen_ctx.iv_dma_addr =
-			dma_map_single(dev, (void *)info,
-				       ivsize, DMA_BIDIRECTIONAL);
+			dma_map_single(dev, info, ivsize, DMA_BIDIRECTIONAL);
 		if (dma_mapping_error(dev, req_ctx->gen_ctx.iv_dma_addr)) {
 			dev_err(dev, "Mapping iv %u B at va=%pK for DMA failed\n",
 				ivsize, info);
diff --git a/drivers/crypto/ccree/cc_cipher.c b/drivers/crypto/ccree/cc_cipher.c
index fc1646ccfe29bcaa..91d2edee47b8c843 100644
--- a/drivers/crypto/ccree/cc_cipher.c
+++ b/drivers/crypto/ccree/cc_cipher.c
@@ -184,7 +184,7 @@ static int cc_cipher_init(struct crypto_tfm *tfm)
 		ctx_p->user.key);
 
 	/* Map key buffer */
-	ctx_p->user.key_dma_addr = dma_map_single(dev, (void *)ctx_p->user.key,
+	ctx_p->user.key_dma_addr = dma_map_single(dev, ctx_p->user.key,
 						  max_key_buf_size,
 						  DMA_TO_DEVICE);
 	if (dma_mapping_error(dev, ctx_p->user.key_dma_addr)) {
@@ -284,7 +284,7 @@ static int cc_cipher_sethkey(struct crypto_skcipher *sktfm, const u8 *key,
 
 	dev_dbg(dev, "Setting HW key in context @%p for %s. keylen=%u\n",
 		ctx_p, crypto_tfm_alg_name(tfm), keylen);
-	dump_byte_array("key", (u8 *)key, keylen);
+	dump_byte_array("key", key, keylen);
 
 	/* STAT_PHASE_0: Init and sanity checks */
 
@@ -387,7 +387,7 @@ static int cc_cipher_setkey(struct crypto_skcipher *sktfm, const u8 *key,
 
 	dev_dbg(dev, "Setting key in context @%p for %s. keylen=%u\n",
 		ctx_p, crypto_tfm_alg_name(tfm), keylen);
-	dump_byte_array("key", (u8 *)key, keylen);
+	dump_byte_array("key", key, keylen);
 
 	/* STAT_PHASE_0: Init and sanity checks */
 
@@ -893,8 +893,8 @@ static int cc_cipher_process(struct skcipher_request *req,
 	}
 
 	/* Setup request structure */
-	cc_req.user_cb = (void *)cc_cipher_complete;
-	cc_req.user_arg = (void *)req;
+	cc_req.user_cb = cc_cipher_complete;
+	cc_req.user_arg = req;
 
 	/* Setup CPP operation details */
 	if (ctx_p->key_type == CC_POLICY_PROTECTED_KEY) {
diff --git a/drivers/crypto/ccree/cc_hash.c b/drivers/crypto/ccree/cc_hash.c
index 912e5ce5079d11ae..36ce015716c317df 100644
--- a/drivers/crypto/ccree/cc_hash.c
+++ b/drivers/crypto/ccree/cc_hash.c
@@ -752,7 +752,7 @@ static int cc_hash_setkey(struct crypto_ahash *ahash, const u8 *key,
 			return -ENOMEM;
 
 		ctx->key_params.key_dma_addr =
-			dma_map_single(dev, (void *)ctx->key_params.key, keylen,
+			dma_map_single(dev, ctx->key_params.key, keylen,
 				       DMA_TO_DEVICE);
 		if (dma_mapping_error(dev, ctx->key_params.key_dma_addr)) {
 			dev_err(dev, "Mapping key va=0x%p len=%u for DMA failed\n",
@@ -1067,8 +1067,8 @@ static int cc_alloc_ctx(struct cc_hash_ctx *ctx)
 	ctx->key_params.keylen = 0;
 
 	ctx->digest_buff_dma_addr =
-		dma_map_single(dev, (void *)ctx->digest_buff,
-			       sizeof(ctx->digest_buff), DMA_BIDIRECTIONAL);
+		dma_map_single(dev, ctx->digest_buff, sizeof(ctx->digest_buff),
+			       DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(dev, ctx->digest_buff_dma_addr)) {
 		dev_err(dev, "Mapping digest len %zu B at va=%pK for DMA failed\n",
 			sizeof(ctx->digest_buff), ctx->digest_buff);
@@ -1079,7 +1079,7 @@ static int cc_alloc_ctx(struct cc_hash_ctx *ctx)
 		&ctx->digest_buff_dma_addr);
 
 	ctx->opad_tmp_keys_dma_addr =
-		dma_map_single(dev, (void *)ctx->opad_tmp_keys_buff,
+		dma_map_single(dev, ctx->opad_tmp_keys_buff,
 			       sizeof(ctx->opad_tmp_keys_buff),
 			       DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(dev, ctx->opad_tmp_keys_dma_addr)) {
@@ -1196,8 +1196,8 @@ static int cc_mac_update(struct ahash_request *req)
 	idx++;
 
 	/* Setup request structure */
-	cc_req.user_cb = (void *)cc_update_complete;
-	cc_req.user_arg = (void *)req;
+	cc_req.user_cb = cc_update_complete;
+	cc_req.user_arg = req;
 
 	rc = cc_send_request(ctx->drvdata, &cc_req, desc, idx, &req->base);
 	if (rc != -EINPROGRESS && rc != -EBUSY) {
@@ -1254,8 +1254,8 @@ static int cc_mac_final(struct ahash_request *req)
 	}
 
 	/* Setup request structure */
-	cc_req.user_cb = (void *)cc_hash_complete;
-	cc_req.user_arg = (void *)req;
+	cc_req.user_cb = cc_hash_complete;
+	cc_req.user_arg = req;
 
 	if (state->xcbc_count && rem_cnt == 0) {
 		/* Load key for ECB decryption */
@@ -1369,8 +1369,8 @@ static int cc_mac_finup(struct ahash_request *req)
 	}
 
 	/* Setup request structure */
-	cc_req.user_cb = (void *)cc_hash_complete;
-	cc_req.user_arg = (void *)req;
+	cc_req.user_cb = cc_hash_complete;
+	cc_req.user_arg = req;
 
 	if (ctx->hw_mode == DRV_CIPHER_XCBC_MAC) {
 		key_len = CC_AES_128_BIT_KEY_SIZE;
@@ -1448,8 +1448,8 @@ static int cc_mac_digest(struct ahash_request *req)
 	}
 
 	/* Setup request structure */
-	cc_req.user_cb = (void *)cc_digest_complete;
-	cc_req.user_arg = (void *)req;
+	cc_req.user_cb = cc_digest_complete;
+	cc_req.user_arg = req;
 
 	if (ctx->hw_mode == DRV_CIPHER_XCBC_MAC) {
 		key_len = CC_AES_128_BIT_KEY_SIZE;
-- 
2.17.1

