Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36FE0581B73
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jul 2022 23:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232529AbiGZVBU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jul 2022 17:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232083AbiGZVBT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 17:01:19 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A3DB2CE2D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jul 2022 14:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=bFbaICsLuFoQMQ
        UFAFQCQdE0ZmTahoCn/h7UBuutveA=; b=epNMzPUNIqriFOdwbNFaMWsVDvRvDq
        TOug/svAaoCfv6J6GyF4Egtog+pQD258OTatEVenAsXMycdbxFfba8GjoLt5q7yh
        Qyvuw/OUC7+LuSMFelQMZWmrEdsBsg5ytjpMkagasbs4813QhVfA4Ho2Lv6BUypn
        BRTfbxbHvljXk=
Received: (qmail 2810287 invoked from network); 26 Jul 2022 23:01:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jul 2022 23:01:16 +0200
X-UD-Smtp-Session: l3s3148p1@i6DimbvkzQRZzIts
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a779f0: Add TMU nodes
Date:   Tue, 26 Jul 2022 23:01:09 +0200
Message-Id: <20220726210110.1444-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726210110.1444-1-wsa+renesas@sang-engineering.com>
References: <20220726210110.1444-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 65 +++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 0c59a93cbaaa..61bd168f51c6 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -334,6 +334,71 @@ tsc: thermal@e6198000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		tmu0: timer@e61e0000 {
+			compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
+			reg = <0 0xe61e0000 0 0x30>;
+			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 713>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 713>;
+			status = "disabled";
+		};
+
+		tmu1: timer@e6fc0000 {
+			compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
+			reg = <0 0xe6fc0000 0 0x30>;
+			interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 714>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 714>;
+			status = "disabled";
+		};
+
+		tmu2: timer@e6fd0000 {
+			compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
+			reg = <0 0xe6fd0000 0 0x30>;
+			interrupts = <GIC_SPI 481 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 715>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 715>;
+			status = "disabled";
+		};
+
+		tmu3: timer@e6fe0000 {
+			compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
+			reg = <0 0xe6fe0000 0 0x30>;
+			interrupts = <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 716>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 716>;
+			status = "disabled";
+		};
+
+		tmu4: timer@ffc00000 {
+			compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
+			reg = <0 0xffc00000 0 0x30>;
+			interrupts = <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 490 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 717>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 717>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@e6500000 {
 			compatible = "renesas,i2c-r8a779f0",
 				     "renesas,rcar-gen4-i2c";
-- 
2.35.1

