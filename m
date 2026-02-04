Return-Path: <linux-renesas-soc+bounces-27919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL3RFRuMg2lWpAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:12:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC2EEB79C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3ADCA30175F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 18:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98C843DA32;
	Wed,  4 Feb 2026 18:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkUE2R+r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B28543DA29
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 18:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228404; cv=none; b=lXdZZYZrrCCrj8NWzA/fK2I5xkVQ7wC8L4UxcRnpoqh1aSxUj0cSaVykOW5D0ssq9BRqMGed+UABS2QA4yEjqIKypl8jRFQBEC6HO9Op6eXLK8u13uAaJEl/vdnU9n1kclmHmCP/dpl3kSvpDYfDlRok2ILL0x94VJghfIk1oMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228404; c=relaxed/simple;
	bh=UP+9KdRnkLsvToA8MtZEcm32tDDxPt9OHWzvcibE/xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRuVAVL0xiFLB4nCQx34roLCBCNjToqxn8tnLN5U3XWGjLCEdlBoFyjDFnef/OoOgtGa8nr9sdosuCaDnVMdoSVNNVysS7EOGrTcNP0AhHmcagJ1r2pheE7oCAwjStRXfh/ZZOREsxuImB7vQ1BGlECiUgFvLmLSThTcyDqnzLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkUE2R+r; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b885e8c679bso4762166b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 10:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770228403; x=1770833203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JoeGOuekatIj2w4dOO9r1vdS0XM/ncxVioEhSKM/u4=;
        b=bkUE2R+r8ejPqoX6b9azWfEnRsmny7Ep7/ngIjSRmQcE2VLqOZyUxziQKdFPeAgxyA
         e5Br382OF/LWXqfZVy0b4cdMffcZkxFfyWf3O3bgAErbJybNikp9MPhDEG2jla4iW5Y+
         HgMSiVFoBr7NlHa1sdiuBCIIY5LRr7tNMkZd/FTzP2yXJ6i/Q/j20DxeAytteyHBjm1Z
         hPNGK5bpP3eG8yq1U2TlMufZk0PmhIaLFzd2xJC3LhLuRj6v8IMq/gZ70L0Dq2r8xmZv
         cOrSi1Xd/bblEiQC6UiIboAWs2HktEmMchq/JGiJ//Kpz/yRgHN2WjlRiwDOYXvIDGx4
         fEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770228403; x=1770833203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+JoeGOuekatIj2w4dOO9r1vdS0XM/ncxVioEhSKM/u4=;
        b=D8eegKI2k54+CGds9dzM3r4mpEwH5IotvJ6U0gz9AzosdysJalZoUF9LxPLcgcRLAi
         4QiR/iLweBdNvyPdRjI+MStCe/IUS7Lf/eBdm4grQ1/gnKb1ke3uX9/GyVC/RfvXSTzu
         xoiusIpXzGMYbRdApRQhO5jyfOpqHoBZoHuGI8DrW0cQT2d0XmrgBQPFdHn/KCfXA16q
         F+pKmgVVNY0ny0h319baFfqa1N1qNQPdNLdBqfCn1+ELLufR4xUiedlVHtAqHt3DwFTI
         XpI0EUWzSpzNNYWFIAo9UeMmZGLmh+PXVEnKXw/ZhEWF3fWmmVvC1/bNXwhgFUh2H69M
         d+FA==
X-Forwarded-Encrypted: i=1; AJvYcCXMOFUvXLD2zV4xqs5X1V9SiZV0iNGFOTbMD6J1rB7wLYJG07NaZ0PINPwuwPYhkUl+mtyvktZuDQUsgMnoaw9ZrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcNj7d5WjI6draAWe6JDvBVb79ilFNtt0lMr22/x5fQaQsCKyf
	cFO9ulr/iieB4X0eIiG9deyRaxyjhgySAumFU0pLjQqkr5/NzmFnYy6F
X-Gm-Gg: AZuq6aIC9haQ89UZV6zP9fgFCD5wNW8nMXLTFyT71AN75x77OiZvrIhsTxBfgW06X/k
	dVrjvQD6Ny19IrxpNgGF5OfrLE49moDp1RD3fBr/xZcXlRfgcUnsk6+oUbo5iEpIqwLJRg1cEOV
	u0TbarnkmJXN4PzhAxEmrXVNulSWm20kqwgZVsOQeElJ/jFeYLg+Ph0zTEa7eoTemw30j/SM/gy
	NA3iVOctbdi5L1erELSFy/9oSlkBGL9nVZxV5MW9SFzhBDyb1zaEbNz5sBKTT5E4DW7lfPnwid5
	ohbq8hWogy5UzVOPoHdM0aW3n/NERRGkKJU76xKDsEFDFxqHONYD3fAQAH09xD7d0TMeNbZbyqN
	qk2mYUEcwXOsfhdnq6gvQfZdZw/eIFvbCE7CCNZclcaSHSUOfviEOTtZQ+YJis114xjuSn24oz6
	VjkgBQ1ty9ZlQKxL7xfRCH3HNYDmgigUYRSvY=
X-Received: by 2002:a17:907:971a:b0:b73:544d:b963 with SMTP id a640c23a62f3a-b8e9f04c8ecmr240160866b.13.1770228402745;
        Wed, 04 Feb 2026 10:06:42 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3c9f:a100:4d45:ebc7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea0057dd1sm149677666b.65.2026.02.04.10.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:06:42 -0800 (PST)
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
Subject: [PATCH v2 9/9] arm64: dts: renesas: r9a08g046: Add ICU node
Date: Wed,  4 Feb 2026 18:06:25 +0000
Message-ID: <20260204180632.249139-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204180632.249139-1-biju.das.jz@bp.renesas.com>
References: <20260204180632.249139-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27919-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 3BC2EEB79C
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add interrupt control node to RZ/G3L ("R9A08G046") SoC DTSI
and add icu as interrupt-parent of pincontrol.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch depend upon [1]
[1] https://lore.kernel.org/linux-renesas-soc/20260203131048.421708-9-biju.das.jz@bp.renesas.com/T/#u
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index a92a4e07cc10..65dfa145ef59 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -188,6 +188,7 @@ pinctrl: pinctrl@11030000 {
 			gpio-ranges = <&pinctrl 0 0 232>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			interrupt-parent = <&icu>;
 			clocks = <&cpg CPG_MOD R9A08G046_GPIO_HCLK>;
 			power-domains = <&cpg>;
 			resets = <&cpg R9A08G046_GPIO_RSTN>,
@@ -196,6 +197,96 @@ pinctrl: pinctrl@11030000 {
 			reset-names = "rstn", "port", "spare";
 		};
 
+		icu: interrupt-controller@11050000 {
+			compatible = "renesas,r9a08g046-irqc";
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0 0x11050000 0 0x10000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 522 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 524 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 525 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 526 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "nmi",
+					  "irq0", "irq1", "irq2", "irq3",
+					  "irq4", "irq5", "irq6", "irq7",
+					  "irq8", "irq9", "irq10", "irq11",
+					  "irq12", "irq13", "irq14", "irq15",
+					  "tint0", "tint1", "tint2", "tint3",
+					  "tint4", "tint5", "tint6", "tint7",
+					  "tint8", "tint9", "tint10", "tint11",
+					  "tint12", "tint13", "tint14", "tint15",
+					  "tint16", "tint17", "tint18", "tint19",
+					  "tint20", "tint21", "tint22", "tint23",
+					  "tint24", "tint25", "tint26", "tint27",
+					  "tint28", "tint29", "tint30", "tint31",
+					  "bus-err", "ec7tie1-0", "ec7tie2-0", "ec7tiovf-0",
+					  "ovfunf0", "ovfunf1", "ovfunf2", "ovfunf3",
+					  "ovfunf4", "ovfunf5", "ovfunf6", "ovfunf7";
+			clocks = <&cpg CPG_MOD R9A08G046_IA55_CLK>,
+				 <&cpg CPG_MOD R9A08G046_IA55_PCLK>;
+			clock-names = "clk", "pclk";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_IA55_RESETN>;
+		};
+
 		dmac: dma-controller@11820000 {
 			compatible = "renesas,r9a08g046-dmac", "renesas,rz-dmac";
 			reg = <0 0x11820000 0 0x10000>,
-- 
2.43.0


