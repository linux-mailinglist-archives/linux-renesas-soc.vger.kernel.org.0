Return-Path: <linux-renesas-soc+bounces-8446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77404962778
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 14:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA88B1F256F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED66D187878;
	Wed, 28 Aug 2024 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKa9MA0o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04423184535;
	Wed, 28 Aug 2024 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848916; cv=none; b=RRX34wKQJXwILZKpHlV+rwKmA8xKs4Tr9VfHuvJWt0i47+U265QhNdteJO31SlXdGYcDZLcB1nMmPiUWq+6tnJAyGa109zInDVaLzCQK6HqlEvBQRX4/MLcaM+EIC4G+CVizuI7wOKK6b64aRyD8kThIzMqv9jyuXQRj5FyAMOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848916; c=relaxed/simple;
	bh=OTYcdAEaoKx4PXRDxW2tRoSwy7eqf+wxGXUq2ZcJ7OM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dBV7XZYvBrSQhZJLpaIeqroYJSvi6SaZ2DkKF7ITA7OTJENkSVTnhl5fD9Ueo9jtjVIvg+3Xl15AWbcTZiaWkPOOIuR7AzFVPaGIXzH8uuPvD3sz621sGSMuQk/Krz3tpR6gLNth4guhXk8mSmf6Rf9JYJIiGh029runQNeiVk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKa9MA0o; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-371bb8322b2so316202f8f.0;
        Wed, 28 Aug 2024 05:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724848913; x=1725453713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xOkGWP2j9zyxNo/L6kzZilhV8vX14pSMglG1vqEnlM=;
        b=fKa9MA0oytbbG01QsPy03NXLRYJOJ20NsKPYSbxg6+SzKHb2v65pKFTCYc3MuOuwaM
         VNm8wfIDXRN8FuJ5+Z5aPOniSI7ogjmCdozH6yrksuLjefKb9FBVEESFzAACXDcP1tZ3
         XG7VSE1TRheex2DRRzRo6QwBu/Bh7YT6ap/uTfyOn8TI52BUgqMCpooYrNIYcG8dO42a
         61h+N0BWJd3bc2jY9aPRwwh40Lh1nuLGbh70u7vNQ/o/8JTwhrZUgfK11BHkcgvnA+WC
         K9HbyjTQONWmuSAjqskWehMPs0rBQxgedARKd7jFe+SJ3AEX/K3ligE84Km8s1+T/nps
         kUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724848913; x=1725453713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xOkGWP2j9zyxNo/L6kzZilhV8vX14pSMglG1vqEnlM=;
        b=NQAUUERcpl57kFQaBb98H+dJMyABG1LaTSA0Gyqfx8ACMZM4RFk1IPnJUWYmvXGi3m
         1Vr81VB2WqZRMv0btidGz6xPRgOf6Kw30KZmUY14VyVw1hknuwaZDk1M5npSz0TalrzY
         I/DBNiGy+xV5nauCCs5coR4Ig/kBYf6Te7FEOJftVyg2K4Q3zFvFqS87sQ0JqRDbsMql
         ICWisOi781eEUziDQ7upr0s5pjPyHI7IW7E2vkamlk8cHJn/pz1MSFwoUsRuPGr6ASXa
         VQmhf50Bq0mMJytl/BBS8fvJJ3vVdm4BGInpFY95iE/Dd/2AyirxvQn1Bo1l3nNhd0hj
         RlbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3WA0KK/kXXJoa1uLxMFf0eMRsUjaxJJecTc0T9BWLzlIyNvqiUQE2jubpJtdWfE5PqhoqmzP4/YxqZ5NS@vger.kernel.org, AJvYcCV9TFYW9BoDPrzuyv8cwOdB5je2dYB5a9mtq5n71WJfgH6jHKPKBDx5iHJq2okE3LrOdpFWho6uV+IG@vger.kernel.org
X-Gm-Message-State: AOJu0YxgLtL9pd4BfTrQaoMXLCgA5vNgkAd8rMVDCQ3F4mJklf/fTfO3
	6iMpKx6vP0/mQzCmbcN1uOsP5z7UMPiZ0DgzxJpbVZ4+UemU6f6uj2Yma8eO1QQ=
X-Google-Smtp-Source: AGHT+IHPvaWCN7n9wVNCR1sw29whkNGKEA/0t1f1g3DxEaPSBgL4425CE3TifDKT3fw4Zr1ilkmJNg==
X-Received: by 2002:a05:6000:1948:b0:371:6fb8:8fe3 with SMTP id ffacd0b85a97d-37495f38afbmr1168001f8f.12.1724848913220;
        Wed, 28 Aug 2024 05:41:53 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813c5edsm15508226f8f.31.2024.08.28.05.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:41:52 -0700 (PDT)
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
Subject: [PATCH v4 5/9] arm64: dts: renesas: r9a09g057: Add RIIC0-RIIC8 nodes
Date: Wed, 28 Aug 2024 13:41:30 +0100
Message-Id: <20240828124134.188864-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v3->v4
- Used hexadecimal values for clocks and resets
- Sorted nodes based on nodes index

v2->v3
- Grouped the I2C nodes
- Dropped clock-frequency
- Updated I2C nodes to match with the coding-style of DTS

v1->v2
- New patch
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 189 +++++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 335a6dd17fce..993c18879007 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -201,6 +201,195 @@ ostm7: timer@12c03000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@14400400 {
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
+			clocks = <&cpg CPG_MOD 0x94>;
+			resets = <&cpg 0x98>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@14400800 {
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
+			clocks = <&cpg CPG_MOD 0x95>;
+			resets = <&cpg 0x99>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@14400c00 {
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
+			clocks = <&cpg CPG_MOD 0x96>;
+			resets = <&cpg 0x9a>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@14401000 {
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
+			clocks = <&cpg CPG_MOD 0x97>;
+			resets = <&cpg 0x9b>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@14401400 {
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
+			clocks = <&cpg CPG_MOD 0x98>;
+			resets = <&cpg 0x9c>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@14401800 {
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
+			clocks = <&cpg CPG_MOD 0x99>;
+			resets = <&cpg 0x9d>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c6: i2c@14401c00 {
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
+			clocks = <&cpg CPG_MOD 0x9a>;
+			resets = <&cpg 0x9e>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c7: i2c@14402000 {
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
+			clocks = <&cpg CPG_MOD 0x9b>;
+			resets = <&cpg 0x9f>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c8: i2c@11c01000 {
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
+			clocks = <&cpg CPG_MOD 0x93>;
+			resets = <&cpg 0xa0>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		scif: serial@11c01400 {
 			compatible = "renesas,scif-r9a09g057";
 			reg = <0 0x11c01400 0 0x400>;
-- 
2.34.1


