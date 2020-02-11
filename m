Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D13F159829
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730135AbgBKSTe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:19:34 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:60426 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729980AbgBKSTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:33 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id 1WKV2200K5USYZQ06WKVNN; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002o8-Mc; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003yb-LQ; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 11/34] crypto: ccree - defer larval_digest_addr init until needed
Date:   Tue, 11 Feb 2020 19:19:05 +0100
Message-Id: <20200211181928.15178-12-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

While the larval digest addresses are not always used in
cc_get_plain_hmac_key() and cc_hash_digest(), they are always
calculated.

Defer their calculations to the points where needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_aead.c | 4 +++-
 drivers/crypto/ccree/cc_hash.c | 5 +++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/ccree/cc_aead.c b/drivers/crypto/ccree/cc_aead.c
index db89144ce6c5e974..d1e7e82b9a40f8ff 100644
--- a/drivers/crypto/ccree/cc_aead.c
+++ b/drivers/crypto/ccree/cc_aead.c
@@ -417,7 +417,7 @@ static int cc_get_plain_hmac_key(struct crypto_aead *tfm, const u8 *authkey,
 	dma_addr_t key_dma_addr = 0;
 	struct cc_aead_ctx *ctx = crypto_aead_ctx(tfm);
 	struct device *dev = drvdata_to_dev(ctx->drvdata);
-	u32 larval_addr = cc_larval_digest_addr(ctx->drvdata, ctx->auth_mode);
+	u32 larval_addr;
 	struct cc_crypto_req cc_req = {};
 	unsigned int blocksize;
 	unsigned int digestsize;
@@ -459,6 +459,8 @@ static int cc_get_plain_hmac_key(struct crypto_aead *tfm, const u8 *authkey,
 			/* Load hash initial state */
 			hw_desc_init(&desc[idx]);
 			set_cipher_mode(&desc[idx], hashmode);
+			larval_addr = cc_larval_digest_addr(ctx->drvdata,
+							    ctx->auth_mode);
 			set_din_sram(&desc[idx], larval_addr, digestsize);
 			set_flow_mode(&desc[idx], S_DIN_to_HASH);
 			set_setup_mode(&desc[idx], SETUP_LOAD_STATE0);
diff --git a/drivers/crypto/ccree/cc_hash.c b/drivers/crypto/ccree/cc_hash.c
index defeb35a16a626ff..cebbe2f08f606bf3 100644
--- a/drivers/crypto/ccree/cc_hash.c
+++ b/drivers/crypto/ccree/cc_hash.c
@@ -429,8 +429,7 @@ static int cc_hash_digest(struct ahash_request *req)
 	bool is_hmac = ctx->is_hmac;
 	struct cc_crypto_req cc_req = {};
 	struct cc_hw_desc desc[CC_MAX_HASH_SEQ_LEN];
-	cc_sram_addr_t larval_digest_addr =
-		cc_larval_digest_addr(ctx->drvdata, ctx->hash_mode);
+	cc_sram_addr_t larval_digest_addr;
 	int idx = 0;
 	int rc = 0;
 	gfp_t flags = cc_gfp_flags(&req->base);
@@ -472,6 +471,8 @@ static int cc_hash_digest(struct ahash_request *req)
 		set_din_type(&desc[idx], DMA_DLLI, state->digest_buff_dma_addr,
 			     ctx->inter_digestsize, NS_BIT);
 	} else {
+		larval_digest_addr = cc_larval_digest_addr(ctx->drvdata,
+							   ctx->hash_mode);
 		set_din_sram(&desc[idx], larval_digest_addr,
 			     ctx->inter_digestsize);
 	}
-- 
2.17.1

