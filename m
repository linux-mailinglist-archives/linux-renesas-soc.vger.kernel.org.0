Return-Path: <linux-renesas-soc+bounces-26018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4738CD6B21
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 17:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5035D301F04C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 16:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0C03321BC;
	Mon, 22 Dec 2025 16:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxQ++bU6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD068287259
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 16:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766421771; cv=none; b=MQJuO66BMY/q00B9BYM4x84Bkf8PRA6vddUQyctEMvAk0Cjf5D4alQ5h7G7azEeqYc2q74y0B/RCHlmNCdA+u0OU6syT1Wj2rBQt+GnpKR+QJdP1b2G3LbReX0NJPaYX/AF0C7+DmeDOrvgvsH3z9Nh6bMbd5c2qTModXdUoj64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766421771; c=relaxed/simple;
	bh=0WAn6C37CbDvwdiRQPOJRz6sUJRlakSK8vPKhqCrSN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AhhPtqzJLXH1Ub1/jll1SQMMPXRtV4Zm/ucS4wZEcCU8YVH4pDff8sT4ZnKBcD7zfANuVwxo1THadaeNROZRdb3AHCclXG8NlKz4+ycvbh6iV/Ly1Hp5V6JMI32tvDpw4dhRRRVgUl4tmo9YSj36D/CFK0wEP2vCS12urWJyaaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxQ++bU6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso23971465e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 08:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766421768; x=1767026568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=si973vWeCiR1v+rHNO63rZ2hR6AefQe1/RG/WMjDXdw=;
        b=ZxQ++bU6V0ETnmmrzjxUFG21ncdlfjRxI547ODWZdd2y6tCPophl4zCPsT29cRmiC3
         4cnk2igcbV+U0F//dwBKUbnXfoAUMwyVPlE9LBHnwWh55qoPmonaAMyEf4gQxUUPavNm
         74ygngUdFIvvUOy6phcF+rHLS28L8m2yU6yHNYuUfCBzN9yu9aacKv3Go60AwkSoFkM5
         BWe3Ga0RkNScioc3sx+bQIPbrZ7Bik6DyC+Uv9pm1f7mMWpCeBrk2NltOzaeYwyAzvGo
         w7CkWc4PZ1HxKPjkBNhQku9PONYGgXVVuBxSnSZbYZq+KsOaGVNLOQMCIPVr7rtxFb94
         lEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421768; x=1767026568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=si973vWeCiR1v+rHNO63rZ2hR6AefQe1/RG/WMjDXdw=;
        b=GIycqUR5/kyy9H6Rsjq26FMSgFkBTXTANa5qB+ex3GMAyMMJW68uqzCRPPCLC3qMsL
         Lmnf0ZFCE1o3gSTUOnUzaA/DXDK7OPT8BPmjUhT0pAVLKOhVG6ISKBUMDHRfXwB2hlL+
         2EXx3XlYZzcUBUMIqHFhpsnrWYeaAJTQQia+MRyzEmNbN38anj70/FLzVcx20S6leBCh
         M5LESNCDQqp3WcK9BclBrjFr0ZATCoN7IMbcB7Hq2gq0GnuGjWWWiB9cHCYtygCkkd/+
         JmumHc2IN/+iIda0Z5KDJbaoTp/U1A0mC5RAFXZdT5FBIpefOryog6LmRu50QpyhDWeF
         xS7w==
X-Gm-Message-State: AOJu0YzGV912YnJsyZIsgQS3wHepwu5MmaNDVE2LYi364SpTtxGXIL6g
	030CJf+GGsuVdsUOSLBpLTGwQHB2CSFbj6a4L49Y1LF7yLy9YXtjGfFR
X-Gm-Gg: AY/fxX5QhnXmCO26GiYg64Thq1CG2GEYw+ftGcjtB0XHdP+H9bu5CrQ1nddermJ8yaQ
	xAOC2KIttfQ79K8L8ruhSNTOt+l+Ek2IH4RjFI12ZsGXHxtwv7ArKD2vc8PCGFFNAyaezs9R1Uc
	7RPS8M3F/GyVQ7FYCu3rtKbDnSyjDVE3FXNPZlVBGHfxClpHuoxYZjnEDR/cILqMZp7tNsXvTxF
	Ny/BdKYy9P1mXWeslMF94Ao1vcBzN3gm87IeAY3ip0ObDuJ7O3sD74vKb7chtK7QTNZfux7HD2N
	G7cSWERDeZM3r1wZyLKEobIz19SuHaOV5H8f05gobKACMJGHVqasFjEiExl4q2fKmLyNEiMfcl+
	lNxa7RCJheU/dRXgp1wYkY0YJi/BPSOLiPB7BLwJFnFgi2kiFO3IaUOnEIlMcECUjwUhZMrXpc3
	eKJVna4k+t0LHQD1RtS7Ljr1dGCsbESX/acUgv0jITK1RE7ZdRAvOEOlBk7uFxd9M63bxmUrx+Q
	a/9et0taAOzdjL/0TBPAdk=
X-Google-Smtp-Source: AGHT+IFtgl1k4kUQx/66Cgf2xabLzmUUShBwcrybjjVLBz+pTPgdnFP05VpbfKl7qm7Pm3GOLP8rSA==
X-Received: by 2002:a05:600c:1550:b0:47b:e29f:e067 with SMTP id 5b1f17b1804b1-47d195387ddmr111360545e9.6.1766421768030;
        Mon, 22 Dec 2025 08:42:48 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:4dd:df38:7864:a996])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193621c8sm196896685e9.7.2025.12.22.08.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:42:46 -0800 (PST)
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
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Add RSCI nodes
Date: Mon, 22 Dec 2025 16:42:37 +0000
Message-ID: <20251222164238.156985-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add RSCI nodes to RZ/V2N ("R9A09G056") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 220 +++++++++++++++++++++
 1 file changed, 220 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 5740f04a6222..35cd6b70856e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -922,6 +922,226 @@ i2c8: i2c@11c01000 {
 			status = "disabled";
 		};
 
+		rsci0: serial@12800c00 {
+			compatible = "renesas,r9a09g056-rsci", "renesas,r9a09g047-rsci";
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
+			compatible = "renesas,r9a09g056-rsci", "renesas,r9a09g047-rsci";
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
+			compatible = "renesas,r9a09g056-rsci", "renesas,r9a09g047-rsci";
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
+			compatible = "renesas,r9a09g056-rsci", "renesas,r9a09g047-rsci";
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
+			compatible = "renesas,r9a09g056-rsci", "renesas,r9a09g047-rsci";
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
+			compatible = "renesas,r9a09g056-rsci", "renesas,r9a09g047-rsci";
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
+			compatible = "renesas,r9a09g056-rsci", "renesas,r9a09g047-rsci";
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
+			compatible = "renesas,r9a09g056-rsci", "renesas,r9a09g047-rsci";
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
+			compatible = "renesas,r9a09g056-rsci", "renesas,r9a09g047-rsci";
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
+			compatible = "renesas,r9a09g056-rsci", "renesas,r9a09g047-rsci";
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
 			compatible = "renesas,r9a09g056-mali",
 				     "arm,mali-bifrost";
-- 
2.52.0


