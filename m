Return-Path: <linux-renesas-soc+bounces-34015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i8ZGKGHoL2psIwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:56:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C95F685E20
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:56:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="FR6HEI+/";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A09C33036E76
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 11:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DB63E5EFB;
	Mon, 15 Jun 2026 11:55:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0543E5A04
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 11:55:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524506; cv=none; b=qqmkkan+uA6oaHuPP3gWXIw2qj3sYMUPoCyOTPTgLDMzVhb76vKotzFgbvBfGi8GfH8LN7Z16K5X9b5J1hrUdMkGstQH+lyZcfgVJNudmll2IqmxWfCjZEWJJj723jezbBpdByPaQM5AP+gofXdLRGouHZd0ysfO20BJqRAWTA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524506; c=relaxed/simple;
	bh=iIqdeceLBd8o4dpGNgrGXIqW2qIXMZqTLra9/ulPGec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X77MwbvGnmWVe419/QwiQuD3Ng57xNGilYbJUdmhHdeuWbMqrmMmRY8G8uRNyeW15KlpNbSTaGw2I4cLRysMlfokF/TOldgYUJioO78lZLQicR7dPRS0aEciA8jIXS6LM56UlQ8dgGfv2tRAt9iWUKnuL5I7eRjaPjk1BpXu+5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FR6HEI+/; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490ac357c55so31276325e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 04:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781524503; x=1782129303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNOjErN7U84k+g1oYD7IlinTGSIclAIYsLUB5M+nSUw=;
        b=FR6HEI+/C4s95U2OVWoZuWSPlL2yjQlo6rDUa6nT0+8BdX8KABLhVYYs5VkI2T40tf
         PVe6rIIRF8jGrorZbCoGl+4AnlukfKlEzbH581DBx2hGb3IQFaq5ytUW564HMA0H5PAg
         C0zmxuCBjkROKTAO87Y1LjK/gpfm/Rg8+9rZryjqfnngVgf9mTj0rHhgeK23xeqiGXp9
         ZWSbK8Si+gJX9GPtC/X4CNtZvnb/sTXVRtCICWktdirdL8TKRhgx3WSLMS3xnHlYSdHN
         1pGLh4rw6EpNJdWR+x38JnZLCXmL9/YkRB3bfIRGalYbBZOXO2Fgt9HwhTVpKpbnIPEX
         sS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524503; x=1782129303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xNOjErN7U84k+g1oYD7IlinTGSIclAIYsLUB5M+nSUw=;
        b=pLtEZn5WJ+UHh5GM8u3qsUxE37BE7mH+plz8mWgbAZ6fQPEPXXQ9PNYQB9kfksVg8J
         xwWpHzqFlCWXBScuD83Rdp8z42V0D41Z2z8zWfTvO45FGwHMHjLpYjK6VwZ3iLIyqJF+
         X7/ODKgcNA8g56MNg8T8iMVutqr3g664U39K6CqfpVVyc4Dgl4VWS5BW1q7LPfrEB9m1
         zMSs6O2nJpxljAhHlkyg2qQkk4cv6zMIG4qLQ7mdJFSgiZe07UaDbEBe2sGs1cRW4DCn
         mE/cREb2Wami3FO3SglbGW7Ff+MXatxUgszmyDyXxmQsL62KXN6XKSvocTLh/y4pLzam
         AfyA==
X-Gm-Message-State: AOJu0YyQvWgmtTiHggWYUzHq83RcYVAy7f/3I6tLp3xkHR9oTIp9/k+A
	EKJaK2pU/uTsGQpSfT3hk7DAF6+YYETEgwJSw4L9H+V9zf3dmSbdQ/6s
X-Gm-Gg: Acq92OHsC4gs/qS3SUdWNiBkKKWGEBOiIJJD1k2u9hmzpJVHFMIYzREne6pySdrNc9O
	oI2009aQblSnlrggXd0eJzPyt3jMvE9mb//xdCrGtOEgTlMLkdky9ziEcKd2MxCnIeVGxo33mfH
	EUhTMtn2W6Mp1RCNUtbDEeRx4VH3ui7DsDSjtaUJY1U0XlSaLWONYhkvLPA+gD01cOcGezF9kAp
	RmtIeiZsx3L+my7GAFT46h4Y882Cj7ipyz4LcxbnidpXs+g7/ssanaDQX2i3NAVx3LD1ICZuEuR
	xExejgDkrA4YonmWovMZ2igow9LrQqU35/FCDzNU5qDwKW3yNUpq0wzZezb1nlnZWjl3YPUELiY
	s61ZkyXE9g+jZYSVtBzYS/azVVDDWtFg7ardUpm7JvMJQsaDuW2AXol2cBMHsrKW3aEOpWRC0Oz
	aNfWmhKNW/NwYNcJFabk7THWHJlPOm3ds14HxxRTNjXeY5nzWDLd+B+OEb6QQOOdrZbvR7iTzfp
	vjMscjC3ZBTfav/24qo6BCCPg6QtvPtttr/
X-Received: by 2002:a05:600c:1d11:b0:492:1e36:552c with SMTP id 5b1f17b1804b1-4921e365572mr133832655e9.37.1781524502499;
        Mon, 15 Jun 2026 04:55:02 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203dd0b9sm240455485e9.15.2026.06.15.04.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:55:02 -0700 (PDT)
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
Subject: [PATCH v2 3/5] arm64: dts: renesas: r9a09g087: Add VSPD and FCPVD nodes
Date: Mon, 15 Jun 2026 12:54:53 +0100
Message-ID: <20260615115455.1412098-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34015-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C95F685E20

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add VSPD and FCPVD nodes to RZ/N2H SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped internal RB tag
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index e8d4f76949cc..174f683fa68d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1379,6 +1379,28 @@ sdhi1_vqmmc: vqmmc-regulator {
 				status = "disabled";
 			};
 		};
+
+		fcpvd: fcp@920d0000 {
+			compatible = "renesas,r9a09g087-fcpvd", "renesas,fcpv";
+			reg = <0 0x920d0000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G087_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+		};
+
+		vspd: vsp@920e0000 {
+			compatible = "renesas,r9a09g087-vsp2", "renesas,r9a07g044-vsp2";
+			reg = <0 0x920e0000 0 0x8000>;
+			interrupts = <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G087_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.54.0


