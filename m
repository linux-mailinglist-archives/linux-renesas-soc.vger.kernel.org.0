Return-Path: <linux-renesas-soc+bounces-34701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AI53LiDVSGp+uQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:40:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 549B87074E3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:40:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SrAHqD6G;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 674FD3062F7E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 09:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF333ACF12;
	Sat,  4 Jul 2026 09:34:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09283ABD96
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 09:34:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157689; cv=none; b=f7ZdXWkQmU1l4tMU35vokUF6J5r5iM9/ar8Iq6mMsTMtCgerr7NHCNICqsMzsXp3vDxVf+g/1u3FMtekQBaoNu2ifn7JuHOhWJ1b7kz+T3NLDDrUrVmEynqcQCXn0jn1B6iA8qOZi3WnGAFuMrQXgXnUB2LkuVWITYjncYvlf50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157689; c=relaxed/simple;
	bh=tSD8OiXYcivI49+zd2Eg3FIIwjv4zYcn/79pDiLMeW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EwmL8Q3RwRflgAC9+iMrqEjFzr/KI3SGc8w3UTLiPnPZOpVD93jMuOAP65Voh89cFuIVu6X1rZAoavcgZgwkejOFgD9I9mDOcz/lWzdNSymAbFQtI62rAvfpEVASB/xPXBdnXn6kE7Kn+izfC5ioDJjkOKWIWBYw5ZevFyEZwl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrAHqD6G; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso4902665e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 02:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157686; x=1783762486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZ5T8dYjv7QNIAt6/YZ+REUOeMyxDslY9uDF5gRyPxY=;
        b=SrAHqD6GInuNwres54uHy5VJJef4zG1UulkkpnJruUEdYFF+nkEyHPp7XH9R5+jVuN
         shHFwfPnFqPO50yAV9B/ErTxl+GHEyhx8rFRz2zNS4tpGMhQz2MXcXiD7pdx6nHrRBZ5
         2Vgao+p9vqpzecKbYUKk0qX9iAMfPJFFjrRpgX94hPAihPlWmUnEdI6D7KeLL/sZXRnh
         tExb7u0qSmAzM21lzM1orABJLQozS0Fmgizfp953pMXSlNX9giuj+ippulSrks1cRgY5
         LZDL1EFr8Vf8mnIsAs8EN8kwsjeglXE6KRdSLv9GsslR7ScQ+SXqP9NxyNcR6kmMmXYN
         ZLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157686; x=1783762486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lZ5T8dYjv7QNIAt6/YZ+REUOeMyxDslY9uDF5gRyPxY=;
        b=JkX4Yyftl5jxgRG+CYAzkGcGYKudl86jsoQ5d5gNB0KDEqjQdDZzQEoHEhjnu0OMqs
         Am8XW7VDEJpj4krplI7PLNhE2bKvXwhF5jakZUgayv/ZOxQAo0BblF+gKuWs4k/DLRQh
         0iOh4HXzjuuzZe71h5G6ZQUr1pl0Gh1P8ZNRod2r4gceAQ385r8nBE5yqgc8OH/9GLnG
         YBlf6taLrkoqPJmgQLuBIqsTIataCzQAh0nCVYgir5e/Fz70GFrgbr7T27Nxo4MLtvRI
         VvKqByhGzUMzA+nfiFAzs8+tPK9CNseEuF3fUpqdc+jM0YcArBxitI772AN6mbeKhxdJ
         qO7g==
X-Forwarded-Encrypted: i=1; AFNElJ+n9nCC4KugtQl7vgx4eH3aLXy9xEfzHtMg0pJv7JFCmDZZ+0Sg+hbnimrKKRqN13NO5yzOdjFcBFbeLqIUqqWaIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1H0Twu9dHU9a0NVq04pHb2wND/fmA7iphJqR3rhrDZqeahWE4
	Flkl499U986bbXqP/apbdMrCO8GL2KuORGWfJZLrI1qBaT8VrRrztGU/
X-Gm-Gg: AfdE7cnD8BsFkskp2GiXi0WtfpPSYG3w10s6cwr42d0OL0wGnYAjKRtRsHvtclZbuE+
	zwKTVuU/Zh35qoyEsJcLL5qjpNGAVtwh/l6eO2fnFGN5+EkUNXq85lWuq1KeexPWZN9fD5qH1vf
	p7DUkTCgSEOU/9WaO5uOeM31Cu4GZweR6WTU1gatbBRZgX0nfkYwiVQ7Vqf7LAjxKsgKTE9QDnX
	Qbvz+cKbIIwvX4FjbwGVRcO3e1uInwXCR5+kTDG8bGGa+mk9XD7naH0GXB7TrWZR47pQj2O4aKD
	4st8H9kksbTqrL3VHbCWsuhJ1FVGyxuHg1t9E8A6PL1qb6UsB7GkTj1DH5zFfr5cQhPj+r/WbWe
	1tZqlpwxnECZshKnoFeMYz1wS77xczIbzjuqA/lAZHJYqnXvcTRw7XoUffvON9DMO1QGlnTW00s
	CeN5yKqTemxpLKFJRdfbOS
X-Received: by 2002:a05:600c:1d0a:b0:493:c535:3934 with SMTP id 5b1f17b1804b1-493d11fe6a6mr26565625e9.36.1783157686079;
        Sat, 04 Jul 2026 02:34:46 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:45 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 15/16] arm64: dts: renesas: Add DSI overlay for RZ/G3L SMARC EVK with ADV7535
Date: Sat,  4 Jul 2026 10:34:25 +0100
Message-ID: <20260704093433.273672-16-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34701-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 549B87074E3

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a Device Tree overlay (r9a08g046l48-smarc-dsi-adv7535.dtso) for the
RZ/G3L (R9A08G046) SMARC EVK board to support DSI-to-HDMI output via the
Analog Devices ADV7535 HDMI transmitter.

The overlay enables the DSI controller with a 4-lane data path and the
display unit (DU/LCDC), and configures the ADV7535 on I2C2.

Update the Makefile to build the overlay as both a standalone .dtbo and
a composite .dtb (base DTB + overlay).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 .../r9a08g046l48-smarc-dsi-adv7535.dtso       | 95 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8bf155badd11..8c6a44890715 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -187,6 +187,9 @@ r9a08g045s33-smarc-pmod1-type-3a-dtbs := r9a08g045s33-smarc.dtb r9a08g045s33-sma
 dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc-pmod1-type-3a.dtb
 
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc.dtb
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtbo
+r9a08g046l48-smarc-dsi-adv7535-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-dsi-adv7535.dtbo
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
new file mode 100644
index 000000000000..cede3b4ba318
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree overlay for the RZ/G3L SMARC EVK with ADV7535
+ * connected to DSI and LCDC enabled.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
+
+&{/} {
+	osc1: cec-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+
+	dsi-to-hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			dsi_to_hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+};
+
+&dsi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			dsi_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&adv7535_in>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	adv7535: hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>;
+
+		interrupts-extended = <&pinctrl RZG3L_GPIO(K, 3) IRQ_TYPE_EDGE_FALLING>;
+		clocks = <&osc1>;
+		clock-names = "cec";
+		avdd-supply = <&reg_1p8v>;
+		dvdd-supply = <&reg_1p8v>;
+		pvdd-supply = <&reg_1p8v>;
+		a2vdd-supply = <&reg_1p8v>;
+		v3p3-supply = <&reg_3p3v>;
+		v1p2-supply = <&reg_1p8v>;
+
+		adi,dsi-lanes = <4>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7535_out: endpoint {
+					remote-endpoint = <&dsi_to_hdmi_con_out>;
+				};
+			};
+		};
+	};
+};
-- 
2.43.0


