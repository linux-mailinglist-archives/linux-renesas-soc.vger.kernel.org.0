Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB0E2C2418
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Nov 2020 12:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732765AbgKXL0P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Nov 2020 06:26:15 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:10210 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732749AbgKXL0O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 06:26:14 -0500
X-IronPort-AV: E=Sophos;i="5.78,366,1599490800"; 
   d="scan'208";a="63502457"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Nov 2020 20:26:13 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6B37C4362272;
        Tue, 24 Nov 2020 20:26:11 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/5] memory: renesas-rpc-if: Export symbols as GPL
Date:   Tue, 24 Nov 2020 11:25:50 +0000
Message-Id: <20201124112552.26377-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124112552.26377-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201124112552.26377-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Renesas RPC-IF driver is licensed under GPL2.0, to be in sync export the
symbols as GPL.

Suggested-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/memory/renesas-rpc-if.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index c5b5691503d7..f5cbc762fda7 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -201,7 +201,7 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
 
 	return PTR_ERR_OR_ZERO(rpc->rstc);
 }
-EXPORT_SYMBOL(rpcif_sw_init);
+EXPORT_SYMBOL_GPL(rpcif_sw_init);
 
 void rpcif_hw_init(struct rpcif *rpc, bool hyperflash)
 {
@@ -249,7 +249,7 @@ void rpcif_hw_init(struct rpcif *rpc, bool hyperflash)
 
 	rpc->bus_size = hyperflash ? 2 : 1;
 }
-EXPORT_SYMBOL(rpcif_hw_init);
+EXPORT_SYMBOL_GPL(rpcif_hw_init);
 
 static int wait_msg_xfer_end(struct rpcif *rpc)
 {
@@ -358,7 +358,7 @@ void rpcif_prepare(struct rpcif *rpc, const struct rpcif_op *op, u64 *offs,
 			RPCIF_SMENR_SPIDB(rpcif_bit_size(op->data.buswidth));
 	}
 }
-EXPORT_SYMBOL(rpcif_prepare);
+EXPORT_SYMBOL_GPL(rpcif_prepare);
 
 int rpcif_manual_xfer(struct rpcif *rpc)
 {
@@ -500,7 +500,7 @@ int rpcif_manual_xfer(struct rpcif *rpc)
 	rpcif_hw_init(rpc, rpc->bus_size == 2);
 	goto exit;
 }
-EXPORT_SYMBOL(rpcif_manual_xfer);
+EXPORT_SYMBOL_GPL(rpcif_manual_xfer);
 
 ssize_t rpcif_dirmap_read(struct rpcif *rpc, u64 offs, size_t len, void *buf)
 {
@@ -529,7 +529,7 @@ ssize_t rpcif_dirmap_read(struct rpcif *rpc, u64 offs, size_t len, void *buf)
 
 	return len;
 }
-EXPORT_SYMBOL(rpcif_dirmap_read);
+EXPORT_SYMBOL_GPL(rpcif_dirmap_read);
 
 static int rpcif_probe(struct platform_device *pdev)
 {
-- 
2.17.1

