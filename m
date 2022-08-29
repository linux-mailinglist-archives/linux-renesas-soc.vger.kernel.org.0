Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD815A4D18
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 15:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbiH2NKc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 09:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbiH2NKN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 09:10:13 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4418E5D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 06:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=FjhVazHYJvxndLDTPmh6wlXOpgJ
        6IiMQmaTsxG4OtJE=; b=CPf5QPyhWEyrNB0q2yl/AAEKpiKExfwVld4ny5JDD+w
        G0Ek2DlGioznfpDfMiIwaUjojUcGREp2tCfcCWSQHP1QrbWvnbQtGlvG5ev+/y6p
        4SpMh3z9R0F0qt00i0ZZ3BSFUpkXcg2NlN1ov+ZuxVMhNqw0fLgecZ1e7b05aaY4
        =
Received: (qmail 117598 invoked from network); 29 Aug 2022 14:41:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Aug 2022 14:41:41 +0200
X-UD-Smtp-Session: l3s3148p1@D0e3lWDnisUgAwDPXyz6AKlRFcsoQyrD
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Thanh Quan <thanh.quan.xn@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] arm64: dts: renesas: r8a779f0: Add MSIOF nodes
Date:   Mon, 29 Aug 2022 14:41:30 +0200
Message-Id: <20220829124130.2412-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Duc Nguyen <duc.nguyen.ub@renesas.com>

Add MSIOF nodes for R-Car S4-8.

Signed-off-by: Duc Nguyen <duc.nguyen.ub@renesas.com>
[thanh: added DMA]
Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
[wsa: removed mso clock from clocks-property]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* removed 'assigned-clocks'
* dropped patches enabling MSIOF on Spider board
* updated commit message

 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 64 +++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 5aff5a23cf06..f0de5f06b89b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -654,6 +654,70 @@ scif4: serial@e6c40000 {
 			status = "disabled";
 		};
 
+		msiof0: spi@e6e90000 {
+			compatible = "renesas,msiof-r8a779f0",
+				     "renesas,rcar-gen4-msiof";
+			reg = <0 0xe6e90000 0 0x0064>;
+			interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 618>;
+			dmas = <&dmac0 0x41>, <&dmac0 0x40>,
+			       <&dmac1 0x41>, <&dmac1 0x40>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 618>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof1: spi@e6ea0000 {
+			compatible = "renesas,msiof-r8a779f0",
+				     "renesas,rcar-gen4-msiof";
+			reg = <0 0xe6ea0000 0 0x0064>;
+			interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 619>;
+			dmas = <&dmac0 0x43>, <&dmac0 0x42>,
+			       <&dmac1 0x43>, <&dmac1 0x42>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 619>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof2: spi@e6c00000 {
+			compatible = "renesas,msiof-r8a779f0",
+				     "renesas,rcar-gen4-msiof";
+			reg = <0 0xe6c00000 0 0x0064>;
+			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 620>;
+			dmas = <&dmac0 0x45>, <&dmac0 0x44>,
+			       <&dmac1 0x45>, <&dmac1 0x44>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 620>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof3: spi@e6c10000 {
+			compatible = "renesas,msiof-r8a779f0",
+				     "renesas,rcar-gen4-msiof";
+			reg = <0 0xe6c10000 0 0x0064>;
+			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 621>;
+			dmas = <&dmac0 0x47>, <&dmac0 0x46>,
+			       <&dmac1 0x47>, <&dmac1 0x46>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 621>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		dmac0: dma-controller@e7350000 {
 			compatible = "renesas,dmac-r8a779f0",
 				     "renesas,rcar-gen4-dmac";
-- 
2.35.1

