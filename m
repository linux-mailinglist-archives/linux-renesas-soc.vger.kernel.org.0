Return-Path: <linux-renesas-soc+bounces-17632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E72AC6B38
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 16:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A423C16B394
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 14:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030352882D7;
	Wed, 28 May 2025 14:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrOJiEZ3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31546283C9F;
	Wed, 28 May 2025 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441107; cv=none; b=dOCiwwSBmNUwaafP00lEQnT4JHk3LLki73aE40JVOec3p7i7gWz05WL/4YqZJP1n5EhzjB+q1zmAIS4B8rtDHhg7gnKt+WZzdBMB+U5SCQ1KG+2hg+PoNKQDX6qJl7gYtrD4/4kB5I2T6Jhr9TlLZQ01E5OjuTK+D/MUDA8XNP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441107; c=relaxed/simple;
	bh=5DMeEe+nP0mHofrnt7GfPk1MGvXTANxWKSg46gQH1M0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdClPnmvpI7Q2hL4rnoCgSGBQpxsGEz2geT+rkYoXR6mbGc9B6NKJPrnizOaMuuVKP0ABuLF543cJue/jyuD6xaEI2wAGWkvzLlZCW8igia70RzBi3khChyYLPzr3T37OCz0NYS7Q7Xi1NMqiHGcaH9i1a0gEDjtmHoAN1XYj7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrOJiEZ3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe574976so36181405e9.1;
        Wed, 28 May 2025 07:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748441104; x=1749045904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJ9cnFO/vbXkCLu0tCtnN/yMKzSUnqE6ZPE2Ep+D7W0=;
        b=mrOJiEZ31FLZHbfcq1LDnbxJiURlgSOuleLdOqZWDosqOeKKfVWMjSjpjexTFUiY5S
         v5Xh3y59AaYItKEcv3xBkvpf4oqWSHIu9A3P9jBxbB7+whquAHeNe6mKHQ584Unm1q9o
         HS67wEVrs9qmYrVFnfBHFITqclFkR75TVcLqjlL5stL+Jwbo3WEDGeEfSRJvykywrv8V
         1/UCoIrh1E1OcaRsrqzSolSxS0+14aYrOwboLE8OtqFbc0UuZSU/2tVyGUI7KaeKHTqA
         sLCo1Kuq4nUuPSnYHAtWSXELdo+HCEUAYbGxrB2qok5SI8GhshjWMmpLnDkKo6LJPG8Z
         2jjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441104; x=1749045904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJ9cnFO/vbXkCLu0tCtnN/yMKzSUnqE6ZPE2Ep+D7W0=;
        b=qx3Xh1tJG1i8KgYcGhLb8InKgb6C0NQ1BbPUoZErQKgSGrK4tCPBmSXH61KPxR47da
         mA5QxQ6lQ6TpfxYD5zFlTnV43WVyG/7zu0iCpu12CIWVUrx0vXu6xKtMXp4RwYskDhZn
         Ab6IAHwnHA7WJCBl16BPckh/Ke+6t+JBG1UBz4GcRy+pQgcEk9qKn0MQLgr0zrhx70gU
         mZKbIZltm21ZR3unCtTL5H7ZfGey1vozB11+3ZftVxO9dS1aShJ52gP8yUw58vwCzpXI
         TUhGwk7NiqmQWBw9MIOYkktJf1miHDKjUW+ibhlNa6GGEQV7VpjAGTp23A1bao2HhfWj
         tnZA==
X-Forwarded-Encrypted: i=1; AJvYcCV0ElWo6sjVKvBJUwRH+Vt8mFrTYOK3MxIQjuqH243lZqtDiTE6ZZbWC7NPRHQ6Svk3xMiKB9Y7EI0yaisY@vger.kernel.org, AJvYcCWI5Jwk2EGd8aHAOSellJxwOULoSVKFVJqNKPMqbRsyCryjd+jYo5CFbzgGmfUW1+fhGhjw19elS0sO@vger.kernel.org
X-Gm-Message-State: AOJu0YwhX2cUe/j0SK17SNPcKYneb6ZNzyBrrBn6XtDeUS/HY50Ib1yt
	vRWLtMI2iB9vFxw0JBSfvOfqchw5Pu0IU8y/Kh324n5tqEtCAvHbE3G3
X-Gm-Gg: ASbGncs20Cp4pc7fDj45CHl7nbNbHcyx0aMwJTqJ29NH1hHumHAHCSBZY9d6Xzrl/cI
	xaNjkxdumstJTArp1G2rmUnRWwpNkLQbsZTUGltJE7pvaoVCbMIXTgM/dVqFqXur9qnkJ1zM1OX
	UlHowvqkSMZpdJ3UXSiQsRA8e2W8f43MJBrkJdNtcfSBszl563A3LxoevlB+zYd8xkJlgxeai8z
	oBsoSdM/Oe5spy9aLffV7K6788OStoU4bAfIPiMAwXQhM3k6Jl8XKBD2e/rei/DAftuwZ+p/KZh
	PAHBgXkfBtvRyrvDxOI1HJDM89PMKpe5gcraYtlzxR9T+FpNjeyZP5GddOGNS6tqPKEW2f2pgLE
	S
X-Google-Smtp-Source: AGHT+IGudAWACBinVZ9qBUn8vuuoVUV5Mklzj6E9Fvs++YleA3Uf4d+E4lneqbl1Em4T/OmwJNENBQ==
X-Received: by 2002:a05:600c:6749:b0:44b:eb56:1d48 with SMTP id 5b1f17b1804b1-45072545a0fmr24378135e9.4.1748441103699;
        Wed, 28 May 2025 07:05:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7078:193c:ccdc:e2f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450787ccbd1sm18846795e9.25.2025.05.28.07.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:05:03 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Add USB2.0 support
Date: Wed, 28 May 2025 15:04:52 +0100
Message-ID: <20250528140453.181851-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528140453.181851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250528140453.181851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The Renesas RZ/V2N (R9A09G056) SoC features a single-channel USB2.0
interface with host and peripheral (function) support.

Add the ECHI, OHCI, USB2.0 PHY and reset control nodes for USB2.0
channel in R9A09G056 SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 9adf216b6d0e..d17d6a9ed0d2 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -569,6 +569,72 @@ gic: interrupt-controller@14900000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		ohci0: usb@15800000 {
+			compatible = "generic-ohci";
+			reg = <0 0x15800000 0 0x100>;
+			interrupts = <GIC_SPI 742 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb6>;
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@15800100 {
+			compatible = "generic-ehci";
+			reg = <0 0x15800100 0 0x100>;
+			interrupts = <GIC_SPI 743 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb6>;
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@15800200 {
+			compatible = "renesas,usb2-phy-r9a09g056", "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15800200 0 0x700>;
+			interrupts = <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>,
+				 <&cpg CPG_CORE R9A09G056_USB2_0_CLK_CORE0>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb20phyrst>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		hsusb: usb@15820000 {
+			compatible = "renesas,usbhs-r9a09g056",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x15820000 0 0x10000>;
+			interrupts = <GIC_SPI 751 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 753 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 754 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb5>;
+			resets = <&usb20phyrst>,
+				 <&cpg 0xae>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb20phyrst: usb20phy-reset@15830000 {
+			compatible = "renesas,r9a09g056-usb2phy-reset",
+				     "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15830000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb6>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			status = "disabled";
+		};
+
 		sdhi0: mmc@15c00000  {
 			compatible = "renesas,sdhi-r9a09g056", "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
-- 
2.49.0


