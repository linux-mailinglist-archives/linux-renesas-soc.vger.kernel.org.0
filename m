Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A698714623
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 May 2023 10:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbjE2IKf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 May 2023 04:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231460AbjE2IKe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 May 2023 04:10:34 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 880D8BB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 May 2023 01:10:33 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,200,1681138800"; 
   d="scan'208";a="164773142"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 May 2023 17:10:32 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BEF92400C741;
        Mon, 29 May 2023 17:10:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a779f0: Update clocks of rswitch node
Date:   Mon, 29 May 2023 17:10:28 +0900
Message-Id: <20230529081028.1156577-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To add ACLK into the clocks and clock-names properties of rswitch
node.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 1d5426e6293c..2cb69d2ce956 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -799,7 +799,8 @@ rswitch: ethernet@e6880000 {
 					  "rmac2_mdio",
 					  "rmac0_phy", "rmac1_phy",
 					  "rmac2_phy";
-			clocks = <&cpg CPG_MOD 1505>;
+			clocks = <&cpg CPG_MOD 1505>, <&cpg CPG_CORE R8A779F0_CLK_S0D2_HSC>;
+			clock-names = "fck", "aclk";
 			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
 			resets = <&cpg 1505>;
 			status = "disabled";
-- 
2.25.1

