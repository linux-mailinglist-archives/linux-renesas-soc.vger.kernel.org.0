Return-Path: <linux-renesas-soc+bounces-17087-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBD8AB6891
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 12:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D6904A5874
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 10:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE61B2749E0;
	Wed, 14 May 2025 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzJUFCFb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BB2270ECC;
	Wed, 14 May 2025 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217744; cv=none; b=GZWqm4sAaWL6QgcAoxa6/d4IHf9IIjp2n6RXJFfMYcEGWdi1ccxVZLKYLJv21+cmw1vMj5QwjlTRcvWYw+VNsCI5i9RYTD8BE0wIvCNkSonQ/BTVIJgHwgYJys+ykGskOZVZNbDXNpfN7/BDnTEaUNE/lcPGe347v38tIfl/VUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217744; c=relaxed/simple;
	bh=OnvOyd4Mi87Ydko7qjEdhFkT+RTTPdCaKAXbNH3txLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fE6G0EAbrz3Z/YCCZjoDAwgsxza+gKwYHYYKDvYhbbGlzTQXMmW5zlWFWv1H8KiiV+VqPPyOeC48XA0l1xleI0ZMuShaHIW4SNRLNrqW3LryG9lTYoGL9wNTp4sHIXSON8LJqfwhLKGeGgBojsYL+wUTuyMHYiIWpMy35Edcr7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzJUFCFb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-441c99459e9so45093625e9.3;
        Wed, 14 May 2025 03:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747217741; x=1747822541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jB1ScLktNmmleinEk4ti0UxJHctXMGkfzJnnRgMVSiM=;
        b=WzJUFCFbwOrJE5dFyNKcW4BW23M7WylYnWaUGlgqyqp8l2wf8IU1x+OK7KCDJwyZxN
         SJHbgKtBiPtI0XJQkzQytdcdEAuUZcKlXT7WSvJMaRseBHNnNxspbw5dkDNjX6CbCRJr
         oSWDCG60l5LuQ5G286DVBJvhQwaQZvn+Kq4zP9uZ4gtaqVhCz+2R+kvHJZXeojw+VECs
         pmMLO40dYSRCdO/kzYL8eBuh60nDr0OBfolf573WiNpGo52ybx6TINCTFh/bVRzEkQ/6
         SLE82i86haPGYZj4K5MdxJ2zrb0rJ5a+Ay4Nkxy1gLnO3CfOiCLIRXfLNXpMt89e0rDa
         wkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747217741; x=1747822541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jB1ScLktNmmleinEk4ti0UxJHctXMGkfzJnnRgMVSiM=;
        b=iGVQeHQIdKnUbmEa4siEddFz4aAjd5OiqHjeU/AUObKJJKoi84fNlzvsPOIUlqKp1O
         7tLgFq9qIe/0pVhsHBXgJ7dFAILsHCOt4/B5l2jkkzqUC1J31XV7oj7bsT5ls/UlECOK
         obHoM6apaumcacymBMpBRVHrmra/2zk4+RXvfdFf3Wa2rmHbQihKrReLEXx3xJlermvx
         h/5j+wTmPYaMqfzAKUKgNhENQWWoB5wxrCVPJiJA264VsUa3y2Jf4/FWdgoDAb1CaK1h
         myZbePTGqNHFIq/wiM86dNSNZhEVWfRGnbRmBKjOAPzj54UduRrQ+GcTEZAAwJz0LPbp
         FTgA==
X-Forwarded-Encrypted: i=1; AJvYcCV8hgxql1K/Hy8Xojv4Fxtu2856vml/+ph+LjzSUhq6Uvl0eiX7XWfXIs6eff8i7MnruHMlnvpbM6YwtM/S3t5BiFA=@vger.kernel.org, AJvYcCX06d5lHmqw2vp53w3QUpiRE5UErzVxD0F8l5MWmPN1iDm0wk6gUUUdsdMB8BChxQzb21qwAGTAcBbqESY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1UVWsk/jAbeg0sraeqhAG2PdWrYYz+yn0UKKsf+PI2+14L01b
	g1LlpMjrarmKp3lBg4zj6OK9GS975cnz3BWIoAsOKHbqK+GNY7yb
X-Gm-Gg: ASbGncvRAPuFbDMIgEOLODbn8Cnzcc4NnLAEwe3U1EPP7loGjjmiyqUNEE6JWWGD1RD
	HuRD9/q82735mELjd8vyi8ZeqNwEwENvXGVvt+RrJV8TMeioilHqIjZ8lNILRMALZzcR/3w13EM
	c5FkBgluQ3FO+ORjf3q0MbRFUjU8boXenIdMp3ZSf8iyFhlZsN1HwAEo/hYeQXtWlj34HlwmYFa
	t82pg9K2dREHLjZQ1J57SJAITqjRnIgWccpZWRkvvwnu+2lw85DlMWCoWeBqGLiszouoCvFCFfm
	coNXOZcU//fSpnDufVbzuGptiOl2LAabbrXOz0X2Zjl0VH4+etc6wfZYiAJ/a5J4R5MlQb7vXWN
	w
X-Google-Smtp-Source: AGHT+IGuNSWFstHbSI5ze4foxSHjnFDglppFbI5HxKEjTNcjpQvONoBGAN2cBakdKBCXSNf5F9DIwA==
X-Received: by 2002:a05:600c:1e89:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-442f210fa5emr29086435e9.17.1747217740629;
        Wed, 14 May 2025 03:15:40 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6140:13af:687a:7a66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm19530249f8f.60.2025.05.14.03.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:15:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 05/10] arm64: dts: renesas: r9a09g056: Add RIIC controllers
Date: Wed, 14 May 2025 11:15:23 +0100
Message-ID: <20250514101528.41663-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the nine RIIC controllers present on the Renesas RZ/V2N (R9A09G056)
SoC to its DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 189 +++++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 564c3d5c6d33..0e168731f7df 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -279,6 +279,195 @@ scif: serial@11c01400 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@14400400 {
+			compatible = "renesas,riic-r9a09g056", "renesas,riic-r9a09g057";
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
+			clocks = <&cpg CPG_MOD 0x94>;
+			resets = <&cpg 0x98>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@14400800 {
+			compatible = "renesas,riic-r9a09g056", "renesas,riic-r9a09g057";
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
+			clocks = <&cpg CPG_MOD 0x95>;
+			resets = <&cpg 0x99>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@14400c00 {
+			compatible = "renesas,riic-r9a09g056", "renesas,riic-r9a09g057";
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
+			clocks = <&cpg CPG_MOD 0x96>;
+			resets = <&cpg 0x9a>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@14401000 {
+			compatible = "renesas,riic-r9a09g056", "renesas,riic-r9a09g057";
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
+			clocks = <&cpg CPG_MOD 0x97>;
+			resets = <&cpg 0x9b>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@14401400 {
+			compatible = "renesas,riic-r9a09g056", "renesas,riic-r9a09g057";
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
+			clocks = <&cpg CPG_MOD 0x98>;
+			resets = <&cpg 0x9c>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@14401800 {
+			compatible = "renesas,riic-r9a09g056", "renesas,riic-r9a09g057";
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
+			clocks = <&cpg CPG_MOD 0x99>;
+			resets = <&cpg 0x9d>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c6: i2c@14401c00 {
+			compatible = "renesas,riic-r9a09g056", "renesas,riic-r9a09g057";
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
+			clocks = <&cpg CPG_MOD 0x9a>;
+			resets = <&cpg 0x9e>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c7: i2c@14402000 {
+			compatible = "renesas,riic-r9a09g056", "renesas,riic-r9a09g057";
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
+			clocks = <&cpg CPG_MOD 0x9b>;
+			resets = <&cpg 0x9f>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c8: i2c@11c01000 {
+			compatible = "renesas,riic-r9a09g056", "renesas,riic-r9a09g057";
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
+			clocks = <&cpg CPG_MOD 0x93>;
+			resets = <&cpg 0xa0>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@14900000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x14900000 0 0x20000>,
-- 
2.49.0


