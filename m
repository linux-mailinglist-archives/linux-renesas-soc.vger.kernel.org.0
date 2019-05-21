Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65584257B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 20:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbfEUSqc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 14:46:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:34148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727969AbfEUSqc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 14:46:32 -0400
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 91473217D9;
        Tue, 21 May 2019 18:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558464391;
        bh=c2/Vk86BeZ4DWmvggGGHr/xonfHRq7UPwimX1ebxIYY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KiftFtsOit+ddvqoHrePibxUCR0KdVwQmlajT/K2EZ9wyF09RqWbVCyYqDpd+f7nB
         m5I7W7pCfaTBJhsVY6C0Ll1sDiZ8I9TKFlLLPD9jcf52ALvU1yZQfoqjRdanC/t1vg
         Vb+NUES5/Ua+pI8n8KZ1OlzIpvVus9zWvn5zd38Y=
From:   Eric Biggers <ebiggers@kernel.org>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] crypto: jitterentropy - change back to module_init()
Date:   Tue, 21 May 2019 11:46:22 -0700
Message-Id: <20190521184622.37202-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190521183417.GA121164@gmail.com>
References: <20190521183417.GA121164@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

"jitterentropy_rng" doesn't have any other implementations, nor is it
tested by the crypto self-tests.  So it was unnecessary to change it to
subsys_initcall.  Also it depends on the main clocksource being
initialized, which may happen after subsys_initcall, causing this error:

    jitterentropy: Initialization failed with host not compliant with requirements: 2

Change it back to module_init().

Fixes: c4741b230597 ("crypto: run initcalls for generic implementations earlier")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/jitterentropy-kcapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/jitterentropy-kcapi.c b/crypto/jitterentropy-kcapi.c
index 6ea1a270b8dc2..787dccca37159 100644
--- a/crypto/jitterentropy-kcapi.c
+++ b/crypto/jitterentropy-kcapi.c
@@ -198,7 +198,7 @@ static void __exit jent_mod_exit(void)
 	crypto_unregister_rng(&jent_alg);
 }
 
-subsys_initcall(jent_mod_init);
+module_init(jent_mod_init);
 module_exit(jent_mod_exit);
 
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.21.0.1020.gf2820cf01a-goog

