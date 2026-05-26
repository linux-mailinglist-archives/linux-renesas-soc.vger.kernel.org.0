Return-Path: <linux-renesas-soc+bounces-33183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMROAF4FFmoRhAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 22:41:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 907965DC65F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 22:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C4353010BF5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 20:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1783C13E3;
	Tue, 26 May 2026 20:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9ZJJkng"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729B038C43F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 20:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779828058; cv=none; b=UYCP+vswcn/i2VWzSe9mrYWSn3gf/usZierPe1vBEXFvMNzrMkN7W7qXSHFqJp7s9JDr981Ixx+KAXqod2Nl5HO/LrHNxrAU29pVKR4UmaYQjOqobMya3/WuNFXnafMOoycosoGAZmJeCYzYVnZ//GUgq+vY4JjmwfKLrXKCz6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779828058; c=relaxed/simple;
	bh=YHV+9GDOaXg9w0i8fK/s4DhskMC9qm3zwruCVxIVpnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AG/pGIB+QFdt7TLZkn+QXW0AuMc5hHP7zUYtKnB8aAw/Ot5DgsrkW06bDMPaJQd0fahlUa1ctKhUC6H0zaaeqHPZB9NxO0jFBTnMNcqAUDl4MIVi5mPTJFRpwpLt6HB0YSOfS14lNJ2S9Jp61DZYnToM9MRRH6fISGMdeWuQ8kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9ZJJkng; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so6929879f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 13:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779828053; x=1780432853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYpT9rCtQKB99xvsZxTJTdf1TCLLdQe2NsUgMRTAJWE=;
        b=k9ZJJkngeo7AHLSpJMDhMIVgSOkHCtL0kSRMBfYEnI2fcURC3BM+cA9+qLEhEBuMa7
         T7rnI7aT76sfWmkdxZkNOFf3Nnnac6o5dV8est3+6x4exJBddPk2RnWrH0ao0NCnH/R4
         w2WMJAjBKZOlDqAjtEwulanKm3/IpipCjD1yFhEfTqFZlHP9IXbrSlPiyKuwBjMuDBSF
         ZO159wWpLDMCjWt19ANEwvJ+JLQY3Z8KgWAYtMOZ5Tij9niiMG1eLhu09RYIy5bLfhqd
         Bb2t7wEr0WcKdEmgvKpugtejOgekaPeOGRfMYBqzwE2ODy/s9LcnJmCl9JvM6/RLQYeZ
         xCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779828053; x=1780432853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xYpT9rCtQKB99xvsZxTJTdf1TCLLdQe2NsUgMRTAJWE=;
        b=IWch5smK+oUjMwTwg4gbc2olJ6uAY14TUZ/2q2haM5U36F+ZwXQsXoJ59R5lKgXylq
         rJ4lMTAd4ztaP1PbWtV31PskR+IzpyhfMSIhIIjzEVE6j4kpPeyiGuqI/Fkuk4dfSKdu
         tGu8wBbZD4mbSTUR6UJN5xV6DwbM4jDW5UMH+qAMkD+5d/beRb02+zSq5DzCCXNllEJ2
         /L6taizNvytjvGMqnKeUbhQYIF3ameHDOcTnPT3Fp5NytGPeO9qPv5az9GMKlQHf/Ghu
         u/kj6be0DtzTfsdv/ga6Xtb2fIsWsKrPtK4cF5LcAWXILvhJTjkOL9kxAQH5Hpbx7Dc5
         4HCg==
X-Gm-Message-State: AOJu0YxLdiQZjSKxYVhh0sjYLwqozPH39f/L9797i4wLeQv22BBI9kq4
	mUrtLvuLhewfHmgW3wya7N43+Zd/9V9F4d85Fvg2pJwmXFrSMIHbnhtS15c4nRDE
X-Gm-Gg: Acq92OGlh3BgO8Y05uKqcZsi46oW9pHDsLrsvhPeV6Gz/qyIeGCuG9v37+3xT4h/HHr
	yPjpbgGT/7AbuLSN5CRuuVgM5gm6FpbyqckWKkifJE8i9vNVrofS6RfVsZZ/7wTIwSCTsTV/Gp5
	ezcykdVmM27rOSyevmoMB5IIRvzmr7qJso148p0UN+HTghIktb4B8IZJC255C5pxjEDJzryyvzM
	85bzyJQ4RM71j+qu/gI3iNIkaljAqwNfrAdgzRfKj8OjpRL3S2Z2dpcqv2w3LlOsNyT8NzRChGL
	8C2efzqFrgkEnlpyEau+GXZW7OZ+K0U+Xl/vjqMWC83rW+no9hY4oXVDnzuc6/mwsfArI63humH
	AuhGmYMNowlJPpNh85bx4HqNyMl1m8hkskrmMDYWWckwwsG0mQa/JOdo1OJAev7v07Ddn/ypzeU
	22N4tpNz8QxpL8q5J7A/UwL+viIKFdLzFyS/rugeRmROJWOPzz5eWUlUIIsOfgz2kMLzFw4nnpL
	NR8FPzC5oTjxK3F5gGpThfgX+vhlunq5Qt71Q==
X-Received: by 2002:a05:6000:144c:b0:43d:77e1:6a69 with SMTP id ffacd0b85a97d-45eb38c2026mr34633256f8f.38.1779828053275;
        Tue, 26 May 2026 13:40:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6e49:e380:c3e5:25e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb557545sm904864f8f.12.2026.05.26.13.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 13:40:52 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: renesas: r9a09g087: Add xSPI nodes
Date: Tue, 26 May 2026 21:40:44 +0100
Message-ID: <20260526204045.3481604-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526204045.3481604-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260526204045.3481604-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-33183-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_PROHIBIT(0.00)[4.200.249.192:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,801c1000:email,0.0.0.3:email]
X-Rspamd-Queue-Id: 907965DC65F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree nodes for the two xSPI (Expanded SPI) controllers
integrated into the RZ/N2H (R9A09G087) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index c64b532f3d23..7a23112ed696 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1009,6 +1009,44 @@ mii_conv3: mii-conv@3 {
 			};
 		};
 
+		xspi0: spi@801c0000 {
+			compatible = "renesas,r9a09g087-xspi", "renesas,r9a09g047-xspi";
+			reg = <0 0x801c0000 0 0x1000>,
+			      <0 0x40000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 4>,
+				 <&cpg CPG_CORE R9A09G087_XSPI_CLK0>;
+			clock-names = "ahb", "spi";
+			resets = <&cpg 0x4>;
+			reset-names = "hresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		xspi1: spi@801c1000 {
+			compatible = "renesas,r9a09g087-xspi", "renesas,r9a09g047-xspi";
+			reg = <0 0x801c1000 0 0x1000>,
+			      <0 0x50000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 5>,
+				 <&cpg CPG_CORE R9A09G087_XSPI_CLK1>;
+			clock-names = "ahb", "spi";
+			resets = <&cpg 5>;
+			reset-names = "hresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g087-cpg-mssr";
 			reg = <0 0x80280000 0 0x10000>,
-- 
2.54.0


