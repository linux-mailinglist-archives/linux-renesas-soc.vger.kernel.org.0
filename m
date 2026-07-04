Return-Path: <linux-renesas-soc+bounces-34698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZVuVO8nTSGohuQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:35:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95074707452
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:35:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QQSVGvLv;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF5A9301C2EE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 09:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E9B3A6EE4;
	Sat,  4 Jul 2026 09:34:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28A03A9870
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 09:34:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157687; cv=none; b=N2A02UOEc31eOHqYUqOBBzCpvOJz0GgY4xeBdD7LiwRPgR8gjz44uTtomD28RyviDeFl79yweBJme16cLdeQYqGDOBhr38W80GtCr6yQKHzlekLZlH6i7R0DudI3CKJ8T6o/mb5FBzwXwY0kLpVJ4Xxo1MyIAH1OmcbMRJ5WHBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157687; c=relaxed/simple;
	bh=61HD1HNENSkzq874mpXMvr1175EVmr+2k1+MUOchsTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bfGf7582c1l9wJDRLij/aMgIoPXdjF3VTEZfeI4/ZQ0kRGhWbEznGN5xf06hJxxfCrWEDnEOaOweDNOo8srKPNMXC0+icCoEENIDUkUtHP18zRdTLfaxLCQ2C9UZDh+fZwcbhZFGeX/zG9hFcur+bm7+Gr0ClFNd2jQCANqpNMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQSVGvLv; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so9320975e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157683; x=1783762483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgGkGuADGw9QjPycnBerHmQm1hL3ZOQs1w9GMxfDvOY=;
        b=QQSVGvLvC/juDWisV0t/trXpsg8SBX0LOpQEOhYUYoEnCe7dGOV+q9X2sobZulM7vZ
         ic4ru7l9j8td6pEt20oN9I3pD0wmbbFhYLpQN3bjT00gpW9temvQ8C7S3s6Te6dfJjUZ
         z2sogE4B3RG8mTKa7+jcgj8YMFFGM8K6fhWSdjqbR4PFvXRAj42WUnjAUcEUq03qcHdA
         A6iNSLyzi8OXZ7P06sTDf4iBJK6DVHVD/373t0Wbg44Jrb7x9t0yNOHuLXiQQx2JBthp
         mtsULFcpn16si+ynonCkXnlYVsFkdWkOhQcWSXicWKib3arnrLEIkSWTkXOI49kyW7o8
         PzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157683; x=1783762483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vgGkGuADGw9QjPycnBerHmQm1hL3ZOQs1w9GMxfDvOY=;
        b=QdxE9P7N2U5CH5STEnP3NjBudZ4prm9sVZOhC2Ulvun+26laeClo7KVIIvtKJhjejY
         3V/Qt/99dn8TMOx0QdQc2wdoqUV7HvYq6nXrQd2wbdcBOsscaKRGYvYVQ/pGNubOWrss
         TzO0woW6P7Bz/24NNwzJc4SJySrPVNdGGwuxELe2mcyqC72rzdWsd66zW0nHy4FdSGkg
         NrZ6febz4utgCeNLNh1IFcbQDv/ZVL3+4dOq3gzN/BLKVf7hUHD45ecsHg4HEhEe+FgE
         f9GEwMj3kigqVxsxmLlpTVDip81fAihKXoVf1A1dPiH9Qj19qc7uef533LpCcU5pdtn0
         f41A==
X-Forwarded-Encrypted: i=1; AFNElJ+lnuSKHZVXDWljTJVyo6zM4GVJU+zYGLbVEu+EAYT77VrnFOgZhiwa1zAeMCth7+ZXMxx9S8VCkz5eAaH4eVsVIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoQ+5jqLWfupNe/Fi102iRtf3U2m+91tyFwUtgjV8IU8cfTzSC
	VAN80HD9Nk2Iy2rzoiOGEBEsg6WAtVAqA/B+HaF6E4GBjRK/ZYRHysNr
X-Gm-Gg: AfdE7clLmtIa5xmQuoCkRsa8arI0OKnunKDDq3kN8xje38aiqrnVdNpGvrOv71b/SJ4
	DluM40Urmi3/kGx2QOjbsXYyTi9otlXigeAtzqfsSsAy2icsOJutIV3ozcORgkquPgyNUnP4YrB
	4N5X+HHRZ3pczYcx8quPfwnOzTdYo3tqJ+u+2nyyXbuYCi3qRVoQNZVrQg68R7FDEWP0sv1amZi
	M5vTS5yuMcKIkiHfvmx0Zjxp1/KDkSPa3lSFaKl8uHCobIOEbpRLBSV9ltsmUAzn1eepjhhW9YT
	nZ8OAlvL/0pJ1ylGViugJnCYjWiVi2iDcePMNxn7gXExXHl+m+UBqNyf3tLebtDRqKSAi4vo97b
	1C1kOJSzudW9og1DSLao2cZSRfhvdJjM4cpHQnxp0K5OnWT5N4OnVqXs4+erxgdednLiM7ontWz
	hiDoUYH8DuzSglCFUL5R63
X-Received: by 2002:a05:600c:154f:b0:492:3754:15f2 with SMTP id 5b1f17b1804b1-493d11f703dmr27792335e9.32.1783157683377;
        Sat, 04 Jul 2026 02:34:43 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:42 -0700 (PDT)
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
Subject: [PATCH 12/16] arm64: dts: renesas: r9a08g046: Add vspd node
Date: Sat,  4 Jul 2026 10:34:22 +0100
Message-ID: <20260704093433.273672-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34698-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,vger.kernel.org:from_smtp,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95074707452

From: Biju Das <biju.das.jz@bp.renesas.com>

Add vspd node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index eb5604b84287..0d8507e0666d 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -696,6 +696,20 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		vspd: vsp@10870000 {
+			compatible = "renesas,r9a08g046-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x10870000 0 0x10000>;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg R9A08G046_LCDC_RESET_N>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd>;
+		};
+
 		fcpvd: fcp@10880000 {
 			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
 			reg = <0 0x10880000 0 0x10000>;
-- 
2.43.0


