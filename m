Return-Path: <linux-renesas-soc+bounces-18669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9227AE6DC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 289D11BC68D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 17:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A222E62D4;
	Tue, 24 Jun 2025 17:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnQh9Gup"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514002D8DB9;
	Tue, 24 Jun 2025 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786842; cv=none; b=CX1YVmPoFfgdOdhX4Ee4nVUT/iF/Q/pvISbiXgEIVIxq96XosX1q/JJOu70ONne8PLawUhAmrkNv1iIZNiWETpf4xgCM8rcw2xPLBSGJSzFsKXy1HN2468QhZDpEXZsXX8OR3xf17RwXYQ6ucwk4Wt5Wtu1bZvjdWUNrULSzs3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786842; c=relaxed/simple;
	bh=Q1drfnn5xQEiXF+8xTCXuax3JXbC7bZeZdnzOdoJNiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W1AVp4FlCyd23sgLwkDGJ4ZufcSa6WlT42BMoaVcFS+xNMvhVWJVWmx0N0nr2cHdMozUNTY1RAj4Yg0YltjEvZI/tIOKQIPOo8yoMx1LqqDHYBOi5l1m4Xj+GKW0Nwy+15Ddb4WpO6UzWbypKUpJJmv1bUeJrX2x/t90guHpcKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnQh9Gup; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so768185e9.0;
        Tue, 24 Jun 2025 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750786838; x=1751391638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQj338YlfuSY8oc1qHpNyeNrnDLLpKuZ+Imnd5Li15A=;
        b=ZnQh9Gupua64KJj5wq5rXTOb0RGNRlRo5Jg4/8qN7I9H89UG7WWKHHrG+JbSWdzxSv
         /I4NW/nv4Gyser3O5DCRaHyjw8qor9Db42BMCE9JZFxZG+LfxT275NuJe6tkBRtmxv/z
         KNW+U6ypqEpeweC+mwkdgBRsN5DFRLs4Mf9VjPVy8abhLgHYqM6CW2xd18wy8GAHkt9s
         G39k0DqU3LYqIEZSdJZ0G//8MFh0QbSlt2DpKo74tepDl93cgwzR9anZ076MAucXECUC
         TI8mdvsJpBUFtb/5dGBZRK47mZNognOdLJuRUzwB1N/UScphPsB6ILG24VZZGOR6R5Q4
         MBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750786838; x=1751391638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQj338YlfuSY8oc1qHpNyeNrnDLLpKuZ+Imnd5Li15A=;
        b=Qpvl+3IcBujw6zbbH7o8evfhLx/LbdxNBJkQq9gWzNdKwRysj5ZnNov+WFjyFjJP1P
         uxw45VNgLuhykLHZ5xIPphemOuvUrq0ZdLpF1u7Wpm3ZppG3gACM7XI1ltzX5g8nb3m2
         JU31WyUR4oXB9gf1WBhwdRUmHeNnfE53R0jafC+KEK2kcQc4o3f2vPiVzbs2hz34B0t8
         LJZcZRTQn4BYt5GFEu2Ucw5KaBh1+MBIowCSrOWPZ/ca4a2ZyB28iKjsF31L6rxj/iex
         WEszNqSYW4v2h7b3ZGvBGd87YYUIDu2C0Winqh2SDawO9h2O+iGdJD1gJVzFHs/JKbCy
         kj1g==
X-Forwarded-Encrypted: i=1; AJvYcCW7mDv2y5OyUuqUYCrfZRDW9ow0O33QALw4qrVobKJEdfRqS0ufrN4ZDIcSL21EQ6dH14C4iMTJZ53h@vger.kernel.org, AJvYcCX3iHXmV8Vfzuz/ehfiuvW7yD3jC9s5TaJTxcMZU4v2XjER9+LpePtPXHxtuF/+UtEMkK9E3ymbE/+NatAG@vger.kernel.org
X-Gm-Message-State: AOJu0YyDGMpVYyvS68DYJSRNEdFm06bG3hIS+7Vv2c2IoxZYkYm9sN9w
	CV0n9neC8FgvxYbOMkvFnqVap0tAhYF1LDvLKDTKUhPG/o159YFBj129hRLyxE3e
X-Gm-Gg: ASbGnctp9VdQQEdCPImMYkvJVwjesicfWfQGRB9oaD02DyCHC1UG9hFn19vNMbnqxJ3
	l2PntoXRNahOctEZjZZ0xx2oAnbmDT4wtm088fGbHPof4MPKVFmB/ML8PQNgeZyYbGdzL7zbK9X
	0MUW79zI/Bz2QQNfzS+QqZFtw41oXep74mEMGl6ZD/ctkkCn1GSKcM1ArN3pujLU62h/X589L5k
	24HDZpHoW6oeSXpEZQrWA0iVqwVdoyn0h6rCfKxg9uUmhUZxQ5Bw2RPmfp+PBPjNLYyc5JqwNw4
	qmg2WHQQew5x6mZuxasMR0QBUH/3YhfwyUkM33snptkqBS1TX9HlUarIbxl8zYuHYEiRYwKDpS+
	VjvLIoNsfWRD64cDEsct/
X-Google-Smtp-Source: AGHT+IHJ34Rp4UNuYkoapYEncyGOb10l+AqxLrflbgJHSc56Ic0L3AKHuxPoxVFbm1rIp3UZvKYSCg==
X-Received: by 2002:a5d:64e4:0:b0:3a5:8977:e0fd with SMTP id ffacd0b85a97d-3a6e717a06cmr4353694f8f.0.1750786837467;
        Tue, 24 Jun 2025 10:40:37 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a522:16f6:ec97:d332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb692sm149812735e9.2.2025.06.24.10.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:40:36 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] arm64: dts: renesas: r9a09g057: Add XSPI node
Date: Tue, 24 Jun 2025 18:40:31 +0100
Message-ID: <20250624174033.475401-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624174033.475401-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250624174033.475401-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add XSPI node to RZ/V2H(P) ("R9A09G057") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 45aedd62a259..258744468079 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -280,6 +280,29 @@ sys: system-controller@10430000 {
 			resets = <&cpg 0x30>;
 		};
 
+		xspi: spi@11030000 {
+			compatible = "renesas,r9a09g057-xspi", "renesas,r9a09g047-xspi";
+			reg = <0 0x11030000 0 0x10000>,
+			      <0 0x20000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 0x9f>,
+				 <&cpg CPG_MOD 0xa0>,
+				 <&cpg CPG_CORE R9A09G057_SPI_CLK_SPI>,
+				 <&cpg CPG_MOD 0xa1>;
+			clock-names = "ahb", "axi", "spi", "spix2";
+			assigned-clocks = <&cpg CPG_CORE R9A09G057_SPI_CLK_SPI>;
+			assigned-clock-rates = <133333334>;
+			resets = <&cpg 0xa3>, <&cpg 0xa4>;
+			reset-names = "hresetn", "aresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		dmac0: dma-controller@11400000 {
 			compatible = "renesas,r9a09g057-dmac";
 			reg = <0 0x11400000 0 0x10000>;
-- 
2.49.0


