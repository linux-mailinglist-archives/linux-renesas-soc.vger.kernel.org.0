Return-Path: <linux-renesas-soc+bounces-29300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBbxBTjksmnyQgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:05:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 989FA275288
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C86FF302EA97
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 16:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368AC3F65F4;
	Thu, 12 Mar 2026 16:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2mOqz5+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19F73E277F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 16:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773331474; cv=none; b=FBdOTb86YFS7Iiut6HyIeWlzTzkpeW2pHCwudQ5xwlgBbdhZdyfpW4IsMEXHB/IcfOigl4bzPDJNT/d8yUdrlRNoQ3M+7F9uGwfflwmNwrE19Wm8u3AkuPgbFd344LsQzHREiSl+b51Qk/lqgCkbAh+pkathdQ4eZZmv/pQ9jFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773331474; c=relaxed/simple;
	bh=TmbMyDWohNFBQJGgdtfkdS1sq/sYQH/G4n16Ow+QF0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VPs39hK9+tcyQnbb8vYiZxdVIBN10BEzDAFcIoBYlykakV0oShy2UqaLcMPk/3CQRqHG5l+jkqTB2TdkbvAy+2OSmGaa2HQtThdgFRiFtvXYsm5koeM896/h8Z94QRFnx6UMLUIoC67GfJ1kG91fBdbqe9S1MAfSWdo5hcfABIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2mOqz5+; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b611274bso840696f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 09:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773331471; x=1773936271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DL07YIOOK8hOw0a10uZ2IzLFMJq7qVGtBYBdc7awMFw=;
        b=R2mOqz5+xfYhr9coE8Ln+bhH9hZyhv+RHlRyRUmdH+YfR1mGgQf/LeKlwbBbFw6iOM
         IzICJb4k1ys/a9ivdKz5S2RzQZrR8i1/OVDFhSWoj4jIhPtMddUMCDLEsJWw7fWmA+nr
         BWho48f0x8jvS+XOnp+nmaTYekGYfOMBvZb4UbIXUtykYTGBUX8dDbKjNOhsEdMDOiF9
         SC3hEK5AVN44UNTaSarjf62F6czBSq69QPww/ortcg+h81Tjo0w3ot60yMXs4m7YYVpo
         gwxs23DTbZ10a6rP5BDG5hvOiRjkfFyO13sbTMXykdj0GjyHU3HT73cm9xEtaaePBLGx
         1d7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331471; x=1773936271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DL07YIOOK8hOw0a10uZ2IzLFMJq7qVGtBYBdc7awMFw=;
        b=hrvOx/IJGaPIG/71g3SWx1bgfOmHGTrdQSqhKCkIJVYrd0c+f05RWYNgfY/V5y/feZ
         hgUgRM8Hos/g4BwHByyuEP9evxwc1xDFQmTgFLhOg5QVX5Fe2IAuzb9rqr6PPeZU+XnD
         cRfHvXr7POmrHZV5BYj6/LP3R2UOchuGndWJZ+wBzuz9sLK+SDbypozQn9qFHE4e6QrU
         +18Nox4LG+fNq8cGvFDoHO+gT3pw6JWIKwmXES7LFaPtBqwhLo+93WPakz6iavYUN/kr
         JEV3K6wKoNmg8XTRuzwKK6qQhDGu1Mos/Z4/VRsE47hqKyUioTL0GHSMff5V2co6zmhd
         y/aA==
X-Gm-Message-State: AOJu0YxrrWh32o1NUKta75EXUiQjLml/FEyP6P8uh1iLGgFmXvX72eJg
	1yNYoC8OThvpoAzWh5TTq9nE1vJA0MjZ+VWg+aP2vWzrW0CQeU8i35sU
X-Gm-Gg: ATEYQzxdeibt2rgc7yOxCEd6bu0q4l3mxtX2SKhihyrSztRKbuo3Apf3wwjIJH0w6ZW
	Z3SDvXTmuWwWIDznQGlZb0jDYNa3xF33K8tQMYZZ4L6vkiUCzpwHTDaxihSyteRNFRauUtBYiWo
	k74ESi3VunBktog3I2afalZNkK4pZp8yy75d1/n4+bnSIn6ACLrRyqie6xFKjqpiR5EI/i+LlpK
	/dl+vh3J8nE+5i3LHxW3dMq9I/ZtD3ioBKF6txNzXY/rsFfXMrSalOxzwZdPJMCve3OtvJMk4dZ
	1XO7cc6hxb6OxXz8L73s88715GrPEO+H7MtYX0OtB1PSC/JBwPwckg1fGUFdmv7vK/GWtbh7c8M
	0A+OAUzVfLegEi+pWTmQTt82w6zfFJXULZ3Fc0VOX5a3IQ/puzG4RJaUszvGhK0xDQ7PJoAWsos
	hkEHBhA0ceVxmSCTrzio4VqIFWx+LKf6NRBRnCjtKYMW3qFHCQGkmNNvDOU1QlDsdpoSfV/b1uW
	mwZjKvfTw86/9o3CE+pIlXkdAt/oy14YO2yl0AY5S/2VHM=
X-Received: by 2002:a05:6000:40ce:b0:439:b2d9:cf35 with SMTP id ffacd0b85a97d-43a04d865b7mr409728f8f.8.1773331470877;
        Thu, 12 Mar 2026 09:04:30 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:fc52:7d64:32f4:e21e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b899sm9775528f8f.23.2026.03.12.09.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 09:04:30 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add PHY interrupt support
Date: Thu, 12 Mar 2026 16:04:07 +0000
Message-ID: <20260312160407.3387840-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312160407.3387840-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260312160407.3387840-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29300-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 989FA275288
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add interrupt support for the GMAC1 and GMAC2 PHYs on the RZ/T2H EVK
board. The PHYs are connected to the ICU via IRQ3 and IRQ13 lines
respectively.

Define RZT2H_IRQxx macros in the SoC DTSI to map the ICU IRQ_NS lines
to their absolute ICU interrupt space offsets.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi     | 18 ++++++++++++++++++
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts     |  8 ++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 81f6a36e6e72..3761551c9647 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -8,6 +8,24 @@
 #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
+/* The IRQ_NS lines start at offset 16 in the ICU interrupt space */
+#define RZT2H_IRQ0	16
+#define RZT2H_IRQ1	17
+#define RZT2H_IRQ2	18
+#define RZT2H_IRQ3	19
+#define RZT2H_IRQ4	20
+#define RZT2H_IRQ5	21
+#define RZT2H_IRQ6	22
+#define RZT2H_IRQ7	23
+#define RZT2H_IRQ8	24
+#define RZT2H_IRQ9	25
+#define RZT2H_IRQ10	26
+#define RZT2H_IRQ11	27
+#define RZT2H_IRQ12	28
+#define RZT2H_IRQ13	29
+#define RZT2H_IRQ14	30
+#define RZT2H_IRQ15	31
+
 / {
 	compatible = "renesas,r9a09g077";
 	#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index e9639bbb2d70..9d9ad9261781 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -224,10 +224,12 @@ &i2c1 {
 };
 
 &mdio1_phy {
+	interrupts-extended = <&icu RZT2H_IRQ3 IRQ_TYPE_EDGE_FALLING>;
 	reset-gpios = <&pinctrl RZT2H_GPIO(32, 3) GPIO_ACTIVE_LOW>;
 };
 
 &mdio2_phy {
+	interrupts-extended = <&icu RZT2H_IRQ13 IRQ_TYPE_EDGE_FALLING>;
 	/*
 	 * PHY2 Reset Configuration:
 	 *
@@ -274,7 +276,8 @@ gmac2_pins: gmac2-pins {
 			 <RZT2H_PORT_PINMUX(31, 5, 0xf)>, /* ETH2_COL */
 			 <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* GMAC2_MDC */
 			 <RZT2H_PORT_PINMUX(30, 6, 0x10)>, /* GMAC2_MDIO */
-			 <RZT2H_PORT_PINMUX(31, 0, 0x2)>; /* ETH2_REFCLK */
+			 <RZT2H_PORT_PINMUX(31, 0, 0x2)>, /* ETH2_REFCLK */
+			 <RZT2H_PORT_PINMUX(31, 1, 0x0)>; /* IRQ13 */
 	};
 
 	/*
@@ -302,7 +305,8 @@ gmac1_pins: gmac1-pins {
 			 <RZT2H_PORT_PINMUX(35, 2, 0xf)>, /* ETH3_COL */
 			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
 			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
-			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>; /* ETH3_REFCLK */
+			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
+			 <RZT2H_PORT_PINMUX(27, 2, 0x0)>; /* IRQ3 */
 	};
 
 	/*
-- 
2.53.0


