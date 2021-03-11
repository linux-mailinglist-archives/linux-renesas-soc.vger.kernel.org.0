Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D780D336EE1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 10:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232031AbhCKJ3x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 04:29:53 -0500
Received: from www.zeus03.de ([194.117.254.33]:49106 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232038AbhCKJ3q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 04:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=O40Hz1rT+pmyE8
        blB96w9UucgXedLosqujccSnja3hw=; b=SYswyLLtEOXtZMrIA4h6NtVy3GOwJm
        n2oZzqXkm17r394xmpJc0zJxf8TQyHIcRIUtKd/qSvzX7ahdjuzGsn9NnSbmz8nQ
        NLtlALLmYOmk156unSAkRXxyZN5Hiz/3MW904OC6Q7jaNBnRyYya9yC0CZdC2/vE
        KiUEAbn3n4eVw=
Received: (qmail 4141781 invoked from network); 11 Mar 2021 10:29:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2021 10:29:44 +0100
X-UD-Smtp-Session: l3s3148p1@Mql3bD+9PMwgARa4Rf6LAY0TkMkJSYgM
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Phong Hoang <phong.hoang.wz@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a779a0: Add CMT support
Date:   Thu, 11 Mar 2021 10:29:38 +0100
Message-Id: <20210311092939.3129-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210311092939.3129-1-wsa+renesas@sang-engineering.com>
References: <20210311092939.3129-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Phong Hoang <phong.hoang.wz@renesas.com>

This patch adds CMT{0|1|2|3} device nodes for R-Car V3U (r8a779a0) SoC.

Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
[wsa: rebased, double checked values, corrected sorting]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 70 +++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index b647c8c05f6b..5e4332d85380 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -239,6 +239,76 @@ gpio9: gpio@e6069980 {
 			#interrupt-cells = <2>;
 		};
 
+		cmt0: timer@e60f0000 {
+			compatible = "renesas,r8a779a0-cmt0",
+				     "renesas,rcar-gen3-cmt0";
+			reg = <0 0xe60f0000 0 0x1004>;
+			interrupts = <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 910>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 910>;
+			status = "disabled";
+		};
+
+		cmt1: timer@e6130000 {
+			compatible = "renesas,r8a779a0-cmt1",
+				     "renesas,rcar-gen3-cmt1";
+			reg = <0 0xe6130000 0 0x1004>;
+			interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 911>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 911>;
+			status = "disabled";
+		};
+
+		cmt2: timer@e6140000 {
+			compatible = "renesas,r8a779a0-cmt1",
+				     "renesas,rcar-gen3-cmt1";
+			reg = <0 0xe6140000 0 0x1004>;
+			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 912>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 912>;
+			status = "disabled";
+		};
+
+		cmt3: timer@e6148000 {
+			compatible = "renesas,r8a779a0-cmt1",
+				     "renesas,rcar-gen3-cmt1";
+			reg = <0 0xe6148000 0 0x1004>;
+			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 913>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 913>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a779a0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x4000>;
-- 
2.30.0

