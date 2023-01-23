Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 758656773D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 02:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbjAWBfI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 22 Jan 2023 20:35:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjAWBfI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Jan 2023 20:35:08 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A10EC18A8C
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Jan 2023 17:35:06 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,238,1669042800"; 
   d="scan'208";a="147138392"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jan 2023 10:35:06 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0D9284000C7C;
        Mon, 23 Jan 2023 10:35:06 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/5] arm64: dts: renesas: r8a779f0: Revise renesas,ipmmu-main
Date:   Mon, 23 Jan 2023 10:34:44 +0900
Message-Id: <20230123013448.1250991-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123013448.1250991-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230123013448.1250991-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since IMSSTR register was undocumented on the latest datasheet and
dt-bindings of renesas,ipmmu-vmsa was updated about
the renesas,ipmmu-main property, revise the property on each cache
IPMMU node.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index ac294168c867..4f409bb2d953 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -1058,7 +1058,7 @@ ipmmu_rt0: iommu@ee480000 {
 			compatible = "renesas,ipmmu-r8a779f0",
 				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xee480000 0 0x20000>;
-			renesas,ipmmu-main = <&ipmmu_mm 10>;
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
 			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
@@ -1067,7 +1067,7 @@ ipmmu_rt1: iommu@ee4c0000 {
 			compatible = "renesas,ipmmu-r8a779f0",
 				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xee4c0000 0 0x20000>;
-			renesas,ipmmu-main = <&ipmmu_mm 19>;
+			renesas,ipmmu-main = <&ipmmu_mm 1>;
 			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
@@ -1076,7 +1076,7 @@ ipmmu_ds0: iommu@eed00000 {
 			compatible = "renesas,ipmmu-r8a779f0",
 				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xeed00000 0 0x20000>;
-			renesas,ipmmu-main = <&ipmmu_mm 0>;
+			renesas,ipmmu-main = <&ipmmu_mm 2>;
 			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
@@ -1085,7 +1085,7 @@ ipmmu_hc: iommu@eed40000 {
 			compatible = "renesas,ipmmu-r8a779f0",
 				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xeed40000 0 0x20000>;
-			renesas,ipmmu-main = <&ipmmu_mm 2>;
+			renesas,ipmmu-main = <&ipmmu_mm 3>;
 			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
-- 
2.25.1

