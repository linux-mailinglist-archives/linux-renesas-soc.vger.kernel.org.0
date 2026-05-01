Return-Path: <linux-renesas-soc+bounces-31866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WsZzAcmF9GlvCAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 01 May 2026 12:51:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA814ABC46
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 01 May 2026 12:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A2A53014BD5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 May 2026 10:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A833939B4;
	Fri,  1 May 2026 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qeYrOxfl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D7A36C9F0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 May 2026 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777632686; cv=none; b=WpWttAk6BvS+7Cr+lNlKcVMDHbPR8odAANVn5T2tGPhb2b2rVnnx2La7ylvQ2S4O3BKDBNyOEgMOOVBAlaE2+0WyI5vQtQw02z8LE8eJjFo3JI9JoDIDTPOEo9ZAylKoi+tefGe9UpD7w8nm0FGCzXfng2UoTw6l/uX9kzamM0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777632686; c=relaxed/simple;
	bh=9VDX2wyTfGXvirY2owoQqjTf1wba8DdvsYRwUvSlgV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rAIjh5sVxAkPT+QUcbZsQUfBypSuJ6HviBIDrzxzr9IUBVRRraHl0Z4Az5zdgyaHl5+1+VQMVnWqxEmDVDvorjEqEpxaFiqSKjB0xd6DVMl1wmGyC7A7Gpv1bXTKgDQKNBaVW0b0tod/Bk6Q6A8xzRV5JH6eXacnWzXFNs8iBWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qeYrOxfl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso23155355e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 May 2026 03:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777632684; x=1778237484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q63HPKyCnCcFzQrI5n0Y9dzWcBoaBgHfQ6Ghkq+SBdw=;
        b=qeYrOxfldGb5yJKgOdbrJxctb1s3Od23MvzzBw83QTi2wmmmRRoYzi+8NSoayO2Ej+
         i6s1JrzxcG5wBayuVPCRQCqfVvUXPnrGk/MzVV9X98Rvj02DwkzRNuUJytF9D0h3PV1i
         hLVgbZA6k2uOcAFqmbVsImthPCFLQZGOaM3D3qgmNfn2U8cYxRwQw4n4n3cKTI4EcaT5
         Eyvcs0WLVJw70e6l7pT5abIkpuB0hzf0u0MsvCWg/ujgiKubvpLmnZIyiY6im7m8AXIX
         7XGEmR/6Lvv62PdKinmE8Z3OHQlEMwYXC3snF7Sssdp6G+MIOAyxaMYfcjyZRgnXQLN5
         Br7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777632684; x=1778237484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q63HPKyCnCcFzQrI5n0Y9dzWcBoaBgHfQ6Ghkq+SBdw=;
        b=KosWv9fysXcB1oePshzMiSbhBcnPsfNzBJgy/XAPcWiaN1eW0fFHt+qsrPflMggquZ
         D4TuDwHvLWJ+HW65YdaDGI0i0yE5FQQ4RI8uLNyWzSuVr6TJEX8tgDJIK7ZSYIVX1YRE
         PDAsvpSWm6Ts108kE17ff9c9I2mtAnM7G9cDGPv2/8InKLoc9qMbM9vwZlmThRX2G667
         Z1PUvNn8FqX5jdGgKIT0FSGytBw8HeUceai9HfcLiLFOfZ+FFBsyW9FT5BLrOnmAWdCP
         c/8KdOMv/NF0nI4dFEBd9GRAcGq1To7OmNjyvNjxP4ruaznaX/d5K462gqV/XuKXfmP3
         WBkg==
X-Gm-Message-State: AOJu0YwN9qUtycu4nujN9hXzIEfQ/E78rR6z1GQEQuu/EcffSc0piQ+C
	5DG7GR6+veIkFYyjdZmWVIrxBSi6GFAELU5cmmn68BLjiPW8/TJ87wlI
X-Gm-Gg: AeBDievuB0OExlxCXs0VNgDgqTuZ3jUFYlW2629MwfXhPzepcs15314zbevM+O6ezAE
	H6Z9bD9QT79Hj+K0WLh0WKaRSWX9L0lwDEQgrj3dbSHuaatjyEEcUldvN21ZXt1XuQ6IY/AhWUO
	nHFTpQix/Y0JBT3XhqxscimZIA9VRCKk8xCwTmKPUT9V51IT7i/KM19GneJ1S6f2kfUeanXY/cq
	sYuu9wSoM5YRc03T/8L0K2aTZBlZ8ncRer311iaqnJYoZCo8rltrrU57p+fI+AM/wNvupLxeFRZ
	98AnIOLYoZrh1Z+K/4QZiiCpqxf1frsnDDAsUh5MHGtSTsEIxkrwXVfQlOhbg48hH858c+G/i4t
	asksH4zO8NbUFmXk4GRpHcg41/dhlaswRY1iY+Wdfr88RYEzAyIZtlesDM3/HhA5/gqzMWzto6t
	o4dZrLLfAPKGQQoAFJOJnMK46S7fPMFWdSS0ge5R41seeK25xm2fS+qAQkNmeU6eeHSdMWZqM7p
	TFjpsYJv/zEahTvKu/FU0m+HFOwXDVWj/xGOpfQClbhnPg=
X-Received: by 2002:a05:600c:c0db:b0:489:284:44ab with SMTP id 5b1f17b1804b1-48a83f6b306mr79985945e9.12.1777632683509;
        Fri, 01 May 2026 03:51:23 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1220:5ff:c603:f3ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81b99127sm122313805e9.0.2026.05.01.03.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 03:51:23 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Add PCIe node
Date: Fri,  1 May 2026 11:51:15 +0100
Message-ID: <20260501105116.33452-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501105116.33452-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260501105116.33452-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7FA814ABC46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31866-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.195.91.184:email];
	NEURAL_HAM(-0.00)[-0.435];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.219.187.144:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.204.119.192:email,0.0.0.0:email,renesas.com:email]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add PCIe node to Renesas RZ/V2N ("R9A09G056") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index dc5b116679c0..d6c8c39df2a4 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -1044,6 +1044,75 @@ rsci9: serial@12803000 {
 			status = "disabled";
 		};
 
+		pcie: pcie@13400000 {
+			compatible = "renesas,r9a09g056-pcie", "renesas,r9a09g047-pcie";
+			reg = <0 0x13400000 0 0x10000>;
+			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>,
+				 <0x43000000 4 0x40000000 4 0x40000000 6 0x00000000>;
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 2 0x00000000>;
+			bus-range = <0x0 0xff>;
+			interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 807 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 798 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 808 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 809 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "serr", "serr_cor", "serr_nonfatal",
+					  "serr_fatal", "axi_err", "inta",
+					  "intb", "intc", "intd", "msi",
+					  "link_bandwidth", "pm_pme", "dma",
+					  "pcie_evt", "msg", "all",
+					  "link_equalization_request",
+					  "turn_off_event", "pmu_poweroff",
+					  "d3_event_f0", "d3_event_f1",
+					  "cfg_pmcsr_writeclear_f0",
+					  "cfg_pmcsr_writeclear_f1";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INTA */
+					<0 0 0 2 &pcie 0 0 0 1>, /* INTB */
+					<0 0 0 3 &pcie 0 0 0 2>, /* INTC */
+					<0 0 0 4 &pcie 0 0 0 3>; /* INTD */
+			clocks = <&cpg CPG_MOD 0xc4>, <&cpg CPG_MOD 0xc5>;
+			clock-names = "aclk", "pmu";
+			resets = <&cpg 0xb2>;
+			reset-names = "aresetn";
+			power-domains = <&cpg>;
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			renesas,sysc = <&sys>;
+			status = "disabled";
+
+			pcie_port0: pcie@0,0 {
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				ranges;
+				device_type = "pci";
+				vendor-id = <0x1912>;
+				device-id = <0x003b>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+			};
+		};
+
 		i2c0: i2c@14400400 {
 			compatible = "renesas,riic-r9a09g056", "renesas,riic-r9a09g057";
 			reg = <0 0x14400400 0 0x400>;
-- 
2.54.0


