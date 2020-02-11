Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8356515984F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728907AbgBKSVG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:21:06 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:34354 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730197AbgBKSTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:33 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id 1WKV2200Y5USYZQ01WKVTg; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002oB-Nk; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003ye-MM; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 12/34] crypto: ccree - remove bogus paragraph about freeing SRAM
Date:   Tue, 11 Feb 2020 19:19:06 +0100
Message-Id: <20200211181928.15178-13-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SRAM allocator does not support deallocating memory.
Hence remove all references to freeing SRAM.

Fix grammar while at it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_sram_mgr.c | 3 ---
 drivers/crypto/ccree/cc_sram_mgr.h | 5 +----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/crypto/ccree/cc_sram_mgr.c b/drivers/crypto/ccree/cc_sram_mgr.c
index a3c13b37adce4641..7d0e0db4f8df6e66 100644
--- a/drivers/crypto/ccree/cc_sram_mgr.c
+++ b/drivers/crypto/ccree/cc_sram_mgr.c
@@ -50,9 +50,6 @@ int cc_sram_mgr_init(struct cc_drvdata *drvdata)
 
 /*!
  * Allocated buffer from SRAM pool.
- * Note: Caller is responsible to free the LAST allocated buffer.
- * This function does not taking care of any fragmentation may occur
- * by the order of calls to alloc/free.
  *
  * \param drvdata
  * \param size The requested bytes to allocate
diff --git a/drivers/crypto/ccree/cc_sram_mgr.h b/drivers/crypto/ccree/cc_sram_mgr.h
index 971029b0e2a16c36..3b62dc3bd422a9c2 100644
--- a/drivers/crypto/ccree/cc_sram_mgr.h
+++ b/drivers/crypto/ccree/cc_sram_mgr.h
@@ -30,10 +30,7 @@ typedef u64 cc_sram_addr_t;
 int cc_sram_mgr_init(struct cc_drvdata *drvdata);
 
 /*!
- * Allocated buffer from SRAM pool.
- * Note: Caller is responsible to free the LAST allocated buffer.
- * This function does not taking care of any fragmentation may occur
- * by the order of calls to alloc/free.
+ * Allocate buffer from SRAM pool.
  *
  * \param drvdata
  * \param size The requested bytes to allocate
-- 
2.17.1

