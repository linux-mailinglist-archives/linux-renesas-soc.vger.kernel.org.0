Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95FBB15982F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729294AbgBKSUS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:20:18 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:60496 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730203AbgBKSTe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:34 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id 1WKV2200E5USYZQ06WKWPA; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0002pM-Gw; Tue, 11 Feb 2020 19:19:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0003zc-Fi; Tue, 11 Feb 2020 19:19:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 32/34] crypto: ccree - use devm_k[mz]alloc() for AEAD data
Date:   Tue, 11 Feb 2020 19:19:26 +0100
Message-Id: <20200211181928.15178-33-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As the lifetime of the AEAD data matches the lifetime of the driver,
AEAD data can be allocated using the managed allocators.
While at it, simplify cc_aead_free() by removing an unneeded cast, and
an unneeded check (aead_handle is always valid here).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_aead.c   | 35 ++++++++++++--------------------
 drivers/crypto/ccree/cc_cipher.c |  8 ++++----
 drivers/crypto/ccree/cc_hash.c   |  9 ++++----
 3 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/drivers/crypto/ccree/cc_aead.c b/drivers/crypto/ccree/cc_aead.c
index be26aaf75e1fe9ea..904aa66752b3bdf4 100644
--- a/drivers/crypto/ccree/cc_aead.c
+++ b/drivers/crypto/ccree/cc_aead.c
@@ -2615,7 +2615,7 @@ static struct cc_crypto_alg *cc_create_aead_alg(struct cc_alg_template *tmpl,
 	struct cc_crypto_alg *t_alg;
 	struct aead_alg *alg;
 
-	t_alg = kzalloc(sizeof(*t_alg), GFP_KERNEL);
+	t_alg = devm_kzalloc(dev, sizeof(*t_alg), GFP_KERNEL);
 	if (!t_alg)
 		return ERR_PTR(-ENOMEM);
 
@@ -2645,19 +2645,12 @@ static struct cc_crypto_alg *cc_create_aead_alg(struct cc_alg_template *tmpl,
 int cc_aead_free(struct cc_drvdata *drvdata)
 {
 	struct cc_crypto_alg *t_alg, *n;
-	struct cc_aead_handle *aead_handle =
-		(struct cc_aead_handle *)drvdata->aead_handle;
-
-	if (aead_handle) {
-		/* Remove registered algs */
-		list_for_each_entry_safe(t_alg, n, &aead_handle->aead_list,
-					 entry) {
-			crypto_unregister_aead(&t_alg->aead_alg);
-			list_del(&t_alg->entry);
-			kfree(t_alg);
-		}
-		kfree(aead_handle);
-		drvdata->aead_handle = NULL;
+	struct cc_aead_handle *aead_handle = drvdata->aead_handle;
+
+	/* Remove registered algs */
+	list_for_each_entry_safe(t_alg, n, &aead_handle->aead_list, entry) {
+		crypto_unregister_aead(&t_alg->aead_alg);
+		list_del(&t_alg->entry);
 	}
 
 	return 0;
@@ -2671,7 +2664,7 @@ int cc_aead_alloc(struct cc_drvdata *drvdata)
 	int alg;
 	struct device *dev = drvdata_to_dev(drvdata);
 
-	aead_handle = kmalloc(sizeof(*aead_handle), GFP_KERNEL);
+	aead_handle = devm_kmalloc(dev, sizeof(*aead_handle), GFP_KERNEL);
 	if (!aead_handle) {
 		rc = -ENOMEM;
 		goto fail0;
@@ -2706,18 +2699,16 @@ int cc_aead_alloc(struct cc_drvdata *drvdata)
 		if (rc) {
 			dev_err(dev, "%s alg registration failed\n",
 				t_alg->aead_alg.base.cra_driver_name);
-			goto fail2;
-		} else {
-			list_add_tail(&t_alg->entry, &aead_handle->aead_list);
-			dev_dbg(dev, "Registered %s\n",
-				t_alg->aead_alg.base.cra_driver_name);
+			goto fail1;
 		}
+
+		list_add_tail(&t_alg->entry, &aead_handle->aead_list);
+		dev_dbg(dev, "Registered %s\n",
+			t_alg->aead_alg.base.cra_driver_name);
 	}
 
 	return 0;
 
-fail2:
-	kfree(t_alg);
 fail1:
 	cc_aead_free(drvdata);
 fail0:
diff --git a/drivers/crypto/ccree/cc_cipher.c b/drivers/crypto/ccree/cc_cipher.c
index a1430d669a584a85..517d78f9931943a3 100644
--- a/drivers/crypto/ccree/cc_cipher.c
+++ b/drivers/crypto/ccree/cc_cipher.c
@@ -1713,11 +1713,11 @@ int cc_cipher_alloc(struct cc_drvdata *drvdata)
 				t_alg->skcipher_alg.base.cra_driver_name);
 			kfree(t_alg);
 			goto fail0;
-		} else {
-			list_add_tail(&t_alg->entry, &drvdata->alg_list);
-			dev_dbg(dev, "Registered %s\n",
-				t_alg->skcipher_alg.base.cra_driver_name);
 		}
+
+		list_add_tail(&t_alg->entry, &drvdata->alg_list);
+		dev_dbg(dev, "Registered %s\n",
+			t_alg->skcipher_alg.base.cra_driver_name);
 	}
 	return 0;
 
diff --git a/drivers/crypto/ccree/cc_hash.c b/drivers/crypto/ccree/cc_hash.c
index 738f0debee98ebf1..2ca5532c07a2e2f4 100644
--- a/drivers/crypto/ccree/cc_hash.c
+++ b/drivers/crypto/ccree/cc_hash.c
@@ -2024,10 +2024,9 @@ int cc_hash_alloc(struct cc_drvdata *drvdata)
 					driver_hash[alg].driver_name);
 				kfree(t_alg);
 				goto fail;
-			} else {
-				list_add_tail(&t_alg->entry,
-					      &hash_handle->hash_list);
 			}
+
+			list_add_tail(&t_alg->entry, &hash_handle->hash_list);
 		}
 		if (hw_mode == DRV_CIPHER_XCBC_MAC ||
 		    hw_mode == DRV_CIPHER_CMAC)
@@ -2049,9 +2048,9 @@ int cc_hash_alloc(struct cc_drvdata *drvdata)
 				driver_hash[alg].driver_name);
 			kfree(t_alg);
 			goto fail;
-		} else {
-			list_add_tail(&t_alg->entry, &hash_handle->hash_list);
 		}
+
+		list_add_tail(&t_alg->entry, &hash_handle->hash_list);
 	}
 
 	return 0;
-- 
2.17.1

