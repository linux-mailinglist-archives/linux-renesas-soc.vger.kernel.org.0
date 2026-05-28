Return-Path: <linux-renesas-soc+bounces-33286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJxKFOhJGGpoiggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 15:58:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E12125F333F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 15:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CA50328AA71
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 13:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9222C282F25;
	Thu, 28 May 2026 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJg16ENh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C95324677F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 13:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976083; cv=none; b=rTsZ08oq5l/FSGXkYonVG/Phybdi4KIejoyC+SrxrzshZ8n7gF//+x8RiPRkF1QyQ6cBGl5U2M2nhFmEgopNpAvem0qtDB5RWcIuqDtzOTfHM3qiYwfTvIUzgVJsXpBiGppUb/Go+WpQ5CoJ3jp3sb1m9RYQNRuPJHgThmiTPyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976083; c=relaxed/simple;
	bh=OhT5XTdCnmZPwjUqMASPcfbQyEP6D3JJx3ZVnZSOBMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hx1Ogw3MGq3QcK5nkPLxz+aG6A+upz5Dgw0OLpKeqNbB7+tgEYnP8dHC6u157s7YqNM719LiHk3Pe8KzH7VT+plgTcP8ktt5k4KyK0nLtLvQCq40VaipYtjjpSXsYKtajun0mlcqgy0HpU1AMTxG9zDHB0ZOyc23nqP72FVvlUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJg16ENh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4906238c62eso42054215e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 06:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779976079; x=1780580879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6a/KOtv5cuojKiqvq5Aw3Jx8xD/OEeudcBYxVCD8BM=;
        b=EJg16ENh8yuAjYsdlmtNpTBijsABg7mhsJgOiCzd7mgu2l7swiLWVhuCQvsgABRG3v
         fu44KWkioWD8K15ZUKFhIqjw9XYBWdqw9JMU981OOTkfkVCiM4aUxsbBCCk89wovJHL1
         fK7FmaKaRiTXKusz+M8vR9MLxsWDngUfdkpgclxBUiHVj4+K3ZEy+1inPFVFjtuCS/iJ
         6QJ1DNGcV+bdC7pQr357u3jCeEkAqvvgkSSh3ZsairMtR3IPyR54XE2XRHzDWTG/O/2N
         EefR+SVxrldvTagpW3Gx9S3pmQwrBDI7GLVih28o0gpQQ2lXqfIHVNBS1xPVJV48vG6H
         csng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976079; x=1780580879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r6a/KOtv5cuojKiqvq5Aw3Jx8xD/OEeudcBYxVCD8BM=;
        b=qL48OQ2qYlZaCA9dZaJlHs8HMA616NkIMPcLkfLzTc1JG/NKRy/TRIJ9prlXIGctOU
         QS0/tZX78l4O4rzBdjYUdBGGmY5tzjnyDXf5DYfiAUq2soYF9FR0lvZ0dKhppaFiwhkx
         tXVbgmdwvGI2Skapzg7vC+h9YjJTfrHSmrfbTrgnIBqdtJg/YHoZt9W3Eio0bcbpc4ZV
         yhvppWsZ8qZrj38LPBw/L0vwt5F5dLbVMA2+L6vJ/enaXXFXs8t8RM1BweLYGLT9POcX
         iRl031NDcyzrSzF5nU9gjwzaG2aIIjleap90KSkmCzoUOhJgFlvX7gLi5LBtOKH4WN3q
         zMJw==
X-Gm-Message-State: AOJu0Yzkk22pWlpiIuoiRi5G4+6mfZG2M3RzJY3sgykbftgcG+ouVrc6
	G8GX+3DsNcUdnnDXcrIzeAkmqdUHDJF2pvnn00XU4qnBTZ9uRGyiqEth
X-Gm-Gg: Acq92OGrqeHBV5+q/hOxyHKyUmArEEJNpVbFQuTGYgNDu3dtkrSXq23EGLQMg3wa1Ia
	KowFhSAD1TrnvmTJCXyGOW/TLoe7Rw/6/xJo3Pcov4cOscCziRm/S1bjaJL/NLX8bPMUyAh/WX6
	NSWMY5S/yk57Aikzvxh0IprUuw50YQGJ4kIbPHqNTjDqxechgH4cOouoU/NtR0+SHtgfgSLEtx+
	bIFBjKydh71T/eLAsAULNMrE2VOVoAXJP6CculpTsAUh2iQ7L53SIf43ySGEcjHEkc2YoNphHKZ
	vaTDcCoAI+lakWvFPC4ZD3+NV8fs8qhMXvEFbDhQgqWjyyeAP2yS+LOqaKEQ2FvQpNQA3ZWXaBf
	GNI99PhSMbA6vKQzKiehC8X1L4U/TiRvS7wpuhabeHDr6+UIZQg5L2f4TcOrp6NfWNSY7HMuMpy
	WEtTScDSa4TorCxCSk2aaDBAiM3bnhsG850jBoXVvfNWm4Nfw7+kP0lWqATuwJ5tu888y4oTeto
	UCpln7x3u+BuneroQ1O+FG3eGWR+gz1cOxQv+iTGbU/eCg=
X-Received: by 2002:a05:600c:310c:b0:490:53d3:4753 with SMTP id 5b1f17b1804b1-49053d34968mr367864985e9.31.1779976078562;
        Thu, 28 May 2026 06:47:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e50f:a16:236e:f9a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb54903csm14013775f8f.6.2026.05.28.06.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:47:58 -0700 (PDT)
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
Subject: [PATCH 1/3] arm64: dts: renesas: rzt2h-n2h-evk: Remove unused MII/GMII pins
Date: Thu, 28 May 2026 14:47:50 +0100
Message-ID: <20260528134752.79813-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33286-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: E12125F333F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the unused TXER, RXER, CRS, and COL pinmux configurations from the
gmac1 (ETH3) and gmac2 (ETH2) pin groups.

The Ethernet interfaces on both the RZ/T2H and RZ/N2H EVK boards operate
in RGMII mode, which does not utilize these extra MII/GMII sideband signal
pins. Update the board switch configuration comments to accurately reflect
the pin ranges that are actually in use.

Fixes: b272b94fd2239 ("arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts   | 14 ++------------
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts   | 15 ++-------------
 2 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index e9ed2de128f6..987e44d0bf95 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -256,8 +256,7 @@ can0_pins: can0-pins {
 	/*
 	 * GMAC1 Pin Configuration:
 	 *
-	 * SW2[8] ON - use pins P33_2-P33_7, P34_0-P34_5, P34_7 and
-	 * P35_0-P35_2 for Ethernet port 3
+	 * SW2[8] ON - use pins P33_2-P33_7 and P34_0-P34_5 for Ethernet port 3
 	 */
 	gmac1_pins: gmac1-pins {
 		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
@@ -272,10 +271,6 @@ gmac1_pins: gmac1-pins {
 			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
 			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
 			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
-			 <RZT2H_PORT_PINMUX(34, 7, 0xf)>, /* ETH3_TXER */
-			 <RZT2H_PORT_PINMUX(35, 0, 0xf)>, /* ETH3_RXER */
-			 <RZT2H_PORT_PINMUX(35, 1, 0xf)>, /* ETH3_CRS */
-			 <RZT2H_PORT_PINMUX(35, 2, 0xf)>, /* ETH3_COL */
 			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
 			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
 			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
@@ -286,8 +281,7 @@ gmac1_pins: gmac1-pins {
 	 * GMAC2 Pin Configuration:
 	 *
 	 * SW2[6] OFF - connect MDC/MDIO of Ethernet port 2 to GMAC2
-	 * SW2[7] ON - use pins P29_1-P29_7, P30_0-P30_4, and P31_2-P31_5
-	 * for Ethernet port 2
+	 * SW2[7] ON - use pins P29_1-P29_7 and P30_0-P30_4 for Ethernet port 2
 	 */
 	gmac2_pins: gmac2-pins {
 		pinmux = <RZT2H_PORT_PINMUX(29, 1, 0xf)>, /* ETH2_TXCLK */
@@ -302,10 +296,6 @@ gmac2_pins: gmac2-pins {
 			 <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD2 */
 			 <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD3 */
 			 <RZT2H_PORT_PINMUX(30, 4, 0xf)>, /* ETH2_RXDV */
-			 <RZT2H_PORT_PINMUX(31, 2, 0xf)>, /* ETH2_TXER */
-			 <RZT2H_PORT_PINMUX(31, 3, 0xf)>, /* ETH2_RXER */
-			 <RZT2H_PORT_PINMUX(31, 4, 0xf)>, /* ETH2_CRS */
-			 <RZT2H_PORT_PINMUX(31, 5, 0xf)>, /* ETH2_COL */
 			 <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* GMAC2_MDC */
 			 <RZT2H_PORT_PINMUX(30, 6, 0x10)>, /* GMAC2_MDIO */
 			 <RZT2H_PORT_PINMUX(31, 0, 0x2)>, /* ETH2_REFCLK */
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index ef6cc7497c2c..a66502d8d82b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -339,9 +339,7 @@ can1_pins: can1-pins {
 	/*
 	 * GMAC1 Pin Configuration:
 	 *
-	 * DSW5[8] ON - use pins P00_0-P00_2, P33_2-P33_7, P34_0-P34_6
-	 * for Ethernet port 3
-	 * DSW12[1] OFF; DSW12[2] ON - use pin P00_3 for Ethernet port 3
+	 * DSW5[8] ON - use pins P33_2-P33_7 and P34_0-P34_6 for Ethernet port 3
 	 */
 	gmac1_pins: gmac1-pins {
 		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
@@ -356,10 +354,6 @@ gmac1_pins: gmac1-pins {
 			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
 			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
 			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
-			 <RZT2H_PORT_PINMUX(0, 0, 0xf)>, /* ETH3_TXER */
-			 <RZT2H_PORT_PINMUX(0, 1, 0xf)>, /* ETH3_RXER */
-			 <RZT2H_PORT_PINMUX(0, 2, 0xf)>, /* ETH3_CRS */
-			 <RZT2H_PORT_PINMUX(0, 3, 0xf)>, /* ETH3_COL */
 			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
 			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
 			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
@@ -370,8 +364,7 @@ gmac1_pins: gmac1-pins {
 	 * GMAC2 Pin Configuration:
 	 *
 	 * DSW5[6] OFF - connect MDC/MDIO of Ethernet port 2 to GMAC2
-	 * DSW5[7] ON - use pins P29_1-P29_7, P30_0-P30_4, P30_7,
-	 * P31_2, P31_4 and P31_5 are used for Ethernet port 2
+	 * DSW5[7] ON - use pins P29_1-P29_7 and P30_0-P30_4 for Ethernet port 2
 	 * DSW13[7] OFF; DSW13[8] ON - use pin P13_7 for IRQ14
 	 */
 	gmac2_pins: gmac2-pins {
@@ -387,10 +380,6 @@ gmac2_pins: gmac2-pins {
 			 <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD2 */
 			 <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD3 */
 			 <RZT2H_PORT_PINMUX(30, 4, 0xf)>, /* ETH2_RXDV */
-			 <RZT2H_PORT_PINMUX(31, 2, 0xf)>, /* ETH2_TXER */
-			 <RZT2H_PORT_PINMUX(31, 1, 0xf)>, /* ETH2_RXER */
-			 <RZT2H_PORT_PINMUX(31, 4, 0xf)>, /* ETH2_CRS */
-			 <RZT2H_PORT_PINMUX(31, 5, 0xf)>, /* ETH2_COL */
 			 <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* GMAC2_MDC */
 			 <RZT2H_PORT_PINMUX(30, 6, 0x10)>, /* GMAC2_MDIO */
 			 <RZT2H_PORT_PINMUX(31, 0, 0x2)>, /* ETH2_REFCLK */
-- 
2.54.0


