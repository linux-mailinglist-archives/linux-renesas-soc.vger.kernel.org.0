Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFFAF15988E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731262AbgBKS04 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:26:56 -0500
Received: from leibniz.telenet-ops.be ([195.130.137.77]:36192 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731300AbgBKS0z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:26:55 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 48H9z71F6jzMtgrf
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2020 19:19:31 +0100 (CET)
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id 1WKV2200E5USYZQ06WKWPt; Tue, 11 Feb 2020 19:19:31 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0002p6-Aw; Tue, 11 Feb 2020 19:19:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0003zN-9Z; Tue, 11 Feb 2020 19:19:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 27/34] crypto: ccree - improve kerneldoc in cc_request_mgr.[ch]
Date:   Tue, 11 Feb 2020 19:19:21 +0100
Message-Id: <20200211181928.15178-28-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Miscellaneous improvements:
  - Start comment blocks with "/**" to enable kerneldoc,
  - Mark parameters using "@" instead of "\param",
  - Fix copied is_dout parameter of cc_send_request(),
  - Add missing function names to kerneldoc headers,
  - Add missing parameter descriptions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_request_mgr.c | 41 ++++++++++++++-------------
 drivers/crypto/ccree/cc_request_mgr.h | 19 ++++++-------
 2 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/crypto/ccree/cc_request_mgr.c b/drivers/crypto/ccree/cc_request_mgr.c
index b2a18122f320b7b2..2b8a9f5a5bd3edee 100644
--- a/drivers/crypto/ccree/cc_request_mgr.c
+++ b/drivers/crypto/ccree/cc_request_mgr.c
@@ -206,12 +206,13 @@ static void enqueue_seq(struct cc_drvdata *drvdata, struct cc_hw_desc seq[],
 	}
 }
 
-/*!
- * Completion will take place if and only if user requested completion
- * by cc_send_sync_request().
+/**
+ * request_mgr_complete() - Completion will take place if and only if user
+ * requested completion by cc_send_sync_request().
  *
- * \param dev
- * \param dx_compl_h The completion event to signal
+ * @dev: Device pointer
+ * @dx_compl_h: The completion event to signal
+ * @dummy: unused error code
  */
 static void request_mgr_complete(struct device *dev, void *dx_compl_h,
 				 int dummy)
@@ -264,15 +265,15 @@ static int cc_queues_status(struct cc_drvdata *drvdata,
 	return -ENOSPC;
 }
 
-/*!
- * Enqueue caller request to crypto hardware.
+/**
+ * cc_do_send_request() - Enqueue caller request to crypto hardware.
  * Need to be called with HW lock held and PM running
  *
- * \param drvdata
- * \param cc_req The request to enqueue
- * \param desc The crypto sequence
- * \param len The crypto sequence length
- * \param add_comp If "true": add an artificial dout DMA to mark completion
+ * @drvdata: Associated device driver context
+ * @cc_req: The request to enqueue
+ * @desc: The crypto sequence
+ * @len: The crypto sequence length
+ * @add_comp: If "true": add an artificial dout DMA to mark completion
  *
  */
 static void cc_do_send_request(struct cc_drvdata *drvdata,
@@ -486,16 +487,18 @@ int cc_send_sync_request(struct cc_drvdata *drvdata,
 	return 0;
 }
 
-/*!
- * Enqueue caller request to crypto hardware during init process.
- * assume this function is not called in middle of a flow,
+/**
+ * send_request_init() - Enqueue caller request to crypto hardware during init
+ * process.
+ * Assume this function is not called in the middle of a flow,
  * since we set QUEUE_LAST_IND flag in the last descriptor.
  *
- * \param drvdata
- * \param desc The crypto sequence
- * \param len The crypto sequence length
+ * @drvdata: Associated device driver context
+ * @desc: The crypto sequence
+ * @len: The crypto sequence length
  *
- * \return int Returns "0" upon success
+ * Return:
+ * Returns "0" upon success
  */
 int send_request_init(struct cc_drvdata *drvdata, struct cc_hw_desc *desc,
 		      unsigned int len)
diff --git a/drivers/crypto/ccree/cc_request_mgr.h b/drivers/crypto/ccree/cc_request_mgr.h
index ff7746aaaf355acd..ae25ca843dceabc9 100644
--- a/drivers/crypto/ccree/cc_request_mgr.h
+++ b/drivers/crypto/ccree/cc_request_mgr.h
@@ -12,18 +12,17 @@
 
 int cc_req_mgr_init(struct cc_drvdata *drvdata);
 
-/*!
- * Enqueue caller request to crypto hardware.
+/**
+ * cc_send_request() - Enqueue caller request to crypto hardware.
  *
- * \param drvdata
- * \param cc_req The request to enqueue
- * \param desc The crypto sequence
- * \param len The crypto sequence length
- * \param is_dout If "true": completion is handled by the caller
- *	  If "false": this function adds a dummy descriptor completion
- *	  and waits upon completion signal.
+ * @drvdata: Associated device driver context
+ * @cc_req: The request to enqueue
+ * @desc: The crypto sequence
+ * @len: The crypto sequence length
+ * @req: Asynchronous crypto request
  *
- * \return int Returns -EINPROGRESS or error
+ * Return:
+ * Returns -EINPROGRESS or error
  */
 int cc_send_request(struct cc_drvdata *drvdata, struct cc_crypto_req *cc_req,
 		    struct cc_hw_desc *desc, unsigned int len,
-- 
2.17.1

