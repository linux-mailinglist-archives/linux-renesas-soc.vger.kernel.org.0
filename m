Return-Path: <linux-renesas-soc+bounces-32405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AD85FLclAmpooQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 20:53:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 376A1514B47
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 20:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D821730A45C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 18:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82C74D2EF4;
	Mon, 11 May 2026 18:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iW8fr/QJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C6D4CA28F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 18:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525476; cv=none; b=K/W95Y2FaUcdsAhFHUCZs7Xrzz7y/3h8H4x+IOeuReTUVlp2cz2KyDA/MBux4N4qiesvrdC2ZoPeGS7xdVW8RPtA45/jhaVHw7a1BM6w8DsLFnSW0EB8daGjOmosbr8FLEk6JwMj3eOn8Ftwra7j3ew7nUaPYPamalXMd3owPXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525476; c=relaxed/simple;
	bh=gsf8O/A4uFSb5xiWCs8Lvej9IiVzo6qsPV5Xik3YnM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tEs2RZLTyiAT1+gN1v9ULPKol94zw8dmQp6wx2uhG1L8wrvN/dE3ACTF4WUTJDbzaR8V6v/hrSfzUVi9imBjhTlZ1By1lVG1SoDztC3ipBO0ACnlH0X+I4XEwxWZ8sdeBEvkTawrEdDFdJrJHo7eqbBj0KlV7qF1CI4xoWwmMZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iW8fr/QJ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so2441003f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 11:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525472; x=1779130272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVviRRXyOpOFqlFXNeMmtSmK6+R7+16vmQsfofx/k+I=;
        b=iW8fr/QJHIGZrqwSG9m2vdDynRDk4XZ9gDphPceMVvXcAndcHtWTMyfaKrMuJRZZvk
         HSWyWGrH2ZeJK6MYOcb9xheOOQrgREkwe01fISC0p7UFXs15HfSfgHZNTaOfGhecVRt3
         djtXXUBMT5swzisvwnuWAouDLoMu0STFMhuWjWwwjbeF5KAt+MRPZsedZCZqxFr3G5Cb
         WRbQo/TgY/P8oXnFov/vzKw1pw3UgOn2CGkgswniulACvCame7PghkMKv6n/7k1NVwxA
         73WxA2Eff8Oc3q45c7QNgcokOpUxrxHeTq8tuJipy+UAVP8hqI+3jyyBoyZSmZ+YF7o+
         ljTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525472; x=1779130272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jVviRRXyOpOFqlFXNeMmtSmK6+R7+16vmQsfofx/k+I=;
        b=pxlFXT+Vr1dHOU1Yue7YAPuCXqvqWcKX2577g0hQRCNHEX44zhJ+2GN2tYrv7KcTZP
         8L14E59EGiEUd9RWIajM3dEngUGY7rZ4m8S7UC9riXxoSA+GMREfpRAeJ7Gd4hi/d+i1
         VCIIm1LATuOYFVC8iHI/1pKyRi/KAs2SkCp6tr9Frl1GcerVvpLfaoe9bP5ybKKS0i9X
         pSegAj09I83JAq8FfiaJSCt+pS+y8JRI4+dMDeq38yZXCocV0YcSz1Qzbi7MuSHSQ8+O
         IFIUKnRAK1uWLGVXjTIFV4/EIAw+CMpU/5Dd+1s/c908VBTxPXFRegEZgLmZ9XNGiiSJ
         TP/Q==
X-Gm-Message-State: AOJu0YzTT39GpOdDPhDnO6D/BbidDY21r0oeUnaWI1dIC3t9cDUPU/t0
	++JsyAh/+g80ZZS30TV/qkyaonwIbgdFfrf+1W+Q+5/m/BdMSS4ggFs8
X-Gm-Gg: Acq92OHsebje4ixt91Pvktj6RXDFb7QmTzFQ+V/VaUAQekHanJjI7GY6UGOqBt4GW9U
	bz2zU3I4QjLOx26KQkqFpykG0z4/Err9h11pngIfC2+YSdyJyrsI335tKkkCPI+x5y5fC4v4D60
	5LbmterKq5mrykyfxkEtOF30wAircLddUtG3AZaCEaLGZ+Z4sVtA4E2DU/71ds12gScb0IqZkc6
	H1le7oS+JOxM6XO3g2wmYxOdBkw/95axjIZua4ZQxlqcfGj4J8KyzIr26eUmVkEOfoYdlZF26Xr
	ffNLIFEleOwBYtjzfoDar+tnTY2a5Z5tD4djcKoOECaiUGRF5gh3Z9hDbce4oXtFFTA3M+/aa9U
	ZTNEzxfH/DdQzHYHIgRnKETAtvn4zjfW8H409VHkx/1hPmGv4hKkyOX7ypo30vM5FDpgckAqQqS
	jFnXRubxCMk/0M5wogDoqA713kCBtEjgWFvTqd/pB3h+HjecEMlZe2lh+yLKzVcnsTwiY827KBu
	aAE6D4IFvgDHP1D5d8sUAEm/hUyEEUujRc/Jg==
X-Received: by 2002:a05:600c:8b0c:b0:48a:7a10:4f47 with SMTP id 5b1f17b1804b1-48e51e0a620mr407790805e9.3.1778525472435;
        Mon, 11 May 2026 11:51:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 8/9] arm64: dts: renesas: r9a09g077: Use SYS syscon for WDTDCR access
Date: Mon, 11 May 2026 19:50:57 +0100
Message-ID: <20260511185058.1926869-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 376A1514B47
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-32405-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[4.197.244.80:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.982];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4.197.247.112:email,bp.renesas.com:mid,4.197.245.224:email,renesas.com:email,4.197.249.200:email,80082c00:email,4.197.248.56:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second region of the
System Controller (SYS) block at 0x81290000, which is now managed by
the dedicated SYS driver and exposed via a unified syscon regmap
interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sys" phandle property pointing to the SYS syscon node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 59e5de743826..b076bea9cb70 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 5>;
 			status = "disabled";
 		};
 
-- 
2.54.0


