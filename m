Return-Path: <linux-renesas-soc+bounces-25141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D1AC87638
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 23:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ED2FD4E172B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 22:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FD62F1FD5;
	Tue, 25 Nov 2025 22:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aN23tLSg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D502EDD41
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 22:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764110754; cv=none; b=HV79Z0btFsQLHsQh29pPGgUuuvJjp2tkryk8amVHpD7hEK4LXAU0bchnI+RkKVu6B6MwfRfytZIlZC40mJa1gSI9dib22zq+tdnx//AIUptwxAwf45b9MXFvYMXOO2Whkrg9OVxxplWIK2ZeSmbc8skEEU7JYBOemddjUFTK70E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764110754; c=relaxed/simple;
	bh=3/rIEhC0xuheQHUU32yqYMWWHNgJNN9Nf0OFWLpgL/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TC0d5jPznrqSZ3OjyUh1VrXmCbcjTbj18AgQrFUE9FY9RZIo7rOONIg0CFEwJbDzGkznHs7IplYySlqrgjCJT4SexXLS94ejx6VZH0kX3IOwQZG17vYNDpRz5Tk1BFHcA9piGi0pzpgKDp8YTIE1PApWBJuB8van4z+cl+6pjIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aN23tLSg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso29183455e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 14:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764110751; x=1764715551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3C5M8y37+ez4uTczGTGPTQ1B9MB3E5E+yiq8CBo+Vbw=;
        b=aN23tLSgyBR09E3LKgO2xBgxlSefP+v0FiHyA3Wt+lRfZDJ/dOb6v2cnczUV28nGDR
         /znQ0clngdJXbuQov4kZ36BadjsX40dzKX3Fn6k6rI/plMPsv1bTSqJryESXJtpoOLwt
         U5AE7Ks5PAIpY3hpaC1uy5t8lTWN37K4EcJBBi5gw+monB1kb6O7nwcvULOleU0uYZUI
         xc41IchKIYzkLchCuiPOmieaoFz6V+E70yQfm1zw/gBWi0Qp7Hk9itnvbNvzLX3GYz7Z
         fKxGea/Kv175Lo+7ekp0vVUK2hS+lEoKTdS34ddZqgQYOPKHTqx8F2MLj/VqYVe/aO8X
         ZZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764110751; x=1764715551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3C5M8y37+ez4uTczGTGPTQ1B9MB3E5E+yiq8CBo+Vbw=;
        b=r+IxcXQgDJdEd/Jj5blUL5J7PzOPbXTpGItY1t4dQJgV8rYf4+HjuAiQGL3FPYw2j3
         09IbyAG50W+BRqqfOdGR9Mt7vBkuGjSyueWJR2YbCZmeSUjMO7Muo8NJ0ZeodNV/DlYS
         EWamPVgeMvZK5luJaSitfZR+L0z/1dAuvi8oG355AI0s/pGy+keb9Q6+lUKAtjMQVcs6
         ljxrIrvzKnFlJlZgIicibvR3cZiwh3Uvgq5Bny9FdHUoO0Pb7iixIu13hLGsaSVapzUW
         UN4YORE7x6ozEaaMXcCb8qXgwmYYuwEyfQ5bQQ95NEo1jlxBVWJl0aeeDY2vgYrVyVyd
         EJhA==
X-Gm-Message-State: AOJu0YzhsedFgQQlXO48EEj10l+AHi/Iz4Uruxubcya+tgxLZ7s/rzdZ
	3dVzcjGujpfBH2GOVKYNayL7tL2lADadBaOSjVycYn5BgPsu4vwBB9cg
X-Gm-Gg: ASbGnctPOnfva0ztRLs6aN2KEaQPP49Kuv06OVTLPNzBu0sI6ykkSNc7lmrLw6mnb2i
	7Qts43hLSBiBKvqJNkH1qhbkrBb5BL7j7OONsSDc4Zq13ZoD5RHceAuzVwaQmm9s2UvY7UAMlUY
	rf6DMz5uKGHTZLNzjEVFljmT8xU+n/SSRkSb033LAYiv7KGrf9+J7Yb1G/0sgCogqEKwsrP3VZA
	MSDLm5E37dT4NfoeGqKRi05WWmGCL1rDbc8qvRF+zBBHmb6kI3dB2jFwNVmcCtVxjcvLThtAOda
	e0EaHZRkuFL81RrydVZcv9xVBZ4h5ltEOTh6YJykYJa/8IqJWdL3eA5N/E/K7y9ANOyhgZWxFZW
	He0l8rbVsvoxOdwwKzJ/lWpC7JfPJ/f/hNnzrnvlMf9xxvKMksqoZQqxruuPkn8TBmZLRqtzpui
	93tQtBuldLm1Vo3E/56T7NvNmwTkTpxmVAwX9DRdYSAZpu
X-Google-Smtp-Source: AGHT+IHz93gGWpc3bGhneuc48VpHTscGDxInYbxKHRqvZzqJ5xhTXmq50gs73XgU6Oih+B/VPUQZ7A==
X-Received: by 2002:a05:600c:4ece:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-477c115db0cmr191424555e9.31.1764110750744;
        Tue, 25 Nov 2025 14:45:50 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:325:d7d3:d337:f08b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc5ea6sm11683045e9.3.2025.11.25.14.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:45:50 -0800 (PST)
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
Subject: [PATCH 3/4] arm64: dts: renesas: r9a09g056: Add RSPI nodes
Date: Tue, 25 Nov 2025 22:45:32 +0000
Message-ID: <20251125224533.294235-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251125224533.294235-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251125224533.294235-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add nodes for the RSPI IPs found in the Renesas RZ/V2N SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 878e14f5e560..910723133715 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -664,6 +664,69 @@ i3c: i3c@12400000 {
 			status = "disabled";
 		};
 
+		rspi0: spi@12800000 {
+			compatible = "renesas,r9a09g056-rspi",  "renesas,r9a09g057-rspi";
+			reg = <0x0 0x12800000 0x0 0x400>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 107 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 500 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 501 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD 0x54>,
+				 <&cpg CPG_MOD 0x55>,
+				 <&cpg CPG_MOD 0x56>;
+			clock-names = "pclk", "pclk_sfr", "tclk";
+			resets = <&cpg 0x7b>, <&cpg 0x7c>;
+			reset-names = "presetn", "tresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rspi1: spi@12800400 {
+			compatible = "renesas,r9a09g056-rspi",  "renesas,r9a09g057-rspi";
+			reg = <0x0 0x12800400 0x0 0x400>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 502 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 503 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD 0x57>,
+				 <&cpg CPG_MOD 0x58>,
+				 <&cpg CPG_MOD 0x59>;
+			clock-names = "pclk", "pclk_sfr", "tclk";
+			resets = <&cpg 0x7d>, <&cpg 0x7e>;
+			reset-names = "presetn", "tresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rspi2: spi@12800800 {
+			compatible = "renesas,r9a09g056-rspi",  "renesas,r9a09g057-rspi";
+			reg = <0x0 0x12800800 0x0 0x400>;
+			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 504 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 505 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD 0x5a>,
+				 <&cpg CPG_MOD 0x5b>,
+				 <&cpg CPG_MOD 0x5c>;
+			clock-names = "pclk", "pclk_sfr", "tclk";
+			resets = <&cpg 0x7f>, <&cpg 0x80>;
+			reset-names = "presetn", "tresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@14400400 {
 			compatible = "renesas,riic-r9a09g056", "renesas,riic-r9a09g057";
 			reg = <0 0x14400400 0 0x400>;
-- 
2.52.0


