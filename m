Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2C02C5C84
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 20:13:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405231AbgKZTME (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 14:12:04 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:49537 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2405176AbgKZTME (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 14:12:04 -0500
X-IronPort-AV: E=Sophos;i="5.78,372,1599490800"; 
   d="scan'208";a="64008847"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 27 Nov 2020 04:12:04 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DCC0040F8D53;
        Fri, 27 Nov 2020 04:12:01 +0900 (JST)
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
Subject: [PATCH v2 4/5] memory: renesas-rpc-if: Make rpcif_enable/disable_rpm() as static inline
Date:   Thu, 26 Nov 2020 19:11:45 +0000
Message-Id: <20201126191146.8753-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Define rpcif_enable_rpm() and rpcif_disable_rpm() as static
inline in the header instead of exporting them.

Suggested-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/memory/renesas-rpc-if.c | 13 -------------
 include/memory/renesas-rpc-if.h | 13 +++++++++++--
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index da0fdb4c7595..8d36e221def1 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -12,7 +12,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
@@ -204,18 +203,6 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
 }
 EXPORT_SYMBOL(rpcif_sw_init);
 
-void rpcif_enable_rpm(struct rpcif *rpc)
-{
-	pm_runtime_enable(rpc->dev);
-}
-EXPORT_SYMBOL(rpcif_enable_rpm);
-
-void rpcif_disable_rpm(struct rpcif *rpc)
-{
-	pm_runtime_disable(rpc->dev);
-}
-EXPORT_SYMBOL(rpcif_disable_rpm);
-
 void rpcif_hw_init(struct rpcif *rpc, bool hyperflash)
 {
 	u32 dummy;
diff --git a/include/memory/renesas-rpc-if.h b/include/memory/renesas-rpc-if.h
index 9ad136682c47..14cfd036268a 100644
--- a/include/memory/renesas-rpc-if.h
+++ b/include/memory/renesas-rpc-if.h
@@ -10,6 +10,7 @@
 #ifndef __RENESAS_RPC_IF_H
 #define __RENESAS_RPC_IF_H
 
+#include <linux/pm_runtime.h>
 #include <linux/types.h>
 
 enum rpcif_data_dir {
@@ -77,11 +78,19 @@ struct	rpcif {
 
 int  rpcif_sw_init(struct rpcif *rpc, struct device *dev);
 void rpcif_hw_init(struct rpcif *rpc, bool hyperflash);
-void rpcif_enable_rpm(struct rpcif *rpc);
-void rpcif_disable_rpm(struct rpcif *rpc);
 void rpcif_prepare(struct rpcif *rpc, const struct rpcif_op *op, u64 *offs,
 		   size_t *len);
 int rpcif_manual_xfer(struct rpcif *rpc);
 ssize_t rpcif_dirmap_read(struct rpcif *rpc, u64 offs, size_t len, void *buf);
 
+static inline void rpcif_enable_rpm(struct rpcif *rpc)
+{
+	pm_runtime_enable(rpc->dev);
+}
+
+static inline void rpcif_disable_rpm(struct rpcif *rpc)
+{
+	pm_runtime_disable(rpc->dev);
+}
+
 #endif // __RENESAS_RPC_IF_H
-- 
2.25.1

