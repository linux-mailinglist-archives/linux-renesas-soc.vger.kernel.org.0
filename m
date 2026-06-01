Return-Path: <linux-renesas-soc+bounces-33393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KMPJZpwHWrFawkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 13:44:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ECC61E85D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 13:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8B05303643B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jun 2026 11:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238F1363C53;
	Mon,  1 Jun 2026 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="be8wmpxd";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WrsJPmTO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90EA361667;
	Mon,  1 Jun 2026 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313973; cv=none; b=JuSRsNqye9vWo/ZShP1AGo0I7J/cluh5q2cpSfM5M1YOdmZr2Hhh56uVNWXp2aBAHlKK2IMyabbqM0erMdwk26bYpBk70QBoq/8r51dWsf/FWcJBC4IaEqKKFdZ0YyYjCqCtXjzyLRcU23p369+vi6Wm4qVDJqWtYAs/LNPjzAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313973; c=relaxed/simple;
	bh=+QwsfkteYX/JnlbYItqTsDqoFVvp2e6HiYv4+oGXFUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W3kztw9jXNJ8zO0RbsxF56JJgogAlCmtjlEmTAEsVRxTXVP0ILHLb+oUC1UWHEusn3PImh++v27H0BJP+CcDqGGI8IztCL5kDr5vtneT6cCZhNPRjAgLgXR8I/+Lchjc7EvUg3H18c8TJr2jqo9JS/9gw9MUOzkluDwsxkF5Sfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=be8wmpxd; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WrsJPmTO; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gTX743Mcsz9vDB;
	Mon,  1 Jun 2026 13:39:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780313968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XxrgoZ+nc2RW0uxcOjuabHAwk7p3VP8+2bqMXrJ39Ks=;
	b=be8wmpxdlxU7iEYeGhrAGv85VtawF3x4n6x+m9vkn0BXDKBbN9mwG9UUqmW3JuBlsApYdY
	2e1AS3wCGeKCb+oAb8CLwnhsxbxKpXP+Kz9PlxVvcC+bpM8XBpSVMCXNhAyVgR6XMVQR23
	vbpQRXPKggz2AEMeFTI65B485uNUObdCzJ65Q9iucWVV6Q/69oTYOavkL+i+L92Or/Tt30
	4bMYZwlItnjC86XgLBMAtdl5fw5jUw3xm/hilLKC07uzdFpPGsnckLv9VgZ9OL59W9agvl
	cB/0LPKPWK8pMXWNQehPAg6ZZilZ0p1eFVDhJbmFj/EEmN1I/6a9jJ/TxbZWgA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=WrsJPmTO;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780313967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XxrgoZ+nc2RW0uxcOjuabHAwk7p3VP8+2bqMXrJ39Ks=;
	b=WrsJPmTO683K9T91scDLcwy7xNy7qdnCl610OhxPHPdEyCZmEBqSrzjdlQwCMN6fLGt6wd
	h7EdVBrkMMr86n2VR4pXTELwNE96Y9PRTpczPeJ3OUTBt6x23eDgw5JVeRwHfs4a+3OJxd
	67HEeW+UlaFpcmYLq87PNAQABFpnsvNewG2pE33JB8SAKM/wJ0Tlsaxh+2Xj9N+4pMjypB
	7SPi4vetUOQRyGmhA6aIXvjuSYXg2R00izOi+QUsG+5lRTliZJ65OOrn/ZRqMheBKgAdZy
	/PglDpctlLhPeZvEFrEfpdhsv91kfRrxsONrMk+iPBtJ5lEa0Yp8WNP6OehJlA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a78000: Enable application CPU cores via PSCI
Date: Mon,  1 Jun 2026 13:38:51 +0200
Message-ID: <20260601113919.8327-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0ffa117923e49be64e7
X-MBO-RS-META: 6t6yf5ce5dbmbzistm9f7tgmeqcmfg53
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33393-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E3ECC61E85D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add PSCI "enable-method" DT property to all application CPU cores.
This allows the OS to bring application CPU cores up and down.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
NOTE: This depends mainline TFA 2.15 or newer (or SDK TFA version
      which includes b950bc09f5e9 ("plat: rcar_gen5: Fix multicore
      boot by ensuring fixed address for plat_secondary_reset"))
      and on SDK 4.32 or newer SCP firmware.
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 7780fb4e8351d..fb71974ef3905 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -143,6 +143,7 @@ a720_0: cpu@0 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x0>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_0>;
 		};
 
@@ -150,6 +151,7 @@ a720_1: cpu@100 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x100>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_1>;
 		};
 
@@ -157,6 +159,7 @@ a720_2: cpu@200 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x200>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_2>;
 		};
 
@@ -164,6 +167,7 @@ a720_3: cpu@300 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x300>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_3>;
 		};
 
@@ -171,6 +175,7 @@ a720_4: cpu@10000 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x10000>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_4>;
 		};
 
@@ -178,6 +183,7 @@ a720_5: cpu@10100 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x10100>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_5>;
 		};
 
@@ -185,6 +191,7 @@ a720_6: cpu@10200 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x10200>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_6>;
 		};
 
@@ -192,6 +199,7 @@ a720_7: cpu@10300 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x10300>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_7>;
 		};
 
@@ -199,6 +207,7 @@ a720_8: cpu@20000 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x20000>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_8>;
 		};
 
@@ -206,6 +215,7 @@ a720_9: cpu@20100 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x20100>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_9>;
 		};
 
@@ -213,6 +223,7 @@ a720_10: cpu@20200 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x20200>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_10>;
 		};
 
@@ -220,6 +231,7 @@ a720_11: cpu@20300 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x20300>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_11>;
 		};
 
@@ -227,6 +239,7 @@ a720_12: cpu@30000 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x30000>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_12>;
 		};
 
@@ -234,6 +247,7 @@ a720_13: cpu@30100 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x30100>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_13>;
 		};
 
@@ -241,6 +255,7 @@ a720_14: cpu@30200 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x30200>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_14>;
 		};
 
@@ -248,6 +263,7 @@ a720_15: cpu@30300 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x30300>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_15>;
 		};
 
@@ -255,6 +271,7 @@ a720_16: cpu@40000 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x40000>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_16>;
 		};
 
@@ -262,6 +279,7 @@ a720_17: cpu@40100 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x40100>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_17>;
 		};
 
@@ -269,6 +287,7 @@ a720_18: cpu@40200 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x40200>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_18>;
 		};
 
@@ -276,6 +295,7 @@ a720_19: cpu@40300 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x40300>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_19>;
 		};
 
@@ -283,6 +303,7 @@ a720_20: cpu@50000 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x50000>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_20>;
 		};
 
@@ -290,6 +311,7 @@ a720_21: cpu@50100 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x50100>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_21>;
 		};
 
@@ -297,6 +319,7 @@ a720_22: cpu@50200 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x50200>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_22>;
 		};
 
@@ -304,6 +327,7 @@ a720_23: cpu@50300 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x50300>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_23>;
 		};
 
@@ -311,6 +335,7 @@ a720_24: cpu@60000 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x60000>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_24>;
 		};
 
@@ -318,6 +343,7 @@ a720_25: cpu@60100 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x60100>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_25>;
 		};
 
@@ -325,6 +351,7 @@ a720_26: cpu@60200 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x60200>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_26>;
 		};
 
@@ -332,6 +359,7 @@ a720_27: cpu@60300 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x60300>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_27>;
 		};
 
@@ -339,6 +367,7 @@ a720_28: cpu@70000 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x70000>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_28>;
 		};
 
@@ -346,6 +375,7 @@ a720_29: cpu@70100 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x70100>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_29>;
 		};
 
@@ -353,6 +383,7 @@ a720_30: cpu@70200 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x70200>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_30>;
 		};
 
@@ -360,6 +391,7 @@ a720_31: cpu@70300 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x70300>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_31>;
 		};
 
-- 
2.53.0


