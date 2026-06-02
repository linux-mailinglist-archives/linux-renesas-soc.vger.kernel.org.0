Return-Path: <linux-renesas-soc+bounces-33437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W4CjJab7Hmq+bgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 17:49:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A70562FF71
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 17:49:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=PpNg3GPN;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9D1630103B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 15:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6743ED3A9;
	Tue,  2 Jun 2026 15:35:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ECF3EBF0C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 15:35:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780414514; cv=none; b=lb7Hxx5PiUCxtuyuNTp1XnBvimj7hH3bmvz76u7y1+G72zKzabj9xOASGVLtCy6s3ogef27htBbP3qdanAekq/lcVDOMEy6OE+pvi09cakUvZmcHUsmRFGiqwj/FADZpHlCM2/ibHCEtnhT06R8Rjcx/Ev5GqMvVypgLYKxOOsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780414514; c=relaxed/simple;
	bh=Hif/XUxesMRRT+g6lRU2ePWEPtXCcBEaB6Yb8vK/Jkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DulIvEE9i9rA9sNi9O+afAQtMeRlMpy3OayNWZl3752aUBmsfdEEe5TgTYuOiBWA3tpy8ePE+w66aFBf7LpGJfzYwZ5FkSwNm7YD5rllPS/KXSUm4xuee/2kOZlDzPWP5hhr57/h1NprQR1adwrHZQoY8j+nbp79u3i3lu34Lp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PpNg3GPN; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=kPhCB7AoH7tSov
	K10gXikRLu6Zwd4MTQbeYJPECjqpY=; b=PpNg3GPNnlbbKmG4/5liYlGtmsYEIa
	+tz4PagB14BOIetekW1fUMejMu/gGQdUp4ojGdwIceAuJpUA9berdQ+BLlvAo7JY
	JhbBtJSWYGlSt+dCHTWFigEIoDed+hjDLAsezppKet1LkSxKscCOq+apB9AzMtKi
	MpsqKXggYIEbhrH+0ob2Rpmlj2RcdYeGSOh1Qk4ceXSj49kbda0gC+RkdwXCxwJV
	7tlIs5lWuJVpI9IQT4RY2KhIGWc/DYrlWMSJVuWBANcRYmX/riW9oSfNpF4h94H+
	0uEyr0e7Lj23FQTyiCdU0KCddkOJpG6EcpbzBi+nUzfpY6P8sM0efHhA==
Received: (qmail 2943881 invoked from network); 2 Jun 2026 17:35:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2026 17:35:09 +0200
X-UD-Smtp-Session: l3s3148p1@S15gDkdTtooujnv7
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3] arm64: renesas: r8a779g0: add MFIS node
Date: Tue,  2 Jun 2026 17:32:22 +0200
Message-ID: <20260602153504.302388-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
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
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33437-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:wsa@sang-engineering.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[sang-engineering.com,glider.be,gmail.com,kernel.org,vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A70562FF71

Describe the MFIS core which is used for various tasks including
inter-processor communication. Interrupt numbers look irregular but they
all work as expected on a Renesas R-Car V4H SparrowHawk board.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v2:
* increased reg size to 0x10000 (Thanks, Geert!)
* shortened interrupt-names line length (Thanks, Geert!)

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 82a7278836e5..3cff822fc609 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -603,6 +603,23 @@ tsn0: ethernet@e6460000 {
 			status = "disabled";
 		};
 
+		mfis: system-controller@e6260000 {
+			compatible = "renesas,r8a779g0-mfis";
+			reg = <0 0xe6260000 0 0x10000>;
+			reg-names = "common";
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 916 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 920 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0e", "ch1e", "ch2e", "ch3e", "ch4e", "ch5e", "ch6e", "ch7e",
+					  "ch8e", "ch9e", "ch10e", "ch11e";
+			#hwlock-cells = <1>;
+			#mbox-cells = <2>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@e6500000 {
 			compatible = "renesas,i2c-r8a779g0",
 				     "renesas,rcar-gen4-i2c";
-- 
2.51.0


