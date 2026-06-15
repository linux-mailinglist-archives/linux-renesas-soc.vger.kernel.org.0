Return-Path: <linux-renesas-soc+bounces-34023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IWDiLdT2L2pYKQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 14:57:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1532D68676D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 14:57:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="fU2qBX o";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7407B30329A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4F03F0AA9;
	Mon, 15 Jun 2026 12:54:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5186E353EC0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 12:54:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528059; cv=none; b=Vc/iRt5zdf6VueLZYO/MRmTAy2yV/jbY2WYL+0f8dKF74ZY8wSRqWremdfdi9/sXfit3VzrIFbp6fpxVZFhTtTWug0kEmCvNSPinmXAJ8DFCo1IGwuW/NqadbhEaO3m4dMhpiFlbKtGcesC28q/lcMBz5x4NctNck8gffXItCvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528059; c=relaxed/simple;
	bh=AC06sH4RnGQwPEIccnw1uf17acGfwnV9+5rHkeHm2sM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oexoRxq9lIJsvkcfhiLPkq2l8GjEO8R2JykoCniSH2vskY+HcEuM1J3QwdAqXwPuqgMVBJbRkNXnYmCwx5sY0v0WKdpv7LSMkWZFHunGx0aUXplgW2GBwscPCqowOpmuP/sh17TC+bp6cHQXXf//qi2ZrEe5WZrNs6qvxszVwI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fU2qBXoX; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=TM35S8oxpc5FX40IDvx4j4eZ2fKCyHizStkwDWitgdY=; b=fU2qBX
	oXD+Xaz90FsZ0oZ5WLv2yisipPiiJaNqFw55ZByCv2vLprw/7OQoOhl65btW7qld
	9ioMRAClZ+qYUUJ/XBd1vxwpNkHu0xHIOIGws7XgqZGafTuYAd8SgI0aNnUd0vbw
	2fNSc9bdWBYUTaNpryYHY/TGOoSzouSepY3bBM/t9xbjRcF9f84oxNEEEdCg7Ok2
	/1uYNUciCypqqHNNjhYbRKzj4kZcst+P2oU6nCdQZR1JRWA2k355jjt3OfUGiVP2
	6YcjYYeVCl1PwmHcD+FxPQ21xx8NlV12Tgf50vmu2tiOE4Jt7LQFJJZ27PJFOzlK
	b6X+kOTAJJ84DF4A==
Received: (qmail 3548809 invoked from network); 15 Jun 2026 14:54:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jun 2026 14:54:12 +0200
X-UD-Smtp-Session: l3s3148p1@N2K5UkpUvJMujntF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Herve Codina <herve.codina@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM
Date: Mon, 15 Jun 2026 14:53:54 +0200
Message-ID: <20260615125355.116027-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615125355.116027-1-wsa+renesas@sang-engineering.com>
References: <20260615125355.116027-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34023-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:herve.codina@bootlin.com,m:wsa+renesas@sang-engineering.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:wsa@sang-engineering.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[bootlin.com,sang-engineering.com,glider.be,gmail.com,kernel.org,vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,glider.be:email,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1532D68676D

Activate the FRAM and the SPI bus which it is attached to.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes since v1:
* added tag from Geert (Thanks!)

 .../dts/renesas/r9a06g032-rzn1d400-eb.dts     | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
index 97a339b30d76..ead379988fb1 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
@@ -53,6 +53,10 @@ led@1 {
 	};
 };
 
+&gpio2 {
+	status = "okay";
+};
+
 &i2c2 {
 	/* Sensors are different across revisions. All are LM75B compatible */
 	sensor@49 {
@@ -152,6 +156,13 @@ pins_sdio1_clk: pins-sdio1-clk {
 		drive-strength = <12>;
 	};
 
+	pins_spi1: pins-spi1 {
+		pinmux = <RZN1_PINMUX(156, RZN1_FUNC_SPI0_M)>,
+			 <RZN1_PINMUX(157, RZN1_FUNC_SPI0_M)>,
+			 <RZN1_PINMUX(158, RZN1_FUNC_SPI0_M)>,
+			 <RZN1_PINMUX(159, RZN1_FUNC_GPIO)>;
+	};
+
 	pins_uart2: pins-uart2 {
 		pinmux = <RZN1_PINMUX(105, RZN1_FUNC_UART2)>,
 			 <RZN1_PINMUX(106, RZN1_FUNC_UART2)>,
@@ -168,6 +179,20 @@ &sdio1 {
 	status = "okay";
 };
 
+&spi1 {
+	pinctrl-0 = <&pins_spi1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	cs-gpios = <&gpio2a 31 GPIO_ACTIVE_LOW>;
+
+	fram: fram@0 {
+		compatible = "cypress,fm25", "atmel,at25";
+		reg = <0>;
+		spi-max-frequency = <12500000>;
+	};
+};
+
 &switch {
 	pinctrl-0 = <&pins_eth1>, <&pins_eth2>, <&pins_eth3>, <&pins_eth4>,
 		    <&pins_mdio1>;
-- 
2.47.3


