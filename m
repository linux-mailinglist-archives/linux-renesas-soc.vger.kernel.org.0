Return-Path: <linux-renesas-soc+bounces-25139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E1AC87623
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 23:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BC6D4EAB29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 22:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D332EF665;
	Tue, 25 Nov 2025 22:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+qetYEq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF0726B760
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 22:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764110752; cv=none; b=mu7ORU/dqYxnVNoJy1gIXlYPz9UmlyjSQWJQRxPeHI3b+134O8g8Zeauv00EJTYw+AFLejgbIoFeS/WKXqRhWwwhl4uivQGEqi66oSvoorbupbcC2UZGHBz8+KrjMLa8AI5SXOBnLKhWrzo9rVtwAjhgo0YmF2JTmGZg9ZA3PrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764110752; c=relaxed/simple;
	bh=zUaC67Q32hQfUotvPi11ucJ5UPnA8huYyYFGjY3gPj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/9eBykHdZkkYwMby1boSa/EhRv6RdQ7JGUfWtWQEnVjoM7NJw2BvyZ8dQCCjrXfTiNzK3LR98MhOFvyUmETm8qgkOd4WL2+RJBcBl2LV7scweuVPaFHGKyH9LcUcBTYOt65xNq0IFBcClxbWVyoBF08sFFZNr/ZK93DSqm3y/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+qetYEq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477aa218f20so37384355e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 14:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764110749; x=1764715549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlyxniM+5FBgaQisnakRL7Imtm1r3b8mw9skX6VEG3o=;
        b=L+qetYEqo19UoQOEvCOHil2G0KHiPq/NQXurRTxQxhiwvmLgg1fks3SsL/vijEWOzZ
         PuCc0rpBeOtmi3H7xpvXS+uygTjvqrC9RO+QvJs5E8KWU5GVBDXnPkUmeVt69CEOvgxH
         3wdcQ5OdZuzXl2viYUb8X4RvdJHhiw3uEeWucuUHKpHklBUOjiR3joEBH0w7bT+I7BCI
         RV1k7LN98IK3gdFQasVX426/El+A4D2to71l/uGce+2k768PjXQF223YESiwV//cWyw3
         F5PNPadylir+bJUtOQdUCmrAxNfP85eSR+3ow3SAzDVOz7U3vOLg/BdwFwv7M67ocCD/
         PAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764110749; x=1764715549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FlyxniM+5FBgaQisnakRL7Imtm1r3b8mw9skX6VEG3o=;
        b=PNzRLbTVPZetPoVLUUxlh8OQmupWiaTbK2te0FGzAR40Lhgne0vTXEuxR4v2Q47nkj
         cgnmrMflDvY+TANgn6NOpblzZTts3eGiacS7r5/Hat6WYlEIwkFnPGt8XOha7XU2efuR
         CHXb6YRlUij4fxO6PugJ/Z7PlPiWbDTuo/Hqko6IOrBdLJYQn4f/VOsW98HamCPqFJBf
         1O5yUE0z4nQkKYKefZ2rvB96IwhsMMqDmOnnRSksOvry77/sZtnLyz6Wal5MNk08+Ny5
         SZkXlOGkJIfuqLDo10XnO+42Q/NdTD/7ueKfAF8gDnArYFwdVI3s4eKu7UKvX4XXQoqP
         LVgA==
X-Gm-Message-State: AOJu0YxwUBL6VbzmWiy8BoAh9JvQiXjxYWdi/yPE0BgWzu8Aehpd0055
	t/36UfRVwGseYjdyfkcjxm/qOYYtlUioA2nf6Z/YVGddpcimONRPUex3iF0jcj2P3g8=
X-Gm-Gg: ASbGnctqJxYgVZx9nNbLbiNtypftq62chfDQyEP3SHCY3G1OQWxd0h8eHUFBDPlAJbS
	FdlG+dPk6oN9OHWJHRP7EH3B4jQKppG0a6WMVVm5vFKi6voOVZYCE2cZJX0TxoNelGFJpXIIaA4
	N4y007mvaeFz1TQIheFqVY1Wl55Zzqm7xyNqqBP3m4THpd3ZoXVbVJ7tJeXjNHeMdsQDAA8qmb0
	ZrwKHmWyl3RwhzRj7b0eJDHj/EeFDsdc8NJZFE6xAY7r5BGAwDK64Zj+gT9i/twCsZqsw3vqlbN
	r2tk+2u76tMdmjF2MkV17rZjdqtQNgsc3dLNiM9b+72y+2nDnKuBg3IFv2V1SgAzKnTPwTF0Dxn
	q++uhbkuEUSsanSrxnma1icEgBR/g2fZ6Gf+Trh+JeAG7FEOCkiL1FX1cMizBet0kEkPRih9bKK
	0VuWPAIHNuQqDiNOC3Bq1/dfPG+LTDoX2Ddg==
X-Google-Smtp-Source: AGHT+IHauEiIjbZ03ZkpcsHD6CdnwXP4dn14s+jlNWZqen6PrqaWkbB1wtBHKfQxRGCxNZ9DUSDZrA==
X-Received: by 2002:a05:600c:4f4c:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-477c0184b1emr196825095e9.14.1764110748860;
        Tue, 25 Nov 2025 14:45:48 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:325:d7d3:d337:f08b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc5ea6sm11683045e9.3.2025.11.25.14.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:45:48 -0800 (PST)
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
Subject: [PATCH 1/4] arm64: dts: renesas: r9a09g056: Add ICU node
Date: Tue, 25 Nov 2025 22:45:30 +0000
Message-ID: <20251125224533.294235-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add node for the Interrupt Control Unit IP found on the Renesas
RZ/V2N SoC, and modify the pinctrl node as its interrupt parent
is the ICU node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index ac8b4a4f5fb7..5a2a4056b7cc 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -183,12 +183,104 @@ soc: soc {
 		#size-cells = <2>;
 		ranges;
 
+		icu: interrupt-controller@10400000 {
+			compatible = "renesas,r9a09g056-icu", "renesas,r9a09g057-icu";
+			reg = <0 0x10400000 0 0x10000>;
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 263 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "nmi",
+					  "port_irq0", "port_irq1", "port_irq2",
+					  "port_irq3", "port_irq4", "port_irq5",
+					  "port_irq6", "port_irq7", "port_irq8",
+					  "port_irq9", "port_irq10", "port_irq11",
+					  "port_irq12", "port_irq13", "port_irq14",
+					  "port_irq15",
+					  "tint0", "tint1", "tint2", "tint3",
+					  "tint4", "tint5", "tint6", "tint7",
+					  "tint8", "tint9", "tint10", "tint11",
+					  "tint12", "tint13", "tint14", "tint15",
+					  "tint16", "tint17", "tint18", "tint19",
+					  "tint20", "tint21", "tint22", "tint23",
+					  "tint24", "tint25", "tint26", "tint27",
+					  "tint28", "tint29", "tint30", "tint31",
+					  "int-ca55-0", "int-ca55-1",
+					  "int-ca55-2", "int-ca55-3",
+					  "icu-error-ca55",
+					  "gpt-u0-gtciada", "gpt-u0-gtciadb",
+					  "gpt-u1-gtciada", "gpt-u1-gtciadb";
+			clocks = <&cpg CPG_MOD 0x5>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x36>;
+		};
+
 		pinctrl: pinctrl@10410000 {
 			compatible = "renesas,r9a09g056-pinctrl";
 			reg = <0 0x10410000 0 0x10000>;
 			clocks = <&cpg CPG_CORE R9A09G056_IOTOP_0_SHCLK>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&icu>;
 			gpio-ranges = <&pinctrl 0 0 96>;
 			power-domains = <&cpg>;
 			resets = <&cpg 0xa5>, <&cpg 0xa6>;
-- 
2.52.0


