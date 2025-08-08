Return-Path: <linux-renesas-soc+bounces-20128-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93704B1E229
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 08:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91CCD5811FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 06:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA562236EE;
	Fri,  8 Aug 2025 06:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mMJcJVZk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F566239E60
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Aug 2025 06:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754633917; cv=none; b=Q4l7REPj7EFuD35TqGkO0Owov80WmC2bDbbB4gGUrwn6aUKovjeVoxwfw1qS3vXOtlvtljAtd7jLVh/hE43odTAX9OaKn/DYBDkL3Dj6QnP4ZAhS6heECl9C+V/rQlSze0et0LmjkcBGQ4PM88yi9dFw94u3t6K6P9YS2VTtfeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754633917; c=relaxed/simple;
	bh=+HdI06QzaFXR+T2k3Pgfbctnx0gjAKt6IiaBLWpjHLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMRHlGhWEnjWLV8kZIyu2Uf908lznB5J4u+43IGkwZ85nxtYAY+srJf+DkCZXgo0TsXboF3gdNoOPKlcVV82vWcliOA9eUX1Tys3rIbwA4ErL2CkjdnYOps0paj00oAWjmEDzoQM7uzXrY9dx4VVLi5z1X6dZla07wuNiEJLEv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mMJcJVZk; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-af968aa2de4so344479666b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Aug 2025 23:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754633913; x=1755238713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84OQbF9bYCLGD5qOco97q4MqiLnZ3GTtaXjZIqPyEhc=;
        b=mMJcJVZkftINUSZNTCcxd7MaNIMHKzichM/0z2oiRjokvQAbxDb+XG0QMUPSHoJgr4
         ifQMBAXDoTaOexBxPcj5Tsmjjm7TikN0oxayCuGPpTNUG5mjjtuytOUpR6z69jpBPF5m
         arDH0xG1aAlsM+621Pxav4oiMb2F/TVMWe4Zjxe4FzGILBettw8AOow9tfa63AiW9gP7
         L3jOyc6a9YxbkZszG3yWPL6iiqocp2pQFF5rT4XHiexn33aUxiy8OoAHQMiMmhq0SspE
         QAKhpir7bMw3h+OaMEBdpyOfa48/78JbfVDnfkWZcOLChY7ZLngbnQNrh9OSN9kcowxG
         ho3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754633913; x=1755238713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84OQbF9bYCLGD5qOco97q4MqiLnZ3GTtaXjZIqPyEhc=;
        b=dd7n/mjUG7poEPlcVrLQVBjk0FAmyFj4RNht9qmPYL7gzqmRkivHwmMy2JgQbr5bzn
         2OZTZ4Sj5be+LnTc6eoSxQGwuJxKtiZCTCYMkOvDAHvU7WFMyMdk4YA5jbzTofaIB+DG
         nACJXV9SP/Ns0iin3bG41BRjTvltK6YLH7p5RRcuTMoUDZANo2IpFGSTaad4HKl6YkWm
         DxO1ukRBGW4Sgcx1Xu/ILWPh1FAhyHiw8I1+DwYK4HkxpdSr4Vxw63t5qQV7wVYBLbuN
         H0T6H3JAd0UaGbGVOqpE1INadZwujqMjR/Z6XonI+I3z/7e99hn88J4ot0Slxn4D+hVI
         iZ3g==
X-Forwarded-Encrypted: i=1; AJvYcCVm5cFq7BNsreXQR/UCgr2Iu1xibFnxUjeTLzLlx4O2XZjF+2IjcfF+MBLopzpyq3CsKRggR4coQuBpoznyiVAIiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKkpvLKKNBE/yZL0Uk7qp8OzgZA3nMF6SgMW0N50vUwApZvkfk
	SIFc24nMzRNvlRTeplFkOFsbXINpgTM0J3fE3lkNp4+Qq7qr8uy4Cj3Pf762RGs10eA=
X-Gm-Gg: ASbGncvbuk0PuXwztz87pK8Hc2k2CcnyJ6ujYyJm2Hcjh5iK4ms1Eo22hJZHpcZZiLg
	vFeT4S5yX6PRp+No58AsStlUNdNWn9zgQQT1xzdOTHF2aAN3BgTemaV/D8R7HcXBJTm0Izsnsr9
	VDl2kmnkkZYYpJ1aKUYPBeQ4VRVuk0oMjJP/LtXgLFUVB3GzxY8b4idnMNiRmQbETY3M2cepdiM
	All1oq1pcz56P42gJ6QciWWsCadjM49ppgif93zcVpksZe2jVK/vdRl1pOHm0hDIkSxGVqcJ4Sr
	A4Oc5DTYFtwub/oTx6hYvwTxu9nI4I/IEmoaebC3sao2IwHVx2Tm1/KFMdAfUHHTeDVD4Lhzham
	k0ng5DPmIxNaUucncNuRkglDhEIBuSEelGgrXsQJiAW1h5+i2cc/i
X-Google-Smtp-Source: AGHT+IFRExz9PVRj8Swpu3e4S+x0Mbbto15T51WR62cF1Ysrntq6xKyRbn6W7QUObuHiH8l/+I0zIQ==
X-Received: by 2002:a17:907:7f18:b0:ae9:b800:2283 with SMTP id a640c23a62f3a-af9c6452471mr150843166b.15.1754633913295;
        Thu, 07 Aug 2025 23:18:33 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a218ab4sm1440488566b.92.2025.08.07.23.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 23:18:32 -0700 (PDT)
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
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 7/8] arm64: dts: renesas: r9a08g045: Add USB support
Date: Fri,  8 Aug 2025 09:18:05 +0300
Message-ID: <20250808061806.2729274-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
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


