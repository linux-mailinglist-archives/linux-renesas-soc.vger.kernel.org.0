Return-Path: <linux-renesas-soc+bounces-31825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOW/CS5S82lnzQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:59:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7646C4A30F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C36C30A43EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831DB41B358;
	Thu, 30 Apr 2026 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiJproqB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F4E40F8DA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553634; cv=none; b=SUNJpUx71CwsDnE25YIp0GB+kKZO0381ZESib/V14/gzMIWok/It38HOKTT1AwjsGh/yimK3a6YjbtYDfgsDgG1Rxw2KyOK50ewpLZuLpS91r+UazQE+zzr6rYMYp8yIMIRJuC+XfIoYXIEk5Ux5p2hqI+ttfAr+bF78FMMAa3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553634; c=relaxed/simple;
	bh=YQIfS26jvrHPJO+3OEX8X39JX9m56jb+tChw9+nyM+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/5cLw+7douz2Y2cg+/KK8MgFSbMlqCpoO1MemoP1mSZ+HMPqqfVYN9/0dphIGIKNLiaLPAOazuL0WuPWN91Muyi2Hmgo6W5oZLv0eAW6cKXhxsw1JlJsx4oAtBBXVdlyzxOvxHj+gCWd4bjEZI2/mC1XgsOkbKcfFiKLQmi5EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiJproqB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so5872915e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777553630; x=1778158430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4PmWsl+VpxDeREtZmv2hm9P+Gs6imFjooqUiVKxd/I=;
        b=PiJproqB4YSo1d/Hdq3rTIw8WOTQSAJ6981sa4GigbJAvjI4AOEy7Dmxsxr49V5zE6
         j7lw7/4jfr6ygIB5he1nXb87JnD3io0pCiKU17yptyfv727ZR6GgZcNtuhdqz7aqLwAS
         WgoVOs+EVJZVesziLOqsyS/dV4YUmNfn/SYWaxwYOeg6OuSDUlITYiKRR0O0+7yMirI1
         wcLao5uyA7lRsJceJuZ5md2PG1swD4Cg7s0avBQTeGOt1kvKGxsWuNOsMkdx6DX6/kZd
         hxO4El2igIuSyBRW9+nQU51oOKZRByOH52SZpdAsZ4kIH3/XPQAVFCyYenbJLxMG7UGZ
         BISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553630; x=1778158430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x4PmWsl+VpxDeREtZmv2hm9P+Gs6imFjooqUiVKxd/I=;
        b=E5b0TqKsxXWEdhJ3WllfDv8E8LkwUD/7G7x70CPTAXFpgbiXjcieGZB4n8syY/Q7iJ
         5dKgzfveqCZtl0BYEBgHPqwgT2UNK6rppE7wdK1z2YDhP1cCOwB6h3gFF6581X6TAU3u
         0z6hPeoFtr4PNuXF/6cok1VR/4Pbs/Z/CwupZisDWETKMh0ZNBnq9C/peIus+ahK8K6t
         BvD5xqr99NtpnULqr/wPgfapznsyfFrerAWlBP1JDNkhAcObT3wYRMelNVAXi1OFPftj
         8FnTeTa3s+g8fnKioyjdD04FtG7ZdeX2+aimLdAzXV5H3IFNZc10GeT51X69wx9Qm5FV
         sqxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iqQLFtcyVZx8j2WVaZ6lVuy0q1L9WI/YWuZQBb1myM8qwHdPFcsvSVApbuGvMdZIxFEmKmYWbczXHZirvglJEOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPv5GBWVf+WjJTGwsSZQrSP9Iifi6tN9pnaG45exaiymKv/RYO
	/C4G1wLjYM3HPvNW35jplwJTfclFhTddjqtOEEokWX78AwmF0qGRqmtO
X-Gm-Gg: AeBDiesX2lRRIXWElWygIWFGJBMCFWWBKkqxe1QQT15PJJ1ppa1h1BbX0bFX52ajc50
	JAN3NOXvQn2UqNz6kcXUuk1u5pPOGqS7PUDYhiyyCNJ3jWogcRegHnv7uzLH9JseJ3FLdlN9yjI
	C5StJk2g175dQNF0JMExyNe3Tq/1lG1zC+8d1b+/ChPgZN76hV7GowoEBei1jLO0lOSnsGbA9Uo
	aIIMrWyXgL1SB4sfL+ttMS0cZ14ERfSlkKYYFOtFxVa03wvRdCMo4NeDJOdOIn4TkiG4XTtEnxc
	lK/9jxCsdeFBTKLX9RLdTOkGdIqW755F5JdVnDLacwd5H6SHrVuBpnGaiS5yQith1ZGWJ2u/F8k
	dqVeopwzaZY/maLiqvEW6LKcdeevcj+881JCm6ZjT8qmswQeiuTu+kl45KWNlGIB+aCmJADKHUI
	pTRbeapVEQLtHIrnfMqvn0t8+MpeDjt7c4FSt4MFk=
X-Received: by 2002:a05:600c:c049:b0:48a:5546:61a1 with SMTP id 5b1f17b1804b1-48a844683edmr34819515e9.15.1777553629708;
        Thu, 30 Apr 2026 05:53:49 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c3057ecsm40995825e9.20.2026.04.30.05.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:48 -0700 (PDT)
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
Subject: [PATCH v3 2/6] arm64: dts: renesas: r9a08g046: Add ICU node
Date: Thu, 30 Apr 2026 13:53:06 +0100
Message-ID: <20260430125342.439755-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7646C4A30F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31825-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.168.156.16:email,bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.168.77.240:email]

From: Biju Das <biju.das.jz@bp.renesas.com>

Add interrupt control node to RZ/G3L ("R9A08G046") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index e52498b3a745..232a0e299df7 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -210,6 +210,96 @@ pinctrl: pinctrl@11030000 {
 			/* placeholder */
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
 		sdhi1: mmc@11c10000 {
 			reg = <0x0 0x11c10000 0 0x10000>;
 			/* placeholder */
-- 
2.43.0


