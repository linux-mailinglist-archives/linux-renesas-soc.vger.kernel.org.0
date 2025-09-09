Return-Path: <linux-renesas-soc+bounces-21674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE48B504FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 20:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED3CD17B5A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 18:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD1236998D;
	Tue,  9 Sep 2025 18:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbSnTgrY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9193629B9;
	Tue,  9 Sep 2025 18:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441296; cv=none; b=K4jP0yBGC4A/L6hsdHU6dQvCSAzwnfTsS0dWeeOVXHSx4lKWZrwOKpkfsig7iobfszvHf6XGkz0mDI7eBOb7rmIzpk2H40d+eugKnfubac975EK0EgsFfpnk/ManlZTdPjCtZdI0pOekfpHOzt5Oulcedbf6ok4RQpuKQRZesII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441296; c=relaxed/simple;
	bh=TQv1j6VyQF0G0y7bsMfyc36APhlNI6wyLxKClHjRF14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+Z+vs1lV9YiSm4jsx5nnUfrUkkQMjcqkUPnAVVD17ztgSiWYrUC9pEYUWsRsLzALacLMwdRufqg0HSbESW0Au1CUhmvm0tR3aWARA/l/RnjOR+qIVvx2woQ4ljjPoCQF/56pE/WpfRE4TBm9ax7l6ELzx/fA/vrbARZ6URTlg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbSnTgrY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45debcea3aeso12873425e9.3;
        Tue, 09 Sep 2025 11:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757441293; x=1758046093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K31Z0WRlSoFH3e16X6uUUEsQvx75Rh0yFQ5KhuK0yHc=;
        b=dbSnTgrY0Be9hiNIaLlvdNs0f+5V4OchzcTcW6OUUkjO5jZyjv2vjybVFn1Mfp0mb0
         j4tO7WUTnS7ocRFQr+PFeMiqRv+V+riOyGTjIP0rZMI+hwp51UgC9tay7VZd9R06l45A
         JBev696e/avhePaR/Xki6Z4IuAEZxbtwD26FifGKtDDNJTttRALBYzYv4epUX3kgPoCm
         D4/zrWCy4FIAGWDiNCrjdk0C9jkGPtFrAU19e2ons8fwHpBwQqzMJLxZkqlTOUclhaCE
         77Rk/6u3pymGp+3TeFNQd+NYaMZcaD3Q5T0PmhCykHD625/7bL7JFADRqTXUMg73WuIW
         DhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441293; x=1758046093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K31Z0WRlSoFH3e16X6uUUEsQvx75Rh0yFQ5KhuK0yHc=;
        b=XWgSV/UiVZHpxjxJUxUNEJEPupfjxnSHm8WQnziRSN0X7SPFNyTRLI89HhOWXc4a7Q
         /3BkV5tn6oA65L11lmykVYDmhbxUJbuRcwJEGEisy3VWNF+gc5yarslP5kRCxTmTdQEz
         koLvKLb0/D435/plJispSZmWhQ+e4xydZE/mYBL5IaOZXFDnbOAoqCYDPSc2IlGJQkSZ
         4++4UB1p+8dSL8LJtjWpjJ+IlTMUMvrT5sFlC9O/2mPbsElYh2kQfpayHh4Mu0/DLezH
         OjwongPGn9R/x0agN5UfrpZMZbqgkleS+D7hK0lUkDU1eO6PjKXnZATHsQi9auTnqCdU
         Dnaw==
X-Forwarded-Encrypted: i=1; AJvYcCWC3j6SZOY95qNppZqBIp+ZJOVOSQZpv4CaLfM7aJLl3kwgVtwQViC9wXTY/uBkzR6wBQZ5hCAFg4JDNXCu@vger.kernel.org, AJvYcCWzR9p39RjQ8EMm6j22EgGRK9v0ILSpxrY45SYvtELRTn37a0IBA/4sQaYAY/Q3zcv6gD9SbsvIZSyN@vger.kernel.org, AJvYcCXUS7ekQ8GdfiUm+F17PCwOeXE5sP3P5h7FbcS67sC+m4Z2sQ8QF5Fn3wAh0DVyvGsebYnCNYr7bjgrPCAIclgfJ2I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrxu5Ym818ZGUT0tUvsYkrGsOeF022WEeJwE5BzvqGYASE4LbT
	i8RTTHrW6O0MYlqdc+l4lO3qprAWJGbhQTZxj7Kw8s4pDojt+dkOaPIi
X-Gm-Gg: ASbGncvfWdTDvaD7q7nN0Q+xoZZU+cCPyw8fIIXawkKvIQ4YNx/l3uPTt86cpkd20J9
	5RsndsZMgh8kVOOsGPd38acckghEWIanoD4qkLyQMe5zYuMZGA64GDk2PHBmBP5LS3XK/9WlKgS
	lwiTywMJq88BefhCQuA7q7unb3896wxkbwaAuCKz2qhwhTvA0OSJIqJOwp7KAu8bTOQwImUD1H4
	lBJX7XCrsIqVjwElMf+ewW1lHf4WXHlms5Y5CdkJ+vKB3PnegNkMBGWyhV/axjZS6XawM6HoJ2X
	Q6FxlRuYNvqAO3RlEiE9REOGcgU0pOow0WmY/In+tEOVpux0riyvpde+Pn1cO4XhBkeyarKmu4P
	hMA+btfRWWxahWi+odPBvbj0BGFWxH5VcMOeHXyzRTqmL4kwn4gIVybipXMGVp85n4hKZzamC+f
	OAwGvE1stF+xeY
X-Google-Smtp-Source: AGHT+IH+E+/N9guYX8udPu3ETkQFiY83YGPYfy2wXcTt1KUb6FlKN1ifr3sXuKOdekeOzAH5X9GnNQ==
X-Received: by 2002:a05:600c:548a:b0:45b:64bc:56ea with SMTP id 5b1f17b1804b1-45dddee9076mr101305565e9.23.1757441292492;
        Tue, 09 Sep 2025 11:08:12 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df679a4c9sm4174015e9.3.2025.09.09.11.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:08:12 -0700 (PDT)
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
Subject: [PATCH v2 09/11] arm64: dts: renesas: r9a09g047: Add USB3 PHY/Host nodes
Date: Tue,  9 Sep 2025 19:07:54 +0100
Message-ID: <20250909180803.140939-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
References: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * No change.
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


