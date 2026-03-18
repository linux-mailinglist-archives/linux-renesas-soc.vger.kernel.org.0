Return-Path: <linux-renesas-soc+bounces-29782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEtKFzixumkVawIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:05:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0141B2BC98A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D45130162B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E583A63EF;
	Wed, 18 Mar 2026 14:01:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40019481B1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 14:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773842511; cv=none; b=mtB3O0oSrG8izCQHYpTlW1eWpCYeqtIi1gG7M37LMpQ7FfHBeJQlzeHl8Gn/SPvx35IIpBLxhfDzEb0I8/5ctUInlPYqPoxgclwlq6UMvXQ1PkaJYPHhHAnFyydk2qsnfL48NlP2//Jrfm5ORyaEwhxs4/eoEJ4V0CJwYIs4Be0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773842511; c=relaxed/simple;
	bh=oVw+SbeXAQrhJMnjeOLxQIDA3DEsbUNZNv6Pdkq2q18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LDm3wl8JDMVW/N+TBh+oxRoPlzXCtEXCnOzm2t6sgdW1+3rFZwwtXfQzDuGo8KJ7DQ2Vtv/h3S8hTJWdLU6z2gi0KoJ4cfGtDu3jk/EtxJnSzbcMstzvE0PN2OesqoXTEJlVqEV5rrz2OG1xyUQRi8vi7HEQcN7POlmGb5CVXQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1644C19424;
	Wed, 18 Mar 2026 14:01:49 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: rzt2h-rzn2h-evk: Fix GMAC pins sort order
Date: Wed, 18 Mar 2026 15:01:47 +0100
Message-ID: <4ce75f75a0569a4cc6f74dfda8b75f6f1a2495c1.1773842409.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29782-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[glider.be];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.infradead.org,glider.be];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.747];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,glider.be:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0141B2BC98A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Restore alphabetical sort order of the pin control subnodes by
exchanging the gmac1-pins and gmac2-pins nodes.
While at it, fix the index in an incorrect "GMAC2" comment.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v7.1.

 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 58 +++++++++---------
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 60 +++++++++----------
 2 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 52e5f6c3ab67d177..4c0e52850ca97250 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -253,6 +253,35 @@ can0_pins: can0-pins {
 			 <RZT2H_PORT_PINMUX(24, 4, 0x19)>; /* CANTX0 */
 	};
 
+	/*
+	 * GMAC1 Pin Configuration:
+	 *
+	 * SW2[8] ON - use pins P33_2-P33_7, P34_0-P34_5, P34_7 and
+	 * P35_0-P35_2 for Ethernet port 3
+	 */
+	gmac1_pins: gmac1-pins {
+		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
+			 <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
+			 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
+			 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
+			 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
+			 <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
+			 <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
+			 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
+			 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
+			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
+			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
+			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
+			 <RZT2H_PORT_PINMUX(34, 7, 0xf)>, /* ETH3_TXER */
+			 <RZT2H_PORT_PINMUX(35, 0, 0xf)>, /* ETH3_RXER */
+			 <RZT2H_PORT_PINMUX(35, 1, 0xf)>, /* ETH3_CRS */
+			 <RZT2H_PORT_PINMUX(35, 2, 0xf)>, /* ETH3_COL */
+			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
+			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
+			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
+			 <RZT2H_PORT_PINMUX(27, 2, 0x0)>; /* IRQ3 */
+	};
+
 	/*
 	 * GMAC2 Pin Configuration:
 	 *
@@ -283,35 +312,6 @@ gmac2_pins: gmac2-pins {
 			 <RZT2H_PORT_PINMUX(31, 1, 0x0)>; /* IRQ13 */
 	};
 
-	/*
-	 * GMAC1 Pin Configuration:
-	 *
-	 * SW2[8] ON - use pins P33_2-P33_7, P34_0-P34_5, P34_7 and
-	 * P35_0-P35_2 for Ethernet port 3
-	 */
-	gmac1_pins: gmac1-pins {
-		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
-			 <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
-			 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
-			 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
-			 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
-			 <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
-			 <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
-			 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
-			 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
-			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
-			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
-			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
-			 <RZT2H_PORT_PINMUX(34, 7, 0xf)>, /* ETH3_TXER */
-			 <RZT2H_PORT_PINMUX(35, 0, 0xf)>, /* ETH3_RXER */
-			 <RZT2H_PORT_PINMUX(35, 1, 0xf)>, /* ETH3_CRS */
-			 <RZT2H_PORT_PINMUX(35, 2, 0xf)>, /* ETH3_COL */
-			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
-			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
-			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
-			 <RZT2H_PORT_PINMUX(27, 2, 0x0)>; /* IRQ3 */
-	};
-
 	/*
 	 * I2C0 Pin Configuration:
 	 * ------------------------
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index 3c636c92f3d6f445..ef6cc7497c2c4c8c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -336,6 +336,36 @@ can1_pins: can1-pins {
 			 <RZT2H_PORT_PINMUX(12, 1, 0x19)>; /* CANTX1 */
 	};
 
+	/*
+	 * GMAC1 Pin Configuration:
+	 *
+	 * DSW5[8] ON - use pins P00_0-P00_2, P33_2-P33_7, P34_0-P34_6
+	 * for Ethernet port 3
+	 * DSW12[1] OFF; DSW12[2] ON - use pin P00_3 for Ethernet port 3
+	 */
+	gmac1_pins: gmac1-pins {
+		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
+			 <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
+			 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD0 */
+			 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
+			 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
+			 <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
+			 <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
+			 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
+			 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
+			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
+			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
+			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
+			 <RZT2H_PORT_PINMUX(0, 0, 0xf)>, /* ETH3_TXER */
+			 <RZT2H_PORT_PINMUX(0, 1, 0xf)>, /* ETH3_RXER */
+			 <RZT2H_PORT_PINMUX(0, 2, 0xf)>, /* ETH3_CRS */
+			 <RZT2H_PORT_PINMUX(0, 3, 0xf)>, /* ETH3_COL */
+			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
+			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
+			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
+			 <RZT2H_PORT_PINMUX(17, 3, 0x0)>; /* IRQ15 */
+	};
+
 	/*
 	 * GMAC2 Pin Configuration:
 	 *
@@ -368,36 +398,6 @@ gmac2_pins: gmac2-pins {
 
 	};
 
-	/*
-	 * GMAC2 Pin Configuration:
-	 *
-	 * DSW5[8] ON - use pins P00_0-P00_2, P33_2-P33_7, P34_0-P34_6
-	 * for Ethernet port 3
-	 * DSW12[1] OFF; DSW12[2] ON - use pin P00_3 for Ethernet port 3
-	 */
-	gmac1_pins: gmac1-pins {
-		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
-			 <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
-			 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD0 */
-			 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
-			 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
-			 <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
-			 <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
-			 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
-			 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
-			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
-			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
-			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
-			 <RZT2H_PORT_PINMUX(0, 0, 0xf)>, /* ETH3_TXER */
-			 <RZT2H_PORT_PINMUX(0, 1, 0xf)>, /* ETH3_RXER */
-			 <RZT2H_PORT_PINMUX(0, 2, 0xf)>, /* ETH3_CRS */
-			 <RZT2H_PORT_PINMUX(0, 3, 0xf)>, /* ETH3_COL */
-			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
-			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
-			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
-			 <RZT2H_PORT_PINMUX(17, 3, 0x0)>; /* IRQ15 */
-	};
-
 	/*
 	 * I2C0 Pin Configuration:
 	 * ------------------------
-- 
2.43.0


