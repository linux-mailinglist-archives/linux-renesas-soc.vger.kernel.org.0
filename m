Return-Path: <linux-renesas-soc+bounces-20879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 318A1B2FFE4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 18:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 480121890A67
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 16:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E563E2E03FD;
	Thu, 21 Aug 2025 16:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMtAF+Nz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CA92DC337;
	Thu, 21 Aug 2025 16:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755793199; cv=none; b=NTdgkx+QEAD0BgTn/IQU1huxdyh/5HmMU7fFKiUGnex2s4zlw+fVd3bTQwlwfNL5XxWtIpbiMdg2zuVnef/Hn9ncTcYxXu+Cvum9rLhc/Uz7x4NLfdqzfIpp+7JYMbWmskDYImhV00ttSPaAIg1ibE3fc2/i+0z1lUCAFoBy6LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755793199; c=relaxed/simple;
	bh=9yiui0Q4lpXvKAtym+b2XSMg5RjpTKpw2I8300uv5KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGWD4le8olEmcQqfcg4iC5u3OiXLpCkm/lFHK7X3fDV098TpZ3TArZeY9UPBkuVZ1Dz7HJuyRfqEoxR/djGmhfvGsPan57p9hIGr/5gf1WLnGFO8AjlbgTh/AXOBVALyJ8KSQyoVShCyzlQvxvS8UwJy7J+gfz4Z6MKg1ha58Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMtAF+Nz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b065d58so9759295e9.1;
        Thu, 21 Aug 2025 09:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755793196; x=1756397996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0sb7hYPmSQ29oIFrSTcxDagmzo1R07NK3WhmtdjoLQ=;
        b=cMtAF+NzfxziDvydi5IrJlJNcdqEbXzRi49GmzdQdLD9x6JmLVFqHp0vs+R5NfZKA5
         u1yvRv14+zRPUy5SuGwz1FBa0Rv2+Xk2SwJl96WWOZlNl7lfdE3q3M96goxGo7Mhsd9c
         2CoVA2K1eKgJU8/ENQCQ4qtATq2PIZD3KLb523MUizNsO+tSjkyKEIr7x8sVX73CqAca
         m56lFAs4fZRsqcR6kBItYAtYQ73bS884jy28kL3UGsrocgAzJwj3eF185FY+Me9oY5mz
         k9dt0qngChUF3rjVs48F3+DV5FMk61K0SJsFW/8RsT2JF64Jtgn5d+p5k3dj/TYpN3Lm
         JyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755793196; x=1756397996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0sb7hYPmSQ29oIFrSTcxDagmzo1R07NK3WhmtdjoLQ=;
        b=Z3y2ThojUjAFKiscjUEp8AnRw8Ecj8WS0uVZ5FFqOfn1A/x4A7tkFFDdtmzJ2RShX/
         dfEcwBlNDRu2FQq8P0plHB4TxPdmIzrT+EYMLaBuBuIFpHgayK0EfAR4D0ORSiBUcEkh
         xwhCPeReUPHmP8rzNQyzq/vfzZPgue1Q26RmNSGIps6UAoopOYvuL3ChhrGvuWVN16JY
         0tLXfDbsnU8JPubsUlK6LU58ei2pMWEc1rbZK7JuunZrobTb9YFDCJBy4fMY9/7Gzy1P
         H++QrTJAJSb2uKr49ejDdwMSHhR1/GrhYXNLjcpl8PazHA8S/p+lgZZu6h+hhydgS7UR
         2dQA==
X-Forwarded-Encrypted: i=1; AJvYcCV3/6LRwvR3K4+vOdOexIWvMfhFXN1HPzAyKmCSrp46ROVHaP4ZBe+fRlRGc5KevCN3VtQIcct18TDn@vger.kernel.org, AJvYcCWb0NTp/z4GE+rpM1Qx3kOBemOe2jEQinzEJg1tVCROfa6cEx/1yLqLdZdugn3H3J+kRjVi2wes5isNYNOQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwkBSBkkTN4pIN0UKA7j1Vw5MZgZelUPcPW47gO5DsPHitTMdAn
	fz+JZF+GwFYvL1hd6gkoTIGoZmwEyIiL/TWRWJ8LHVdrCzBJhdwntC4L
X-Gm-Gg: ASbGnctC7rtBsUj9C0RHFGdzmbhLuq0nvQsi1B2WyCDM0KsvVMM2fxIF1Vft2lxsrQ3
	NzjUUncvsLQyMXve1AO+qcsD3VRDQowPU/1oE7WLoHxSc9mIRgARBGMHBJpRG+TOcSfar/ElJVA
	aldffudTOyouD0ICZPoYTUJn66vNGHxPt7MEkQXCsz8mN15FiGhVfk3GsIBPXnGyh7o6ZRx3uzk
	gw5kkpTVqYJe97G4tkwcDKRMs5/t+8P2wbcACy51ge//eWBqPneZx6v4PBJjsVkPKozH0PY4D3h
	EVPVLtWyC2G1SdDt6lPmGw2X7+EuS4naBby+EAgdAkHpoIA+fGtFlgpc5YHvRyo5FNojhyG9BRx
	a5bVb8xL5uQrTZH+/5FSoOgvP2vp0jMx9y78KVXVB3pInJCQlXnBBWhwo
X-Google-Smtp-Source: AGHT+IGqCC0qjWf/t34DI0eKesPxh/X254apYMPWuzdySpeINa3HEOE0hqIKHQ0bCsB2PON6x4t80Q==
X-Received: by 2002:a5d:5f47:0:b0:3b7:735f:25c9 with SMTP id ffacd0b85a97d-3c49549e24cmr2427801f8f.21.1755793196273;
        Thu, 21 Aug 2025 09:19:56 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9ed2:95cd:69a:8d10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c4f77e969asm2316464f8f.20.2025.08.21.09.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 09:19:55 -0700 (PDT)
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
Subject: [PATCH 5/6] arm64: dts: renesas: r9a09g087: Add USB2.0 support
Date: Thu, 21 Aug 2025 17:19:45 +0100
Message-ID: <20250821161946.1096033-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add EHCI, OHCI, PHY and HSUSB nodes to RZ/N2H (R9A09G087) SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index b669c1a506d3..cd8e409b8db8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -299,6 +299,53 @@ gic: interrupt-controller@83000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		ohci: usb@92040000 {
+			compatible = "generic-ohci";
+			reg = <0 0x92040000 0 0x100>;
+			interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 408>;
+			phys = <&usb2_phy 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci: usb@92040100 {
+			compatible = "generic-ehci";
+			reg = <0 0x92040100 0 0x100>;
+			interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 408>;
+			phys = <&usb2_phy 2>;
+			phy-names = "usb";
+			companion = <&ohci>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy: usb-phy@92040200 {
+			compatible = "renesas,usb2-phy-r9a09g087", "renesas,usb2-phy-r9a09g077";
+			reg = <0 0x92040200 0 0x700>;
+			interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 408>,
+				 <&cpg CPG_CORE R9A09G087_USB_CLK>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		hsusb: usb@92041000 {
+			compatible = "renesas,usbhs-r9a09g087", "renesas,usbhs-r9a09g077";
+			reg = <0 0x92041000 0 0x10000>;
+			interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 408>;
+			phys = <&usb2_phy 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		sdhi0: mmc@92080000  {
 			compatible = "renesas,sdhi-r9a09g087",
 				     "renesas,sdhi-r9a09g057";
-- 
2.51.0


