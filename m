Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 601515083CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Apr 2022 10:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352524AbiDTIqE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Apr 2022 04:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354104AbiDTIqB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 04:46:01 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4F3143B3F8;
        Wed, 20 Apr 2022 01:43:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,275,1643641200"; 
   d="scan'208";a="118558002"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Apr 2022 17:42:59 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 112BB401073A;
        Wed, 20 Apr 2022 17:42:59 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 11/15] soc: renesas: rcar-rst: Add support for R-Car V4H
Date:   Wed, 20 Apr 2022 17:42:51 +0900
Message-Id: <20220420084255.375700-12-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for R-Car V4H (R8A779G0) to the R-Car RST driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/soc/renesas/rcar-rst.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index 4d293eb2d8f3..e1c7e91f5a86 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -103,6 +103,7 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
 	/* R-Car Gen4 */
 	{ .compatible = "renesas,r8a779a0-rst", .data = &rcar_rst_gen4 },
 	{ .compatible = "renesas,r8a779f0-rst", .data = &rcar_rst_gen4 },
+	{ .compatible = "renesas,r8a779g0-rst", .data = &rcar_rst_gen4 },
 	{ /* sentinel */ }
 };
 
-- 
2.25.1

