Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76FA57E5C11
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Nov 2023 18:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbjKHRML (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Nov 2023 12:12:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232483AbjKHRMJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Nov 2023 12:12:09 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5E0B61BFF
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Nov 2023 09:12:07 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.03,286,1694703600"; 
   d="scan'208";a="182203724"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Nov 2023 02:12:07 +0900
Received: from localhost.localdomain (unknown [10.226.92.247])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5EACB402E68C;
        Thu,  9 Nov 2023 02:12:04 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Michael Walle <michael@walle.cc>,
        Biju Das <biju.das.au@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 3/4] memory: renesas-rpc-if: Add support for overriding IO fixed values
Date:   Wed,  8 Nov 2023 17:11:48 +0000
Message-Id: <20231108171149.258656-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for overriding IO fixed values to control the pin state
based on the flash type.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/memory/renesas-rpc-if.c | 20 ++++++++++++++++++++
 include/memory/renesas-rpc-if.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 9695b2d3ae59..17bc604cdfff 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -325,6 +325,26 @@ static void rpcif_rzg2l_timing_adjust_sdr(struct rpcif_priv *rpc)
 	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000032);
 }
 
+int rpcif_set_iofv(struct device *dev, u32 val)
+{
+	struct rpcif_priv *rpc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	regmap_update_bits(rpc->regmap, RPCIF_CMNCR, RPCIF_CMNCR_IOFV(3),
+			   RPCIF_CMNCR_IO0FV(val & 0x3) |
+			   RPCIF_CMNCR_IO2FV((val >> 4) & 0x3) |
+			   RPCIF_CMNCR_IO3FV((val >> 6) & 0x3));
+
+	pm_runtime_put(dev);
+
+	return 0;
+}
+EXPORT_SYMBOL(rpcif_set_iofv);
+
 int rpcif_hw_init(struct device *dev, bool hyperflash)
 {
 	struct rpcif_priv *rpc = dev_get_drvdata(dev);
diff --git a/include/memory/renesas-rpc-if.h b/include/memory/renesas-rpc-if.h
index b8fa30fd6b50..124ca9c16a39 100644
--- a/include/memory/renesas-rpc-if.h
+++ b/include/memory/renesas-rpc-if.h
@@ -71,6 +71,7 @@ struct rpcif {
 
 int rpcif_sw_init(struct rpcif *rpc, struct device *dev);
 int rpcif_hw_init(struct device *dev, bool hyperflash);
+int rpcif_set_iofv(struct device *dev, u32 val);
 void rpcif_prepare(struct device *dev, const struct rpcif_op *op, u64 *offs,
 		   size_t *len);
 int rpcif_manual_xfer(struct device *dev);
-- 
2.25.1

