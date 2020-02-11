Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6DA0159809
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729980AbgBKSTe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:19:34 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:45446 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731048AbgBKSTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:33 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id 1WKW220055USYZQ01WKWwQ; Tue, 11 Feb 2020 19:19:31 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0002pS-J0; Tue, 11 Feb 2020 19:19:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0003zi-He; Tue, 11 Feb 2020 19:19:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 34/34] crypto: ccree - use devm_kzalloc() for hash data
Date:   Tue, 11 Feb 2020 19:19:28 +0100
Message-Id: <20200211181928.15178-35-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As the lifetime of the hash data matches the lifetime of the driver,
hash data can be allocated using the managed allocators.
While at it, simplify cc_hash_free() by removing an unneeded check
(hash_handle is always valid here).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_hash.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/ccree/cc_hash.c b/drivers/crypto/ccree/cc_hash.c
index 2ca5532c07a2e2f4..0c32aa2e6801ed7f 100644
--- a/drivers/crypto/ccree/cc_hash.c
+++ b/drivers/crypto/ccree/cc_hash.c
@@ -1828,7 +1828,7 @@ static struct cc_hash_alg *cc_alloc_hash_alg(struct cc_hash_template *template,
 	struct crypto_alg *alg;
 	struct ahash_alg *halg;
 
-	t_crypto_alg = kzalloc(sizeof(*t_crypto_alg), GFP_KERNEL);
+	t_crypto_alg = devm_kzalloc(dev, sizeof(*t_crypto_alg), GFP_KERNEL);
 	if (!t_crypto_alg)
 		return ERR_PTR(-ENOMEM);
 
@@ -1961,7 +1961,7 @@ int cc_hash_alloc(struct cc_drvdata *drvdata)
 	int rc = 0;
 	int alg;
 
-	hash_handle = kzalloc(sizeof(*hash_handle), GFP_KERNEL);
+	hash_handle = devm_kzalloc(dev, sizeof(*hash_handle), GFP_KERNEL);
 	if (!hash_handle)
 		return -ENOMEM;
 
@@ -2022,7 +2022,6 @@ int cc_hash_alloc(struct cc_drvdata *drvdata)
 			if (rc) {
 				dev_err(dev, "%s alg registration failed\n",
 					driver_hash[alg].driver_name);
-				kfree(t_alg);
 				goto fail;
 			}
 
@@ -2046,7 +2045,6 @@ int cc_hash_alloc(struct cc_drvdata *drvdata)
 		if (rc) {
 			dev_err(dev, "%s alg registration failed\n",
 				driver_hash[alg].driver_name);
-			kfree(t_alg);
 			goto fail;
 		}
 
@@ -2056,8 +2054,7 @@ int cc_hash_alloc(struct cc_drvdata *drvdata)
 	return 0;
 
 fail:
-	kfree(drvdata->hash_handle);
-	drvdata->hash_handle = NULL;
+	cc_hash_free(drvdata);
 	return rc;
 }
 
@@ -2066,17 +2063,12 @@ int cc_hash_free(struct cc_drvdata *drvdata)
 	struct cc_hash_alg *t_hash_alg, *hash_n;
 	struct cc_hash_handle *hash_handle = drvdata->hash_handle;
 
-	if (hash_handle) {
-		list_for_each_entry_safe(t_hash_alg, hash_n,
-					 &hash_handle->hash_list, entry) {
-			crypto_unregister_ahash(&t_hash_alg->ahash_alg);
-			list_del(&t_hash_alg->entry);
-			kfree(t_hash_alg);
-		}
-
-		kfree(hash_handle);
-		drvdata->hash_handle = NULL;
+	list_for_each_entry_safe(t_hash_alg, hash_n, &hash_handle->hash_list,
+				 entry) {
+		crypto_unregister_ahash(&t_hash_alg->ahash_alg);
+		list_del(&t_hash_alg->entry);
 	}
+
 	return 0;
 }
 
-- 
2.17.1

