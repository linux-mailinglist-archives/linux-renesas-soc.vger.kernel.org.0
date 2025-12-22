Return-Path: <linux-renesas-soc+bounces-26019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E646BCD6B27
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 17:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27C1E3014103
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 16:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9E53321CE;
	Mon, 22 Dec 2025 16:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPs1OpMC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E143321DC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 16:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766421773; cv=none; b=m0AGFMIpHZPLBxnIIxBU6+yZEMsCMRb3crjwiGyg8W9A3jJ/3zYaSE9alBdoH7dXmSJAOg8OJ6L/MURizHFa2l3azhNC6vRTgm5yS3YKto1R5Mk8r5HI/WxLS2Eha7rzstcjflDMre62jZlXcWL5LoDf9oi6vGvJJMvB/HhMSQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766421773; c=relaxed/simple;
	bh=NAjUB/C3OUr4PxeiYgXoqhdWOpzIYfrxxb6hbE0EQO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iyK2my095IH0k70fDbmom+vs53WlsouD96rcco0xVRMsnWPO8+2kxA0jghOHZTOszk3+xMUSqR+GvfbLR04yMv9TzOnZVRZ3+z1/5iRnASe7HkMomwWMX5M/e5xTmKmBV5iCdlLMSW3y5b4q011SP+J/O/iKL/s6z6yj7fusghE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPs1OpMC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477b91680f8so35186515e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 08:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766421769; x=1767026569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rmP0GjE7trXn8ElgL+MNSAmFgZRUQZF4nxVn+pMLro=;
        b=OPs1OpMCBxOZzCykESHgCitctvXXZQo6WYnZOKy/gyGFAZT6+2SoqawVzngbkZjEHf
         2H5CrtouyCQ+xXheHZETxqRe2x+O2GMn9BAAsWGDqqdJNGL315vX7lghot5nT1fVvlS9
         VCZRttaTDc0Zq9A0PSvCuJttkR025LHxs/MmrdXhKBisNhVYLRkT0AB+N5LpQjkR4K0E
         YM+1KcCCVu04RPKxa3CTlvoWuVtNkxvRHu+ZBaHunOLgaKj9d+B8rXeHrtbWBcdRrZhZ
         XYbi7+qlAabfiDsHLkRHyB2Ev/RorZo3udj5qoBYlCGrqYf/gqm/MsTOWMRUX8UPNPgJ
         9xkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421769; x=1767026569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5rmP0GjE7trXn8ElgL+MNSAmFgZRUQZF4nxVn+pMLro=;
        b=vE6HxQjBgP69B8EGbzP1N+2O0c9tzeszhnVE24O12mPRIJ120tOLqTtERdzJQCqLl0
         32SJHbTBDTjMpxNpeAPjTk2ZVqAg5sRDJTnNM+dbrtL07NFbT+jk/OMIREm01ZOTyuZl
         uVKJUyZknr00SxNQDZH2TdD4B5nYJ0zf02YibBK1a6NMsYPrtynbnBVXc6HOFfDhoRq8
         iIQQLbshqDtHUA36HMJmYV+mOLuFeycQ/6ChLBKFru86EglgPAxgNnAL/vArjL3vJR/d
         NJbC31U+CjkfhrH0DvepyOIy2mBXCVViEDMWvz/WCwix4564Rmhp0LkGW/IhqpNfOOge
         LU/g==
X-Gm-Message-State: AOJu0Yx3C1aXUiiFb4OdrbdXQD/du+SI6xfbe9oszw1rW8uq5FUKDKB8
	jdjNfBXS8vwP2hmpz0jgJgU2+d4bO4RQnQHh1ZmvkMPXyfp+xJ/CdKFU2rWgHL5+4qk=
X-Gm-Gg: AY/fxX7u30X1WK1CXSbn2HUcmMtG6sn9xtPnhCP3YW+j4Xc+V+HWOt5NRJp0+MWRVoY
	WoeCvkphnSsso0u+i5yYzYkL8TXx+diqLyOn5JQp49voTy6jugEjJw1V71juj6cCJHNhTh68WNr
	P8hWwdmLSvKUBfi+8oHhfH5n0FK1wkN4V6eDk3gx6KPWJVGqCKfTePF73hQeQogjxrLWyIJXtTF
	2HNrTu21RcIiXSpIZlBnqPxzEYS/EBkboegifZ8MFkaNzqgE3DCk82+Qfcx0lMyVeTO2ARwtmDI
	3IgPM/zVj5crQbpCZcTHWWQ0UZllRMZhx6x1wH+8UdPiI6mp18a+14Cdv69yEgLw3D8U7/toZYp
	19LiG74ISMTaastfr1D6zmbmfgA6CNgu09GllPt746Vkzn9Mi4db2eeeezT84djT/tEd+FV2v9X
	X7zLDC+m+wwBH2cb1FjvWijeKRuXipcGToUKJ4BRFbCjLKA97M1S1bPO//Ubc+71Q3VCHFsoeuY
	BP5QxEcgfx3KkYcJb2Ku10I9Vm4yPhzuQ==
X-Google-Smtp-Source: AGHT+IGVI/5VbHwMj1aHDV1E9cdXWSa077ceUrM5T9XA29CBFfaHx9LYNl4J+hOuSYlw4PH2FIM9IQ==
X-Received: by 2002:a05:600c:45c8:b0:477:7c45:87b2 with SMTP id 5b1f17b1804b1-47d195843e7mr116578825e9.16.1766421768796;
        Mon, 22 Dec 2025 08:42:48 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:4dd:df38:7864:a996])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193621c8sm196896685e9.7.2025.12.22.08.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:42:48 -0800 (PST)
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
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g057: Add RSCI nodes
Date: Mon, 22 Dec 2025 16:42:38 +0000
Message-ID: <20251222164238.156985-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222164238.156985-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251222164238.156985-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add RSCI nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 220 +++++++++++++++++++++
 1 file changed, 220 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 9587733ce04a..4a0f34ee8560 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -948,6 +948,226 @@ i2c8: i2c@11c01000 {
 			status = "disabled";
 		};
 
+		rsci0: serial@12800c00 {
+			compatible = "renesas,r9a09g057-rsci", "renesas,r9a09g047-rsci";
+			reg = <0 0x12800c00 0 0x400>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 115 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 116 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD 0x5d>, <&cpg CPG_MOD 0x5e>,
+				 <&cpg CPG_MOD 0x61>, <&cpg CPG_MOD 0x60>,
+				 <&cpg CPG_MOD 0x5f>;
+			clock-names = "pclk", "tclk", "tclk_div4",
+				      "tclk_div16", "tclk_div64";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x81>, <&cpg 0x82>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci1: serial@12801000 {
+			compatible = "renesas,r9a09g057-rsci", "renesas,r9a09g047-rsci";
+			reg = <0 0x12801000 0 0x400>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 124 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD 0x62>, <&cpg CPG_MOD 0x63>,
+				 <&cpg CPG_MOD 0x66>, <&cpg CPG_MOD 0x65>,
+				 <&cpg CPG_MOD 0x64>;
+			clock-names = "pclk", "tclk", "tclk_div4",
+				      "tclk_div16", "tclk_div64";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x83>, <&cpg 0x84>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci2: serial@12801400 {
+			compatible = "renesas,r9a09g057-rsci", "renesas,r9a09g047-rsci";
+			reg = <0 0x12801400 0 0x400>;
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 128 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD 0x67>, <&cpg CPG_MOD 0x68>,
+				 <&cpg CPG_MOD 0x6b>, <&cpg CPG_MOD 0x6a>,
+				 <&cpg CPG_MOD 0x69>;
+			clock-names = "pclk", "tclk", "tclk_div4",
+				      "tclk_div16", "tclk_div64";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x85>, <&cpg 0x86>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci3: serial@12801800 {
+			compatible = "renesas,r9a09g057-rsci", "renesas,r9a09g047-rsci";
+			reg = <0 0x12801800 0 0x400>;
+			interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 136 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD 0x6c>, <&cpg CPG_MOD 0x6d>,
+				 <&cpg CPG_MOD 0x70>, <&cpg CPG_MOD 0x6f>,
+				 <&cpg CPG_MOD 0x6e>;
+			clock-names = "pclk", "tclk", "tclk_div4",
+				      "tclk_div16", "tclk_div64";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x87>, <&cpg 0x88>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci4: serial@12801c00 {
+			compatible = "renesas,r9a09g057-rsci", "renesas,r9a09g047-rsci";
+			reg = <0 0x12801c00 0 0x400>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 140 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD 0x71>, <&cpg CPG_MOD 0x72>,
+				 <&cpg CPG_MOD 0x75>, <&cpg CPG_MOD 0x74>,
+				 <&cpg CPG_MOD 0x73>;
+			clock-names = "pclk", "tclk", "tclk_div4",
+				      "tclk_div16", "tclk_div64";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x89>, <&cpg 0x8a>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci5: serial@12802000 {
+			compatible = "renesas,r9a09g057-rsci", "renesas,r9a09g047-rsci";
+			reg = <0 0x12802000 0 0x400>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 146 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD 0x76>, <&cpg CPG_MOD 0x77>,
+				 <&cpg CPG_MOD 0x7a>, <&cpg CPG_MOD 0x79>,
+				 <&cpg CPG_MOD 0x78>;
+			clock-names = "pclk", "tclk", "tclk_div4",
+				      "tclk_div16", "tclk_div64";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x8b>, <&cpg 0x8c>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci6: serial@12802400 {
+			compatible = "renesas,r9a09g057-rsci", "renesas,r9a09g047-rsci";
+			reg = <0 0x12802400 0 0x400>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 152 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 154 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD 0x7b>, <&cpg CPG_MOD 0x7c>,
+				 <&cpg CPG_MOD 0x7f>, <&cpg CPG_MOD 0x7e>,
+				 <&cpg CPG_MOD 0x7d>;
+			clock-names = "pclk", "tclk", "tclk_div4",
+				      "tclk_div16", "tclk_div64";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x8d>, <&cpg 0x8e>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci7: serial@12802800 {
+			compatible = "renesas,r9a09g057-rsci", "renesas,r9a09g047-rsci";
+			reg = <0 0x12802800 0 0x400>;
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 160 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD 0x80>, <&cpg CPG_MOD 0x81>,
+				 <&cpg CPG_MOD 0x84>, <&cpg CPG_MOD 0x83>,
+				 <&cpg CPG_MOD 0x82>;
+			clock-names = "pclk", "tclk", "tclk_div4",
+				      "tclk_div16", "tclk_div64";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x8f>, <&cpg 0x90>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci8: serial@12802c00 {
+			compatible = "renesas,r9a09g057-rsci", "renesas,r9a09g047-rsci";
+			reg = <0 0x12802c00 0 0x400>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 163 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 164 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 166 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD 0x85>, <&cpg CPG_MOD 0x86>,
+				 <&cpg CPG_MOD 0x89>, <&cpg CPG_MOD 0x88>,
+				 <&cpg CPG_MOD 0x87>;
+			clock-names = "pclk", "tclk", "tclk_div4",
+				      "tclk_div16", "tclk_div64";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x91>, <&cpg 0x92>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci9: serial@12803000 {
+			compatible = "renesas,r9a09g057-rsci", "renesas,r9a09g047-rsci";
+			reg = <0 0x12803000 0 0x400>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD 0x8a>, <&cpg CPG_MOD 0x8b>,
+				 <&cpg CPG_MOD 0x8e>, <&cpg CPG_MOD 0x8d>,
+				 <&cpg CPG_MOD 0x8c>;
+			clock-names = "pclk", "tclk", "tclk_div4",
+				      "tclk_div16", "tclk_div64";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x93>, <&cpg 0x94>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
 		gpu: gpu@14850000 {
 			compatible = "renesas,r9a09g057-mali",
 				     "arm,mali-bifrost";
-- 
2.52.0


