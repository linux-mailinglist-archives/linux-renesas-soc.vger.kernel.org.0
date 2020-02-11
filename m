Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D836C159897
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731293AbgBKS1H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:27:07 -0500
Received: from leibniz.telenet-ops.be ([195.130.137.77]:35844 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728548AbgBKS0y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:26:54 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 48H9z66VTZzMtgr4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2020 19:19:30 +0100 (CET)
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id 1WKV2200M5USYZQ06WKWPC; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0002pO-I2; Tue, 11 Feb 2020 19:19:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0003zf-Gd; Tue, 11 Feb 2020 19:19:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 33/34] crypto: ccree - use devm_k[mz]alloc() for cipher data
Date:   Tue, 11 Feb 2020 19:19:27 +0100
Message-Id: <20200211181928.15178-34-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As the lifetime of the cipher data matches the lifetime of the driver,
cipher data can be allocated using the managed allocators.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_cipher.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/crypto/ccree/cc_cipher.c b/drivers/crypto/ccree/cc_cipher.c
index 517d78f9931943a3..44dc8e6229062a02 100644
--- a/drivers/crypto/ccree/cc_cipher.c
+++ b/drivers/crypto/ccree/cc_cipher.c
@@ -1634,7 +1634,7 @@ static struct cc_crypto_alg *cc_create_alg(const struct cc_alg_template *tmpl,
 	struct cc_crypto_alg *t_alg;
 	struct skcipher_alg *alg;
 
-	t_alg = kzalloc(sizeof(*t_alg), GFP_KERNEL);
+	t_alg = devm_kzalloc(dev, sizeof(*t_alg), GFP_KERNEL);
 	if (!t_alg)
 		return ERR_PTR(-ENOMEM);
 
@@ -1670,7 +1670,6 @@ int cc_cipher_free(struct cc_drvdata *drvdata)
 	list_for_each_entry_safe(t_alg, n, &drvdata->alg_list, entry) {
 		crypto_unregister_skcipher(&t_alg->skcipher_alg);
 		list_del(&t_alg->entry);
-		kfree(t_alg);
 	}
 	return 0;
 }
@@ -1711,7 +1710,6 @@ int cc_cipher_alloc(struct cc_drvdata *drvdata)
 		if (rc) {
 			dev_err(dev, "%s alg registration failed\n",
 				t_alg->skcipher_alg.base.cra_driver_name);
-			kfree(t_alg);
 			goto fail0;
 		}
 
-- 
2.17.1

