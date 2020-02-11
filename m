Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACB8159816
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729087AbgBKSTq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:19:46 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:60432 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730250AbgBKSTf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:35 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id 1WKV2200M5USYZQ06WKVNP; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002oF-PY; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003yh-NM; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 13/34] crypto: ccree - use u32 for SRAM addresses
Date:   Tue, 11 Feb 2020 19:19:07 +0100
Message-Id: <20200211181928.15178-14-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SRAM addresses are small integer offsets into local SRAM.  Currently
they are stored using a mixture of cc_sram_addr_t (u64), u32, and
dma_addr_t types.

Settle on u32, and remove the cc_sram_addr_t typedefs.
This allows to drop several casts.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_aead.c          |  6 +++---
 drivers/crypto/ccree/cc_buffer_mgr.h    |  2 +-
 drivers/crypto/ccree/cc_cipher.c        | 10 +++++-----
 drivers/crypto/ccree/cc_driver.h        |  2 +-
 drivers/crypto/ccree/cc_hash.c          | 21 ++++++++++-----------
 drivers/crypto/ccree/cc_hash.h          |  5 ++---
 drivers/crypto/ccree/cc_hw_queue_defs.h | 10 ++++------
 drivers/crypto/ccree/cc_sram_mgr.c      | 24 ++++++++++--------------
 drivers/crypto/ccree/cc_sram_mgr.h      | 15 ++++-----------
 9 files changed, 40 insertions(+), 55 deletions(-)

diff --git a/drivers/crypto/ccree/cc_aead.c b/drivers/crypto/ccree/cc_aead.c
index d1e7e82b9a40f8ff..78afa753b44f2dba 100644
--- a/drivers/crypto/ccree/cc_aead.c
+++ b/drivers/crypto/ccree/cc_aead.c
@@ -26,7 +26,7 @@
 #define MAX_NONCE_SIZE CTR_RFC3686_NONCE_SIZE
 
 struct cc_aead_handle {
-	cc_sram_addr_t sram_workspace_addr;
+	u32 sram_workspace_addr;
 	struct list_head aead_list;
 };
 
@@ -797,7 +797,7 @@ static void cc_proc_authen_desc(struct aead_request *areq,
 		 * assoc. + iv + data -compact in one table
 		 * if assoclen is ZERO only IV perform
 		 */
-		cc_sram_addr_t mlli_addr = areq_ctx->assoc.sram_addr;
+		u32 mlli_addr = areq_ctx->assoc.sram_addr;
 		u32 mlli_nents = areq_ctx->assoc.mlli_nents;
 
 		if (areq_ctx->is_single_pass) {
@@ -1171,7 +1171,7 @@ static void cc_mlli_to_sram(struct aead_request *req,
 	    req_ctx->data_buff_type == CC_DMA_BUF_MLLI ||
 	    !req_ctx->is_single_pass) && req_ctx->mlli_params.mlli_len) {
 		dev_dbg(dev, "Copy-to-sram: mlli_dma=%08x, mlli_size=%u\n",
-			(unsigned int)ctx->drvdata->mlli_sram_addr,
+			ctx->drvdata->mlli_sram_addr,
 			req_ctx->mlli_params.mlli_len);
 		/* Copy MLLI table host-to-sram */
 		hw_desc_init(&desc[*seq_size]);
diff --git a/drivers/crypto/ccree/cc_buffer_mgr.h b/drivers/crypto/ccree/cc_buffer_mgr.h
index 250d634902adc634..653441b6542e1fb1 100644
--- a/drivers/crypto/ccree/cc_buffer_mgr.h
+++ b/drivers/crypto/ccree/cc_buffer_mgr.h
@@ -24,7 +24,7 @@ enum cc_sg_cpy_direct {
 };
 
 struct cc_mlli {
-	cc_sram_addr_t sram_addr;
+	u32 sram_addr;
 	unsigned int mapped_nents;
 	unsigned int nents; //sg nents
 	unsigned int mlli_nents; //mlli nents might be different than the above
diff --git a/drivers/crypto/ccree/cc_cipher.c b/drivers/crypto/ccree/cc_cipher.c
index 91d2edee47b8c843..1c7ced65008bc311 100644
--- a/drivers/crypto/ccree/cc_cipher.c
+++ b/drivers/crypto/ccree/cc_cipher.c
@@ -753,7 +753,7 @@ static void cc_setup_mlli_desc(struct crypto_tfm *tfm,
 		dev_dbg(dev, " bypass params addr %pad length 0x%X addr 0x%08X\n",
 			&req_ctx->mlli_params.mlli_dma_addr,
 			req_ctx->mlli_params.mlli_len,
-			(unsigned int)ctx_p->drvdata->mlli_sram_addr);
+			ctx_p->drvdata->mlli_sram_addr);
 		hw_desc_init(&desc[*seq_size]);
 		set_din_type(&desc[*seq_size], DMA_DLLI,
 			     req_ctx->mlli_params.mlli_dma_addr,
@@ -801,16 +801,16 @@ static void cc_setup_flow_desc(struct crypto_tfm *tfm,
 			     req_ctx->in_mlli_nents, NS_BIT);
 		if (req_ctx->out_nents == 0) {
 			dev_dbg(dev, " din/dout params addr 0x%08X addr 0x%08X\n",
-				(unsigned int)ctx_p->drvdata->mlli_sram_addr,
-				(unsigned int)ctx_p->drvdata->mlli_sram_addr);
+				ctx_p->drvdata->mlli_sram_addr,
+				ctx_p->drvdata->mlli_sram_addr);
 			set_dout_mlli(&desc[*seq_size],
 				      ctx_p->drvdata->mlli_sram_addr,
 				      req_ctx->in_mlli_nents, NS_BIT,
 				      (!last_desc ? 0 : 1));
 		} else {
 			dev_dbg(dev, " din/dout params addr 0x%08X addr 0x%08X\n",
-				(unsigned int)ctx_p->drvdata->mlli_sram_addr,
-				(unsigned int)ctx_p->drvdata->mlli_sram_addr +
+				ctx_p->drvdata->mlli_sram_addr,
+				ctx_p->drvdata->mlli_sram_addr +
 				(u32)LLI_ENTRY_BYTE_SIZE * req_ctx->in_nents);
 			set_dout_mlli(&desc[*seq_size],
 				      (ctx_p->drvdata->mlli_sram_addr +
diff --git a/drivers/crypto/ccree/cc_driver.h b/drivers/crypto/ccree/cc_driver.h
index b983e721f2f758fe..d7928b164a3b57e5 100644
--- a/drivers/crypto/ccree/cc_driver.h
+++ b/drivers/crypto/ccree/cc_driver.h
@@ -139,7 +139,7 @@ struct cc_drvdata {
 	int irq;
 	struct completion hw_queue_avail; /* wait for HW queue availability */
 	struct platform_device *plat_dev;
-	cc_sram_addr_t mlli_sram_addr;
+	u32 mlli_sram_addr;
 	void *buff_mgr_handle;
 	void *cipher_handle;
 	void *hash_handle;
diff --git a/drivers/crypto/ccree/cc_hash.c b/drivers/crypto/ccree/cc_hash.c
index cebbe2f08f606bf3..0b179aafd484738b 100644
--- a/drivers/crypto/ccree/cc_hash.c
+++ b/drivers/crypto/ccree/cc_hash.c
@@ -20,8 +20,8 @@
 #define CC_SM3_HASH_LEN_SIZE 8
 
 struct cc_hash_handle {
-	cc_sram_addr_t digest_len_sram_addr; /* const value in SRAM*/
-	cc_sram_addr_t larval_digest_sram_addr;   /* const value in SRAM */
+	u32 digest_len_sram_addr;	/* const value in SRAM*/
+	u32 larval_digest_sram_addr;   /* const value in SRAM */
 	struct list_head hash_list;
 };
 
@@ -429,7 +429,7 @@ static int cc_hash_digest(struct ahash_request *req)
 	bool is_hmac = ctx->is_hmac;
 	struct cc_crypto_req cc_req = {};
 	struct cc_hw_desc desc[CC_MAX_HASH_SEQ_LEN];
-	cc_sram_addr_t larval_digest_addr;
+	u32 larval_digest_addr;
 	int idx = 0;
 	int rc = 0;
 	gfp_t flags = cc_gfp_flags(&req->base);
@@ -734,7 +734,7 @@ static int cc_hash_setkey(struct crypto_ahash *ahash, const u8 *key,
 	int digestsize = 0;
 	int i, idx = 0, rc = 0;
 	struct cc_hw_desc desc[CC_MAX_HASH_SEQ_LEN];
-	cc_sram_addr_t larval_addr;
+	u32 larval_addr;
 	struct device *dev;
 
 	ctx = crypto_ahash_ctx(ahash);
@@ -1868,7 +1868,7 @@ static struct cc_hash_alg *cc_alloc_hash_alg(struct cc_hash_template *template,
 int cc_init_hash_sram(struct cc_drvdata *drvdata)
 {
 	struct cc_hash_handle *hash_handle = drvdata->hash_handle;
-	cc_sram_addr_t sram_buff_ofs = hash_handle->digest_len_sram_addr;
+	u32 sram_buff_ofs = hash_handle->digest_len_sram_addr;
 	unsigned int larval_seq_len = 0;
 	struct cc_hw_desc larval_seq[CC_DIGEST_SIZE_MAX / sizeof(u32)];
 	bool large_sha_supported = (drvdata->hw_rev >= CC_HW_REV_712);
@@ -1974,7 +1974,7 @@ int cc_init_hash_sram(struct cc_drvdata *drvdata)
 int cc_hash_alloc(struct cc_drvdata *drvdata)
 {
 	struct cc_hash_handle *hash_handle;
-	cc_sram_addr_t sram_buff;
+	u32 sram_buff;
 	u32 sram_size_to_alloc;
 	struct device *dev = drvdata_to_dev(drvdata);
 	int rc = 0;
@@ -2266,13 +2266,13 @@ static const void *cc_larval_digest(struct device *dev, u32 mode)
  *
  * \return u32 The address of the initial digest in SRAM
  */
-cc_sram_addr_t cc_larval_digest_addr(void *drvdata, u32 mode)
+u32 cc_larval_digest_addr(void *drvdata, u32 mode)
 {
 	struct cc_drvdata *_drvdata = (struct cc_drvdata *)drvdata;
 	struct cc_hash_handle *hash_handle = _drvdata->hash_handle;
 	struct device *dev = drvdata_to_dev(_drvdata);
 	bool sm3_supported = (_drvdata->hw_rev >= CC_HW_REV_713);
-	cc_sram_addr_t addr;
+	u32 addr;
 
 	switch (mode) {
 	case DRV_HASH_NULL:
@@ -2324,12 +2324,11 @@ cc_sram_addr_t cc_larval_digest_addr(void *drvdata, u32 mode)
 	return hash_handle->larval_digest_sram_addr;
 }
 
-cc_sram_addr_t
-cc_digest_len_addr(void *drvdata, u32 mode)
+u32 cc_digest_len_addr(void *drvdata, u32 mode)
 {
 	struct cc_drvdata *_drvdata = (struct cc_drvdata *)drvdata;
 	struct cc_hash_handle *hash_handle = _drvdata->hash_handle;
-	cc_sram_addr_t digest_len_addr = hash_handle->digest_len_sram_addr;
+	u32 digest_len_addr = hash_handle->digest_len_sram_addr;
 
 	switch (mode) {
 	case DRV_HASH_SHA1:
diff --git a/drivers/crypto/ccree/cc_hash.h b/drivers/crypto/ccree/cc_hash.h
index 3dbd0abefea0546c..d76ecae996ca3fa0 100644
--- a/drivers/crypto/ccree/cc_hash.h
+++ b/drivers/crypto/ccree/cc_hash.h
@@ -89,8 +89,7 @@ int cc_hash_free(struct cc_drvdata *drvdata);
  *
  * \return u32 returns the address of the initial digest length in SRAM
  */
-cc_sram_addr_t
-cc_digest_len_addr(void *drvdata, u32 mode);
+u32 cc_digest_len_addr(void *drvdata, u32 mode);
 
 /*!
  * Gets the address of the initial digest in SRAM
@@ -102,6 +101,6 @@ cc_digest_len_addr(void *drvdata, u32 mode);
  *
  * \return u32 The address of the initial digest in SRAM
  */
-cc_sram_addr_t cc_larval_digest_addr(void *drvdata, u32 mode);
+u32 cc_larval_digest_addr(void *drvdata, u32 mode);
 
 #endif /*__CC_HASH_H__*/
diff --git a/drivers/crypto/ccree/cc_hw_queue_defs.h b/drivers/crypto/ccree/cc_hw_queue_defs.h
index e3ec2a8084d864cd..36786344c57a92cf 100644
--- a/drivers/crypto/ccree/cc_hw_queue_defs.h
+++ b/drivers/crypto/ccree/cc_hw_queue_defs.h
@@ -290,10 +290,9 @@ static inline void set_cpp_crypto_key(struct cc_hw_desc *pdesc, u8 slot)
  * @addr: DIN address
  * @size Data size in bytes
  */
-static inline void set_din_sram(struct cc_hw_desc *pdesc, dma_addr_t addr,
-				u32 size)
+static inline void set_din_sram(struct cc_hw_desc *pdesc, u32 addr, u32 size)
 {
-	pdesc->word[0] = (u32)addr;
+	pdesc->word[0] = addr;
 	pdesc->word[1] |= FIELD_PREP(WORD1_DIN_SIZE, size) |
 				FIELD_PREP(WORD1_DIN_DMA_MODE, DMA_SRAM);
 }
@@ -373,9 +372,8 @@ static inline void set_dout_dlli(struct cc_hw_desc *pdesc, dma_addr_t addr,
  * @last_ind: The last indication bit
  * @axi_sec: AXI secure bit
  */
-static inline void set_dout_mlli(struct cc_hw_desc *pdesc, dma_addr_t addr,
-				 u32 size, enum cc_axi_sec axi_sec,
-				 bool last_ind)
+static inline void set_dout_mlli(struct cc_hw_desc *pdesc, u32 addr, u32 size,
+				 enum cc_axi_sec axi_sec, bool last_ind)
 {
 	set_dout_type(pdesc, DMA_MLLI, addr, size, axi_sec);
 	pdesc->word[3] |= FIELD_PREP(WORD3_DOUT_LAST_IND, last_ind);
diff --git a/drivers/crypto/ccree/cc_sram_mgr.c b/drivers/crypto/ccree/cc_sram_mgr.c
index 7d0e0db4f8df6e66..d46aad7c8140acaa 100644
--- a/drivers/crypto/ccree/cc_sram_mgr.c
+++ b/drivers/crypto/ccree/cc_sram_mgr.c
@@ -9,7 +9,7 @@
  * @sram_free_offset:   the offset to the non-allocated area
  */
 struct cc_sram_ctx {
-	cc_sram_addr_t sram_free_offset;
+	u32 sram_free_offset;
 };
 
 /**
@@ -22,23 +22,20 @@ struct cc_sram_ctx {
 int cc_sram_mgr_init(struct cc_drvdata *drvdata)
 {
 	struct cc_sram_ctx *ctx;
-	dma_addr_t start = 0;
+	u32 start = 0;
 	struct device *dev = drvdata_to_dev(drvdata);
 
 	if (drvdata->hw_rev < CC_HW_REV_712) {
 		/* Pool starts after ROM bytes */
-		start = (dma_addr_t)cc_ioread(drvdata,
-					      CC_REG(HOST_SEP_SRAM_THRESHOLD));
-
+		start = cc_ioread(drvdata, CC_REG(HOST_SEP_SRAM_THRESHOLD));
 		if ((start & 0x3) != 0) {
-			dev_err(dev, "Invalid SRAM offset %pad\n", &start);
+			dev_err(dev, "Invalid SRAM offset 0x%x\n", start);
 			return -EINVAL;
 		}
 	}
 
 	/* Allocate "this" context */
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-
 	if (!ctx)
 		return -ENOMEM;
 
@@ -54,11 +51,11 @@ int cc_sram_mgr_init(struct cc_drvdata *drvdata)
  * \param drvdata
  * \param size The requested bytes to allocate
  */
-cc_sram_addr_t cc_sram_alloc(struct cc_drvdata *drvdata, u32 size)
+u32 cc_sram_alloc(struct cc_drvdata *drvdata, u32 size)
 {
 	struct cc_sram_ctx *smgr_ctx = drvdata->sram_mgr_handle;
 	struct device *dev = drvdata_to_dev(drvdata);
-	cc_sram_addr_t p;
+	u32 p;
 
 	if ((size & 0x3)) {
 		dev_err(dev, "Requested buffer size (%u) is not multiple of 4",
@@ -66,14 +63,14 @@ cc_sram_addr_t cc_sram_alloc(struct cc_drvdata *drvdata, u32 size)
 		return NULL_SRAM_ADDR;
 	}
 	if (size > (CC_CC_SRAM_SIZE - smgr_ctx->sram_free_offset)) {
-		dev_err(dev, "Not enough space to allocate %u B (at offset %llu)\n",
+		dev_err(dev, "Not enough space to allocate %u B (at offset %u)\n",
 			size, smgr_ctx->sram_free_offset);
 		return NULL_SRAM_ADDR;
 	}
 
 	p = smgr_ctx->sram_free_offset;
 	smgr_ctx->sram_free_offset += size;
-	dev_dbg(dev, "Allocated %u B @ %u\n", size, (unsigned int)p);
+	dev_dbg(dev, "Allocated %u B @ %u\n", size, p);
 	return p;
 }
 
@@ -88,9 +85,8 @@ cc_sram_addr_t cc_sram_alloc(struct cc_drvdata *drvdata, u32 size)
  * @seq:	  A pointer to the given IN/OUT descriptor sequence
  * @seq_len:	  A pointer to the given IN/OUT sequence length
  */
-void cc_set_sram_desc(const u32 *src, cc_sram_addr_t dst,
-		      unsigned int nelement, struct cc_hw_desc *seq,
-		      unsigned int *seq_len)
+void cc_set_sram_desc(const u32 *src, u32 dst, unsigned int nelement,
+		      struct cc_hw_desc *seq, unsigned int *seq_len)
 {
 	u32 i;
 	unsigned int idx = *seq_len;
diff --git a/drivers/crypto/ccree/cc_sram_mgr.h b/drivers/crypto/ccree/cc_sram_mgr.h
index 3b62dc3bd422a9c2..04a857259d4148eb 100644
--- a/drivers/crypto/ccree/cc_sram_mgr.h
+++ b/drivers/crypto/ccree/cc_sram_mgr.h
@@ -10,13 +10,7 @@
 
 struct cc_drvdata;
 
-/**
- * Address (offset) within CC internal SRAM
- */
-
-typedef u64 cc_sram_addr_t;
-
-#define NULL_SRAM_ADDR ((cc_sram_addr_t)-1)
+#define NULL_SRAM_ADDR ((u32)-1)
 
 /*!
  * Initializes SRAM pool.
@@ -35,7 +29,7 @@ int cc_sram_mgr_init(struct cc_drvdata *drvdata);
  * \param drvdata
  * \param size The requested bytes to allocate
  */
-cc_sram_addr_t cc_sram_alloc(struct cc_drvdata *drvdata, u32 size);
+u32 cc_sram_alloc(struct cc_drvdata *drvdata, u32 size);
 
 /**
  * cc_set_sram_desc() - Create const descriptors sequence to
@@ -48,8 +42,7 @@ cc_sram_addr_t cc_sram_alloc(struct cc_drvdata *drvdata, u32 size);
  * @seq:	  A pointer to the given IN/OUT descriptor sequence
  * @seq_len:	  A pointer to the given IN/OUT sequence length
  */
-void cc_set_sram_desc(const u32 *src, cc_sram_addr_t dst,
-		      unsigned int nelement, struct cc_hw_desc *seq,
-		      unsigned int *seq_len);
+void cc_set_sram_desc(const u32 *src, u32 dst, unsigned int nelement,
+		      struct cc_hw_desc *seq, unsigned int *seq_len);
 
 #endif /*__CC_SRAM_MGR_H__*/
-- 
2.17.1

