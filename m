Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9547715982D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbgBKSUR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:20:17 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:59478 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730977AbgBKSTe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:34 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id 1WKW220045USYZQ06WKWaY; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0002ob-1m; Tue, 11 Feb 2020 19:19:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0003z2-0G; Tue, 11 Feb 2020 19:19:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 20/34] crypto: ccree - remove struct buff_mgr_handle
Date:   Tue, 11 Feb 2020 19:19:14 +0100
Message-Id: <20200211181928.15178-21-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The buff_mgr_handle structure contains only a single member, and only
one instance exists.  Simplify the code and reduce memory consumption by
moving this member to struct cc_drvdata.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_buffer_mgr.c | 41 ++++++----------------------
 drivers/crypto/ccree/cc_driver.h     |  2 +-
 2 files changed, 9 insertions(+), 34 deletions(-)

diff --git a/drivers/crypto/ccree/cc_buffer_mgr.c b/drivers/crypto/ccree/cc_buffer_mgr.c
index abf08369f030faa8..f2e782d2be155ee4 100644
--- a/drivers/crypto/ccree/cc_buffer_mgr.c
+++ b/drivers/crypto/ccree/cc_buffer_mgr.c
@@ -19,10 +19,6 @@ enum dma_buffer_type {
 	DMA_BUFF_TYPE = 2,
 };
 
-struct buff_mgr_handle {
-	struct dma_pool *mlli_buffs_pool;
-};
-
 union buffer_array_entry {
 	struct scatterlist *sgl;
 	dma_addr_t buffer_dma;
@@ -402,7 +398,6 @@ int cc_map_cipher_request(struct cc_drvdata *drvdata, void *ctx,
 {
 	struct cipher_req_ctx *req_ctx = (struct cipher_req_ctx *)ctx;
 	struct mlli_params *mlli_params = &req_ctx->mlli_params;
-	struct buff_mgr_handle *buff_mgr = drvdata->buff_mgr_handle;
 	struct device *dev = drvdata_to_dev(drvdata);
 	struct buffer_array sg_data;
 	u32 dummy = 0;
@@ -466,7 +461,7 @@ int cc_map_cipher_request(struct cc_drvdata *drvdata, void *ctx,
 	}
 
 	if (req_ctx->dma_buf_type == CC_DMA_BUF_MLLI) {
-		mlli_params->curr_pool = buff_mgr->mlli_buffs_pool;
+		mlli_params->curr_pool = drvdata->mlli_buffs_pool;
 		rc = cc_generate_mlli(dev, &sg_data, mlli_params, flags);
 		if (rc)
 			goto cipher_exit;
@@ -1007,7 +1002,6 @@ int cc_map_aead_request(struct cc_drvdata *drvdata, struct aead_request *req)
 	struct device *dev = drvdata_to_dev(drvdata);
 	struct buffer_array sg_data;
 	unsigned int authsize = areq_ctx->req_authsize;
-	struct buff_mgr_handle *buff_mgr = drvdata->buff_mgr_handle;
 	int rc = 0;
 	struct crypto_aead *tfm = crypto_aead_reqtfm(req);
 	bool is_gcm4543 = areq_ctx->is_gcm4543;
@@ -1180,7 +1174,7 @@ int cc_map_aead_request(struct cc_drvdata *drvdata, struct aead_request *req)
 	 */
 	if (areq_ctx->assoc_buff_type == CC_DMA_BUF_MLLI ||
 	    areq_ctx->data_buff_type == CC_DMA_BUF_MLLI) {
-		mlli_params->curr_pool = buff_mgr->mlli_buffs_pool;
+		mlli_params->curr_pool = drvdata->mlli_buffs_pool;
 		rc = cc_generate_mlli(dev, &sg_data, mlli_params, flags);
 		if (rc)
 			goto aead_map_failure;
@@ -1208,7 +1202,6 @@ int cc_map_hash_request_final(struct cc_drvdata *drvdata, void *ctx,
 	u32 *curr_buff_cnt = cc_hash_buf_cnt(areq_ctx);
 	struct mlli_params *mlli_params = &areq_ctx->mlli_params;
 	struct buffer_array sg_data;
-	struct buff_mgr_handle *buff_mgr = drvdata->buff_mgr_handle;
 	int rc = 0;
 	u32 dummy = 0;
 	u32 mapped_nents = 0;
@@ -1255,7 +1248,7 @@ int cc_map_hash_request_final(struct cc_drvdata *drvdata, void *ctx,
 
 	/*build mlli */
 	if (areq_ctx->data_dma_buf_type == CC_DMA_BUF_MLLI) {
-		mlli_params->curr_pool = buff_mgr->mlli_buffs_pool;
+		mlli_params->curr_pool = drvdata->mlli_buffs_pool;
 		/* add the src data to the sg_data */
 		cc_add_sg_entry(dev, &sg_data, areq_ctx->in_nents, src, nbytes,
 				0, true, &areq_ctx->mlli_nents);
@@ -1293,7 +1286,6 @@ int cc_map_hash_request_update(struct cc_drvdata *drvdata, void *ctx,
 	unsigned int update_data_len;
 	u32 total_in_len = nbytes + *curr_buff_cnt;
 	struct buffer_array sg_data;
-	struct buff_mgr_handle *buff_mgr = drvdata->buff_mgr_handle;
 	unsigned int swap_index = 0;
 	int rc = 0;
 	u32 dummy = 0;
@@ -1368,7 +1360,7 @@ int cc_map_hash_request_update(struct cc_drvdata *drvdata, void *ctx,
 	}
 
 	if (areq_ctx->data_dma_buf_type == CC_DMA_BUF_MLLI) {
-		mlli_params->curr_pool = buff_mgr->mlli_buffs_pool;
+		mlli_params->curr_pool = drvdata->mlli_buffs_pool;
 		/* add the src data to the sg_data */
 		cc_add_sg_entry(dev, &sg_data, areq_ctx->in_nents, src,
 				(update_data_len - *curr_buff_cnt), 0, true,
@@ -1435,39 +1427,22 @@ void cc_unmap_hash_request(struct device *dev, void *ctx,
 
 int cc_buffer_mgr_init(struct cc_drvdata *drvdata)
 {
-	struct buff_mgr_handle *buff_mgr_handle;
 	struct device *dev = drvdata_to_dev(drvdata);
 
-	buff_mgr_handle = kmalloc(sizeof(*buff_mgr_handle), GFP_KERNEL);
-	if (!buff_mgr_handle)
-		return -ENOMEM;
-
-	drvdata->buff_mgr_handle = buff_mgr_handle;
-
-	buff_mgr_handle->mlli_buffs_pool =
+	drvdata->mlli_buffs_pool =
 		dma_pool_create("dx_single_mlli_tables", dev,
 				MAX_NUM_OF_TOTAL_MLLI_ENTRIES *
 				LLI_ENTRY_BYTE_SIZE,
 				MLLI_TABLE_MIN_ALIGNMENT, 0);
 
-	if (!buff_mgr_handle->mlli_buffs_pool)
-		goto error;
+	if (!drvdata->mlli_buffs_pool)
+		return -ENOMEM;
 
 	return 0;
-
-error:
-	cc_buffer_mgr_fini(drvdata);
-	return -ENOMEM;
 }
 
 int cc_buffer_mgr_fini(struct cc_drvdata *drvdata)
 {
-	struct buff_mgr_handle *buff_mgr_handle = drvdata->buff_mgr_handle;
-
-	if (buff_mgr_handle) {
-		dma_pool_destroy(buff_mgr_handle->mlli_buffs_pool);
-		kfree(drvdata->buff_mgr_handle);
-		drvdata->buff_mgr_handle = NULL;
-	}
+	dma_pool_destroy(drvdata->mlli_buffs_pool);
 	return 0;
 }
diff --git a/drivers/crypto/ccree/cc_driver.h b/drivers/crypto/ccree/cc_driver.h
index 7360b403655c96f7..4895f124d2b83fb1 100644
--- a/drivers/crypto/ccree/cc_driver.h
+++ b/drivers/crypto/ccree/cc_driver.h
@@ -140,7 +140,7 @@ struct cc_drvdata {
 	struct completion hw_queue_avail; /* wait for HW queue availability */
 	struct platform_device *plat_dev;
 	u32 mlli_sram_addr;
-	void *buff_mgr_handle;
+	struct dma_pool *mlli_buffs_pool;
 	void *cipher_handle;
 	void *hash_handle;
 	void *aead_handle;
-- 
2.17.1

