Return-Path: <linux-renesas-soc+bounces-33184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ENeNGcFFmr/gwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 22:41:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD975DC692
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 22:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 202F6303ACE8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 20:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27383C09FC;
	Tue, 26 May 2026 20:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8r1Kjad"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3953C0610
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 20:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779828059; cv=none; b=np17YVkHn6G5qzwtW06HgNUikP1SVjD5EYexfx6xSAzUEHOOpLhze5hMQ9woc/wxpdovh7IE3cdmmu3bS0jhvTMPab1fVBXUNnKn0ZWHNceR9mhUGvlL5m4UlfOZ/1rXCGEh+YsEtT5X8vD5nTeWEBR8OHGBZ7Uh++vx/ICsi7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779828059; c=relaxed/simple;
	bh=GY+3JuwvqmoMB+7D3MTbrtRBNTJrIqJO/hk0l4ca7mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lefv8/HIb2wDuOId4m1AXwlVDcAO7S765RiF/qGs75wxgOv54v0Gp/mSj+5bab1/IW9hiNl7x+YKQJF/A/dwRG2nieNC3x48+6gJnCuYENNjr+o6y46+LM+t0gCqL3bgFbEgSVBRaLYPEXUjzW0ETVzDFwms9XM7WPLfb4mjld4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8r1Kjad; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so6302471f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 13:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779828054; x=1780432854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3zfcrPXxIeWk32OZbqQALutCssJlFsmq9m7NFPHnKI=;
        b=F8r1KjadpNixTcU7aIj7JzgixOq3A7EhNKjW5rNrGf2wZMHIJz85EgJHBXu487duIX
         XfRrqt7JFsaercxVXCuV6hlb/+gqQvj4w1fyNoBPAqthlGVZqtcIRpMuQyB8awCW1Rwt
         HzSFRvQcAnX9WfamIhQQcZRu3a5+vC7IycPVQHa8drhOcpM3Pqg3ZruxX4sLH4jCYNTS
         pbbRwNiaL7bKPB2TPEIsiwBdMPzlqTyyxF9iNTx9BWItr+LLXMv6T+27qc0VUlu2F8E3
         4y2GhqJWrgBiBPAs91JZtIDsRMhXsIHqg+T+Qxvvo+w16/kqIW+qtFMEUvyd2UiJ8ube
         oJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779828054; x=1780432854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y3zfcrPXxIeWk32OZbqQALutCssJlFsmq9m7NFPHnKI=;
        b=QzRGvim8O9uRBVJRZTvp5/n45R6apqY+j8ufHnoOmwdz46Y3MejocNZofm3/3EQCex
         j2UGSIDon43I2beqWeiNAdEs4KSkhx+ciW0cT+klgcp5fvbuYFvSHsMEs338XPKeiCUQ
         AclDfMUGrHlkIJe4gizf5FPdcbx5P7wCgBcX0kGRUf9tzbiQzTkSVIyv0jOiccblMtWt
         oiW2WYF+5lhr4ySjTG1w0xfLWP7/zWCRKsgBb9rQsUSKMKMeercXZY+Wl3C3MhSllMDW
         kJ0G5CDX2lE6zxsPd1Rnp9CG25x52ogd0CpNVKEMBoJPjjEOZlNXraJQ79X371LUlgVa
         UBSw==
X-Gm-Message-State: AOJu0YyouRjQhslgfNavFBJsXOw2v6TRFnSATi39V0cIdrBjY02uMrkr
	IUnB1lmK21WtMEKFw0yJrhjS4ULraW2rhVBv8eXmmOpi7USYgESZBe1M
X-Gm-Gg: Acq92OHImvMCKbJXaOB2dzm5imDoELzpO+AVXkb70HXJ7yMojHFaaxk8BdQ1uGjbKn3
	r4VgsNZn/bzB8qJtmkfjVQCqixuPr5XgD1qEgLKfFBrxPuc5Lbk49qrtI9hks2v0DM9r4CtwkJk
	e58CVjr0Xwa9CmV6YthAlxy7Te6b+w8MOX77UE/deXhicayoscWKwJyqMULjYHu4K5bqWA9AdnQ
	Bo80y/UHhXwMwSObqxKUFHhVNjr3h8+bjGx62/wgex9ynPtzA8I1Z8lNYy4Xgt95sefsPDNBZ2/
	7qn7mO9NQg4VN/ks1/ZeAIjTnE5vPv9IAGu/gTIXUzmFDbKAzd6w1+hlTXpaJFy+gabgG1l2ko4
	hhZ6A17xa403Aa/DaND0xIMfSkKfykg77/3d9UQxYje7CMIxVAXl9eVwL0q/VBhIH1yAQRdW7xv
	i/+YcjR++lsiND6LtxkYWMXucTyTrYW8b6BleKYNbFYjUnNnTUKt/zRnAtL/96LGhOT3crE328y
	2eQuselAz/xLzU2Luc/EEySNKCsdspKmj3m0EFz33ol6ojP
X-Received: by 2002:a05:6000:1acd:b0:448:69c0:8da0 with SMTP id ffacd0b85a97d-45eb3692456mr33444947f8f.7.1779828054000;
        Tue, 26 May 2026 13:40:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6e49:e380:c3e5:25e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb557545sm904864f8f.12.2026.05.26.13.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 13:40:53 -0700 (PDT)
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
Subject: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes
Date: Tue, 26 May 2026 21:40:45 +0100
Message-ID: <20260526204045.3481604-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526204045.3481604-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260526204045.3481604-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-33184-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_PROHIBIT(0.00)[0.12.53.0:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,0.4.147.224:email,renesas.com:email,0.0.234.96:email,0.0.0.0:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3AD975DC692
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the xSPI0 and xSPI1 controllers on the RZ/T2H N2H EVK board.

Configure the xSPI0 controller interface to 1-bit (x1) mode, even though
the connected MX25LW51245 octal flash device supports octal mode. Add a
corresponding inline hardware comment detailing this restriction;
operating in octal mode causes the BootROM to fail loading the first-stage
bootloader following a Watchdog Timer (WDT) reset.

Configure the xSPI1 controller interface connected to the AT25SF128A
flash device for 4-bit (x4) mode to utilize all available data lines.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index f87c2492f414..fff63d08e3a3 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2025 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/net/mscc-phy-vsc8531.h>
@@ -20,6 +21,8 @@ aliases {
 		mmc0 = &sdhi0;
 		mmc1 = &sdhi1;
 		serial0 = &sci0;
+		spi0 = &xspi0;
+		spi1 = &xspi1;
 	};
 
 	chosen {
@@ -331,6 +334,59 @@ ctrl-pins {
 				 <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1_CD */
 		};
 	};
+
+	xspi0_pins: xspi0-group {
+		clk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(5, 1, 0x1c)>, /* XSPI0_CKP */
+				 <RZT2H_PORT_PINMUX(5, 2, 0x1c)>; /* XSPI0_CKN */
+			input-schmitt-disable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+
+		data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(5, 6, 0x1c)>, /* XSPI0_IO0 */
+				 <RZT2H_PORT_PINMUX(5, 7, 0x1c)>, /* XSPI0_IO1 */
+				 <RZT2H_PORT_PINMUX(6, 0, 0x1c)>, /* XSPI0_IO2 */
+				 <RZT2H_PORT_PINMUX(6, 1, 0x1c)>, /* XSPI0_IO3 */
+				 <RZT2H_PORT_PINMUX(6, 2, 0x1c)>, /* XSPI0_IO4 */
+				 <RZT2H_PORT_PINMUX(6, 3, 0x1c)>, /* XSPI0_IO5 */
+				 <RZT2H_PORT_PINMUX(6, 4, 0x1c)>, /* XSPI0_IO6 */
+				 <RZT2H_PORT_PINMUX(6, 5, 0x1c)>; /* XSPI0_IO7 */
+			input-schmitt-disable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+
+		ctrl-pins {
+			pinmux = <RZT2H_PORT_PINMUX(5, 3, 0x1c)>, /* XSPI0_CS0 */
+				 <RZT2H_PORT_PINMUX(6, 6, 0x1c)>, /* XSPI0_RESET0 */
+				 <RZT2H_PORT_PINMUX(5, 5, 0x1c)>; /* XSPI0_DS */
+			input-schmitt-disable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+	};
+
+	xspi1_pins: xspi1-group {
+		ctrl-pins {
+			pinmux = <RZT2H_PORT_PINMUX(1, 0, 0x1c)>, /* XSPI1_CKP */
+				 <RZT2H_PORT_PINMUX(1, 1, 0x1c)>; /* XSPI1_CS0 */
+			input-schmitt-enable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+
+		data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(1, 4, 0x1c)>, /* XSPI1_IO0 */
+				 <RZT2H_PORT_PINMUX(1, 5, 0x1c)>, /* XSPI1_IO1 */
+				 <RZT2H_PORT_PINMUX(1, 6, 0x1c)>, /* XSPI1_IO2 */
+				 <RZT2H_PORT_PINMUX(1, 7, 0x1c)>; /* XSPI1_IO3 */
+			input-schmitt-enable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+	};
 };
 
 &sci0 {
@@ -395,3 +451,86 @@ &wdt2 {
 	timeout-sec = <60>;
 };
 
+&xspi0 {
+	pinctrl-0 = <&xspi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	assigned-clocks = <&cpg CPG_CORE R9A09G077_XSPI_CLK0>;
+	assigned-clock-rates = <50000000>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		m25p,fast-read;
+		/*
+		 * Configure for 1-bit mode to prevent the BootROM from failing
+		 * to load the first-stage bootloader following a watchdog reset.
+		 */
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+		vcc-supply = <&reg_3p3v>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bl2-0";
+				reg = <0x00000000 0x00060000>;
+				read-only;
+			};
+
+			partition@1fb000 {
+				label = "fip-0";
+				reg = <0x00060000 0x007a0000>;
+				read-only;
+			};
+
+			partition@300000 {
+				label = "user-0";
+				reg = <0x800000 0x003800000>;
+			};
+		};
+	};
+};
+
+&xspi1 {
+	pinctrl-0 = <&xspi1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	assigned-clocks = <&cpg CPG_CORE R9A09G077_XSPI_CLK1>;
+	assigned-clock-rates = <50000000>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		m25p,fast-read;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		vcc-supply = <&reg_3p3v>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bl2-1";
+				reg = <0x00000000 0x00060000>;
+			};
+
+			partition@60000 {
+				label = "fip-1";
+				reg = <0x00060000 0x007a0000>;
+			};
+
+			partition@800000 {
+				label = "user-1";
+				reg = <0x800000 0x800000>;
+			};
+		};
+	};
+};
-- 
2.54.0


