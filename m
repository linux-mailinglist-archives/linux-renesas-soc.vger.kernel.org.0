Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA3A159847
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:21:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731180AbgBKSTd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:19:33 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:44960 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731011AbgBKSTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:33 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id 1WKV2200N5USYZQ01WKV3D; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002nh-D2; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003yD-B9; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 03/34] crypto: ccree - fix retry handling in cc_send_sync_request()
Date:   Tue, 11 Feb 2020 19:18:57 +0100
Message-Id: <20200211181928.15178-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
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
Acked-by: Gilad Ben-Yossef <gilad@benyossef.com>
---
v2:
  - Add Acked-by: Gilad Ben-Yossef <gilad@benyossef.com>,
  - Drop RFC.
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

