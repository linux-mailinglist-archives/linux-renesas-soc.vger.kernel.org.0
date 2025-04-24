Return-Path: <linux-renesas-soc+bounces-16285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A8EA9A097
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 07:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3031D7AF8E0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 05:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6894F1CAA66;
	Thu, 24 Apr 2025 05:41:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07830139B;
	Thu, 24 Apr 2025 05:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745473274; cv=none; b=HANzTzZk7DpWd1eTLWiNbePKBL7RXdrDA4a6qx7ZhHuaWluvK9eOjKvISplCqDih0ShKRgpMk8t3P4Ze5d1D0mh2JoCVyyxUlgxxgCNN/QAMla86+K/3fQBdUdWm/9Q142718W2/Q928mVKZjRkj/GVPL2Lhqdcw5Sj8JDuqmQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745473274; c=relaxed/simple;
	bh=LmvG7gj0wfxt5G3gBCAilEdhXEYE2ZEDbcO8C/boenA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNtHg/gyqbv+S25nHyM7Kw8D8m/BvR89crnihqFw/kGyCFSJOqhWE7Vt3e1TzU4UnFSdUTU4px77dYC6Fecp+k5bx40R31VeCNZD5Uqk7+gCvOs5LC78txwwq12vBKwJ0Zra4BqFOMmrViuFJvv8S9o7uRebgDbNwJJJP9x7+EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: NHChK+8XSEmGTnBn2rv0Mw==
X-CSE-MsgGUID: qNJUt7qaToGJMEpEeMvLBg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Apr 2025 14:41:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.69])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 318A54160629;
	Thu, 24 Apr 2025 14:41:02 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/4] arm64: dts: renesas: r9a07g054: Add GPT support
Date: Thu, 24 Apr 2025 06:40:45 +0100
Message-ID: <20250424054050.28310-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424054050.28310-1-biju.das.jz@bp.renesas.com>
References: <20250424054050.28310-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add GPT support by adding pwm node to RZ/V2L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 115 +++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 01f59914dd09..669eca74da0a 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -244,6 +244,121 @@ mtu3: timer@10001200 {
 			status = "disabled";
 		};
 
+		gpt: pwm@10048000 {
+			compatible = "renesas,r9a07g054-gpt",
+				     "renesas,rzg2l-gpt";
+			reg = <0 0x10048000 0 0x800>;
+			#pwm-cells = <3>;
+			interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 219 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 220 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 221 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 222 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 223 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 224 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 225 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 226 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 227 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 231 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 232 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 233 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 234 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 235 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 236 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 237 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 238 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 239 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 240 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 244 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 245 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 246 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 247 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 248 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 249 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 251 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 252 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 253 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 257 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 258 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 259 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 260 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 261 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 263 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 272 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 273 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 274 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 275 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 276 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 278 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 279 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 283 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 284 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 285 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 286 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 287 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 288 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 289 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 290 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 292 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 297 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 298 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 299 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 300 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 301 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 302 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 303 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 304 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 305 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 311 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 312 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 313 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 314 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 315 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 316 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 317 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 318 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ccmpa0", "ccmpb0", "cmpc0", "cmpd0",
+					  "cmpe0", "cmpf0", "adtrga0", "adtrgb0",
+					  "ovf0", "unf0",
+					  "ccmpa1", "ccmpb1", "cmpc1", "cmpd1",
+					  "cmpe1", "cmpf1", "adtrga1", "adtrgb1",
+					  "ovf1", "unf1",
+					  "ccmpa2", "ccmpb2", "cmpc2", "cmpd2",
+					  "cmpe2", "cmpf2", "adtrga2", "adtrgb2",
+					  "ovf2", "unf2",
+					  "ccmpa3", "ccmpb3", "cmpc3", "cmpd3",
+					  "cmpe3", "cmpf3", "adtrga3", "adtrgb3",
+					  "ovf3", "unf3",
+					  "ccmpa4", "ccmpb4", "cmpc4", "cmpd4",
+					  "cmpe4", "cmpf4", "adtrga4", "adtrgb4",
+					  "ovf4", "unf4",
+					  "ccmpa5", "ccmpb5", "cmpc5", "cmpd5",
+					  "cmpe5", "cmpf5", "adtrga5", "adtrgb5",
+					  "ovf5", "unf5",
+					  "ccmpa6", "ccmpb6", "cmpc6", "cmpd6",
+					  "cmpe6", "cmpf6", "adtrga6", "adtrgb6",
+					  "ovf6", "unf6",
+					  "ccmpa7", "ccmpb7", "cmpc7", "cmpd7",
+					  "cmpe7", "cmpf7", "adtrga7", "adtrgb7",
+					  "ovf7", "unf7";
+			clocks = <&cpg CPG_MOD R9A07G054_GPT_PCLK>;
+			resets = <&cpg R9A07G054_GPT_RST_C>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		ssi0: ssi@10049c00 {
 			compatible = "renesas,r9a07g054-ssi",
 				     "renesas,rz-ssi";
-- 
2.43.0


