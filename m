Return-Path: <linux-renesas-soc+bounces-7796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAAD94E30C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 22:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92DDF1F210B7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 20:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B78166F28;
	Sun, 11 Aug 2024 20:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgzXki9Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDE91607A5;
	Sun, 11 Aug 2024 20:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723409419; cv=none; b=Ep0dtpuOPz8r2i/dydJooj/lyKf37cR3hP8XRRL5RHu4Yx20YJfBi1NgTdp6QJhBuRQi5ftr1gmBKTe9wHAG8JRu51wIoW1mEymlcuz4jacKkHttimhjZeIL1bEy+bZXC5fIEak+epe84R7FJ+lcMW7hOaV5m1XRpRGGdU3seZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723409419; c=relaxed/simple;
	bh=5IqtMJonGpOqNI+Ab/wwaIvaEbSl0/FlRu04xsZoA3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KMsFTl7DvO3xsPk/+LknG6uvZcS2k/y+uQwMCNIQyUnoUAntNI8CmYRMYHyE0bQM68K+hWcrP5fcAe+2TCWa+PudE8ZSRpW6dAyElZnCtfq31K1X4rzcLdJiDJYX8mOEXCSwhIAL4bbeKLyw+qWROR5IenIaT6KUowvQaCQk+KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgzXki9Q; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42812945633so28956685e9.0;
        Sun, 11 Aug 2024 13:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723409416; x=1724014216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuKjP44iJu3KgjXFPSFxFGhjrkTL1a9whLpKmp7UVic=;
        b=hgzXki9QqSMUxxVCWCmAXcSQ3Fc1Vbs7lESs3jbAb5RbueMu3HKJM/iL/7NyuH8bUY
         xk6MmmxNSlnG45WQhoBAzfdNZVeJDxB5XSUFJf70R9RuNbf7SrmspV3ZDV6ddOtONPdW
         DQjMslOqaXNQbo6g662ZXqlEtvJy2l8+wOr+bWOiAM4TRz8cNoEuZA+1IvT5BE0TVPaB
         quY3TIN1/Y7Hi5AKKAxB9CrGLXCErJSJe62jJBDiwrljrGMPtSwa/4TOccx+SZKUz3tZ
         s7rB8YsU4P+C9ShgsALsGmUSS/J1P77HHO6KguEr8KwgpHZSJjamEBvEEAHeqKr8KLB7
         Hw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723409416; x=1724014216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PuKjP44iJu3KgjXFPSFxFGhjrkTL1a9whLpKmp7UVic=;
        b=bjmes16d/smWiqTcbOJl2OeZEWSVyjM0Odl6b6diYh4XfldmaS59Z6pCAtInU/MJQh
         GCnklFk4cenEF8CH5OPKHj+SwkhZm34GcpNe46as4mRvb1TQo6jocNw1xndykLyRSmXV
         AHJC0gAoxlsqVhIF8UOjSYP1Ww5treNLCl9amCBRRKhTvp6F+hb0W1nvAEEPRrMR1XyQ
         n4fMYJLdCAVoqE04acY+doQruKVkUHeH96ZqjGQ0lzoBEZsqTIWxMr5qVWMQ3lfZYT3B
         XE3bGjtwz8Evu40GniQ4QwvDra6CqMGKg+BSs8o3Lhp10e4xJbDmGLpnDwuKMa0YFypx
         KOyw==
X-Forwarded-Encrypted: i=1; AJvYcCUh3TkT5CHTU0Q+4kevwLrt8BIftzfAO6VW4zXYErPfIZiflAi8Y0PdpnBwSrqtcoN1ssE7Byn3d9hvcydiRgKy7VjFmxice5DWsoCBGm7NICq5p9gyTYP5PYkuyIWtPcChH4PoGk/Nig==
X-Gm-Message-State: AOJu0YyTJg+gGos/tsu/M/SsXIKNX0UGDgHVNz0l1K10iiEOvbNSlgL4
	il+PukT4xOh/AcTO345MyFn9NxFEMk37zTsALPtmuT3j5wkB/feg
X-Google-Smtp-Source: AGHT+IEBrvSDaNGZ+o8/dvTW7j63XVz2E+/y+SmHf9a4OUBdSY8y2Ul47XkWaNxFBhWQgFhzFmqd4Q==
X-Received: by 2002:a05:600c:5491:b0:426:6353:4b7c with SMTP id 5b1f17b1804b1-429c3a17f05mr53508115e9.8.1723409415801;
        Sun, 11 Aug 2024 13:50:15 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c750f0absm76421845e9.17.2024.08.11.13.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 13:50:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/8] arm64: dts: renesas: r9a09g057: Add RIIC0-RIIC8 nodes
Date: Sun, 11 Aug 2024 21:49:51 +0100
Message-Id: <20240811204955.270231-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add RIIC0-RIIC8 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- New patch
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 198 +++++++++++++++++++++
 1 file changed, 198 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 3d6c3a604ec9..c9e1e21b820d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -141,6 +141,28 @@ ostm1: timer@11801000 {
 			status = "disabled";
 		};
 
+		i2c8: i2c@11c01000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,riic-r9a09g057";
+			reg = <0 0x11c01000 0 0x400>;
+			interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 523 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 522 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD 147>;
+			clock-frequency = <100000>;
+			resets = <&cpg 160>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		scif: serial@11c01400 {
 			compatible = "renesas,scif-r9a09g057";
 			reg = <0 0x11c01400 0 0x400>;
@@ -222,6 +244,182 @@ ostm3: timer@14001000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@14400400 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,riic-r9a09g057";
+			reg = <0 0x14400400 0 0x400>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 507 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 506 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD 148>;
+			clock-frequency = <100000>;
+			resets = <&cpg 152>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@14400800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,riic-r9a09g057";
+			reg = <0 0x14400800 0 0x400>;
+			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 509 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 508 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD 149>;
+			clock-frequency = <100000>;
+			resets = <&cpg 153>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@14400c00 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,riic-r9a09g057";
+			reg = <0 0x14400c00 0 0x400>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 511 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 510 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD 150>;
+			clock-frequency = <100000>;
+			resets = <&cpg 154>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@14401000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,riic-r9a09g057";
+			reg = <0 0x14401000 0 0x400>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 513 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 512 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD 151>;
+			clock-frequency = <100000>;
+			resets = <&cpg 155>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@14401400 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,riic-r9a09g057";
+			reg = <0 0x14401400 0 0x400>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 515 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 514 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD 152>;
+			clock-frequency = <100000>;
+			resets = <&cpg 156>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@14401800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,riic-r9a09g057";
+			reg = <0 0x14401800 0 0x400>;
+			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 517 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 516 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD 153>;
+			clock-frequency = <100000>;
+			resets = <&cpg 157>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		i2c6: i2c@14401c00 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,riic-r9a09g057";
+			reg = <0 0x14401c00 0 0x400>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 519 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 518 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD 154>;
+			clock-frequency = <100000>;
+			resets = <&cpg 158>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		i2c7: i2c@14402000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,riic-r9a09g057";
+			reg = <0 0x14402000 0 0x400>;
+			interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 521 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 520 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD 155>;
+			clock-frequency = <100000>;
+			resets = <&cpg 159>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@14900000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.34.1


