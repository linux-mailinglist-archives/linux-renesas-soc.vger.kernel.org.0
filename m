Return-Path: <linux-renesas-soc+bounces-30652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O8bOMXfy2m0MAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 16:52:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D349036B36C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 16:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 596ED3009F25
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 14:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CA93F9F31;
	Tue, 31 Mar 2026 14:52:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF8C3FF890;
	Tue, 31 Mar 2026 14:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968758; cv=none; b=NZAIvIKhTgOYn6RgU53T+ArSK2bS3KR5ahqzEIurPQS8p8qDduQtSS9W4Z4deZRoW23OsI8dhRMUAWnNvpt40977DPluyPnd4jfbLXFhL0uLoIe+CyJxC/L7Qspi7+ge/b/jpFwI5iMz3hEmX+sMcsaSqsvGgwXB7XgBhS3C29Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968758; c=relaxed/simple;
	bh=NQaVxmfcqTeFxpUYUeCfJOIcQ1OBkiQyo82UX8yL1qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tW6DI49jmmvHobdk25LvUzUQC93qOuUiE/g0HNffDp9blfsSZeKlTMxT+Gn+dRtUkPEm6/2np1wryoC0Z/fdz2B7Dzm9Zy8s372aDK4CdxB/c4xOs4qbPr1ud1D6MCCAKq5lbZx77091zKJ72LdRIxHb8Yg00BWGdvbIt5hsElA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Tcx395gARCK8VW8Ydq0Mdg==
X-CSE-MsgGUID: 7dAj3FM/SxSYPU62XqYzCg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Mar 2026 23:52:35 +0900
Received: from mind-2s.example.org (unknown [10.226.37.207])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id CB7224209849;
	Tue, 31 Mar 2026 23:52:31 +0900 (JST)
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
Subject: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI pins
Date: Tue, 31 Mar 2026 15:52:18 +0100
Message-ID: <20260331145221.7974-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30652-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: D349036B36C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The HW user manual for the Renesas RZ/T2H and the RZ/N2H state
that for SDR104, SDR50, and HS200 to work properly the eMMC/SDHI
interface pins have to be configured as specified below:
* SDn_CLK pin - drive strength: Ultra High, slew rate: fast
* Other SDn_* pins: drive strength: High, slew rate: fast,
  Schmitt trigger: disabled (not applicable to SDn_RST pins).

Adjust the pin definitions accordingly.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 54 ++++++++++++++++---
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index f87c2492f414..3fae950db603 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -275,12 +275,28 @@ data-pins {
 				 <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* SD0_DATA5 */
 				 <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* SD0_DATA6 */
 				 <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* SD0_DATA7 */
+			drive-strength-microamp = <9000>;
+			slew-rate = <1>;
+			input-schmitt-disable;
 		};
 
-		ctrl-pins {
-			pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
-				 <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
-				 <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* SD0_RST# */
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
 
@@ -299,12 +315,23 @@ data-pins {
 				 <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0_DATA1 */
 				 <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0_DATA2 */
 				 <RZT2H_PORT_PINMUX(12, 5, 0x29)>; /* SD0_DATA3 */
+			drive-strength-microamp = <9000>;
+			slew-rate = <1>;
+			input-schmitt-disable;
+		};
+
+		clk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* SD0_CLK */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
 		};
 
 		ctrl-pins {
-			pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
-				 <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
+			pinmux = <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
 				 <RZT2H_PORT_PINMUX(22, 5, 0x29)>; /* SD0_CD */
+			drive-strength-microamp = <9000>;
+			slew-rate = <1>;
+			input-schmitt-disable;
 		};
 	};
 
@@ -323,12 +350,23 @@ data-pins {
 				 <RZT2H_PORT_PINMUX(17, 0, 0x29)>, /* SD1_DATA1 */
 				 <RZT2H_PORT_PINMUX(17, 1, 0x29)>, /* SD1_DATA2 */
 				 <RZT2H_PORT_PINMUX(17, 2, 0x29)>; /* SD1_DATA3 */
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
-- 
2.34.1


