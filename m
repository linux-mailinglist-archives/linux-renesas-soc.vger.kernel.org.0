Return-Path: <linux-renesas-soc+bounces-33751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dzbMJdD8J2q66gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:45:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E891365F9A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:45:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=f0K17pzG;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFCC03057067
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 11:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F8B3FFF80;
	Tue,  9 Jun 2026 11:39:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE123FFFA5
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 11:39:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005150; cv=none; b=t7DYvPzS23OWJCJyE1tZP3opMFshy925svOuk1juQgpJxqRIJ2uMMwsTMLPnbaH7yUHpruw+bDU25BvXUVoPtbNKKUf/fq+kDBZJ+hRJ8I8CgLQw3AbP0Go+7a5476oy3khPxWUa3+VpcCuoXuqWkeJFT1u5dha1ub5gZIAy3ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005150; c=relaxed/simple;
	bh=fTbdpRCyfFLaOtbYVQuXBTeh5e2Blvm9k0H83//ETNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DG7vnKAFwN1cG0NplYg0JEW6FVSsKJ7Dre98lJNYURMoi8xXD8dCRxIRQ17cfL25hq7uhVEXZP4x8Gss1mBSLXuOxpadkktqGguP7aT2d1cBYJ91lk//3I/VoAtGNYWKZnvqXLAfKXxUf04HSw2ZS3RIc57gzUpbXRhg/L+M8Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0K17pzG; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf3781ca51so50401785ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 04:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005147; x=1781609947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwW5NMDZEbB74SUEwI6Q2ihuAyLFKsCwR8MKDpGPFxY=;
        b=f0K17pzGok8AG6cblWdht+Y+BPqVuaLw2dmKrPaRplni+FCwgCS3j+9kVFL+gslipB
         cpQQwL+kq5+WP46TtnC55rbKiWZ2me8IfuGS0lyi8s8w6G/KzGdTXM8CCgUiV5h7GQD9
         06IkXgygPzwE5rlEBmnEU4GLRpvgQPSC67NJ5lqYaU1e6CWgHBvWLi/doZjZyH5vP/73
         Y+oeLbcXPP3qiilNBXPMxIEuLX03DKtkbh8QADw/SDI5P+SY0vEh4Zg/4gN2I4JLYjF6
         8FpZ+hEtkgjhXffD5JeDayv0aWJVEsngAb2/KQ9/5Kcm/McYQzaQ9ZEUciTTUgImF13A
         /O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005147; x=1781609947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JwW5NMDZEbB74SUEwI6Q2ihuAyLFKsCwR8MKDpGPFxY=;
        b=J/UdHwzsYfhHccEKCMfbtO1MuJupUuRMRGmOfdapS34O12VXxC5pIamIkSuDkpurEH
         IeT9zTjgT3vcKB9Rhp3IYjBLynBA39xgakx0HWPNOW91BXR+GS2GfJbprNWADWyDPe3l
         K+WeVuBnGf8AYXJtcOzq+Q1GXO8mFuTP2l0Ya1eQkvNHLQAYgF7Q8c05cSYXg5+VmC9q
         w6QVRVQRPVztu5Va31vDUyXWBG0ooGk2xLJcQ8TxHD2isTJchiVZs6I+2ZSpNRqUnM3O
         colJtobTi3LsiZ8LrerN6wMLtIEz3/1yQEXLTdBMDd6Fx3AM6iQ76uCq8pp3xX93+hsL
         8DhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gg/wMZi5nG47nKoXp0MNpckgXjyssjeBvx3raD3AWnig5SUnRp9r1wBEeK55/5x+/4VZHDe/9Zz/9CwP8vovZng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXk22r1saeCpznDsHIX67KWwLXUfObZbPsKR8HHPQb87o7ASJ5
	ihRtJrT3D23Nk1aWKdT6y+jsMoSmn3vIIFmCGJ4Aw3lludQX5RW1mFvIKSYHOQ==
X-Gm-Gg: Acq92OG9wgAGJIFbVTrtenkJrhyp0W0vRcEtM33h3OOFcjtJkR6K90lXqprGAYHBzZP
	xEMG5QpN4g4OoyQIj22vQoIby/CrPSe0EW9sjwLu0w5I6NRxaRdqJOsgomMzwgMYyv+xOwlI+xP
	kdn9jeywfwZ1X9qY1hvvKIBFcBjar2llTdx/j7PtHK4+35N3G5VaIjCiKt4YNt7DDD/5IFAG6/D
	SxR+E1jQQk9a12LcV7v/KpblXbnOKeWjq00kHr7n3ufV0wStCTNu59LJLeGS95+0owFa68FD8rn
	4N3VRXR08zA1G6HWGTPW32Wns+i3KOuL9VT+cQxtn77JTYn10ZL6fNepx/VfR/WGYYjxs311+8R
	+lcX7DFY8GIlcA1ZpNC4VtExgMt2RJbiAzhPfe+0IfJuIFDBFS5s976DoSLLCdZmK9Q4Vd6HvpZ
	v2OmlFGo8dT1X9cyOvZ2QCyyHg89dW0R7B+7HWhUvAFH/elZuXMoRLI8ikYzEJd55FLUvi/jy+z
	tEkexA=
X-Received: by 2002:a17:903:3d06:b0:2bf:2114:ecbe with SMTP id d9443c01a7336-2c1e8209435mr230863995ad.23.1781005147530;
        Tue, 09 Jun 2026 04:39:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
Date: Tue,  9 Jun 2026 18:38:27 +0700
Message-ID: <20260609113836.45079-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33751-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E891365F9A3

From: bui duc phuc <phucduc.bui@gmail.com>

Add the SPU bus clock, icka/b functional clocks, and xcka/b external
clock inputs to the FSI device node.
This prepares for subsequent driver changes that explicitly manage the
SPU clock required for FSI register access on the r8a7740.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab4..6f9d9bbfd159 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -393,7 +393,11 @@ sh_fsi2: sound@fe1f0000 {
 		compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
 		reg = <0xfe1f0000 0x400>;
 		interrupts = <GIC_SPI 9 0x4>;
-		clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+		clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+			<&fsia_clk>, <&fsib_clk>, <&fsiack_clk>,
+			<&fsibck_clk>;
+		clock-names = "fck", "spu", "icka", "ickb", "xcka",
+				"xckb";
 		power-domains = <&pd_a4mp>;
 		status = "disabled";
 	};
@@ -614,6 +618,12 @@ vou_clk: vou@e6150088 {
 				 <0>;
 			#clock-cells = <0>;
 		};
+		fsib_clk: fsib@e6150090 {
+			compatible = "renesas,r8a7740-div6-clock", "renesas,cpg-div6-clock";
+			reg = <0xe6150090 4>;
+			clocks = <&pllc1_div2_clk>, <&fsibck_clk>, <0>, <0>;
+			#clock-cells = <0>;
+		};
 		stpro_clk: stpro@e615009c {
 			compatible = "renesas,r8a7740-div6-clock", "renesas,cpg-div6-clock";
 			reg = <0xe615009c 4>;
-- 
2.43.0


