Return-Path: <linux-renesas-soc+bounces-20546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F98B2730B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Aug 2025 01:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66A475C410C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 23:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50AC283153;
	Thu, 14 Aug 2025 23:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vFQVFUNQ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tWV0c81n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21480219E0;
	Thu, 14 Aug 2025 23:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755214558; cv=none; b=ASrqxgxgwXLp3WHvG8bCbp+P1N1rDF3CzdFeY/o9CQd8ZwAC3xHcavBNTg+ieAJiu9dlwN4W+rNMOjdbrc+1hZn2hK1WI9xHU9+xNokbQF61iYc8kWrT+7Oicsy+vISZ9BZZgrGK5+B1WrSjdvDE0dKskDQVJ+nbvMazfEIOJDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755214558; c=relaxed/simple;
	bh=T5VAbGZ92MHd0uN3cV3PuUPUxL/Zo9VMeK/ZdLkvha4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UoEwYWaGDCNGw0JL1zROlR6Ch3Zo3Hq7KJRdqSnJny1U1VFLyz5WGmn/l1aHXRbaS5+Vtl0dfHoY9AE4IBOya+6zUA3CuFg7K53efhAnhqazRKsf0Hr2jrlMUWygXePmUmP4efJt9mvvdOGf/3GMgV3A3Y7UNYkSIyfFr9a1vbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vFQVFUNQ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tWV0c81n; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4c31nw06QYz9tBF;
	Fri, 15 Aug 2025 01:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755214548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wbvZ1ekGJuwOIl7G04NQ4rzv98Rcb4Y1ERxLhOMI7n0=;
	b=vFQVFUNQIg+ezhmhzXAKC2bRenWQ6bVdP4x+8IpqQsQYCH9l41Vek1gL5H810IHElmcSKL
	DPZkKV5Zi2QfTo1omFwljuYxcIDxzCexarzcFIwucBqL8p+8rptH5h7DdwZKOD6PEp+KXH
	BZP7Cr9eTs6PVuw/9TIHhlqNMOEkzIY2+TiBWNFKCNhl2AQEGIxQO4g3z/V0wU5nB2GPXG
	aydsyChatjvziDTXN58ysQ9eUoWdZaqxwow5jJSNY8yvko0OQ5d83/1OLDxdMSkNaoymJ9
	IlgPJjsAQqbo2L3xOnm3pQPbDaE+UVPPOh5F6Ll5spgdWheeVr3aC8g5smX6BQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755214546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wbvZ1ekGJuwOIl7G04NQ4rzv98Rcb4Y1ERxLhOMI7n0=;
	b=tWV0c81nn9dTIUdRpFoitXRTFb8fiw64Kdxyb7zo1I3kzk7mF18y02YrVlgGgqUVdazU+/
	N3hQmsShwqsCa2BPlm0m6WuA9qbwOr8d0ZBhYQfOUM6syhezdl3TQZjQVRcPKaYZiHmTJe
	QF4YuEXDuyTth/CSIrpynckaUQOFqjnn4NWX23qV0ATexXXYX2FoIyTQKYEVJHS8nMFDCX
	ecIJmfnoIEUGZt0sX+8/mb/M68WSq1Pg+TLbhQCKvcm2L8Rm46jyLIVTphjiVfx/YsTkgK
	W17DJdPyciUMS5TJgV5x70EZ10VOfXflput3V7TNhn3yEDwz4FsG0RY0/FSeRw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3] arm64: dts: renesas: r8a779g3: Update thermal trip points on V4H Sparrow Hawk
Date: Fri, 15 Aug 2025 01:34:57 +0200
Message-ID: <20250814233529.191874-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ro33ojtzrzd8qiioe6n1mqqa58ybn7rr
X-MBO-RS-ID: 23a44379a17920dd7c0

Since the Sparrow Hawk has a smaller PCB than the White Hawk, it tends
to generate more heat. To prevent potential damage to the board, adjust
the temperature trip points.

Add four "passive" trip points which increasingly throttle the CPU to
prevent overheating. The first trip point at 68°C disables the 1.8 GHz
and 1.7 GHz modes and limits the CPU to 1.5 GHz frequency. The second
trip point at 72°C disables the 1.5 GHz mode and limits the CPU to 1.0
GHz frequency. The third trip point at 76°C uses thermal-idle to start
inserting idle cycles into the CPU instruction stream to cool the CPU
cores down. The fourth and last trip point at 80°C disables the 1.0 GHz
mode and limits the CPU to 500 MHz frequency.

In case the SoC heats up further, in case either of the thermal sensors
readings passes the 100°C, a thermal shutdown is triggered to prevent
any damage to the hardware.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Add RB from Niklas
V3: - Sort DT nodes
    - Update comment on idle states, note the 0..80%
    - Add RB from Geert
---
 .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 1f44005e1a11..75b1b789ae1d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -38,6 +38,7 @@
 
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "r8a779g3.dtsi"
 
@@ -189,6 +190,41 @@ vcc_sdhi: regulator-vcc-sdhi {
 	};
 };
 
+/* Use thermal-idle cooling for all SoC cores */
+&a76_0 {
+	#cooling-cells = <2>;
+
+	a76_0_thermal_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <10000>;
+		exit-latency-us = <500>;
+	};
+};
+
+&a76_1 {
+	a76_1_thermal_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <10000>;
+		exit-latency-us = <500>;
+	};
+};
+
+&a76_2 {
+	a76_2_thermal_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <10000>;
+		exit-latency-us = <500>;
+	};
+};
+
+&a76_3 {
+	a76_3_thermal_idle: thermal-idle {
+		#cooling-cells = <2>;
+		duration-us = <10000>;
+		exit-latency-us = <500>;
+	};
+};
+
 &audio_clkin {
 	clock-frequency = <24576000>;
 };
@@ -801,3 +837,104 @@ &rwdt {
 &scif_clk {	/* X12 */
 	clock-frequency = <24000000>;
 };
+
+/* THS sensors in SoC, critical temperature trip point is 100C */
+&sensor1_crit {
+	temperature = <100000>;
+};
+
+&sensor2_crit {
+	temperature = <100000>;
+};
+
+&sensor3_crit {
+	temperature = <100000>;
+};
+
+&sensor4_crit {
+	temperature = <100000>;
+};
+
+/* THS sensor in SoC near CA76 cores does more progressive cooling. */
+&sensor_thermal_ca76 {
+	critical-action = "shutdown";
+
+	cooling-maps {
+		/*
+		 * The cooling-device minimum and maximum parameters inversely
+		 * match opp-table-0 {} node entries in r8a779g0.dtsi, in other
+		 * words, 0 refers to 1.8 GHz OPP and 4 refers to 500 MHz OPP.
+		 * This is because they refer to cooling levels, where maximum
+		 * cooling level happens at 500 MHz OPP, when the CPU core is
+		 * running slowly and therefore generates least heat.
+		 */
+		map0 {
+			/* At 68C, inhibit 1.7 GHz and 1.8 GHz modes */
+			trip = <&sensor3_passive_low>;
+			cooling-device = <&a76_0 2 4>;
+			contribution = <128>;
+		};
+
+		map1 {
+			/* At 72C, inhibit 1.5 GHz mode */
+			trip = <&sensor3_passive_mid>;
+			cooling-device = <&a76_0 3 4>;
+			contribution = <256>;
+		};
+
+		map2 {
+			/* At 76C, start injecting idle states 0..80% of time */
+			trip = <&sensor3_passive_hi>;
+			cooling-device = <&a76_0_thermal_idle 0 80>,
+					 <&a76_1_thermal_idle 0 80>,
+					 <&a76_2_thermal_idle 0 80>,
+					 <&a76_3_thermal_idle 0 80>;
+			contribution = <512>;
+		};
+
+		map3 {
+			/* At 80C, inhibit 1.0 GHz mode */
+			trip = <&sensor3_passive_crit>;
+			cooling-device = <&a76_0 4 4>;
+			contribution = <1024>;
+		};
+	};
+
+	trips {
+		sensor3_passive_low: sensor3-passive-low {
+			temperature = <68000>;
+			hysteresis = <2000>;
+			type = "passive";
+		};
+
+		sensor3_passive_mid: sensor3-passive-mid {
+			temperature = <72000>;
+			hysteresis = <2000>;
+			type = "passive";
+		};
+
+		sensor3_passive_hi: sensor3-passive-hi {
+			temperature = <76000>;
+			hysteresis = <2000>;
+			type = "passive";
+		};
+
+		sensor3_passive_crit: sensor3-passive-crit {
+			temperature = <80000>;
+			hysteresis = <2000>;
+			type = "passive";
+		};
+	};
+};
+
+&sensor_thermal_cnn {
+	critical-action = "shutdown";
+};
+
+&sensor_thermal_cr52 {
+	critical-action = "shutdown";
+};
+
+&sensor_thermal_ddr1 {
+	critical-action = "shutdown";
+};
-- 
2.47.2


