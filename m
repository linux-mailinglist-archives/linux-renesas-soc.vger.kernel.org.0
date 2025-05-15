Return-Path: <linux-renesas-soc+bounces-17149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BA8AB8F27
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 20:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 717433AA8B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 18:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F7228642C;
	Thu, 15 May 2025 18:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mn0kAkTG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7014F2857DE;
	Thu, 15 May 2025 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333879; cv=none; b=iiThO0cjF1FQjD9h7Qe1+0YN344R/AyM4POV9fCAdCMZmfLiVa4hnEsfCmf4m6QDOoDc0ad9bEsSwmXHPwLgJcZ4fFVQp95ybIbkTeQq/daKxsOT7P32v2dVSFjxPrKqLqWUuP8hHt2ypnURoiXyvo6azuQMNt1k7Ug7JQPwKRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333879; c=relaxed/simple;
	bh=k4/UjGuCR90R813oJb+kcKG4YRAvU/QF+PoDqWduOD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NntD1+MP+rYA+ANC9Q60J/QGkfeU/gPr4H+/Pvh7Opw2ZcpgKYeEVHgwvWGw6IJjmt0Med5vLkpQdbD/cMKrbQGvMPOatcps5FjXH2aWMQ+SUW0bQu5AHh4LHD5dWj0DagnQOO2A9YQdCPBBkvL3b9miGteiYPt3rvyU0n4XrQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mn0kAkTG; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0b9625735so847225f8f.2;
        Thu, 15 May 2025 11:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747333875; x=1747938675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjhSvSz0wM17cfwfMJwAnkMdQuGYA3rYJZzkeg35A9k=;
        b=Mn0kAkTGQtLY+Tk5aSOyBIKBd402yd//iyFuJ8472/dXlp7GZPnpEvGk2RVZeaNInm
         qiOrifw4LEQQi+CsuSn67JrM9n8MAvn/m8q6qMWdG1MosK+HFZYEEX56zksAq7TnGccC
         DnSlhn+b6f6jawMQ15UfxjvIyHUP29LxKSUiJIx4ruFgPgpu9h/77FIqAIi9xbX8gRJ1
         EqLhCYkJq0DLyEytC0GQtV3LLe03270niFms0D3Rn0WDvBdJIdkbhCyXx8igI0f863bF
         7Lu5DtYWli77L+MPZliiPyd5IWRAJImxbNGyWMISytatcPNXwJKF+gFV6QesJNDYScr3
         JQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333875; x=1747938675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjhSvSz0wM17cfwfMJwAnkMdQuGYA3rYJZzkeg35A9k=;
        b=gStw/cLeXJzCfxsPQo//N5+VZ4PpQpxLhnHK7zJDBhUC+Xs21kRxD7EYrdYD9XuRB5
         BdGDVyjVWPlyLWOBJWyoP0tBO0ofNZ6UjcU9FQoBjPajGuY1TFSRfNPkfxYJuuueIllj
         1g5hCkSEK8hZV9Jzpyn/BOoPe9J3tZp13w6fqkhfCASVgPiKSkeN85zPLaqeui9T+KoL
         EMeEt6D4WgUPUlK8DbnkVquCLZ2Fb2G+qDkfCLZ0NL17Qh+Qu8Y2Gt3xGZAVgjrNxQ+j
         fJIVgpwH+4dCgud9t+YlRJ3XjOD/4dPYFdfO6LP+BilwclWDWkvkJOrmo+bwsr4UxMeb
         FLYw==
X-Forwarded-Encrypted: i=1; AJvYcCUYdmfNwLs7MIAHfsbsMFDyAc8SV1w84wOpOK5O2L1XM60oPfFAh4FFB386qV/3D+048LNcQmxvooFQ@vger.kernel.org, AJvYcCWMmOsba0kbM+xG+fqCfxC5vLI4Dup4Whte8Vok6mdbWJBHqroF77TgTbmPorQjj4N1lpRyEzyyEsU39cnv@vger.kernel.org
X-Gm-Message-State: AOJu0YwNol++azt6dmQ+tUtnSXsZF0IWbNDgwnWKCoDbFqwh90sfnBzH
	4tszcgjcNxCX23yAXWklozrOTyNWOUKmpy5lrzWVhPpDxHZxyd7pn/qC
X-Gm-Gg: ASbGncut+WB/baFKJKCkUL4xwjrpJDdohZ8E6mwFlo47plQNaynU95kR+uIdfWQLylb
	hW1GX9SaI2YV/T2064v1vFsmB/uX35PsmPFZBlJ8R/rVKTIFB7Lpx2ByQ73ex9ssRnRY8NEbP9K
	wWtmf7U7Wz67yGChDImjd7F/mp1Ts0LaewT0iKmG7mgbZ0MKFssqwXFqw1tFDBDkeRSIAP5hYrc
	gT2Zud93WMqcG0VenEd/JRrrlmwimzoxjABe6BHG96P4ixNFgQyB3Mn3PM6Ah/5eq3x6SCrmvIJ
	LRiqXulFTBkXA0Kv19ioAalpXsREA5b5LN5JSULufXiyK28e0Ph5XGz3JvPX10hyUdYz7FYAjOl
	Dh5LUjDr2
X-Google-Smtp-Source: AGHT+IHt2qLLSU66BWSWAiBUp39FhKD+3w33RyzJ8Lj+beG+tCC6eBu/Uyl2fPObBXFklJlvwk+0gg==
X-Received: by 2002:a05:6000:290e:b0:3a3:4ba4:e87b with SMTP id ffacd0b85a97d-3a35c857ffcmr877911f8f.55.1747333875417;
        Thu, 15 May 2025 11:31:15 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7b5:b9aa:961b:d080])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d012sm262816f8f.94.2025.05.15.11.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:31:14 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add USB2.0 support
Date: Thu, 15 May 2025 19:31:03 +0100
Message-ID: <20250515183104.330964-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515183104.330964-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250515183104.330964-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The Renesas RZ/V2H(P) ("R9A09G057") SoC supports 1x channel with OTG/DRD
and 1x channel with host interface.

Add the ECHI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
in R9A09G057 SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index a7574ddd216f..37851342ed9d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -662,6 +662,119 @@ sdhi0_vqmmc: vqmmc-regulator {
 			};
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
+		ohci1: usb@15810000 {
+			compatible = "generic-ohci";
+			reg = <0 0x15810000 0 0x100>;
+			interrupts = <GIC_SPI 747 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>, <&cpg CPG_MOD 0xb7>;
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			phys = <&usb2_phy1 1>;
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
+		ehci1: usb@15810100 {
+			compatible = "generic-ehci";
+			reg = <0 0x15810100 0 0x100>;
+			interrupts = <GIC_SPI 748 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>, <&cpg CPG_MOD 0xb7>;
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@15800200 {
+			compatible = "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15800200 0 0x700>;
+			interrupts = <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>,
+				 <&cpg CPG_CORE R9A09G057_USB2_0_CLK_CORE0>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb20phyrst>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy1: usb-phy@15810200 {
+			compatible = "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15810200 0 0x700>;
+			interrupts = <GIC_SPI 750 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>,
+				 <&cpg CPG_CORE R9A09G057_USB2_0_CLK_CORE1>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb21phyrst>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		hsusb: usb@15820000 {
+			compatible = "renesas,usbhs-r9a09g057",
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
+			compatible = "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15830000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb6>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			status = "disabled";
+		};
+
+		usb21phyrst: usb21phy-reset@15840000 {
+			compatible = "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15840000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb7>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			status = "disabled";
+		};
+
 		sdhi1: mmc@15c10000 {
 			compatible = "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c10000 0 0x10000>;
-- 
2.49.0


