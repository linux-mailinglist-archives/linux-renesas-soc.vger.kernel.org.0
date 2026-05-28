Return-Path: <linux-renesas-soc+bounces-33287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL/hJ8hHGGoUiggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 15:48:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEE05F2FC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 15:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9897A303D2D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 13:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBC4282F3B;
	Thu, 28 May 2026 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDJC2xwj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C4126FDAC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 13:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976083; cv=none; b=hbTpLN2BuszgMoBf9ZpMMZOp27L+vaVZSPV9aVIg/+FXVNC6XtGyM1daDWmkMUrKueWYtxSB98Lpv0PnvkmuauQXg98N6rKZWLX4AOYvpXGc6YbEOzVPzpMwEZ32sb74zJhiR1SEpYtzMs1D0x7BY3DTFMZyJUzOrQvo7L4PA4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976083; c=relaxed/simple;
	bh=2EWdcMrPkf1p8eDfkqZmZHPs8BmqSGwIW1yb+gViwc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3Ez8vlcRhBFIlxmMZ6Jv53J7T3aRf5duNgo66jnfAksoryxU507UANB+74kNY6h0ZT170Luwcqh6v7ZJJ34ei0toN/dELcNLzGTMEpy+XuPeoJhJO+jr8FxVy2fN9f2Ix00lb71pzaH4ecEdWMbbtxf5zfzgB4HjawLLueirSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDJC2xwj; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45eedc94d37so186681f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 06:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779976080; x=1780580880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAAY4ADZtMNNAxpwxGGAyfT+L5cJNl6r86p6t7OL4Ds=;
        b=YDJC2xwjRKF6AL82P04hsaLqIJzIziaaZMOoHvMnfsJoWwXJAH3D8qg6ve77dbFQ+9
         q5iuyuz8wlvddktQDPaGj7tDqcQ7COBGnUSUCYsNkv+kl+dwBqRVgBLuNihT5fM+UvHR
         3Dx8ylgT/eI265tkawWaGZl/tTuBdHcwUVT8+3p+NTGMTN+XA0FCSZdYQNrCF9Lj6hIO
         laECvyQ9XxPHyyuDwu0LBPSaAxhL3l9+b/6hoTt8zYR1lbJDGafrDAcBSrOrjiGxc8eH
         VWppuNzdE7jllRbqqC8EvGgWdVShZ8KEfLU89iyBGdoQI3fqt6O3jepxhWc0xeavfE1a
         /Dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976080; x=1780580880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XAAY4ADZtMNNAxpwxGGAyfT+L5cJNl6r86p6t7OL4Ds=;
        b=aHJAgu1bix/3O3cSxjwb6x/Mu1y8vFQNxvXfP7U3kFjoRPdg1mrp3Kd7gjRIbDB7z+
         2fYdYu273IiWai1vtrE/fBm9/y6adean+FNcli8anvNGhCiw1+EJ18zZmWenuOHHPOmE
         6TXXFeUdThodagxMcJkgO+NpcU/PjEOJbJDrhYJs5082FQHJ98/8vaah5W6vakSfGu97
         UXQqyTqCxp/JrrhT9OaePRh5Lx9L0hJQb2AujrNkCfQx2wUTRLKGpybptVEszEjKq+7z
         F5gspTcOc2dJ7jFfgtTRwKMd6xFZ7V2/Lc3x5ZZCBXozVP1IuzkVcEFyRsPTahKyGAS/
         5f+w==
X-Gm-Message-State: AOJu0YykZ/JORWNgQEPp2Sex0UDCHR6/WyFGP7XZz1j4Ggifjq/EtdJ6
	Tb40aw23BmRxvDYkokF5OjIfaUFz8vzvkX/9ktCiBxqs1fm7Q4ru52AR
X-Gm-Gg: Acq92OHVvOZTy71O6i+O2NV9vjnijwZAtNS3Q8QkGmgzsDxFuRIli3uMLpNFmNRhkGP
	/PT+tT/DIy/l87npUsqcNgu3HLjDLCkgWxBGEHgdVM5YhL0fDxR6WZkm/X/bFLebbACcmjbZSBd
	TpvGA7NuSgEY+xvq/UHuFBG5k2D+uBDnUl03z+Dmic5H1nLW3N9kcmPIDyCwTQ+snqZUVHq50O+
	lFtp7Em81N4vLev0Qz8HUIFstCOQqYzYI24jGadcmwzI08P6Wndn1AbREap0NfVDTBtNNayRSiI
	iTZ7JjzzokNKEsECOTFTWKWQxmYZrzQYEzivsG3sbS2XlOyg4lJ/EjIYJeSxUm2R772eD4wgpHx
	wvMgXQFwyPVftVCvScAX89XkXOrbQngGIFfuDDbfx2Wo7j0NTdWoqX9UmF9wh2Tc9yyl4L+mpy6
	5QLG6ltUgQJCwpIbu8XgRvUJmkAnUQSzj9XXo9U/lSsjj3J6UdIG/6rxjkfsTEjYOxM2r5hhB+A
	NuegYL7ddjxdH8TZV2Cg8KzhytRSfZkO76r0VhHa9233PiPE96Xg2WC7A==
X-Received: by 2002:a05:6000:2411:b0:43d:775b:c9bd with SMTP id ffacd0b85a97d-45eb38a167amr45793813f8f.10.1779976079394;
        Thu, 28 May 2026 06:47:59 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH pins
Date: Thu, 28 May 2026 14:47:51 +0100
Message-ID: <20260528134752.79813-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33287-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: AFEE05F2FC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the gmac1 (ETH3) and gmac2 (ETH2) pin configurations on the
RZ/T2H and RZ/N2H EVK boards to comply with the electrical specifications
defined in Table 58.11 of the hardware user manual.

While restructuring the nodes into pin groups, fix a copy-paste comment
typo in the RZ/N2H device tree where the ETH3_TXD1 pin mux configuration
was mistakenly labeled as ETH3_TXD0.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 130 +++++++++++++-----
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 129 ++++++++++++-----
 2 files changed, 191 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 987e44d0bf95..46ae17d0795b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -258,23 +258,54 @@ can0_pins: can0-pins {
 	 *
 	 * SW2[8] ON - use pins P33_2-P33_7 and P34_0-P34_5 for Ethernet port 3
 	 */
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
-			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
-			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
-			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
-			 <RZT2H_PORT_PINMUX(27, 2, 0x0)>; /* IRQ3 */
+	gmac1_pins: gmac1-group {
+		txclk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>; /* ETH3_TXCLK */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
+
+		txd-en-pins {
+			pinmux = <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
+				 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
+				 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
+				 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
+				 <RZT2H_PORT_PINMUX(33, 7, 0xf)>; /* ETH3_TXEN */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+		};
+
+		rx-pins {
+			pinmux = <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
+				 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
+				 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
+				 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
+				 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
+				 <RZT2H_PORT_PINMUX(34, 5, 0xf)>; /* ETH3_RXDV */
+			input-schmitt-disable;
+		};
+
+		md-pins {
+			pinmux = <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
+				 <RZT2H_PORT_PINMUX(26, 2, 0x10)>; /* GMAC1_MDIO */
+			drive-strength-microamp = <5000>;
+			slew-rate = <0>;
+			input-schmitt-disable;
+		};
+
+		refclk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(34, 6, 0x2)>; /* ETH3_REFCLK */
+			drive-strength-microamp = <5000>;
+			slew-rate = <1>;
+		};
+
+		irq-pins {
+			pinmux = <RZT2H_PORT_PINMUX(27, 2, 0x0)>; /* IRQ3 */
+			drive-strength-microamp = <5000>;
+			slew-rate = <0>;
+			input-schmitt-disable;
+		};
 	};
 
 	/*
@@ -283,23 +314,54 @@ gmac1_pins: gmac1-pins {
 	 * SW2[6] OFF - connect MDC/MDIO of Ethernet port 2 to GMAC2
 	 * SW2[7] ON - use pins P29_1-P29_7 and P30_0-P30_4 for Ethernet port 2
 	 */
-	gmac2_pins: gmac2-pins {
-		pinmux = <RZT2H_PORT_PINMUX(29, 1, 0xf)>, /* ETH2_TXCLK */
-			 <RZT2H_PORT_PINMUX(29, 2, 0xf)>, /* ETH2_TXD0 */
-			 <RZT2H_PORT_PINMUX(29, 3, 0xf)>, /* ETH2_TXD1 */
-			 <RZT2H_PORT_PINMUX(29, 4, 0xf)>, /* ETH2_TXD2 */
-			 <RZT2H_PORT_PINMUX(29, 5, 0xf)>, /* ETH2_TXD3 */
-			 <RZT2H_PORT_PINMUX(29, 6, 0xf)>, /* ETH2_TXEN */
-			 <RZT2H_PORT_PINMUX(29, 7, 0xf)>, /* ETH2_RXCLK */
-			 <RZT2H_PORT_PINMUX(30, 0, 0xf)>, /* ETH2_RXD0 */
-			 <RZT2H_PORT_PINMUX(30, 1, 0xf)>, /* ETH2_RXD1 */
-			 <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD2 */
-			 <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD3 */
-			 <RZT2H_PORT_PINMUX(30, 4, 0xf)>, /* ETH2_RXDV */
-			 <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* GMAC2_MDC */
-			 <RZT2H_PORT_PINMUX(30, 6, 0x10)>, /* GMAC2_MDIO */
-			 <RZT2H_PORT_PINMUX(31, 0, 0x2)>, /* ETH2_REFCLK */
-			 <RZT2H_PORT_PINMUX(31, 1, 0x0)>; /* IRQ13 */
+	gmac2_pins: gmac2-group {
+		txclk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(29, 1, 0xf)>; /* ETH2_TXCLK */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
+
+		txd-en-pins {
+			pinmux = <RZT2H_PORT_PINMUX(29, 2, 0xf)>, /* ETH2_TXD0 */
+				 <RZT2H_PORT_PINMUX(29, 3, 0xf)>, /* ETH2_TXD1 */
+				 <RZT2H_PORT_PINMUX(29, 4, 0xf)>, /* ETH2_TXD2 */
+				 <RZT2H_PORT_PINMUX(29, 5, 0xf)>, /* ETH2_TXD3 */
+				 <RZT2H_PORT_PINMUX(29, 6, 0xf)>; /* ETH2_TXEN */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+		};
+
+		rx-pins {
+			pinmux = <RZT2H_PORT_PINMUX(29, 7, 0xf)>, /* ETH2_RXCLK */
+				 <RZT2H_PORT_PINMUX(30, 0, 0xf)>, /* ETH2_RXD0 */
+				 <RZT2H_PORT_PINMUX(30, 1, 0xf)>, /* ETH2_RXD1 */
+				 <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD2 */
+				 <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD3 */
+				 <RZT2H_PORT_PINMUX(30, 4, 0xf)>; /* ETH2_RXDV */
+			input-schmitt-disable;
+		};
+
+		md-pins {
+			pinmux = <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* GMAC2_MDC */
+				 <RZT2H_PORT_PINMUX(30, 6, 0x10)>; /* GMAC2_MDIO */
+			drive-strength-microamp = <5000>;
+			slew-rate = <0>;
+			input-schmitt-disable;
+		};
+
+		refclk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(31, 0, 0x2)>; /* ETH2_REFCLK */
+			drive-strength-microamp = <5000>;
+			slew-rate = <1>;
+		};
+
+		irq-pins {
+			pinmux = <RZT2H_PORT_PINMUX(31, 1, 0x0)>; /* IRQ13 */
+			drive-strength-microamp = <5000>;
+			slew-rate = <0>;
+			input-schmitt-disable;
+		};
 	};
 
 	/*
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index a66502d8d82b..174b8f728522 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -341,23 +341,54 @@ can1_pins: can1-pins {
 	 *
 	 * DSW5[8] ON - use pins P33_2-P33_7 and P34_0-P34_6 for Ethernet port 3
 	 */
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
-			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
-			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
-			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
-			 <RZT2H_PORT_PINMUX(17, 3, 0x0)>; /* IRQ15 */
+	gmac1_pins: gmac1-group {
+		txclk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>; /* ETH3_TXCLK */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
+
+		txd-en-pins {
+			pinmux = <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
+				 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
+				 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
+				 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
+				 <RZT2H_PORT_PINMUX(33, 7, 0xf)>; /* ETH3_TXEN */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+		};
+
+		rx-pins {
+			pinmux = <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
+				 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
+				 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
+				 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
+				 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
+				 <RZT2H_PORT_PINMUX(34, 5, 0xf)>; /* ETH3_RXDV */
+			input-schmitt-disable;
+		};
+
+		md-pins {
+			pinmux = <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
+				 <RZT2H_PORT_PINMUX(26, 2, 0x10)>; /* GMAC1_MDIO */
+			drive-strength-microamp = <5000>;
+			slew-rate = <0>;
+			input-schmitt-disable;
+		};
+
+		refclk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(34, 6, 0x2)>; /* ETH3_REFCLK */
+			drive-strength-microamp = <5000>;
+			slew-rate = <1>;
+		};
+
+		irq-pins {
+			pinmux = <RZT2H_PORT_PINMUX(17, 3, 0x0)>; /* IRQ15 */
+			drive-strength-microamp = <5000>;
+			slew-rate = <0>;
+			input-schmitt-disable;
+		};
 	};
 
 	/*
@@ -367,24 +398,54 @@ gmac1_pins: gmac1-pins {
 	 * DSW5[7] ON - use pins P29_1-P29_7 and P30_0-P30_4 for Ethernet port 2
 	 * DSW13[7] OFF; DSW13[8] ON - use pin P13_7 for IRQ14
 	 */
-	gmac2_pins: gmac2-pins {
-		pinmux = <RZT2H_PORT_PINMUX(29, 1, 0xf)>, /* ETH2_TXCLK */
-			 <RZT2H_PORT_PINMUX(29, 2, 0xf)>, /* ETH2_TXD0 */
-			 <RZT2H_PORT_PINMUX(29, 3, 0xf)>, /* ETH2_TXD1 */
-			 <RZT2H_PORT_PINMUX(29, 4, 0xf)>, /* ETH2_TXD2 */
-			 <RZT2H_PORT_PINMUX(29, 5, 0xf)>, /* ETH2_TXD3 */
-			 <RZT2H_PORT_PINMUX(29, 6, 0xf)>, /* ETH2_TXEN */
-			 <RZT2H_PORT_PINMUX(29, 7, 0xf)>, /* ETH2_RXCLK */
-			 <RZT2H_PORT_PINMUX(30, 0, 0xf)>, /* ETH2_RXD0 */
-			 <RZT2H_PORT_PINMUX(30, 1, 0xf)>, /* ETH2_RXD1 */
-			 <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD2 */
-			 <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD3 */
-			 <RZT2H_PORT_PINMUX(30, 4, 0xf)>, /* ETH2_RXDV */
-			 <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* GMAC2_MDC */
-			 <RZT2H_PORT_PINMUX(30, 6, 0x10)>, /* GMAC2_MDIO */
-			 <RZT2H_PORT_PINMUX(31, 0, 0x2)>, /* ETH2_REFCLK */
-			 <RZT2H_PORT_PINMUX(13, 7, 0x0)>; /* IRQ14 */
+	gmac2_pins: gmac2-group {
+		txclk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(29, 1, 0xf)>; /* ETH2_TXCLK */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
 
+		txd-en-pins {
+			pinmux = <RZT2H_PORT_PINMUX(29, 2, 0xf)>, /* ETH2_TXD0 */
+				 <RZT2H_PORT_PINMUX(29, 3, 0xf)>, /* ETH2_TXD1 */
+				 <RZT2H_PORT_PINMUX(29, 4, 0xf)>, /* ETH2_TXD2 */
+				 <RZT2H_PORT_PINMUX(29, 5, 0xf)>, /* ETH2_TXD3 */
+				 <RZT2H_PORT_PINMUX(29, 6, 0xf)>; /* ETH2_TXEN */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+		};
+
+		rx-pins {
+			pinmux = <RZT2H_PORT_PINMUX(29, 7, 0xf)>, /* ETH2_RXCLK */
+				 <RZT2H_PORT_PINMUX(30, 0, 0xf)>, /* ETH2_RXD0 */
+				 <RZT2H_PORT_PINMUX(30, 1, 0xf)>, /* ETH2_RXD1 */
+				 <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD2 */
+				 <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD3 */
+				 <RZT2H_PORT_PINMUX(30, 4, 0xf)>; /* ETH2_RXDV */
+			input-schmitt-disable;
+		};
+
+		md-pins {
+			pinmux = <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* GMAC2_MDC */
+				 <RZT2H_PORT_PINMUX(30, 6, 0x10)>; /* GMAC2_MDIO */
+			drive-strength-microamp = <5000>;
+			slew-rate = <0>;
+			input-schmitt-disable;
+		};
+
+		refclk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(31, 0, 0x2)>; /* ETH2_REFCLK */
+			drive-strength-microamp = <5000>;
+			slew-rate = <1>;
+		};
+
+		irq-pins {
+			pinmux = <RZT2H_PORT_PINMUX(13, 7, 0x0)>; /* IRQ14 */
+			drive-strength-microamp = <5000>;
+			slew-rate = <0>;
+			input-schmitt-disable;
+		};
 	};
 
 	/*
-- 
2.54.0


