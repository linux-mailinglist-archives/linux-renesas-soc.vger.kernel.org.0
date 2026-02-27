Return-Path: <linux-renesas-soc+bounces-28538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHJ+D+KooWm1vQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:23:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C361B8D0E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5950131D3F75
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 14:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8BB43CEE8;
	Fri, 27 Feb 2026 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlHldy7g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD10243C074
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 14:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201012; cv=none; b=RyLynQPexqQ55w4j56DT2zJSaYHMcOIuj45Bt+aLGc7pP20Y66LctD8OJ68xhZ8zuhy7iKuvNq7RDYuolMsMfU+okCq8sHWmGcYcQz2yfvyDMJRBQ0lbPznMuMyo5kPuyCCsCDKhcPua7cWhkjNjzwo7ABEpNdcENGfA8W367Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201012; c=relaxed/simple;
	bh=v8NuAqPHuQhxiIPA6oSZRKTTw8K3lCcS4wYxX82x2YI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ATfjOp7+hpmc0DdvKyvd0R9VSlPrxgV/G0qNeJRcjRb0eIqV1gKzDGQSbLR4abitUJfk6kc8JjmJ0rg9zYjuhKWIG+bDgUNDWAVGXzQIbFWY5OgOm+3TreWhlhMG2aHw4IaC45bRzyyn3w+yqy9eTvkkme1hJnqLjeyk+o6kxn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlHldy7g; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4398d1f06caso1951978f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772201009; x=1772805809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbhORpx+Sybx+mRQWlVCWvB5Y61i5coqsSmdGVq+Myg=;
        b=PlHldy7gWyJLVqRNlVnTcWnKZT2CbIifYUctIE33qHvnWTn0YvMBzxNqEzbWEfhb46
         MggEecUg6IzY8fhtagQ409+Vb4GMa0cihJvqmeKyIatOucGFFIEDsX/uNEbQl7H7Qxge
         IN5Zxq8I2/5h5WXf6rC6L1MOrpgGQ6tWEVJ7RBf4HkEuht8dwp8dPzaalO+2A1tksOkt
         a4pWdLjXQXKKEQCA8ntEqZtxX7Q8vX03Hjr8lvXbIr4ttu+BWP4f1g9QNhr/wD6qfo+H
         WC6QkmtnnD4t3RiS3XPjLxOz3rhmwLiXBU19S5/2xbZu80RCyqdCnH6SN33eUM7p4cm2
         d/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772201009; x=1772805809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tbhORpx+Sybx+mRQWlVCWvB5Y61i5coqsSmdGVq+Myg=;
        b=HVN8c102rCycCigRWg21YWHB4otUzYenv/0y/RcFtDWcecU+1pXdcV3yKc0uMm8pOj
         GgQSftIhO9tJ+mAfmBL02aDltbB6J8i4gcylz9xkzwPr4kKTjYAGSW/Oj/LNIMBtDiYH
         VRxLkDNzRBGQ7NbZBNPTzFeg+Zkr3MaWkkcsVRkivZuJlESii0DVswGDv390x/hdP8pU
         GJQbaewgDDNWwCjJ180zy34sJAG8myPtxK151KlO18iH5nWDrpS9yCqWF7D5FgN6p5Bw
         OQxXJRKBf6aJcc4pPBMiZoVyUxrzd9uQ5qeuJc9GF3bQnl62ilTJ2UAC3cWgqRuzSjLg
         4QYg==
X-Forwarded-Encrypted: i=1; AJvYcCXstLKF94udZZCOSR+FI9Rtxhcj46siu67NGO0Z0bmC4kiSrbN7EBpmh7Zi16NNPHA/hx9bhV03fYGzWwk4MPJZ4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc9GXEI7ef4LdlLvBUjd24HvRRMvc/PSG099888aICakCE+E8V
	oJbor31ntSMMGxzOzaH24e1TBsPbGihCXiM88s4Y6IYLbrNbMKLoKCe1
X-Gm-Gg: ATEYQzxnKbOsrhS7qUV2udFKddAa8pJTg5TlMQUuyLGUjpAK4scsRdj4vqXJS0GxSbz
	Dws4XOf+4Ff/IFDekzPNE/cKcgyDu8TDK4vUKrpSZln15Spnz0DsiP1thP42ArgoRyE4+0xlRiV
	vsjoLZeW2hIwzKtwSYvc+GsgzC+GNLLw6CLd9p8TJC+rfhxI3kfDE1oYwfM+7Ao13C3AjgsItQg
	xRaSZQccePytQSZzvUPuQtrjGtdR1TK99wXL84pVwo6b4Us9ghJ/F4KE4wEaThyDF4EkTDArtet
	FibTk+dVTaL/4mlpULELXtIjtVG+QYpKDH0U20izN763MeL+ZKcZM67h1DE02QFbQXaTYVjAa5d
	/6PWI9BeeKOeK7H/LXbRFAOo50j2s35djvZ2OyfgXOsiRLB/tNaoSSLLSDlXdyrD6N+QpN8NCMm
	HdqAEIsUYM8wRBucZ2s3gFfaq1vWfCdYlsNL9leb4/cg==
X-Received: by 2002:a5d:5c89:0:b0:436:d824:621b with SMTP id ffacd0b85a97d-4399de1c64amr4917597f8f.32.1772201008670;
        Fri, 27 Feb 2026 06:03:28 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:4d8b:fefb:26cf:1906])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60feeesm7658811f8f.1.2026.02.27.06.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:03:27 -0800 (PST)
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
Subject: [PATCH v4 9/9] arm64: dts: renesas: r9a08g046: Add ICU node
Date: Fri, 27 Feb 2026 14:03:09 +0000
Message-ID: <20260227140316.308106-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227140316.308106-1-biju.das.jz@bp.renesas.com>
References: <20260227140316.308106-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-28538-lists,linux-renesas-soc=lfdr.de];
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
	DBL_PROHIBIT(0.00)[0.168.156.16:email];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,0.180.91.224:email,0.168.77.240:email]
X-Rspamd-Queue-Id: 93C361B8D0E
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add interrupt control node to RZ/G3L ("R9A08G046") SoC DTSI
and add icu as interrupt-parent of pincontrol.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch depend upon [1]
[1] https://lore.kernel.org/linux-renesas-soc/20260203131048.421708-9-biju.das.jz@bp.renesas.com/T/#u

v3->v4:
 * No change
v2->v3:
 * No change
v1->v2:
 * No change
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 973370cbdb83..d701b6a2375e 100644
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
@@ -197,6 +198,96 @@ pinctrl: pinctrl@11030000 {
 			renesas,clonech = <&sysc 0xe2c>;
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


