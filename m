Return-Path: <linux-renesas-soc+bounces-28914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GouJeIBqmm9JQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 23:21:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 370A7218DD7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 23:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D250230D06B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 22:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFCC3630A6;
	Thu,  5 Mar 2026 22:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gcwjW17t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B493537FA
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 22:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772749189; cv=none; b=n6dqbeh07L/vyeC7j4uUecGNamNu3oxNSdbshu0csNuIu8SeQxzR4s3TquThfyfGR8UCud2v2k15GxvRyMcl+JigMeJi+17nMJKGCL+y7i2Ok3vUw+xYiUdGxnQHtV8CqvXlxdjy9FgawW/j7l/Qyfx05l55colUeL/XfX59Upg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772749189; c=relaxed/simple;
	bh=ve27/23CkRPhQ3axcIh4mjZYu7U1Bp5w5heJng5xG24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RL7t8sZyLghG6A/3tiz85T8JfL/hO8iD5Nh3U3yBNCCF4InDwlCdUxGqKd8kmhjCNkN2X0u7lFgplFLv5A6luu/a7p4b5EYbt7+I3SZHl6sNOmRBxMhsm1uQOljjuou6A7ptkUYxLy1zON8u8IO00OGjVQxKf+uVNyZUtkfsHRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gcwjW17t; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=fCYk96rdRbd7XG
	ma/c4T8oweeYvi9rvqv8vWDIk/zWo=; b=gcwjW17tDwG0klo4ixS7vpJs7nRUKC
	42jwtvwoT4Z9xlsHTarr2O16W/J27/x+pbOI/b24MnG7oWjzEQsawnV/957rVTM6
	FKuoLzl7JLkCaHRMJbpepCgP9vr2zuqJjneUM1O/2ygxh2y1ygtZ0mw/+Hd1ztTj
	C8kPnF8W+NWswxoDhNSuRbUqQ1PVB7yk1dkNQVM5xiRlnd3r7XemFhQj2aZRQSSQ
	1nAh7WLIHZ/nGaXdKmn0f9zVV5p21dgHA7NrBhu04mjglIvtbyoauuZJmPDZwsxu
	HBCKeBHjT1ZjkvTdpTGPKLVseePGGxq1XxTwRuKYZPb05lYV+ZSe9cgw==
Received: (qmail 1354238 invoked from network); 5 Mar 2026 23:19:45 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2026 23:19:45 +0100
X-UD-Smtp-Session: l3s3148p1@MkNvVU5MKsAujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2] ARM: dts: renesas: r9a06g032-rzn1d400-db: use interrupt for Micrel PHYs
Date: Thu,  5 Mar 2026 23:16:58 +0100
Message-ID: <20260305221939.32643-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 370A7218DD7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28914-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[sang-engineering.com,bootlin.com,glider.be,gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Make use of the interrupts wired to the Micrel PHYs via the GPIO IRQ
mux.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
---
Changes since RFC v1:
* rebased to 7.0-rc2
* drop RFC status, irqmux is now upstream
* added tag from Herve (Thanks!)

 .../dts/renesas/r9a06g032-rzn1d400-db.dts     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index 80f78998500b..bf456130878e 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -185,6 +185,18 @@ fixed-link {
 	};
 };
 
+&gpioirqmux {
+	interrupt-map = <89 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>, /* pin 147: phy@4 */
+			<91 &gic GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>; /* pin 149: phy@5 */
+	status = "okay";
+};
+
+&gpio2 {
+	pinctrl-0 = <&pins_gpio2>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&pins_i2c2>;
 	pinctrl-names = "default";
@@ -256,6 +268,13 @@ pins_cpld: pins-cpld {
 			 <RZN1_PINMUX(122, RZN1_FUNC_USB)>;
 	};
 
+	pins_gpio2: pins-gpio2 {
+		pinmux = <RZN1_PINMUX(147, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(149, RZN1_FUNC_GPIO)>;
+		drive-strength = <6>;
+		bias-disable;
+	};
+
 	pins_eth3: pins_eth3 {
 		pinmux = <RZN1_PINMUX(36, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
 			 <RZN1_PINMUX(37, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
@@ -401,11 +420,13 @@ mdio {
 		switch0phy4: ethernet-phy@4 {
 			reg = <4>;
 			micrel,led-mode = <1>;
+			interrupts-extended = <&gpio2a 25 IRQ_TYPE_LEVEL_LOW>;
 		};
 
 		switch0phy5: ethernet-phy@5 {
 			reg = <5>;
 			micrel,led-mode = <1>;
+			interrupts-extended = <&gpio2a 27 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
-- 
2.47.3


