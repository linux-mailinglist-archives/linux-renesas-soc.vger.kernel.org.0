Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDCC4D5D29
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Mar 2022 09:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235031AbiCKIUw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Mar 2022 03:20:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235475AbiCKIUu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Mar 2022 03:20:50 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 477401B8FCE;
        Fri, 11 Mar 2022 00:19:47 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,173,1643641200"; 
   d="scan'208";a="114077949"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Mar 2022 17:19:46 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1B9B5420A724;
        Fri, 11 Mar 2022 17:19:46 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gilad@benyossef.com
Cc:     herbert@gondor.apana.org.au, davem@davemloft.net,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Dung Nguyen <dung.nguyen.zy@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [RFC/PATCH] crypto: ccree - fix a race of enqueue_seq() in send_request_init()
Date:   Fri, 11 Mar 2022 17:19:09 +0900
Message-Id: <20220311081909.1661934-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.4 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        KHOP_HELO_FCRDNS,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Dung Nguyen <dung.nguyen.zy@renesas.com>

When loading ccree.ko, after registering cipher algorithm at
cc_cipher_alloc() and cc_hash_alloc() -> send_request_init() ->
enqueue_seq() has called to pushing descriptor into HW.

On other hand, if another thread have called to encrypt/decrypt
cipher (cc_cipher_encrypt/decrypt) -> cc_send_request() ->
cc_do_send_request() -> enqueue_seq() while send_request_init()
is running, the thread also has called to pushing descriptor into HW.
And then, it's possible to overwrite data.

The cc_do_send_request() locks mgr->hw_lock, but send_request_init()
doesn't lock mgr->hw_lock before enqueue_seq() is called. So,
send_request_init() should lock mgr->hw_lock before enqueue_seq() is
called.

This issue is possible to cause the following way in rare cases:
- CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=n
- insmod ccree.ko & insmod tcrypt.ko

Signed-off-by: Dung Nguyen <dung.nguyen.zy@renesas.com>
[shimoda: revise the subject/description]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 I believe we should fix this race. But, as I wrote the desciption
 above, there is in rare cases. So, I marked this patch as RFC.

 drivers/crypto/ccree/cc_request_mgr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/ccree/cc_request_mgr.c b/drivers/crypto/ccree/cc_request_mgr.c
index 887162df50f9..eef40022258b 100644
--- a/drivers/crypto/ccree/cc_request_mgr.c
+++ b/drivers/crypto/ccree/cc_request_mgr.c
@@ -513,6 +513,7 @@ int send_request_init(struct cc_drvdata *drvdata, struct cc_hw_desc *desc,
 
 	set_queue_last_ind(drvdata, &desc[(len - 1)]);
 
+	spin_lock_bh(&req_mgr_h->hw_lock);
 	/*
 	 * We are about to push command to the HW via the command registers
 	 * that may reference host memory. We need to issue a memory barrier
@@ -520,6 +521,7 @@ int send_request_init(struct cc_drvdata *drvdata, struct cc_hw_desc *desc,
 	 */
 	wmb();
 	enqueue_seq(drvdata, desc, len);
+	spin_unlock_bh(&req_mgr_h->hw_lock);
 
 	/* Update the free slots in HW queue */
 	req_mgr_h->q_free_slots =
-- 
2.25.1

