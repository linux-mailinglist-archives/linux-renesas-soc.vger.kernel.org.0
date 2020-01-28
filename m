Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1925E14C0A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2020 20:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgA1TJT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Jan 2020 14:09:19 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:42532 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgA1TJT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Jan 2020 14:09:19 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id vv9G2100D5USYZQ06v9G3A; Tue, 28 Jan 2020 20:09:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iwWEe-0008Ot-3V; Tue, 28 Jan 2020 20:09:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iwWEe-000616-1A; Tue, 28 Jan 2020 20:09:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [RFC] crypto: ccree - fix retry handling in cc_send_sync_request()
Date:   Tue, 28 Jan 2020 20:09:13 +0100
Message-Id: <20200128190913.23086-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If cc_queues_status() indicates that the queue is full,
cc_send_sync_request() should loop and retry.

However, cc_queues_status() returns either 0 (for success), or -ENOSPC
(for queue full), while cc_send_sync_request() checks for real errors by
comparing with -EAGAIN.  Hence -ENOSPC is always considered a real
error, and the code never retries the operation.

Fix this by just removing the check, as cc_queues_status() never returns
any other error value than -ENOSPC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I am not 100% sure what was intended originally.
Perhaps the second -ENOSPC error in cc_queues_status() should have been
-EAGAIN?
---
 drivers/crypto/ccree/cc_request_mgr.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/crypto/ccree/cc_request_mgr.c b/drivers/crypto/ccree/cc_request_mgr.c
index 9d61e6f1247819e2..b2a18122f320b7b2 100644
--- a/drivers/crypto/ccree/cc_request_mgr.c
+++ b/drivers/crypto/ccree/cc_request_mgr.c
@@ -476,10 +476,6 @@ int cc_send_sync_request(struct cc_drvdata *drvdata,
 			break;
 
 		spin_unlock_bh(&mgr->hw_lock);
-		if (rc != -EAGAIN) {
-			cc_pm_put_suspend(dev);
-			return rc;
-		}
 		wait_for_completion_interruptible(&drvdata->hw_queue_avail);
 		reinit_completion(&drvdata->hw_queue_avail);
 	}
-- 
2.17.1

