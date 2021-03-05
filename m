Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3AE32ED2C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 15:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbhCEOdk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 09:33:40 -0500
Received: from www.zeus03.de ([194.117.254.33]:42042 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231206AbhCEOdJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 09:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=rGpg/GomB7WF2Z
        kCNldKdYx3ZT4lkgID22jqWSVurPE=; b=YcQSzDkqCjL/xaCbcQONDNMLuyfyn4
        AGn0g2xiN89kCSbRbyyHWpSUbN0l+8LTbM9C+WvNZqY04D6HWQndsJNhUv0gvaGm
        5eXLhVKknbbyNnbsFnrhj7El3xLEJAfKJApKfCDtkt4CkuAAjsai27ZengZPnnHg
        krNpx+nzM468k=
Received: (qmail 2251868 invoked from network); 5 Mar 2021 15:33:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2021 15:33:06 +0100
X-UD-Smtp-Session: l3s3148p1@PCNb9sq8eplN91Vm
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Phong Hoang <phong.hoang.wz@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a779a0: Add TMU support
Date:   Fri,  5 Mar 2021 15:32:58 +0100
Message-Id: <20210305143259.12622-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210305143259.12622-1-wsa+renesas@sang-engineering.com>
References: <20210305143259.12622-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Phong Hoang <phong.hoang.wz@renesas.com>

This patch adds TMU{0|1|2|3|4} device nodes for R-Car V3U (r8a779a0) SoC.

Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
[wsa: rebased, double checked values]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 65 +++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 2762c8b75c4e..5e4332d85380 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -330,6 +330,71 @@ sysc: system-controller@e6180000 {
 			#power-domain-cells = <1>;
 		};
 
+		tmu0: timer@e61e0000 {
+			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
+			reg = <0 0xe61e0000 0 0x30>;
+			interrupts = <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 713>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 713>;
+			status = "disabled";
+		};
+
+		tmu1: timer@e6fc0000 {
+			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
+			reg = <0 0xe6fc0000 0 0x30>;
+			interrupts = <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 714>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 714>;
+			status = "disabled";
+		};
+
+		tmu2: timer@e6fd0000 {
+			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
+			reg = <0 0xe6fd0000 0 0x30>;
+			interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 715>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 715>;
+			status = "disabled";
+		};
+
+		tmu3: timer@e6fe0000 {
+			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
+			reg = <0 0xe6fe0000 0 0x30>;
+			interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 716>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 716>;
+			status = "disabled";
+		};
+
+		tmu4: timer@ffc00000 {
+			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
+			reg = <0 0xffc00000 0 0x30>;
+			interrupts = <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 717>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 717>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@e6500000 {
 			compatible = "renesas,i2c-r8a779a0",
 				     "renesas,rcar-gen3-i2c";
-- 
2.29.2

