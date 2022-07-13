Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 707035733EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jul 2022 12:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234677AbiGMKPD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jul 2022 06:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234630AbiGMKPC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jul 2022 06:15:02 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962AAE6309
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jul 2022 03:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=46X6R/jkP+nvkO
        38TFaRSw8Vy5EwqgrK7utRwel/tZE=; b=pbt1g1wXUptnByeNgecOOTwM8uxoAa
        ggvSlDVHc8QObEkv46dC8WX46Pv0LtKB6cYq/DtIPCFE+d4o+f0pvb/ERY+HKEBd
        xIRfZokizvGHG/Um1VLqUm1WW4hqSNVS/IOOqRFeZzV+lcQwhDed9GkKoTgqHwXz
        j5cqEDnBYZGyA=
Received: (qmail 126371 invoked from network); 13 Jul 2022 12:14:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jul 2022 12:14:58 +0200
X-UD-Smtp-Session: l3s3148p1@TTmpDq3jJoMgAwDtxwdRAEXXn+yo/Rze
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a779f0: Add CMT support
Date:   Wed, 13 Jul 2022 12:14:46 +0200
Message-Id: <20220713101447.3804-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220713101447.3804-1-wsa+renesas@sang-engineering.com>
References: <20220713101447.3804-1-wsa+renesas@sang-engineering.com>
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

This patch adds CMT{0|1|2|3} device nodes for R-Car S4-8 (r8a779f0) SoC.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 70 +++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 68e4d835c812..af299a520a39 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -136,6 +136,76 @@ gpio3: gpio@e6051980 {
 			#interrupt-cells = <2>;
 		};
 
+		cmt0: timer@e60f0000 {
+			compatible = "renesas,r8a779f0-cmt0",
+				     "renesas,rcar-gen4-cmt0";
+			reg = <0 0xe60f0000 0 0x1004>;
+			interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 910>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 910>;
+			status = "disabled";
+		};
+
+		cmt1: timer@e6130000 {
+			compatible = "renesas,r8a779f0-cmt1",
+				     "renesas,rcar-gen4-cmt1";
+			reg = <0 0xe6130000 0 0x1004>;
+			interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 911>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 911>;
+			status = "disabled";
+		};
+
+		cmt2: timer@e6140000 {
+			compatible = "renesas,r8a779f0-cmt1",
+				     "renesas,rcar-gen4-cmt1";
+			reg = <0 0xe6140000 0 0x1004>;
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 912>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 912>;
+			status = "disabled";
+		};
+
+		cmt3: timer@e6148000 {
+			compatible = "renesas,r8a779f0-cmt1",
+				     "renesas,rcar-gen4-cmt1";
+			reg = <0 0xe6148000 0 0x1004>;
+			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 913>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 913>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a779f0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x4000>;
-- 
2.35.1

