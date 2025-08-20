Return-Path: <linux-renesas-soc+bounces-20773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBDEB2E3A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 19:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5134A3B2974
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 17:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AD235082F;
	Wed, 20 Aug 2025 17:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdFm3kLf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE1D34DCDD;
	Wed, 20 Aug 2025 17:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710304; cv=none; b=iHCF7YEEy7MvmC3yYL1KkrekscPRm07KVJ8nkRWgmQ3zdfixmoEcKUdTKOs65L0j2Mars3inB1Hk5srDgUhdg9KczjbVuSKz3QDGqrakgWBZVjmd/+Wmmt4jAtBy0NOL3UjblPS0rxIrhlXsfLojNg92gBsiwkDQ0GGV+Nk3//U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710304; c=relaxed/simple;
	bh=wN1xfUpI5zaCnHtRq2Gd3i3LCgMwwgT37PMTa3OnxIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKG1wVpqCq5R/S/6PH/zxnEwJlN9z0JN0UiNv2+3DVEK65+1diefrcVOwHDa1mJUWTX3YelZwQA1awD2wuNYOFOshuO0U0tGWNv6xN1eP02XJdCAV0tuLeRv0dlQn4ftfzaxMVFM25a1YHXBRcYOuQzyp2ECoiKhgM9oBdMp7Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdFm3kLf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a28ff47a0so794095e9.0;
        Wed, 20 Aug 2025 10:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755710300; x=1756315100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6ZsPgU4qzY8L5kyMP1ZvFmnQ5UnPb2Ivsc2PiDsP0s=;
        b=fdFm3kLf719Ti8rCiRMmeG76j0y/iZo62uvMZL10MwSu2kyCupyQttGFjpzcizKR38
         58J30Btwlrt7Fermf3OJLFc1xWJHvhCC74leYf74ixbqSiXtKkghQ6wvzr6O6SzqVvXj
         Dtg/2BvMJieMsLU6U1k+MuxYbkVOrTiLwQFu7mlSP8G2/2/V11IALWXy6dX3WdXtfn6K
         5mWEbSmJ9JKmyjWc6T2s5CGVTIlqCWxPEXlLz3oePvp7GWZrqtO+23HR1c070sNJezrO
         ZUOQmT8fPjxyZzDkCLFZGvS0FOkDOhEpWN4L3sg09xcJT158xYzqHodhAfGgPLD3fT9l
         GhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710300; x=1756315100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6ZsPgU4qzY8L5kyMP1ZvFmnQ5UnPb2Ivsc2PiDsP0s=;
        b=JlrTeBig+J282LTYuQHVOBW8gMO5hjfC+OUxLeJUrUtJgYfg0/aZXMGXzfZCZfRPGC
         jPB04+Hcu9xUHnvJcPMbpCFzwfoKGwAIdeJxfwR/OjnMGUSn8RP1evSynAeOZCzy3rj7
         u8wfKmzmPhc81HvTTuMzI1C7lFYaqYellv9gAH4iDJct6UK2Y1k5Y7O4y+uO0nYrdKsj
         gI0xeXDBBAmMp9w+IhAaLRvQcwz+fIgYP0NYvFlp14W9jsCxLppChpiRrDHL1fxpbytv
         wZcgvxpbxweG7GM82iQpj+ZQnOnE0AlnZwAk1kyuqskC8ZFSwgSAjTaa3yvjQaVVuuI/
         1ZhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Uycv1uEtLgTc24e5I/UggXpJEaAHD9Qxc+gl3C9uAcP9dE9zfgJX6/IEHZ48ZoJ8rngMpAGeUVNP@vger.kernel.org, AJvYcCXnM7LJHzowX1/Lf1H+CbPqfcVEnwTreLQu5TC4M2cd14/nHpn5AZKCg9sTMtv+uh88rui4W8HwltbQyE8O@vger.kernel.org, AJvYcCXszbhPjH7n9euwdbc1Y1qVImGtARKtpKa6Ajz/he4ucoaksleDhc0NZV0d7WNMZulJtwMjtRwuGWsXnVX7lst+uKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJICIw3ETNQhO9K1jSmK+UVR1dAF5hfqkaOEZrOBPDVQFzACyF
	qx2MsORx0frfu9UFQcBqzHfOtNrW7lX6G8fmoBrpwJhSSNllEzUxC+5J
X-Gm-Gg: ASbGncs6ocgbgFIpgX6mpb0YU8cTqlxaZ691Gswabys2P9ilOvj6GO18ew/GY0lkzoA
	kOF/SR3RHSm0l1+qEEust/voUUIH28QkzAnwbmPhv6vA1q7RhchLf019Z4fjL2Yz+Zz0EsxcrDQ
	DLysea2HSpbPjrH2AzIvI9GcPhqN1V1HkAQh+gPpd8xPn+mjzPkHMDDqqXePy1O86UpB50BaA60
	Rb4xrmx+TlYJBMUE5lXII/1amtXLkgBT3Zpehr3QuvXP3l7VwTEa0Kuna/mdCvBfLOASsz+vTCo
	/JwiVx0dDqnwPs4MlKihLebtgk2qk8G5tBkTZqdSyx0oBVTKjVTZcI5ip+b4/quUomlY+VXFGyS
	yFmquFIZhHYcvYRGF8mYwvmKNfEC8ojKbSbhpN2GnHjHd/s4B/nL8ZgY21LECi/tfMKU0DsYZsv
	d72NGRzcwW
X-Google-Smtp-Source: AGHT+IGGUCqjdkhcLPsEOhT/8l34/y962F3EXB75VyRKU8RNiiBd8zhrKhEekyZTMPPld/abxPXKKg==
X-Received: by 2002:a05:600c:3109:b0:456:1846:6566 with SMTP id 5b1f17b1804b1-45b479f0b77mr31734675e9.29.1755710300316;
        Wed, 20 Aug 2025 10:18:20 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c2865dsm40319815e9.2.2025.08.20.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:18:20 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 09/11] arm64: dts: renesas: r9a09g047: Add USB3 PHY/Host nodes
Date: Wed, 20 Aug 2025 18:17:56 +0100
Message-ID: <20250820171812.402519-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB3 PHY/Host nodes to RZ/G3E ("R9A09G047") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index e5b24e46d645..b3ef0c15e62d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -836,6 +836,36 @@ gic: interrupt-controller@14900000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		xhci: usb@15850000 {
+			compatible = "renesas,r9a09g047-xhci";
+			reg = <0 0x15850000 0 0x10000>;
+			interrupts = <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 757 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 756 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 755 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "all", "smi", "hse", "pme", "xhc";
+			clocks = <&cpg CPG_MOD 0xaf>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0xaa>;
+			phys = <&usb3_phy>, <&usb3_phy>;
+			phy-names = "usb2-phy", "usb3-phy";
+			status = "disabled";
+		};
+
+		usb3_phy: usb-phy@15870000 {
+			compatible = "renesas,r9a09g047-usb3-phy";
+			reg = <0 0x15870000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb0>,
+				 <&cpg CPG_CORE R9A09G047_USB3_0_CLKCORE>,
+				 <&cpg CPG_CORE R9A09G047_USB3_0_REF_ALT_CLK_P>;
+			clock-names = "pclk", "core", "ref_alt_clk_p";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xaa>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		sdhi0: mmc@15c00000  {
 			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
-- 
2.43.0


