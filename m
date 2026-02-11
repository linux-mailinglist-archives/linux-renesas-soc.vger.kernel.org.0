Return-Path: <linux-renesas-soc+bounces-28156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAf0NF55jGktpAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 13:43:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 926B6124724
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 13:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AD3E3019380
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 12:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B3633F8C8;
	Wed, 11 Feb 2026 12:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ibvaVf1/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx-relay24-hz1.antispameurope.com (mx-relay24-hz1.antispameurope.com [94.100.132.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54B733B6F9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Feb 2026 12:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.224
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813786; cv=pass; b=jckHHE/g3R43R1uad7r390YlykWSe28s5db3QOcTSL6ySZkeLeYoNnXdoEPZrgJTWH+TC4Dxv7ed/VRfA5qiXHzFG7DZpe9BkcU4jgZZHZzKmNHxla5tAC+laouJf8dAwzbu8wNt/0GA1sMdKaddGF9Kxd6wZve5nWa53W5+TyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813786; c=relaxed/simple;
	bh=mYfcH9xWbwIpe8Jl7XbgaXGWWaW7rRpZQJHPj+tY8U0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckNtIcRg4AMVjlT0Ra6xqctVJ2iILtx5S0UQQtnfobLMYME0TO4xR70IrGpLin/1O15dHgBY0RtXlsFl9+et6Y9BBE0NmoxzEUu1dygDWoRF5aJzo+2Lvn8tRpZpb2ti+wRHH7bMb135B676L3mehKGADl9U5DKldeqE03RzhWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ibvaVf1/; arc=pass smtp.client-ip=94.100.132.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate24-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=6py1FlyDVN3cYWCSXt10KIIllpLulnoSlCJdgJBjOeY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770813746;
 b=pBrqrZCAb6fPF6WSsmHGNH/NtsB9oClqF/1LGzghnP1bZJbSEuweUgEgJSBo4MGpMr+aUv1j
 V/vLCN/UmSYpY977mrWexOfMJKboLjWXhRU3Q8m5QhHOCiGwzI9/yA7I8jD3Qv5jEjCXj7dkPYn
 RTYx41I0vgrEyeupKVmkzYJrzxP2e6Mk/K/mYol746R1GpL2jN6ruK6TqmMR7G8k/pY48Kz0Amh
 6pzHX3TeLCR7Yqk9Vs0hrBTxXwlo9ulNGUaVMnFA00yC+cBFnKGmPYZy31QjqyoC1d+CvPpSHro
 MapF/RI3yd9NDZiMLhSUqJ1iimpmQK0E5LTEcqrL4ZDvw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770813746;
 b=mtHchrtO5vMVroQkbDKYxPjXo8Ch3Q+vx75up1oI1yUZRJxnTxpnmOSP9Jlv+kuD5uwdD21V
 HoVPhvoL6SZf65SeaZFIcmOwrwj+9oj9lY4zYWGmNrkeCm10qg96l3Qpg52XKvezpT7dFIr+5+g
 4AtrHtwGjRmpDKlQ4A5hvWim1wdJj/oi0oEDPLREaBfOhtHs6yiV+OiguvByIXH77YBXFuEuwwR
 6//yIvdCz3H0u6bmUqHkxUOfVFUsmkqfO9+ngQDroDh5Y0GNqyKRS3vdZNb0V3jZeQZ4fVbo/Yk
 35xvaSrWNd7flzhqDHW1vrpKSxAudVcg86wiB7FRto1og==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay24-hz1.antispameurope.com;
 Wed, 11 Feb 2026 13:42:25 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 940A1220535;
	Wed, 11 Feb 2026 13:41:56 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Frank Li <Frank.Li@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 5/5] arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster
Date: Wed, 11 Feb 2026 13:41:53 +0100
Message-ID: <20260211124154.1080135-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-renesas-soc@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay24-hz1.antispameurope.com with 4f9yjx5Qnhz2ff2J
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:ebb129c93538d71a139afec21e2b08e4
X-cloud-security:scantime:1.798
DKIM-Signature: a=rsa-sha256;
 bh=6py1FlyDVN3cYWCSXt10KIIllpLulnoSlCJdgJBjOeY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770813745; v=1;
 b=ibvaVf1/NBiSG2JIgQ2AuDhjD+FF1FYxS8eJSK64eqgmsx15mxhIM+0+nR/pvHVlCoBCLdhx
 kvbKUWOcTLwm0BYjw+V8cPi0ukV5py/+7IEMjw0P9HaVfd8TLrinsj9LK1VbVgdfFWWSOkQyLES
 znBlqQR4XG1m/jUwJUgmmBKeGcO6LF4UfJX1gLK0e0ijBEXeDUQthIwL6EfS+C5QPITKA+GRW6G
 +S8ciobZckr4o3INBEaE40VyUTWys5E5etN7kMuD7r0d+B1xLcYjAjEFKr5fyvU7FzS05P8LyCS
 ojF32+ofkhwX2ZZNbhnuLMZURjIp/1b546F+S+GnTVJRA==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=hse1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,baylibre.com,cadence.com,linuxfoundation.org,pengutronix.de,gmail.com,denx.de,nxp.com];
	TAGGED_FROM(0.00)[bounces-28156-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_PROHIBIT(0.00)[4.196.180.0:email];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tq-group.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.100:email,0.0.0.101:email,ew.tq-group.com:mid,ew.tq-group.com:dkim]
X-Rspamd-Queue-Id: 926B6124724
X-Rspamd-Action: no action

Due to missing workaround for "ERR050104: Arm/A53: Cache coherency issue"
disable the whole Cortex-A72 cluster.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 39 -------------------
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 13 +++++--
 2 files changed, 10 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
index ce5a4657c4230..25274cc76fc56 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
@@ -297,45 +297,6 @@ map3 {
 				};
 			};
 		};
-
-		cpu1-thermal {
-			trips {
-				soc_active1_0: trip-active0 {
-					temperature = <40000>;
-					hysteresis = <5000>;
-					type = "active";
-				};
-
-				soc_active1_1: trip-active1 {
-					temperature = <48000>;
-					hysteresis = <3000>;
-					type = "active";
-				};
-
-				soc_active1_2: trip-active2 {
-					temperature = <60000>;
-					hysteresis = <10000>;
-					type = "active";
-				};
-			};
-
-			cooling-maps {
-				map1 {
-					trip = <&soc_active1_0>;
-					cooling-device = <&fan0 1 1>;
-				};
-
-				map2 {
-					trip = <&soc_active1_1>;
-					cooling-device = <&fan0 2 2>;
-				};
-
-				map3 {
-					trip = <&soc_active1_2>;
-					cooling-device = <&fan0 3 3>;
-				};
-			};
-		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
index d94605c999915..f0e398eb2aad7 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
@@ -15,6 +15,13 @@ / {
 	model = "TQ-Systems i.MX8QM TQMa8QM";
 	compatible = "tq,imx8qm-tqma8qm", "fsl,imx8qm";
 
+	/* Due to missing workaround for ERR050104 */
+	cpus {
+		/delete-node/ cpu-map;
+		/delete-node/ cpu@100;
+		/delete-node/ cpu@101;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		/*
@@ -174,6 +181,8 @@ &mu2_m0 {
 };
 
 &thermal_zones {
+	/delete-node/ cpu1-thermal;
+
 	pmic0-thermal {
 		polling-delay-passive = <250>;
 		polling-delay = <2000>;
@@ -199,9 +208,7 @@ map0 {
 					<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 					<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 					<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					<&A72_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					<&A72_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 			};
 		};
 	};
-- 
2.43.0


