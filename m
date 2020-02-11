Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83BDF159851
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731346AbgBKSVL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:21:11 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:45482 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730154AbgBKSTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:33 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id 1WKV2200a5USYZQ01WKWwU; Tue, 11 Feb 2020 19:19:31 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0002of-3F; Tue, 11 Feb 2020 19:19:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0003z5-1I; Tue, 11 Feb 2020 19:19:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 21/34] crypto: ccree - remove struct cc_cipher_handle
Date:   Tue, 11 Feb 2020 19:19:15 +0100
Message-Id: <20200211181928.15178-22-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The cc_cipher_handle structure contains only a single member, and only
one instance exists.  Simplify the code and reduce memory consumption by
moving this member to struct cc_drvdata.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_cipher.c | 33 ++++++++------------------------
 drivers/crypto/ccree/cc_driver.h |  2 +-
 2 files changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/crypto/ccree/cc_cipher.c b/drivers/crypto/ccree/cc_cipher.c
index 1c7ced65008bc311..a1430d669a584a85 100644
--- a/drivers/crypto/ccree/cc_cipher.c
+++ b/drivers/crypto/ccree/cc_cipher.c
@@ -20,10 +20,6 @@
 
 #define template_skcipher	template_u.skcipher
 
-struct cc_cipher_handle {
-	struct list_head alg_list;
-};
-
 struct cc_user_key_info {
 	u8 *key;
 	dma_addr_t key_dma_addr;
@@ -1669,36 +1665,24 @@ static struct cc_crypto_alg *cc_create_alg(const struct cc_alg_template *tmpl,
 int cc_cipher_free(struct cc_drvdata *drvdata)
 {
 	struct cc_crypto_alg *t_alg, *n;
-	struct cc_cipher_handle *cipher_handle = drvdata->cipher_handle;
-
-	if (cipher_handle) {
-		/* Remove registered algs */
-		list_for_each_entry_safe(t_alg, n, &cipher_handle->alg_list,
-					 entry) {
-			crypto_unregister_skcipher(&t_alg->skcipher_alg);
-			list_del(&t_alg->entry);
-			kfree(t_alg);
-		}
-		kfree(cipher_handle);
-		drvdata->cipher_handle = NULL;
+
+	/* Remove registered algs */
+	list_for_each_entry_safe(t_alg, n, &drvdata->alg_list, entry) {
+		crypto_unregister_skcipher(&t_alg->skcipher_alg);
+		list_del(&t_alg->entry);
+		kfree(t_alg);
 	}
 	return 0;
 }
 
 int cc_cipher_alloc(struct cc_drvdata *drvdata)
 {
-	struct cc_cipher_handle *cipher_handle;
 	struct cc_crypto_alg *t_alg;
 	struct device *dev = drvdata_to_dev(drvdata);
 	int rc = -ENOMEM;
 	int alg;
 
-	cipher_handle = kmalloc(sizeof(*cipher_handle), GFP_KERNEL);
-	if (!cipher_handle)
-		return -ENOMEM;
-
-	INIT_LIST_HEAD(&cipher_handle->alg_list);
-	drvdata->cipher_handle = cipher_handle;
+	INIT_LIST_HEAD(&drvdata->alg_list);
 
 	/* Linux crypto */
 	dev_dbg(dev, "Number of algorithms = %zu\n",
@@ -1730,8 +1714,7 @@ int cc_cipher_alloc(struct cc_drvdata *drvdata)
 			kfree(t_alg);
 			goto fail0;
 		} else {
-			list_add_tail(&t_alg->entry,
-				      &cipher_handle->alg_list);
+			list_add_tail(&t_alg->entry, &drvdata->alg_list);
 			dev_dbg(dev, "Registered %s\n",
 				t_alg->skcipher_alg.base.cra_driver_name);
 		}
diff --git a/drivers/crypto/ccree/cc_driver.h b/drivers/crypto/ccree/cc_driver.h
index 4895f124d2b83fb1..4790eb5cb8bdac3c 100644
--- a/drivers/crypto/ccree/cc_driver.h
+++ b/drivers/crypto/ccree/cc_driver.h
@@ -141,7 +141,7 @@ struct cc_drvdata {
 	struct platform_device *plat_dev;
 	u32 mlli_sram_addr;
 	struct dma_pool *mlli_buffs_pool;
-	void *cipher_handle;
+	struct list_head alg_list;
 	void *hash_handle;
 	void *aead_handle;
 	void *request_mgr_handle;
-- 
2.17.1

