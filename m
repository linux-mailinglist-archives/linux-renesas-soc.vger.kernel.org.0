Return-Path: <linux-renesas-soc+bounces-32638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKTUGHM4BmocggIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 23:02:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F180F546E16
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 23:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4BBB1300130F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 21:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC403C819A;
	Thu, 14 May 2026 21:02:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3077C17A2EA;
	Thu, 14 May 2026 21:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778792559; cv=none; b=rYjiu1vhjJIqhzJaDey1ZqFKDCCWsXYsCe/5lf0tw7TabYaiLQQBDgWmAwUmnXOMIeTnyihPobhQt4jG7yYUrqdAxRhxwAt+7WXjGWrPo8+Dv6L+E3qyAHcKgCXnpgFhgv2wSM9eIsL2v8kbmk7JBaSWK9RTaOlyO5PRx0NkJbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778792559; c=relaxed/simple;
	bh=L6tgnJ6HVRpvyne7GS8JPqXSX4XQFaYBy7CWbE1jSv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I+1ooWSaJzshe2RmFElZ3YXQn4pX6htPLnc3vsxp4p/Aj4dPGvDZY9Sw2L2oBfcyH1+BAIMIjH8YJqDaB0DIpmP1xw+VSlNW0mFtWG1fNCfiIbEDZOVP4yUwpU/+JN97CM7EA7vQSormSRA/JRuSAyT/GDnizmVnxjj6oPvnjPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: fezz5zrPTDOd0v3OJeCDig==
X-CSE-MsgGUID: WYp4g7/XRMW4GpD9CfKFOg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 May 2026 06:02:27 +0900
Received: from mind-2s.lan (unknown [10.24.0.33])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1E1AF40031EC;
	Fri, 15 May 2026 06:02:23 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI pins
Date: Thu, 14 May 2026 22:02:17 +0100
Message-ID: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F180F546E16
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32638-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Action: no action

The HW user manual for the Renesas RZ/T2H and the RZ/N2H states
that for SDR104, SDR50, and HS200 to work properly the eMMC/SDHI
interface pins have to be configured as specified below:
* SDn_CLK pin - drive strength: Ultra High, slew rate: Fast
* Other SDn_* pins: drive strength: High, slew rate: Fast,
  Schmitt trigger: disabled (not applicable to SDn_RST pins).

HS DDR and DDR50 are currently not supported, and for every
other bus mode the eMMC/SDHI interface pins should be configured
as specified below:
* SDn_CLK pin - drive strength: High, slew rate: Fast
* Other SDn_* pins: drive strength: Middle, slew rate: Fast,
  Schmitt trigger: disabled (not applicable to SDn_RST pins).

Adjust the pin definitions accordingly.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
v1->v2:
* Take into account the settings for lower speed modes

 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 147 ++++++++++++++++--
 1 file changed, 136 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index f87c2492f414..46f4aaac0478 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -275,12 +275,63 @@ data-pins {
 				 <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* SD0_DATA5 */
 				 <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* SD0_DATA6 */
 				 <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* SD0_DATA7 */
+			drive-strength-microamp = <5000>;
+			slew-rate = <1>;
+			input-schmitt-disable;
 		};
 
-		ctrl-pins {
-			pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
-				 <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
-				 <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* SD0_RST# */
+		clk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* SD0_CLK */
+			drive-strength-microamp = <9000>;
+			slew-rate = <1>;
+		};
+
+		cmd-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* SD0_CMD */
+			drive-strength-microamp = <5000>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
+
+		rst-pins {
+			pinmux = <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* SD0_RST# */
+			drive-strength-microamp = <5000>;
+			slew-rate = <1>;
+		};
+	};
+
+	sdhi0_emmc_pins_uhs: sd0-emmc-group-uhs {
+		data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 2, 0x29)>, /* SD0_DATA0 */
+				 <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0_DATA1 */
+				 <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0_DATA2 */
+				 <RZT2H_PORT_PINMUX(12, 5, 0x29)>, /* SD0_DATA3 */
+				 <RZT2H_PORT_PINMUX(12, 6, 0x29)>, /* SD0_DATA4 */
+				 <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* SD0_DATA5 */
+				 <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* SD0_DATA6 */
+				 <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* SD0_DATA7 */
+			drive-strength-microamp = <9000>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
+
+		clk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* SD0_CLK */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+		};
+
+		cmd-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* SD0_CMD */
+			drive-strength-microamp = <9000>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
+
+		rst-pins {
+			pinmux = <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* SD0_RST# */
+			drive-strength-microamp = <9000>;
+			slew-rate = <1>;
 		};
 	};
 
@@ -299,12 +350,49 @@ data-pins {
 				 <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0_DATA1 */
 				 <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0_DATA2 */
 				 <RZT2H_PORT_PINMUX(12, 5, 0x29)>; /* SD0_DATA3 */
+			drive-strength-microamp = <5000>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
+
+		clk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* SD0_CLK */
+			drive-strength-microamp = <9000>;
+			slew-rate = <1>;
 		};
 
 		ctrl-pins {
-			pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
-				 <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
+			pinmux = <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
 				 <RZT2H_PORT_PINMUX(22, 5, 0x29)>; /* SD0_CD */
+			drive-strength-microamp = <5000>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
+	};
+
+	sdhi0_sd_pins_uhs: sd0-sd-group-uhs {
+		data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 2, 0x29)>, /* SD0_DATA0 */
+				 <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0_DATA1 */
+				 <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0_DATA2 */
+				 <RZT2H_PORT_PINMUX(12, 5, 0x29)>; /* SD0_DATA3 */
+			drive-strength-microamp = <9000>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
+
+		clk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* SD0_CLK */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+		};
+
+		ctrl-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
+				 <RZT2H_PORT_PINMUX(22, 5, 0x29)>; /* SD0_CD */
+			drive-strength-microamp = <9000>;
+			slew-rate = <1>;
+			input-schmitt-disable;
 		};
 	};
 
@@ -323,12 +411,49 @@ data-pins {
 				 <RZT2H_PORT_PINMUX(17, 0, 0x29)>, /* SD1_DATA1 */
 				 <RZT2H_PORT_PINMUX(17, 1, 0x29)>, /* SD1_DATA2 */
 				 <RZT2H_PORT_PINMUX(17, 2, 0x29)>; /* SD1_DATA3 */
+			drive-strength-microamp = <5000>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
+
+		clk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(16, 5, 0x29)>; /* SD1_CLK */
+			drive-strength-microamp = <9000>;
+			slew-rate = <1>;
+		};
+
+		ctrl-pins {
+			pinmux = <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* SD1_CMD */
+				 <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1_CD */
+			drive-strength-microamp = <5000>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
+	};
+
+	sdhi1_pins_uhs: sd1-group-uhs {
+		data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(16, 7, 0x29)>, /* SD1_DATA0 */
+				 <RZT2H_PORT_PINMUX(17, 0, 0x29)>, /* SD1_DATA1 */
+				 <RZT2H_PORT_PINMUX(17, 1, 0x29)>, /* SD1_DATA2 */
+				 <RZT2H_PORT_PINMUX(17, 2, 0x29)>; /* SD1_DATA3 */
+			drive-strength-microamp = <9000>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
+
+		clk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(16, 5, 0x29)>; /* SD1_CLK */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
 		};
 
 		ctrl-pins {
-			pinmux = <RZT2H_PORT_PINMUX(16, 5, 0x29)>, /* SD1_CLK */
-				 <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* SD1_CMD */
+			pinmux = <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* SD1_CMD */
 				 <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1_CD */
+			drive-strength-microamp = <9000>;
+			slew-rate = <1>;
+			input-schmitt-disable;
 		};
 	};
 };
@@ -342,7 +467,7 @@ &sci0 {
 #if SD0_EMMC
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_emmc_pins>;
-	pinctrl-1 = <&sdhi0_emmc_pins>;
+	pinctrl-1 = <&sdhi0_emmc_pins_uhs>;
 	pinctrl-names = "default", "state_uhs";
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&reg_1p8v>;
@@ -357,7 +482,7 @@ &sdhi0 {
 #if SD0_SD
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_sd_pins>;
-	pinctrl-1 = <&sdhi0_sd_pins>;
+	pinctrl-1 = <&sdhi0_sd_pins_uhs>;
 	pinctrl-names = "default", "state_uhs";
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&vqmmc_sdhi0>;
@@ -372,7 +497,7 @@ &sdhi0 {
 #if SD1_MICRO_SD
 &sdhi1 {
 	pinctrl-0 = <&sdhi1_pins>;
-	pinctrl-1 = <&sdhi1_pins>;
+	pinctrl-1 = <&sdhi1_pins_uhs>;
 	pinctrl-names = "default", "state_uhs";
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&vccq_sdhi1>;
-- 
2.34.1


