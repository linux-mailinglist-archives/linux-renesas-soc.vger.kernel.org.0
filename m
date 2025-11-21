Return-Path: <linux-renesas-soc+bounces-24985-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C59D8C7ABD3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 17:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7941E4EB391
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BBA34DCC7;
	Fri, 21 Nov 2025 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Il5HElpt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D7034A77F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 16:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741334; cv=none; b=VJdenykY+FM4ccd8yz110kOyn/HGndiE6LyvYnl9RD34OIQS2TskazFA8HUb381mAx7tTw7/MiOt5A5R03TZsSDsDGmoIjScSeHL2M1mno6u60gzBh6bNCPfaPfnuqoDSuDiw2/GxVT0s/3rz4SOFbzVMNSM7nNiANUDc/58VHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741334; c=relaxed/simple;
	bh=uYGyNFF/e2FXi32LKj2Hz5o28vYJmJ2ToYK1UTPHwD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJAPHdX+icL5M0DASl1SuYI3BSCaBG4ZxR9qNAkG9WHSs/MgWqRDltyJKSCPSoRCIhcnxEZBfwYKmm2ZIj+e4COr3zXskWJf1c2bqvrvmfmvBeyZ+7f2eYz9MTO9JHMiY8Y7wi1+wBKik8NbfJIZxYj7cIFoGQFgLrTaWBo7H18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Il5HElpt; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779a637712so14330335e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741329; x=1764346129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0Qa+rIdxIz/npk54kfvyvMz12yBrI1lLKupWZkvgr0=;
        b=Il5HElptYnmna02dkm1/z+LzRcgH1fw8vBRlnK6V0CqEeZoecjc9AYBrE8xTop8u9H
         XzM5JU/kv0hbzRtgLjoTnYynzk9fqPbhBJW/be9/FJZMWB0sOi1cIzyuFvzBYZN+8gHf
         Cs6FR/8P6sZo+ltoaPlR8BT/yskQZ70XZWKgi+P8g0kHIXEUPqp6PU3+CJfxuuGPCkXt
         VKFEx503J8o1dwQjMz1Daxcv1nQ2K+IAUcDOOyHjf6IFEfaOzOhaQ3rZNEj31mywIZvE
         qg1GcfUa3BamlHLxC9x+cd5MeyLhYex3ka5g7KBPhMGAA+5eqA+2urYPvqf2zsUKlYlg
         oxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741329; x=1764346129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H0Qa+rIdxIz/npk54kfvyvMz12yBrI1lLKupWZkvgr0=;
        b=B57YGdte/f4AneqTIRyl0D27K6MurJ81rzZTLqseJLtu8di/rCo6n3fW3ZSCDUf7Hh
         aA/zausFJf619sSKiYUNOyJIwYFy79L+RuM9xTqrIQ1RiJ84dSAihORDpntsgtKR+glg
         F09SRTopveuWb6eN5jd6yVrK0a7JTkcvvOIBJiq7wxWNrghbvSucEEy8vP9wf91cmo+3
         vPPo824AcVS9WUnm4XFQCWlZDmtIzwYtVXTvXSXBaTw1c8coCk5CAtWn5XMn3XjRO05Y
         DnXgayyTg8KC71zIswyFRw6YOmhET5qsUWMYEvtGfv35BcCIjwtUKvTiU8oduommCcGO
         YePw==
X-Forwarded-Encrypted: i=1; AJvYcCU5RMgPBrXdljshD7K4m8i15SscHdzTrCBz8E99enb9/jfdXCD6p3tSiioXl2r7axi5othqz+bYaXVw3iZCW2t6Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnDR6s8gxKgC5s4YtSZMt5rWYM5Nsk3eOG32W+H8gAnyPip2DH
	Ajjb1gYLNtDmIRR55TG3SciUGTzSvfvVnZKlF+7Tcdpaj4MDIzgIOcSy
X-Gm-Gg: ASbGncuBWsDsU/lbANPhhvh4QBDnHWYnrtbBHO7tiZFeUD/kDnIfFxh3GS8BthjATge
	Y818NxYoKARfaYvEMsQGfMHwmgm61pzo/33rDKXGdKosXToExZtpgc/Y91LH8EWGECaKZCciPZm
	94h4+giNwMeLf2clZviTHsQwAwehTeNfd/ZqXV1SDdODZ/kv5bNll790x5rPA9XFv4qwzg0lY3x
	+iZgcBp2ydpLItyk5PBgee4Q6PvZwXtcn0W0RojdSRaxZab52JjocUAs2RSXcvUJm3r9dWnnNiD
	npVWR5YuFAe5h2tacgV5PuD5jGCtIjRq/Fsc5/bApA/WKL2pOEXVIc9oaDKHfjB34PpqfXL72ZP
	tyz+BprjWq+sHlHlsKieJ7ib3xKlDRGHp4jvx3jMdqikTfA3T2+ZVRThejIJXqcmyYZxVs45K8T
	bpwNMPTOp6VWoMw0q1jY+sk+qgFqnL+OYUDuuWJ0NsIaUxCs3kVu1llltZmudP6SOY29zXK4E=
X-Google-Smtp-Source: AGHT+IGFqRWy8+PYG5Cz1NoGF31QbRQa1cjMTNZa6HyRAdvFI8uSoM5dIJXPjiC2atDAR+vi008Qhg==
X-Received: by 2002:a05:600c:450f:b0:46d:ba6d:65bb with SMTP id 5b1f17b1804b1-477c01eb9bdmr33974185e9.31.1763741328913;
        Fri, 21 Nov 2025 08:08:48 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm89496195e9.8.2025.11.21.08.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:48 -0800 (PST)
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
Subject: [PATCH v8 05/15] arm64: dts: renesas: r9a07g0{4,5}4: Add POEG nodes
Date: Fri, 21 Nov 2025 16:08:12 +0000
Message-ID: <20251121160842.371922-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
References: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add POEGG{A,B,C,D} nodes to RZ/{G2L,V2L} SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8:
 * New patch
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 52 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 52 ++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index bd52d60bafb9..28ef5ac98712 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -359,6 +359,58 @@ gpt: pwm@10048000 {
 			status = "disabled";
 		};
 
+		poegga: poeg@10048800 {
+			compatible = "renesas,r9a07g044-poeg",
+				     "renesas,rzg2l-poeg";
+			reg = <0 0x10048800 0 0x400>;
+			interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_POEG_A_CLKP>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_POEG_A_RST>;
+			renesas,poeg-id = <0>;
+			renesas,gpt = <&gpt>;
+			status = "disabled";
+		};
+
+		poeggb: poeg@10048c00 {
+			compatible = "renesas,r9a07g044-poeg",
+				     "renesas,rzg2l-poeg";
+			reg = <0 0x10048c00 0 0x400>;
+			interrupts = <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_POEG_B_CLKP>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_POEG_B_RST>;
+			renesas,poeg-id = <1>;
+			renesas,gpt = <&gpt>;
+			status = "disabled";
+		};
+
+		poeggc: poeg@10049000 {
+			compatible = "renesas,r9a07g044-poeg",
+				     "renesas,rzg2l-poeg";
+			reg = <0 0x10049000 0 0x400>;
+			interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_POEG_C_CLKP>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_POEG_C_RST>;
+			renesas,poeg-id = <2>;
+			renesas,gpt = <&gpt>;
+			status = "disabled";
+		};
+
+		poeggd: poeg@10049400 {
+			compatible = "renesas,r9a07g044-poeg",
+				     "renesas,rzg2l-poeg";
+			reg = <0 0x10049400 0 0x400>;
+			interrupts = <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_POEG_D_CLKP>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_POEG_D_RST>;
+			renesas,poeg-id = <3>;
+			renesas,gpt = <&gpt>;
+			status = "disabled";
+		};
+
 		ssi0: ssi@10049c00 {
 			compatible = "renesas,r9a07g044-ssi",
 				     "renesas,rz-ssi";
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 4e0256d3201d..14ea99d2cfd0 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -359,6 +359,58 @@ gpt: pwm@10048000 {
 			status = "disabled";
 		};
 
+		poegga: poeg@10048800 {
+			compatible = "renesas,r9a07g054-poeg",
+				     "renesas,rzg2l-poeg";
+			reg = <0 0x10048800 0 0x400>;
+			interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G054_POEG_A_CLKP>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G054_POEG_A_RST>;
+			renesas,poeg-id = <0>;
+			renesas,gpt = <&gpt>;
+			status = "disabled";
+		};
+
+		poeggb: poeg@10048c00 {
+			compatible = "renesas,r9a07g054-poeg",
+				     "renesas,rzg2l-poeg";
+			reg = <0 0x10048c00 0 0x400>;
+			interrupts = <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G054_POEG_B_CLKP>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G054_POEG_B_RST>;
+			renesas,poeg-id = <1>;
+			renesas,gpt = <&gpt>;
+			status = "disabled";
+		};
+
+		poeggc: poeg@10049000 {
+			compatible = "renesas,r9a07g054-poeg",
+				     "renesas,rzg2l-poeg";
+			reg = <0 0x10049000 0 0x400>;
+			interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G054_POEG_C_CLKP>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G054_POEG_C_RST>;
+			renesas,poeg-id = <2>;
+			renesas,gpt = <&gpt>;
+			status = "disabled";
+		};
+
+		poeggd: poeg@10049400 {
+			compatible = "renesas,r9a07g054-poeg",
+				     "renesas,rzg2l-poeg";
+			reg = <0 0x10049400 0 0x400>;
+			interrupts = <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G054_POEG_D_CLKP>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G054_POEG_D_RST>;
+			renesas,poeg-id = <3>;
+			renesas,gpt = <&gpt>;
+			status = "disabled";
+		};
+
 		ssi0: ssi@10049c00 {
 			compatible = "renesas,r9a07g054-ssi",
 				     "renesas,rz-ssi";
-- 
2.43.0


