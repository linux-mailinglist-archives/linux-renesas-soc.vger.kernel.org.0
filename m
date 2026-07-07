Return-Path: <linux-renesas-soc+bounces-34823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gpv9HK0YTWoovAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 17:18:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C08B671D2B2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 17:18:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bjYKVVL+;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7644132025A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 14:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA101377558;
	Tue,  7 Jul 2026 14:51:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A3F36A36B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 14:51:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435906; cv=none; b=UNDwHZMsmXqxOaOFyUHunmadDekJc7O/cn/Hj52lsj8G/go95/FfbNuV85VhHNDd2/M7oqfnUvnMZ6vpf05hir7ux+OMVFRQ+oQWe5uDmCeftipb8+JI7m9gazYjP53eaxegl9cm3//wy1TowtW1BD7WIZwluyIuZQsabrQd3Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435906; c=relaxed/simple;
	bh=vAslAFwxtnX76SeSatSOQIeLFuAwnMan3jvx1EwTzLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umniApi2RRBPqa9hYWqIejH5WiIUxa8Cac5UaAZrgEfZJ6Y7qEDF7zDhw7qfvK+38sVL7KgtlIN/09EXdn+xty0FyNvDzqG/JHzqgMmA/Ln9yExlJZP39OUJXo3nTwwKdVhoah+9ZFG87M7q50qZe5lZeo1mm3OFj3xqq85nGiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjYKVVL+; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so4646565e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 07:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435900; x=1784040700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CDPmQD+4GY6QyFnHeYogutzK0+DQlm88rhGwro4EDM=;
        b=bjYKVVL+v1cvgVlwvK2N5aYwjMutJ+mMYXG9IPWusfOaWF/MYOyt75HDdLvDRfMtE5
         4+Ikt1LbMNoud0PQMdIy8TLnTbLP18YBgU8guSJh09ZDMBttv4x4cLEmI57M9HGlR5xV
         +Hf4X1AF1k+06ImSlf6dzL4khnvybZBTB7D07vRA6FnEWXWY2mjj35YoUZu61axAhIy+
         NIB532NmMmACSQnUzx1CArw6pEFWlyhqYv2hvMQliia97rdk6dzk/J0OuliaWOrHGEoh
         RifVtfux4mug2jZFtkUP9BlkRa2m+p8dnSGq8nc+fAY0CABGa2sV7h4dJJCr4zR5M0tt
         67mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435900; x=1784040700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4CDPmQD+4GY6QyFnHeYogutzK0+DQlm88rhGwro4EDM=;
        b=F6DVG5JSU1x6Ko0X7i77qiw56bdRyUXSuKLDsWF0ym6PpC3GvE7tXY/2sH+b9qviND
         p2/JjfQ/mf0VzJct3DGGRfMc6co654NTCk9ZSLbA1iH9hCU8L9gzrdab6BBHCNDMkcYS
         wyKKwTbMspkTBOqUxJCCLr7NuxeGE9EG4px5LFnCVVHXBuZXncyp7CSuGyeHle+qBDEy
         W6TEOCVFJxDESHOWFoWilmcEGzH3LY1IgJHBzxk8lJ6llC9nnG/bk8cvsX7iwRkBmKWO
         rBMyE8z91D8gRZvwBuNCpWeh3x2+YGPCkaKwKGLaDEJkEMbOP7FJp1Iq2rCqb3EJQpuX
         +X9w==
X-Forwarded-Encrypted: i=1; AHgh+RrPo4dbtLVDItvcYxI2p010dXg+tGIfp8cJIRrgtWnowcGNsmyqKly1l35SG2eRyUTAb7cjSD8MLAe40PPWdyiu+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEo9w9+xHY58Ju/Es3zbvuPtyr9VuCD7VqoZ3Zc8WE2aa2Yz8l
	X6y9IFnNeCYu+3J6eRwlfRyrVROcXAxs0q5KJRZ4X7LKCCrCM8RxN8aC
X-Gm-Gg: AfdE7cm4yIi5UR1ELdSpHVlasoFDKrC+O2lz+fvBM7yqgAF7Q1QEnYcnrCvzV0y/jHd
	DjUJ0qC4mopRG90helbrEBKSj7FXrFGwfAXlaD80gGQSK8Llb9yLNjyLhW1DCnwy5L4egvoa0LN
	GBi8oxqHwztpXg11mZAkWor+Y8zVLU6Ex+nssElvx2Hb/kfwkQ2bfTRHoy+56s3b+z7ZcI6455U
	PXWsUq9Rc2sgvrkw5blz9nzuYpsVx6l6uqQVW7bIkoKIFjDkEf/IkSCEroMS6CASQiagfFbvZyf
	lED8/5uIbIqC2eG2ZN6YDGy3Ro3hYOlWR7/BdYc5nzImCtAThCwDSS7ZiQ0IIkZha4DnwwLNymm
	7HEn0GHL9w6bFYWlZo/j4GeG7ZYgOullp4LAl5irJpVwnPlN5W/d2rbjt8ZuzqlAw7rhpHE8jlJ
	9pmG+tdhFgoxIZfIjlpDFe3MmhY5nQazlX9X0dEg==
X-Received: by 2002:a05:600c:c16f:b0:492:6f5c:fd8c with SMTP id 5b1f17b1804b1-493e101910bmr34953405e9.15.1783435899787;
        Tue, 07 Jul 2026 07:51:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0ec6e64sm105192695e9.0.2026.07.07.07.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:51:39 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
Date: Tue,  7 Jul 2026 15:51:31 +0100
Message-ID: <20260707145135.247565-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707145135.247565-1-biju.das.jz@bp.renesas.com>
References: <20260707145135.247565-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34823-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C08B671D2B2

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 function device nodes to the RZ/G3L (r9a08g046) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 926a81cec37e..4016eec80847 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1303,6 +1303,44 @@ usb2_phy1: usb-phy@11e90200 {
 			status = "disabled";
 		};
 
+		hsusb0: usb@11e30000 {
+			compatible = "renesas,usbhs-r9a08g046",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x11e30000 0 0x10000>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2P0_EXR_CPUCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2P0_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		hsusb1: usb@11eb0000 {
+			compatible = "renesas,usbhs-r9a08g046",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x11eb0000 0 0x10000>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2P1_EXR_CPUCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2P1_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy1 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		pcie: pcie@11e40000 {
 			reg = <0 0x11e40000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
-- 
2.43.0


