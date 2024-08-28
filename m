Return-Path: <linux-renesas-soc+bounces-8447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B189296277C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 14:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40086B20C58
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FB2188014;
	Wed, 28 Aug 2024 12:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D63j6lWk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A5618784A;
	Wed, 28 Aug 2024 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848918; cv=none; b=QrwDBj7VpGxArjC+Cpe8qPqwcpWk50Neg4Hp9R/aSQiiLATlKqA4TfkDQ9aJkIkhdLc0sLXwPnkzb5RNO4w74aUDdNqoW3maTB0ZiWPlpaIRf0xWkUcTWDAwh0fydckTVPmq+PQ/+eX/I6InziLIrIrEB1ySiEEUisHIm0eRmHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848918; c=relaxed/simple;
	bh=jdr/scoorpl2XE9WMb4VdknBOtKJ4TwG+jw1r4lZbn0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YYMWhcTeAgG2OjJHMHU1yU48QA3nOpY5AQOOpTUcJsdvzNHsYVKwsWYSxFyuywaUKiKwOJgMV3ytORPiLyyiDGWAKwT6pCWtJlUBDJwwhIfUJBitswtC9IT+z0GckZKtxCWXSXejqO10GTdULDJag6NukA/WnOLypjx7CtISrvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D63j6lWk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3719896b7c8so3499256f8f.3;
        Wed, 28 Aug 2024 05:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724848915; x=1725453715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJcaqVUDl2vSsvsXn10pV4exK0qFXqjJv9E+YCCAoGc=;
        b=D63j6lWk/lu4qN5pmAI8OBJtBurn/1bMjieqREaCTVdNh5Nd6aluUzonIj5beH4ydB
         i0/ba7PJfQ6jcrTMgBqObxXw58fSU71nYrxb5NeVfzUt/ka6IlT22HllXzb9kPGO/UMA
         DvpbwuWDDZsQcnkQFOqHz0CVPT6hwJDTDedBnpxxRbzMUpVQdxRFhBUSSL101A932xkf
         g47h6hHcHOIQGPuv+LB87rjD+/ekEvt7Q/JgRbkB2/KHiIjpNa3bqrmUFAmCKxNP1lke
         yYu4hhah/k3ubfxM0v8bE2sKZYdnu+6jnDNYlq9+ia6sZXV00HtQ7LCSSSMY9lIWO6VO
         Yp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724848915; x=1725453715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJcaqVUDl2vSsvsXn10pV4exK0qFXqjJv9E+YCCAoGc=;
        b=IBJu5eYHdz5rpwmc/8GDAW7ZrH/sUnTYnpc+stDcMSLyENoMThxzXBd2G7BqUaggum
         tHjMaWKmyLxf1UUr2yqtrn7x0aFA/ZyfePDY57EP5K4cLZVGtVROxc/QBPSKiAo6wqEB
         kk23zrbJ0otkcd63IV1ELoPgAdPeModCGpF9tK3P/QSImQNxoMETm2OT1cx260rk+oD7
         fQsnF/tJcCc29Xda+kskVAXxBBxZ0GVmV7H98zFt6X20BwurL0LQ++7hztfPYP3f/X/b
         KqTVSmcxRpkv9dMxxNn/fDPYzUT0PcCHqa04+BAcof7esmNNBk7W5hqScII+KKWB5UEH
         EZDA==
X-Forwarded-Encrypted: i=1; AJvYcCUEuL0aq4Kp2cAYvngPZ/v/8zR+u5he1TJEGam38qgHTNBPHH90+eWa0V6UBjaLy0oCgjGM12XpJo+l@vger.kernel.org, AJvYcCUSQSxPQu5630JNLM3njQrIwQX8E4wDTj6FHER+HjeaFZo/Ep5MClbQ1d7g/YdWmTe1qbVNV9uxB93dCtli@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0GZbRIrHAmRghaEDZNjzt7Bpp9QQBtsXSQTny+H10VQuBbGQJ
	0bCgoLclfNw2LqGqoa3Rn/ToTiM3aK/KAL9C2SyJxCIGt92CJiSW
X-Google-Smtp-Source: AGHT+IEJ7ljgvgQmaalSHaunXfyYfI4Azs0iZi+0t520wNLavtkobseqvzC4hFsDsN86A6p47ToIiA==
X-Received: by 2002:adf:b311:0:b0:368:665a:4c64 with SMTP id ffacd0b85a97d-37311840237mr9675591f8f.5.1724848914443;
        Wed, 28 Aug 2024 05:41:54 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813c5edsm15508226f8f.31.2024.08.28.05.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:41:53 -0700 (PDT)
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
Subject: [PATCH v4 6/9] arm64: dts: renesas: r9a09g057: Add SDHI0-SDHI2 nodes
Date: Wed, 28 Aug 2024 13:41:31 +0100
Message-Id: <20240828124134.188864-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add SDHI0-SDHI2 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4
- Used hexadecimal values for clocks and resets

v2->v3
- No change

v1->v2
- New patch
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 993c18879007..7e243c127ec2 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -420,6 +420,51 @@ gic: interrupt-controller@14900000 {
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
+
+		sdhi0: mmc@15c00000  {
+			compatible = "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x15c00000 0 0x10000>;
+			interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xa3>,
+				 <&cpg CPG_MOD 0xa5>,
+				 <&cpg CPG_MOD 0xa4>,
+				 <&cpg CPG_MOD 0xa6>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg 0xa7>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		sdhi1: mmc@15c10000 {
+			compatible = "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x15c10000 0 0x10000>;
+			interrupts = <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xa7>,
+				 <&cpg CPG_MOD 0xa9>,
+				 <&cpg CPG_MOD 0xa8>,
+				 <&cpg CPG_MOD 0xaa>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg 0xa8>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		sdhi2: mmc@15c20000 {
+			compatible = "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x15c20000 0 0x10000>;
+			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 740 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xab>,
+				 <&cpg CPG_MOD 0xad>,
+				 <&cpg CPG_MOD 0xac>,
+				 <&cpg CPG_MOD 0xae>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg 0xa9>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.34.1


