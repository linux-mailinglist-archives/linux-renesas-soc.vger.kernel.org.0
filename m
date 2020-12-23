Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEAA2E1FE0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Dec 2020 18:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbgLWRZx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Dec 2020 12:25:53 -0500
Received: from www.zeus03.de ([194.117.254.33]:42336 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725907AbgLWRZw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Dec 2020 12:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=JMgg2+Zkpjwouh
        eSkfPrwdtg/lFBbymSjqafJhZzRlM=; b=mUGBKv8wURxvTwd5AZ0D7kOSu4PzhD
        MLKIk2ikeuTtVGMZRR171cXjMZ3XlLxw6zVEaCjMFgkIOAwGnVvCgC77kHlW7tlZ
        pgazY2phtzERAR9A/QgcwsaNow/1j/W2v7vUnk5+aXK2kqLPDdEXYW4RCoPBJq7O
        RuSSs2m0CmXIk=
Received: (qmail 544662 invoked from network); 23 Dec 2020 18:25:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Dec 2020 18:25:10 +0100
X-UD-Smtp-Session: l3s3148p1@pTwg+SS3zOdUhszw
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: renesas: Add I2C to R8A779A0
Date:   Wed, 23 Dec 2020 18:25:02 +0100
Message-Id: <20201223172505.34736-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201223172505.34736-1-wsa+renesas@sang-engineering.com>
References: <20201223172505.34736-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Add I2C devicetree description to V3U

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
[wsa: rebased and double checked]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 122 ++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 742c04f55f74..177c4e8acc52 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -14,6 +14,16 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -115,6 +125,118 @@ sysc: system-controller@e6180000 {
 			#power-domain-cells = <1>;
 		};
 
+		i2c0: i2c@e6500000 {
+			compatible = "renesas,i2c-r8a779a0",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe6500000 0 0x40>;
+			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 518>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 518>;
+			dmas = <&dmac1 0x91>, <&dmac1 0x90>;
+			dma-names = "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@e6508000 {
+			compatible = "renesas,i2c-r8a779a0",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe6508000 0 0x40>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 519>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 519>;
+			dmas = <&dmac1 0x93>, <&dmac1 0x92>;
+			dma-names = "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@e6510000 {
+			compatible = "renesas,i2c-r8a779a0",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe6510000 0 0x40>;
+			interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 520>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 520>;
+			dmas = <&dmac1 0x95>, <&dmac1 0x94>;
+			dma-names = "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@e66d0000 {
+			compatible = "renesas,i2c-r8a779a0",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe66d0000 0 0x40>;
+			interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 521>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 521>;
+			dmas = <&dmac1 0x97>, <&dmac1 0x96>;
+			dma-names = "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@e66d8000 {
+			compatible = "renesas,i2c-r8a779a0",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe66d8000 0 0x40>;
+			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 522>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 522>;
+			dmas = <&dmac1 0x99>, <&dmac1 0x98>;
+			dma-names = "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@e66e0000 {
+			compatible = "renesas,i2c-r8a779a0",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe66e0000 0 0x40>;
+			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 523>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 523>;
+			dmas = <&dmac1 0x9b>, <&dmac1 0x9a>;
+			dma-names = "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c6: i2c@e66e8000 {
+			compatible = "renesas,i2c-r8a779a0",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe66e8000 0 0x40>;
+			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 524>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 524>;
+			dmas = <&dmac1 0x9d>, <&dmac1 0x9c>;
+			dma-names = "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		scif0: serial@e6e60000 {
 			compatible = "renesas,scif-r8a779a0",
 				     "renesas,rcar-gen3-scif", "renesas,scif";
-- 
2.28.0

