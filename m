Return-Path: <linux-renesas-soc+bounces-34819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5v3RJAATTWqTugEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 16:53:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4007971CDF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 16:53:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=q5oz3gn+;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA304311EDCC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 14:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F424314B2;
	Tue,  7 Jul 2026 14:36:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC45430CCB
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 14:36:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435019; cv=none; b=CdsohSD1dFESH1mfxdegS8OwTx/f2y4fVy1mDOwdBNGrnLfaU+TV8V4oRYscM5ZlQv3AmOPmhPdJbquix5VH9/V8k5aY6+OpZ5QbuFoGdbE2NGBTP+Zr6bKQm8B4e0Iu9nao7F3S2bwv3l8S9lw9VSDwtOkeT5VAEOsZ1O4Z/Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435019; c=relaxed/simple;
	bh=ecBOyRsLkPlIKU46NQfDb9lK1VKigZxgCDvcAtZDjgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jeopdSXK3N/1HhTp4jp1g68vC0dZHQ19xphF1otV87BJ16/fJwDmzTfy+dzFhyAk4VzRJd+Qo0R4R2SAGo+P4vyC8W37WoKFdRexgcp7bDO1L9/RZ8r5Es9vJPv8nJ2R+t7GdJXBAheLsVdxD1/VNd0fNHWJqX/iRli/EueuvLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5oz3gn+; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47640541585so2639958f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435016; x=1784039816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4zILMBc3HmB22GzD3Z6RYaUw5fjgkNeDZ6KBjDQfWA=;
        b=q5oz3gn+VIdSC3BbApkqYZsBXfAmkRdNl3PhcckcTi6ohgEHv5+/XmczKL1/llecd3
         4nfyJwyGWOzrvznXK8ZH2rxdnI7RHJPwmeMgMsf2Sj4G9if9otDZXfVfP2OTCN6hiXPS
         m7ggg18iMugzQFXGVB2Kdb3T967FmVhXObylpOg5e9PauEXdNNUpZRqj0or6cL1cd7/e
         bdliEHXBRCTM01lL6Po/S4s3Lj3vTtyjfj1Qr/MWKUodrlKGAp6RCR1QjUaE+nLmmcSp
         n3GE/6fuHVTvdrhBh+ELJVxqkqUPR68rlxEF0+Fa5183DRro5ZIfx6pJ9CL8O+kLudb9
         L34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435016; x=1784039816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X4zILMBc3HmB22GzD3Z6RYaUw5fjgkNeDZ6KBjDQfWA=;
        b=BxGoyO6JnnkKbxQhI9NyZkNKIn2LOv9Plxy+1tgEndHXa36VCSuX59PoU0ogUHyVh9
         FhxUsylXPkbUhXLT7ST8pkU2dbueEmZf50t6rMtkGrKk5XhM/J5SdCucoz0ruKXOKoSX
         Aenqja7Fq66HAKiXtr7WRc6ls6u6wztWG/QCyiEHCo60Sfikrz0UE095X5jbWDyLE180
         XhfQguj6YeM+VY3J2Br02hXAESWTR3pSe9S1JpXWgU4ZWxt4QUagVlIJNNsNf0q40k/J
         Grk6cvodMsJJFJIVQVNPF+1CIUpKmveRWn+viZIymY2X4x/ZrBiGOlsq9FzG1OZJSMIc
         cdgA==
X-Forwarded-Encrypted: i=1; AHgh+RqabeoqMcL94I4W71W1VppIO5OCUEqIP0/rnF4fgpq2nbdtthFjZtaY2Qqrt85mo3kMXopI5D514/BTf3x6zNy+KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrwSMH2JjzBKGGYSR3bgV/FXb85fzPV/s8lq5DfLLC3QUvJlag
	gUMPkXz5j0ec8CG9XMGh01lzFsnkjsXMAFDf4Hcy8Y4++YonQRW9h9kI
X-Gm-Gg: AfdE7ckeBddB20JOYZyudpH7zhHd+mC/apArA7QltKqJeFZA1BKqSkLYwJuAC6G/zlm
	c8zH0M2Hyt3uzOlZCXFLMDwd3oHt+GEosz6wEOPrbGYWuz5U1xVf8vadvWV1wbRXSMWqK8XUuRE
	puhK2soxcgrVH3zTIB3fHVnIbyg63BEoD1yF4YPAxEeWMtyHgm6ePurUXMmqIBIMDTAGuTuwNe8
	qfCDCRFoIiXc+0+iUI5UvElTIL8m1Y92+h7pfbHFPjaLH0xXru34ytBmoFrnc3taKElap8lVWdr
	74FuBd1VDcqgOQdT8mJOCmQ2kvvW1XdvDerTQB/OMnLqheJcfurmai0VGuhi9PPOe+vvQL3vSVr
	X6CHxltFRPCkB4+TeCHPXcZm+4jftqKDqB9v5HHvJuX14hRNfInxYzD4VI/l7GeTZ1HTEqBHKLT
	8B8Zp8RvY0Q49kooe9RpRwEUGRqnLfUiibxabQRw==
X-Received: by 2002:a05:6000:1081:b0:475:f0f0:9f01 with SMTP id ffacd0b85a97d-47de66ce309mr5665955f8f.56.1783435015863;
        Tue, 07 Jul 2026 07:36:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm33228611f8f.23.2026.07.07.07.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:36:55 -0700 (PDT)
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
Subject: [PATCH v3 8/9] arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
Date: Tue,  7 Jul 2026 15:36:40 +0100
Message-ID: <20260707143646.245177-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34819-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4007971CDF2

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI, covering
the USB PHY controller, OHCI/EHCI host controllers, and USB2 PHYs for
both ports.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description.
 * Added regulators group node and its children.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 85e409ac8d5c..926a81cec37e 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1198,6 +1198,111 @@ queue3 {
 			};
 		};
 
+		phyrst: usbphy-ctrl@11e00000 {
+			compatible = "renesas,r9a08g046-usbphy-ctrl";
+			reg = <0 0x11e00000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>;
+			resets = <&cpg R9A08G046_USB_PRESETN>;
+			power-domains = <&cpg>;
+			#reset-cells = <1>;
+			renesas,sysc-pwrrdy = <&sysc 0xd70 0x1>;
+			status = "disabled";
+
+			regulators {
+				usb0_vbus_otg: vbus0 {
+					regulator-name = "usb0_vbus";
+				};
+
+				usb1_vbus_otg: vbus1 {
+					regulator-name = "usb1_vbus";
+				};
+			};
+		};
+
+		ohci0: usb@11e10000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e10000 0 0x100>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@11e90000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e90000 0 0x100>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@11e10100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e10100 0 0x100>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci1: usb@11e90100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e90100 0 0x100>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@11e10200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e10200 0 0x700>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy1: usb-phy@11e90200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e90200 0 0x700>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		pcie: pcie@11e40000 {
 			reg = <0 0x11e40000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
-- 
2.43.0


