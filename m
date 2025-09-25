Return-Path: <linux-renesas-soc+bounces-22370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C66CB9E8CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 12:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4EDC188C0E6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 10:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461222EBB9D;
	Thu, 25 Sep 2025 10:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="afOx1XFj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F44C2EB871
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 10:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758794653; cv=none; b=UMCXURTPsM1usfnRj7xApqjQGqRAT5eKoh+HoOF4svezIrCbKRRKFv08TOEF+vuqr7KSQ6Qk2F4qUppAbfNn9ANpf0qdyCnW2w3i3lPuKkOsmJ98qJ+aAkzpSC712edRnfI9z/fdPIE4ARuGTu+6A5JrxeVyw/etf9P16pEjsq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758794653; c=relaxed/simple;
	bh=cXzTNhLzCyNcnVT8nuvyx+q7HjA5Qw68VoK7HS7Odqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJE0u118kAltXpVxksuWSftp1dg2wgOoZhah62gKT25BJuKUGa/MoVa1fWD4BjpghlPOL83NEZegOY+D2t3gTms3xv7gtcisjWjviAaVh5rXIAT9mJ0ZSakKVu81JdXPBHpReaLXrRrszfopJeonu5GRIkOuJ7iX5zXwdp/WREQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=afOx1XFj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3f44000626bso558574f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758794649; x=1759399449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YyvVRav29kLqOT5Vy/6uWXxy4p2puZwG88xDDJQXI8=;
        b=afOx1XFjTdRM0+QvOqCA5QIe/iVQmyDXjb+Ggl+DVG6JN6gWQGvzApd4iWsPH5hkOT
         rVcUaF0kfKVDFx2UeuQlwGLNXWKZy3OXdPWQHBX9ZjwDKRRCRSW2rMcyA4Z7YZbTu40U
         3hYBxdWk2oUEBZoOR1ZSADX52StYWWhHG6NZCeubO4FjVD1n3nyhqkWI0EdJ7VbtOsLm
         YCNVcxC8LRlkmuLOEkcCYDOljC6r8BdZb+7DLBjORjNRGsbVyrer3MrkqVvC/NKf/YIi
         4I2M8aRw+5xG/GCYFG0axOi/duax0kAq8FT8MWBddOHi5tzqCORpxJJFcwsbekmk9Evr
         p3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758794649; x=1759399449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YyvVRav29kLqOT5Vy/6uWXxy4p2puZwG88xDDJQXI8=;
        b=FJwvRCJusLZHkbksQuEmzveItEA7DOX4HH7inry63i3AgIbG7QTUHEoEd6JGb98/Jm
         feGGE7z28NVAeaMApcLZDUO7dVW2vdBAvu3FmKvw11Vu8GmJNzqSL9HAPwgR2n4bIYTU
         ZG8WFkZxDkruW/r6UjuNAsMAKKqaMECo4jjpj+28S+YNCkIEwLlzn/zv3mWbrd2BgBWv
         8sgwrqe3ye8/f6UiB0QBio2lxjElZFvJHwRHYDVYHFt2352hsCSELlBpTmnthKZdgfds
         VBkBs2AnJdUs/Cfo71tPHZBOY7VTP8pBEUL6d628h76nJLgljW9xjYzGQMfM45AbmCst
         SwOg==
X-Forwarded-Encrypted: i=1; AJvYcCWYv7Y4vacAxMEfBxlqDZS9YcpeYCIuj4lZf8GvNFvpxY3jqXZH20PhDIaaq8Wxy7mCdfKnUA7d1EcIaB7bJMqGNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS9xFz57jZ88k9uM2qAGQ6gDtXbnX6oADVKMCGx9BSuAIUPnhH
	OTzgkAtvA+kNh0BgOKUyMPgIh5kr0tmghu7jyX5b2TUke16r4vSqZ3xPv2jJf4Sokik=
X-Gm-Gg: ASbGnctUIqPYW3maiopvB/eE7ZzfODUB/OOU7WjiHl1x9p3bQLGh1sQ2nCdOpljutnW
	3muNE43BrIhl4oWrpGPLTk2TKn3hdisjKpiCqAwdtdKaYNl6bXGH+OmVrihlWUuWs/62wH8Gb/2
	FoIBY2jZLd6LmWqKYGZbi0aR2QFpsrE+EtP5z0PrVl3wHOc3WnGueMrIgyzoX3bHUFmCeOduiMS
	OE5RqrpYGSHac9qABqxyG4xOnKckEsWvD066zBoYJByvE1vGyVHHuxblJ8dI/6/GmnG0OkdJh3+
	9xgHSohicmaFEDeZhsj5LnJok2TOJg5D3whj+gvMEX/CHY/9A+4m0l5aM1HVaZWxU9B2pTih/gM
	B+7z0LwIYN3+fcPCjzB4cZegr4tChMcFrcxIoPmGuO31sue6P9uO8
X-Google-Smtp-Source: AGHT+IERDCaOmw/P4P4Q05MdqPZfQ/2WYHrkfe9FFxi8U8hYp4D61H14IVLledsfc4L4egI5ILaAzA==
X-Received: by 2002:a05:6000:2285:b0:3ed:e1d8:bd72 with SMTP id ffacd0b85a97d-40e4364289amr2980328f8f.17.1758794649045;
        Thu, 25 Sep 2025 03:04:09 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb6b7sm2501122f8f.2.2025.09.25.03.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:04:08 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v7 6/7] arm64: dts: renesas: r9a08g045: Add USB support
Date: Thu, 25 Sep 2025 13:03:01 +0300
Message-ID: <20250925100302.3508038-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925100302.3508038-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250925100302.3508038-1-claudiu.beznea.uj@bp.renesas.com>
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v7:
- collected tags

Changes in v6:
- collected tags

Changes in v5:
- none

Changes in v4:
- dropped renesas,sysc-signals from usb2_phy0, usb2_phy1 nodes
- s/renesas,sysc-signals/renesas,sysc-pwrrdy/g

Changes in v3:
- changed the nodes order to keep similar nodes toghether

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 118 +++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 16e6ac614417..ab29b8365e26 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -717,6 +717,124 @@ eth1: ethernet@11c40000 {
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


