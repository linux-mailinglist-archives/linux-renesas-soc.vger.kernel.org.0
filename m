Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72322C241A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Nov 2020 12:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732749AbgKXL0Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Nov 2020 06:26:16 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:44147 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732791AbgKXL0Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 06:26:16 -0500
X-IronPort-AV: E=Sophos;i="5.78,366,1599490800"; 
   d="scan'208";a="63718454"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Nov 2020 20:26:15 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D1F074362273;
        Tue, 24 Nov 2020 20:26:13 +0900 (JST)
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
Subject: [PATCH 4/5] memory: renesas-rpc-if: Avoid use of C++ style comments
Date:   Tue, 24 Nov 2020 11:25:51 +0000
Message-Id: <20201124112552.26377-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124112552.26377-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201124112552.26377-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace C++ style comment with C style.

While at it also replace the tab with a space between struct and
struct name.

Suggested-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/memory/renesas-rpc-if.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/memory/renesas-rpc-if.h b/include/memory/renesas-rpc-if.h
index b8c7cc63065f..30ea6bd969b4 100644
--- a/include/memory/renesas-rpc-if.h
+++ b/include/memory/renesas-rpc-if.h
@@ -19,7 +19,7 @@ enum rpcif_data_dir {
 	RPCIF_DATA_OUT,
 };
 
-struct	rpcif_op {
+struct rpcif_op {
 	struct {
 		u8 buswidth;
 		u8 opcode;
@@ -57,7 +57,7 @@ struct	rpcif_op {
 	} data;
 };
 
-struct	rpcif {
+struct rpcif {
 	struct device *dev;
 	void __iomem *dirmap;
 	struct regmap *regmap;
@@ -93,4 +93,4 @@ static inline void rpcif_disable_rpm(struct rpcif *rpc)
 	pm_runtime_put_sync(rpc->dev);
 }
 
-#endif // __RENESAS_RPC_IF_H
+#endif /* __RENESAS_RPC_IF_H */
-- 
2.17.1

