Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D94A753739E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 May 2022 04:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232302AbiE3Cqb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 29 May 2022 22:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232304AbiE3Cqa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 29 May 2022 22:46:30 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4C4D43CA6D
        for <linux-renesas-soc@vger.kernel.org>; Sun, 29 May 2022 19:46:30 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,261,1647270000"; 
   d="scan'208";a="122652000"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 May 2022 11:46:28 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4CFEE4172468;
        Mon, 30 May 2022 11:46:28 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/2] arm64: dts: renesas: r8a779f0: Add iommus in dmac nodes
Date:   Mon, 30 May 2022 11:46:26 +0900
Message-Id: <20220530024626.1870277-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530024626.1870277-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220530024626.1870277-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add iommus propaties in the dmac nodes for r8a779f0.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 512e0b57fd6a..ad8c77edb126 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -306,6 +306,14 @@ dmac0: dma-controller@e7350000 {
 			resets = <&cpg 709>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_ds0 0>, <&ipmmu_ds0 1>,
+				 <&ipmmu_ds0 2>, <&ipmmu_ds0 3>,
+				 <&ipmmu_ds0 4>, <&ipmmu_ds0 5>,
+				 <&ipmmu_ds0 6>, <&ipmmu_ds0 7>,
+				 <&ipmmu_ds0 8>, <&ipmmu_ds0 9>,
+				 <&ipmmu_ds0 10>, <&ipmmu_ds0 11>,
+				 <&ipmmu_ds0 12>, <&ipmmu_ds0 13>,
+				 <&ipmmu_ds0 14>, <&ipmmu_ds0 15>;
 		};
 
 		dmac1: dma-controller@e7351000 {
@@ -341,6 +349,14 @@ dmac1: dma-controller@e7351000 {
 			resets = <&cpg 710>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_ds0 16>, <&ipmmu_ds0 17>,
+				 <&ipmmu_ds0 18>, <&ipmmu_ds0 19>,
+				 <&ipmmu_ds0 20>, <&ipmmu_ds0 21>,
+				 <&ipmmu_ds0 22>, <&ipmmu_ds0 23>,
+				 <&ipmmu_ds0 24>, <&ipmmu_ds0 25>,
+				 <&ipmmu_ds0 26>, <&ipmmu_ds0 27>,
+				 <&ipmmu_ds0 28>, <&ipmmu_ds0 29>,
+				 <&ipmmu_ds0 30>, <&ipmmu_ds0 31>;
 		};
 
 		ipmmu_rt0: iommu@ee480000 {
-- 
2.25.1

