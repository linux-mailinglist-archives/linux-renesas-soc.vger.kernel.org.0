Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5522C5C86
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 20:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405240AbgKZTMI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 14:12:08 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:49537 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2405176AbgKZTMH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 14:12:07 -0500
X-IronPort-AV: E=Sophos;i="5.78,372,1599490800"; 
   d="scan'208";a="64008850"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 27 Nov 2020 04:12:06 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7B26840F8D53;
        Fri, 27 Nov 2020 04:12:04 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/5] memory: renesas-rpc-if: Export symbols as GPL
Date:   Thu, 26 Nov 2020 19:11:46 +0000
Message-Id: <20201126191146.8753-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Renesas RPC-IF driver is licensed under GPL2.0, to be in sync export the
symbols as GPL.

Suggested-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Sergei Shtylyov <sergei.shtylyov@gmail.com>
---
 drivers/memory/renesas-rpc-if.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 8d36e221def1..99633986ffda 100644
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
2.25.1

