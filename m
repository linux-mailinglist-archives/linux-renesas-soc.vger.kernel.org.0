Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1C272FE720
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jan 2021 11:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbhAUKId (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jan 2021 05:08:33 -0500
Received: from www.zeus03.de ([194.117.254.33]:48420 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728926AbhAUKHb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 05:07:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=ywQpBvgwF6wXCp
        D8kayuPBCjD37i6Tn0qSNwl1dAo2I=; b=ZiGVDISktg9W2DWyyHp075cfAqsZCz
        EF/TE87XgqP+t+LavJRyl3VKJIalAIkF2sKuL8ekZofp9+9vvwZku+oJpesaz5bp
        Epg6IsGbwLZ+voI3GZG8Z3VzWLepSYswkBj8QqoipYDu9Q2Gwzc58Z+uwnFjeLa/
        4R+77vGeio3Zc=
Received: (qmail 1790531 invoked from network); 21 Jan 2021 11:06:28 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 11:06:28 +0100
X-UD-Smtp-Session: l3s3148p1@mjygOWa5tr4gAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Tho Vu <tho.vu.wh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: dts: renesas: r8a779a0: Add Ethernet-AVB support
Date:   Thu, 21 Jan 2021 11:06:17 +0100
Message-Id: <20210121100619.5653-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121100619.5653-1-wsa+renesas@sang-engineering.com>
References: <20210121100619.5653-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Tho Vu <tho.vu.wh@renesas.com>

Define the generic parts of Ethernet-AVB device nodes. Only AVB0 was
tested because it was the only port with a PHY on current hardware.

Signed-off-by: Tho Vu <tho.vu.wh@renesas.com>
[wsa: double checked, rebased, added "internal-delay" properties]
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Change since v1:
* added internal-delay properties

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 282 ++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 1d953a892309..4671a5840ae1 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -372,6 +372,288 @@ i2c6: i2c@e66e8000 {
 			status = "disabled";
 		};
 
+		avb0: ethernet@e6800000 {
+			compatible = "renesas,etheravb-r8a779a0",
+				     "renesas,etheravb-rcar-gen3";
+			reg = <0 0xe6800000 0 0x800>;
+			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15",
+					  "ch16", "ch17", "ch18", "ch19",
+					  "ch20", "ch21", "ch22", "ch23",
+					  "ch24";
+			clocks = <&cpg CPG_MOD 211>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 211>;
+			phy-mode = "rgmii";
+			rx-internal-delay-ps = <0>;
+			tx-internal-delay-ps = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		avb1: ethernet@e6810000 {
+			compatible = "renesas,etheravb-r8a779a0",
+				     "renesas,etheravb-rcar-gen3";
+			reg = <0 0xe6810000 0 0x800>;
+			interrupts = <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15",
+					  "ch16", "ch17", "ch18", "ch19",
+					  "ch20", "ch21", "ch22", "ch23",
+					  "ch24";
+			clocks = <&cpg CPG_MOD 212>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 212>;
+			phy-mode = "rgmii";
+			rx-internal-delay-ps = <0>;
+			tx-internal-delay-ps = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		avb2: ethernet@e6820000 {
+			compatible = "renesas,etheravb-r8a779a0",
+				     "renesas,etheravb-rcar-gen3";
+			reg = <0 0xe6820000 0 0x1000>;
+			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12", "ch13", "ch14", "ch15",
+					"ch16", "ch17", "ch18", "ch19",
+					"ch20", "ch21", "ch22", "ch23",
+					"ch24";
+			clocks = <&cpg CPG_MOD 213>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 213>;
+			phy-mode = "rgmii";
+			rx-internal-delay-ps = <0>;
+			tx-internal-delay-ps = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		avb3: ethernet@e6830000 {
+			compatible = "renesas,etheravb-r8a779a0",
+				     "renesas,etheravb-rcar-gen3";
+			reg = <0 0xe6830000 0 0x1000>;
+			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12", "ch13", "ch14", "ch15",
+					"ch16", "ch17", "ch18", "ch19",
+					"ch20", "ch21", "ch22", "ch23",
+					"ch24";
+			clocks = <&cpg CPG_MOD 214>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 214>;
+			phy-mode = "rgmii";
+			rx-internal-delay-ps = <0>;
+			tx-internal-delay-ps = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		avb4: ethernet@e6840000 {
+			compatible = "renesas,etheravb-r8a779a0",
+				     "renesas,etheravb-rcar-gen3";
+			reg = <0 0xe6840000 0 0x1000>;
+			interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12", "ch13", "ch14", "ch15",
+					"ch16", "ch17", "ch18", "ch19",
+					"ch20", "ch21", "ch22", "ch23",
+					"ch24";
+			clocks = <&cpg CPG_MOD 215>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 215>;
+			phy-mode = "rgmii";
+			rx-internal-delay-ps = <0>;
+			tx-internal-delay-ps = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		avb5: ethernet@e6850000 {
+			compatible = "renesas,etheravb-r8a779a0",
+				     "renesas,etheravb-rcar-gen3";
+			reg = <0 0xe6850000 0 0x1000>;
+			interrupts = <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12", "ch13", "ch14", "ch15",
+					"ch16", "ch17", "ch18", "ch19",
+					"ch20", "ch21", "ch22", "ch23",
+					"ch24";
+			clocks = <&cpg CPG_MOD 216>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 216>;
+			phy-mode = "rgmii";
+			rx-internal-delay-ps = <0>;
+			tx-internal-delay-ps = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		scif0: serial@e6e60000 {
 			compatible = "renesas,scif-r8a779a0",
 				     "renesas,rcar-gen3-scif", "renesas,scif";
-- 
2.29.2

