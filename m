Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFE8B159858
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731364AbgBKSVT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:21:19 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:59438 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731160AbgBKSTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:33 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id 1WKV2200J5USYZQ06WKVaS; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002o2-KQ; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003yV-Ix; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 09/34] crypto: ccree - make mlli_params.mlli_virt_addr void *
Date:   Tue, 11 Feb 2020 19:19:03 +0100
Message-Id: <20200211181928.15178-10-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

mlli_params.mlli_virt_addr is just a buffer of memory.
This allows to drop a cast.

No change in generated code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_buffer_mgr.c | 2 +-
 drivers/crypto/ccree/cc_buffer_mgr.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/ccree/cc_buffer_mgr.c b/drivers/crypto/ccree/cc_buffer_mgr.c
index 1e335abd744024d8..abf08369f030faa8 100644
--- a/drivers/crypto/ccree/cc_buffer_mgr.c
+++ b/drivers/crypto/ccree/cc_buffer_mgr.c
@@ -207,7 +207,7 @@ static int cc_generate_mlli(struct device *dev, struct buffer_array *sg_data,
 		goto build_mlli_exit;
 	}
 	/* Point to start of MLLI */
-	mlli_p = (u32 *)mlli_params->mlli_virt_addr;
+	mlli_p = mlli_params->mlli_virt_addr;
 	/* go over all SG's and link it to one MLLI table */
 	for (i = 0; i < sg_data->num_of_buffers; i++) {
 		union buffer_array_entry *entry = &sg_data->entry[i];
diff --git a/drivers/crypto/ccree/cc_buffer_mgr.h b/drivers/crypto/ccree/cc_buffer_mgr.h
index 827b6cb1236e8a65..250d634902adc634 100644
--- a/drivers/crypto/ccree/cc_buffer_mgr.h
+++ b/drivers/crypto/ccree/cc_buffer_mgr.h
@@ -32,7 +32,7 @@ struct cc_mlli {
 
 struct mlli_params {
 	struct dma_pool *curr_pool;
-	u8 *mlli_virt_addr;
+	void *mlli_virt_addr;
 	dma_addr_t mlli_dma_addr;
 	u32 mlli_len;
 };
-- 
2.17.1

