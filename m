Return-Path: <linux-renesas-soc+bounces-17319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A0CABF76F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 16:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D96B7B6074
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 14:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAABB2857C4;
	Wed, 21 May 2025 14:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fpzYXsVS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DEA283143
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 14:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836630; cv=none; b=cD+kFxsr4veTHfdxpyFa4S0le7lMFyYWNfvHgP7Dg7gVot4Lfv+1Z6nGwzBSh9Oq0sGissP26nST1APsiAkw8xPywB03zISeTAsr6YpUA75GMoqGwiJ9i7Y9sSWYSIj4jPAxD8Sbekmf0Pg6p1uhW9Wr7vnL8Vm8vafDcM/5kFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836630; c=relaxed/simple;
	bh=BSsTy3tbn/xKQinuO+XIPNVVjzoHKqygxo857+Pk8I0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qNjqQ0hdu+v1w0Um8mhyjBk8fjt+bs/R/Ko3Y9KmBBaLO6hV2ByUBwKLj3dU7WPGutAQENFsS1STiW6+4Ncgs4Mv7TbcAnKtu535ajb3OwVhzL/3veWRTPy1qNDg/u+fhdFYNtWAJ6RxNi79tsg3FzpzMwZsYeJr1Gxry4P1pTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fpzYXsVS; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-602039559d8so4818362a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 07:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747836627; x=1748441427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5R0SBkCSnZ1ZgHRkf3W4h5B5fht7vGGoztaC7tLlMq0=;
        b=fpzYXsVS7sHayaezRGajAwjlC+6HqUzSUEHYeb8GLNjU+AcriBHc4AbixY/i6L3Jbs
         gG4kyGgxEvRFV6Z1rkPpPKhxIc4Hq6U9gDD+WNB626EhAwg/NjnbKn+PV1Z1Qg/Asc9u
         jX1bqXkvC4TqDcrtD3acHfdfqcEjzW15kxsKlwwI3z4dTAsTpmCEYViOXnWN++qumGxS
         heSTXGNWL3b0Q3BZsLQUWSmJtofKvk4vBRl9zwvqeLvtRyut56s3A/1kcMKuYH7bTn48
         PiX5j/imcOxqKlzlBgoGUHnRZD470tC+dK/RqT/DvteytH1YInR9loFVa82PIWQPLsHF
         eRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836627; x=1748441427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5R0SBkCSnZ1ZgHRkf3W4h5B5fht7vGGoztaC7tLlMq0=;
        b=QG10UkOBzp8389GW7RWMCL1JuUE1sY3WGuLmPoFuW74whpazBWdc0y1tRBAKAJ8t74
         ceCW8w/S0fHGxcJgrBbPc2LARnKHnrH+f2H8TiMdjYiSlJpo6mhyMn8SAKcQ/UAwWWSY
         9pqSzTSwIb1RbEijqdxjAchCgj23OfkI5Lj8Whch+Wi5ewrw84wiTj0che/Xa/VgZg4D
         JdyU9Pinj8JDVTd4Xw3JWXzChzZmbIpW/u6mOQUbFOq8/6n7YolW29eqdou6h9o+AokN
         MEfiZve4Utaw6bXYIE9Eb3TJsjHzJiV2ctZ6jCPA2qyPE7Zk8r5KznVr4QSfT9kuWsJo
         R/4w==
X-Forwarded-Encrypted: i=1; AJvYcCVMS1/w7GjYC2aWTmxF5FjsDm4T2WrJ9ilu16ZI9mpOFCjyU4BMOwG0aoKdI+dqORAmJ4JxAn71lSdJegCPuKKTDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9tNBvPskhqQwuD6Hs0aR4oV++gQkvLQUD7nqWb4G+aXweH6+g
	nrA7tOq1LXbBbOeRVThuMbXhusqgZZ6lMjkIvY5xfitxTCItp3B1Swl1mp7v3zRq9q8=
X-Gm-Gg: ASbGnctxWYRR8jbSnE2vAyhLeyaxjd3+dlJEKp0Dk/DbuvOVfSQTQlxn0IyTk+ScC11
	zr154kvhBUv+7dxQlKI6oR2BSuCtYiMtWbfiA0z2VxPTDpeJMBHzAKr1ejcK9iX6B6IZi/cLXKl
	aDAWrtBJSCFVHydGerZhDRJNDFbfOZwC3nh8meEPJ4WNKhMJ8gGM1V1RFSzTH01+4i2+I0SXLIt
	pUyLp1oTfBCI41iUMVfte8JHonnVYSwFmjxXj/U31JhKxepFGocVz5MT4HSZvlLxVDFAboqOaJd
	ArJWrdLxjEUL767sv4oaGjo1/sUxoM10WTKCg2rSd+o3tUduCGnh4LdHCMDgbgSvTFYbi4kKck5
	CkFoV
X-Google-Smtp-Source: AGHT+IHIkR9ssJIhuCx1mmiAIGd6OoO/KN3o16DijCKheyN/jOueJQVldCbsG3V2xpWCs2Emi9rUQg==
X-Received: by 2002:a17:907:96a1:b0:ad2:1cba:cf85 with SMTP id a640c23a62f3a-ad536dce1b0mr1741373266b.39.1747836626692;
        Wed, 21 May 2025 07:10:26 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm914552866b.69.2025.05.21.07.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:10:25 -0700 (PDT)
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
	kees@kernel.org,
	gustavoars@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 11/12] arm64: dts: renesas: r9a08g045: Add USB support
Date: Wed, 21 May 2025 17:09:42 +0300
Message-ID: <20250521140943.3830195-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v3:
- changed the nodes order to keep similar nodes toghether

Changes in v2:
- this was patch 14/16 in v1
- added renesas,sysc-signal properties to USB PHYs
- collected tags
- Geert: I kept your tag; please let me know if you consider otherwise 

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 0364f89776e6..e329c55c3fad 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -681,6 +681,126 @@ eth1: ethernet@11c40000 {
 			status = "disabled";
 		};
 
+		phyrst: usbphy-ctrl@11e00000 {
+			compatible = "renesas,r9a08g045-usbphy-ctrl";
+			reg = <0 0x11e00000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>;
+			resets = <&cpg R9A08G045_USB_PRESETN>;
+			power-domains = <&cpg>;
+			#reset-cells = <1>;
+			renesas,sysc-signals = <&sysc 0xd70 0x1>;
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
+			renesas,sysc-signals = <&sysc 0xd70 0x1>;
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
+			renesas,sysc-signals = <&sysc 0xd70 0x1>;
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


