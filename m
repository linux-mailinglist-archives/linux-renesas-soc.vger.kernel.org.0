Return-Path: <linux-renesas-soc+bounces-27891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJdtCG9Xg2mJlQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 15:27:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71590E715E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 15:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13DAF307CEB6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 14:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE3C41B35B;
	Wed,  4 Feb 2026 14:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECi2anPi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E15641B34A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215010; cv=none; b=SLjki9vCS/hVL/+wmZsoNxPvjW70N5AXkbIZNwAj1oc1UmLpMBUi4WPLG9B5wX4by5KhdFXo7iTZtz8YAtHhGD+jYQn4aF2hlYYeRpA40oeqNadn35RaJJaVAOL2xuW8kyoBlAp5oAhH8uK7x3kcYy+8oWsPjxaLpLcYWX5+LUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215010; c=relaxed/simple;
	bh=UP+9KdRnkLsvToA8MtZEcm32tDDxPt9OHWzvcibE/xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7fuhoQfjnqCQ1sLP53HlKuOh75QRe2rJ8i+7qtv++Ih3pNZj8dIXAe9GaHAvG8NEuKZ3nRAMwMPDlZg6zaqe4okHIYxSCXeKmuGC9DwCbVgu/rAzjwUW8WeZDQgBf/HFfOLOsLd0QSQjheh0VxopyEcc/2lAT+kh/8AZrJcIOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECi2anPi; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8871718b00so1171522666b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 06:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770215008; x=1770819808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JoeGOuekatIj2w4dOO9r1vdS0XM/ncxVioEhSKM/u4=;
        b=ECi2anPiK35Ib9nk7K7fIlJlrxWTRoblRVtVM6uwk3Qlnc/X21HzI+xxOL1BBVWY5m
         82t3Ue6Zhn5g4IwN97BlX/Ge3opejG4pdU+gY2z1SLkWh8QO/hYPSMN5nTIbATwAtxLZ
         TUgIIN1pAsWEjnyy2Vuc5Zl5blGP7xVawFNfM5mt9xBeek7f+QPTU2PHEryUvoQL72AW
         VD5c+6mCEcZ7o79YLzliZ+gpC9/n2k5KtlsMgHUWF7ROU7oz3I1F4t0BdUaC4PNyY0Kq
         SqzVX4WLjjfUI8LRxgxEZP07aAFSfO7HfCeVeavIn/q2Idt76BWE4yAhu2rD/yEQxdtk
         wMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770215008; x=1770819808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+JoeGOuekatIj2w4dOO9r1vdS0XM/ncxVioEhSKM/u4=;
        b=V371mJgtRiqNSxn7wXAG5Dx55U03NAsl+2rX0ygZs3ZWUp3M7OgXzPIiRXmMhIz8g7
         IElJbLv9hPJ7KTTGb4gCuz08BaF/IzqlpxFSK5LHz1hooYvH+EDaUOBvIMYiZHUPY/ts
         sqSoeWlsJTDi34OYgii/yycA4apiGbpBlazi7vDKjJU0MP9Yy6m7BrpAmKOjJzyJmGMZ
         3KAmHF018e3OykBPm9gLWbNkF4SFlKJwsMuzi4RTYe953OTvGKzz63em0IkW+ibMS5MN
         o8e4Qus/T0sQ/EnxHzD0x+v4ZjdcpOnejvHF9ohdJVNYyzmQaGMgQ2HtoA5w3fEhFWnH
         HPUg==
X-Forwarded-Encrypted: i=1; AJvYcCXnw2qGjavvq+d8Al3yBF/dGE5ZDH7XOSnm9eF4ajRL1WN9cneOHvARarHHao/8CgRMajd191UwNXIDkxxLAuBx0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN2WxwYgMoiW70YHxvMiXDWyk2vhmggogA/P8Fop1MsGMuEQhO
	/cDsMcm26oHmkfkkKjKyTuWRmNc0LGiB4DsJtudq9Q8oZsENRBAjCLQF
X-Gm-Gg: AZuq6aIgMMK4puBGtv6Jc13bHw7MwtvfVoC8qYHJmLpPrF5LnhsxFhpdKp8ius+h2t0
	DbfU+1zktTbKRJ8R8DBVVNDb3ZCpJr/8Qt9lb0Flxd0gTW4Z3Rh2+oVaz6vpW0GbeFLlwHXRWX8
	47Jdt9hy3RG2v0nHiRCfKSGBJ7eQBvX+KJkD+Yf+0FO7eHhXx1axXkzjMbHygZrTcg+AwPJnoqw
	pOGokOm4Knzc8Kr7GY7HN5xNKkJWbBQyz1ztdsWwkrtKCyihAFDKZ9lX+GulBw6AJUWoBT8hUg8
	jFrOrivwAncRhLDaJopoaI1iwknQBdIUcPCxPGuDomJHZISh8dWtGJLjGxTNK5yQRz/b0YHBrzS
	xahfsM+gIaB4D/Cl4CJeGPflsOLD9BXE8cCfOu0A8ev2Fmx8By+3nOxsxFFhMNmwEfdbfCsFkqW
	ftz0WtjkjhXBpTheciWxyVyCKad61y4YLmii4=
X-Received: by 2002:a17:907:3d0c:b0:b87:63a8:880c with SMTP id a640c23a62f3a-b8e9ef58045mr221168866b.19.1770215007916;
        Wed, 04 Feb 2026 06:23:27 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3c9f:a100:4d45:ebc7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea001ea7dsm129038366b.47.2026.02.04.06.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:23:27 -0800 (PST)
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
Subject: [PATCH 8/8] arm64: dts: renesas: r9a08g046: Add ICU node
Date: Wed,  4 Feb 2026 14:23:16 +0000
Message-ID: <20260204142320.103184-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204142320.103184-1-biju.das.jz@bp.renesas.com>
References: <20260204142320.103184-1-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27891-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.168.156.16:email,0.180.91.224:email,0.168.77.240:email];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 71590E715E
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


