Return-Path: <linux-renesas-soc+bounces-24049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 670E9C2DFAA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 21:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 10CD74EFE02
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 20:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE0821ABD7;
	Mon,  3 Nov 2025 20:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFPHBCqC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7954D23EA80
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 20:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762200274; cv=none; b=GbzxhBr8TpKGhylGbdB6TsRnvqIzmONL0wAjWOcqP/fUg9uNlFoFoC1vy/VdXmu8U5msgLv8P3QRrvgr9oWtCfSYGqO2+vbm2FoVd92cdkrtkALBtl3lqnW/PxYrUhdtOM0oRG/rEM1PYrOYtOSnxi8WbKPjtlrN2oYaLtVREKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762200274; c=relaxed/simple;
	bh=QLYFPz+iYP5CjA9fN/raAFqjs9deftRM7H/UAUtODdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lEqylUXDFXe29eX7ldVcmiX6O6I3w+xRv+6JPNLmhUrKORMM45WKqjI6wZcwEzXU4defPmwQK0CDE0C8aFkzgv5RSo2DYWxXS43UmYlM+tEtefrsh9cBgOSrqojXiDWq71JBh2/SbQwozHdgHEExEeA5qsUcyFLhgAGXWj6psOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFPHBCqC; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2947d345949so42333935ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Nov 2025 12:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762200273; x=1762805073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jh3uwPLmYR07dlhjkDymOyq+/CPc5KFjXFc3K+Rn6uQ=;
        b=CFPHBCqCYM8YJGJTmO6oZUo+Gi7BXzq6lDr9zmg1//y1rr1o7HlecgSVWodxiO8R4O
         nKkLe3/RJoRrnHU3BVx4O3KoHspir2QyBuijKEJ5iytpMXZ4DL41UuRB4B9pCEuXO4Do
         t4IIQnL7IuUD5eIwMA/PQbwydVCz/YVZV/LfPmWldv8XfF+58SD88LbW7PSWZ4n/KDTE
         F72zwEbzK3ZXV1g1dnD/0Qjb+EaIVcvi7Mn0d6O9YNPiK7cQ1AG64VkGIF3vMz3iHbdx
         3wk7MCn1h8eXIcTVrkK5t2r36qBIEf90fd06R+6biCSncJQrhxIIo762//5c7FZwzifT
         VwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762200273; x=1762805073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jh3uwPLmYR07dlhjkDymOyq+/CPc5KFjXFc3K+Rn6uQ=;
        b=q/elp1z4/+/yuEbtX61yWB3C5rn0k7J4smIobxkPwSmOUg15zCtkIl62uhAtDs3ws8
         wK1NokHfxrqCa+hYYasF9qdKBWJSjjYPQzKlEhvqBLJ/MlLXQmvElyDLTCCMLIC0nRAz
         76c+mcJmdspBBe63F89hc1yc/tKzfM+HTQMy0CccQQ0Rhlajb60zj/R3DpeAd0U8J1ve
         S/RM3DyzhGn8FntmeTCW4Xf69d+FPf4yh9AyX/2byXCLD0XH4ujEI4apSHdJdflyzZiE
         yyf5oTY7eRTLCFLO+80Ge4ZgwkWB0hiKmdvyDAxm9LtyS2j/JZwcegjDo0uZjWFlWCl2
         6GZQ==
X-Gm-Message-State: AOJu0YwwDQVqJvJYwEe9k6ZnTv4V4TA2yRg33Lwlddo/m1veArNzD0Tv
	zJ1+v3bm5IkOwDtopxFwDSnVJySMzLvO4oUrgpS2MdfK9jC8oqMW9CMA
X-Gm-Gg: ASbGnctbnY4uE3COelF1CCZt1hLll0R+3GtVDHgmTpo26KVy4RALoGLM8h1/OWyYyNC
	se22fF359/qlKFXLYgUvPkRt8BR9YBPZZKzjR30ntQYFDJqrSIdFwDRivCtziqIp/M1fgMa1JF8
	rZffHPtRRyvisuggf81AKQhYxUdMo5a8YllSOqIwv3AymvagPJD90wGrYy2aqPv10WRmszqpCjT
	AmqW35hb0UyqfiXHPozrrttbXX8L14+Ykj5fryIgOaKPu2A7/xlKiE8TeXBxDXdY2KIc0aWSAbH
	Y5gvuLUvIKtWoqIlt04OsQmm738Kb7x9qGXQ0vJTAj9FD52ZsLR4Qw16JUBfMwNTYHV90rDuIWj
	fB+qVQRyUxnzlEqA7ioOxDix8k8Zq2GTwZ331Aw3Npg/SrGx6DZIj7m/B+vV4gMS6xQD9wZW1wP
	PlKJf57LkFIUp6OQ6fwgPbw1jh4d32ex6x2kUqKcb03Q==
X-Google-Smtp-Source: AGHT+IHUWa64MAKdOLu6VI/4meUcfZ5QKprxUjp2FXrj9UBY+kBU1nKWPbnLHdfg53QEZjhB1qdhsg==
X-Received: by 2002:a17:902:ec81:b0:288:5d07:8a8f with SMTP id d9443c01a7336-2951a3d0b6amr160180325ad.24.1762200271921;
        Mon, 03 Nov 2025 12:04:31 -0800 (PST)
Received: from iku.. ([2401:4900:1c06:600d:df45:8e1:7a61:1482])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952774570bsm127494895ad.99.2025.11.03.12.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:04:31 -0800 (PST)
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
Subject: [PATCH 2/3] arm64: dts: renesas: r9a09g056: Add DU and DSI nodes
Date: Mon,  3 Nov 2025 20:03:48 +0000
Message-ID: <20251103200349.62087-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103200349.62087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251103200349.62087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add DU and DSI nodes to RZ/V2N SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 32a8005058f8..68f7a8b68d91 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -958,6 +958,71 @@ queue3 {
 			};
 		};
 
+		dsi: dsi@16430000 {
+			compatible = "renesas,r9a09g056-mipi-dsi", "renesas,r9a09g057-mipi-dsi";
+			reg = <0 0x16430000 0 0x20000>;
+			interrupts = <GIC_SPI 874 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 875 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 876 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 877 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 878 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 879 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 880 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "seq0", "seq1", "vin1", "rcv",
+					  "ferr", "ppi", "debug";
+			clocks = <&cpg CPG_MOD 0xec>, <&cpg CPG_MOD 0xe9>,
+				 <&cpg CPG_MOD 0xe8>, <&cpg CPG_MOD 0xea>,
+				 <&cpg CPG_MOD 0xeb>;
+			clock-names = "pllrefclk", "aclk", "pclk", "vclk", "lpclk";
+			resets = <&cpg 0xd8>, <&cpg 0xd7>;
+			reset-names = "arst", "prst";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in: endpoint {
+						remote-endpoint = <&du_out_dsi>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi_out: endpoint {
+					};
+				};
+			};
+		};
+
+		du: display@16460000 {
+			compatible = "renesas,r9a09g056-du", "renesas,r9a09g057-du";
+			reg = <0 0x16460000 0 0x10000>;
+			interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xed>, <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xdc>;
+			renesas,vsps = <&vspd 0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_dsi: endpoint {
+						remote-endpoint = <&dsi_in>;
+					};
+				};
+			};
+		};
+
 		fcpvd: fcp@16470000 {
 			compatible = "renesas,r9a09g056-fcpvd", "renesas,fcpv";
 			reg = <0 0x16470000 0 0x10000>;
-- 
2.43.0


