Return-Path: <linux-renesas-soc+bounces-20669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 333D3B2B8E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 07:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 200586812B2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 05:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A333115B1;
	Tue, 19 Aug 2025 05:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Fg5bO9GX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D713F311598
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 05:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755582152; cv=none; b=uZk9/wKwrkGjMnCBRWtN9SCjGWQoxYUD2QgORpiyVVeBBooeCd8liIDZvrt+rgH67iLkqibBpP96dmYE+gM8IgIs6Vsa6VQZbmG4DLkNx2+WGtFwTEr9TOoQ60y230wGQQ/AeVZ1JQsfXmVN0C99Ar5/9ZOA6WVOY9WQmepDrS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755582152; c=relaxed/simple;
	bh=zvYLqAOarWrfDuYAx8SvRiKVQASWxN64GJJN+491o7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MlBETBaE/8gpC2oC7Qk22QexAO/hFDy1NsjhQlgT4Mo68mJJLzCKuNQ7e0tKqzcI2/Mi1I0dg2GJKqv+vjSUT4VsY9A5ziYkXkqdEUTaJVU2PVEKTI5JNiLbsf0oRNBxAZwz5ix/xcShCz4C9YCcG7RF67NDyPm1acfDfpu9ksk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Fg5bO9GX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9d41cd38dso3770155f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 22:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755582149; x=1756186949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Cj5e9ujZibB123jMncpAMtWn8qKgxY22z4IJdc5luY=;
        b=Fg5bO9GXFziXR7XobPwKop66uGSO4CHdIheuMlus+rlSUWgLXeCXdZOv/nhuX50dUK
         iHHOVhAOMfez/Cq4VDfWmPdp47Gb4ompESpvkmyOTQrl8nAJGuvFeaW9fArBINyYQdPq
         qT5RLVbPUqes1wzJKC0MNsrnfagnCm9M58WS1eNwXdNmYLtcm4X1MxAOVPvvddIlQetZ
         DL9PaEB9rdIh5p7be1WQiV/4vndhO/7QXmTAScQE3jIgz7LZqW+eXuxxR/FIrIWk7Eej
         RNkj82/+4iNUnHiS/oAzDvlAK6ibwjct7HSyWc+ZxOjbF6AAh9kQFsWDMAIOXjgGCsfE
         C2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755582149; x=1756186949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Cj5e9ujZibB123jMncpAMtWn8qKgxY22z4IJdc5luY=;
        b=oc1qxqOMlY1KvihB8KaHLB78PghBF9yvnn7yhoWuQl9rttuenTszMu5UBl4so9XPRZ
         etugJiVMA4+mnXS8VDQqi8YcdL1BIRqAMzLZdL2v0L5jz0G9fMURp+nLGFPHKHzPoMLI
         +B9VlL/gG6gisFM83wvyuEAY9OmiqqAHp7elyYI0aN7QXDo9bIM/MmdTJAYQ/jqM6iVW
         nzzB2IMAiyM5olHc6mIPYV3q3o7yFSQpt8l/ipKaq2lqgdNwKjQen3ODNf8NtVHiuCzY
         134/yH1V/vKj909pwgTYW0rrtanaW8+v/Vph+5YQd1JXjK+qjKHhaYmVkxpOhKbP/oNt
         WJcA==
X-Forwarded-Encrypted: i=1; AJvYcCXexo8MEhsEikonGx1tUTCaVQBKX+tBOZ+9MuSFxQe5YLda3skgu3joxsRgzHVCE4jfcYkFd1uODO7O8izhzNqM+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxzgqgqlQh11R0gj8CSJZbW7gVSTHhbUAc9S6E/2l06Bm0ECQr
	pIF/oNvvN1q+yJ3lil3X+SbfXf7mTCb1r5N0Rct3vuj+XRL88QnaN3CcFn7dvWL94jU=
X-Gm-Gg: ASbGncuSkPQzHs30MwJ4bbel9c16IAL7uh5POjqOYz4xiWvboyW0CJ+7Eo/jH4X8jfv
	tdqvwTQMATfttuGmcOpqpd5CUOcNOPPzul/9AmndFo2tHemKBkWoYe9wF1NVuThLR0G5gWwZ0DS
	5/rCK+Cpz5n4TsakgIuFUGvJp892uiofrUWaoF/qtrKALh5rJzZK00iq+yXLw+d99SjD9E1HHU7
	Tdl+UmfJvHa+1ZwL24WLhogo0w0gl1is5KBPHyVvu/aAMPI8qkbEQeeGMlb3EwN15KqSoQeK6PU
	WRdLVBIiXUHMt0JgT2Z2MbKCp/im85vWc7nAfKSQSPFhRjQmHvJOx+m2JhDktm5O7vqxkfU/dAW
	sq5nzZFv4ESgRkfL66HZ3V7f+Yl+/ys/mZ7QHztROfF1cfgU5yy6KlE3OiEWljDY0lZy9K5gAzy
	/U0Y5pQ44=
X-Google-Smtp-Source: AGHT+IHFPZ1WYS1TRNOJs1PLvKhd+CAfSBA92Wzrc+e9qbctLs8+wOrzubrfZ9b75mBvHWVLfR187w==
X-Received: by 2002:a05:6000:288b:b0:3b7:8d33:81ea with SMTP id ffacd0b85a97d-3c0ebcc6e99mr669917f8f.29.1755582149270;
        Mon, 18 Aug 2025 22:42:29 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:620a:8b00:4343:2ee6:dba1:7917])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b42a9847fsm25097345e9.26.2025.08.18.22.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 22:42:28 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 6/7] arm64: dts: renesas: r9a08g045: Add USB support
Date: Tue, 19 Aug 2025 08:42:11 +0300
Message-ID: <20250819054212.486426-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add USB nodes for the Renesas RZ/G3S SoC. This consists of PHY reset,
host and device support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- dropped renesas,sysc-signals from usb2_phy0, usb2_phy1 nodes
- s/renesas,sysc-signals/renesas,sysc-pwrrdy/g

Changes in v3:
- changed the nodes order to keep similar nodes toghether

Changes in v2:
- this was patch 14/16 in v1
- added renesas,sysc-signal properties to USB PHYs
- collected tags
- Geert: I kept your tag; please let me know if you consider otherwise 

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 118 +++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 0364f89776e6..b7ad6db0174b 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -681,6 +681,124 @@ eth1: ethernet@11c40000 {
 			status = "disabled";
 		};
 
+		phyrst: usbphy-ctrl@11e00000 {
+			compatible = "renesas,r9a08g045-usbphy-ctrl";
+			reg = <0 0x11e00000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>;
+			resets = <&cpg R9A08G045_USB_PRESETN>;
+			power-domains = <&cpg>;
+			#reset-cells = <1>;
+			renesas,sysc-pwrrdy = <&sysc 0xd70 0x1>;
+			status = "disabled";
+
+			usb0_vbus_otg: regulator-vbus {
+				regulator-name = "vbus";
+			};
+		};
+
+		ohci0: usb@11e10000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e10000 0 0x100>;
+			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G045_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@11e30000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e30000 0 0x100>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G045_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@11e10100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e10100 0 0x100>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G045_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci1: usb@11e30100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e30100 0 0x100>;
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G045_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@11e10200 {
+			compatible = "renesas,usb2-phy-r9a08g045";
+			reg = <0 0x11e10200 0 0x700>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G045_USB_U2H0_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy1: usb-phy@11e30200 {
+			compatible = "renesas,usb2-phy-r9a08g045";
+			reg = <0 0x11e30200 0 0x700>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G045_USB_U2H1_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		hsusb: usb@11e20000 {
+			compatible = "renesas,usbhs-r9a08g045",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x11e20000 0 0x10000>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_USB_U2P_EXR_CPUCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G045_USB_U2P_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@12400000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.43.0


