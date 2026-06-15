Return-Path: <linux-renesas-soc+bounces-34017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qolnGpDoL2p7IwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:57:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C99CB685E49
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:57:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hQVycLTy;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8BE430416B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 11:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FEB3E7BCB;
	Mon, 15 Jun 2026 11:55:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B073E558A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 11:55:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524508; cv=none; b=amCkNuhxbO3HRXAQmVGo7Z2S2omzsHn+4iPYxeWkvv2m0sPisdyDGJFQL1c+MSuAKTNa2aOCYEz4AWkLvd3GWC8r6k4CCKpvJLYBRcaYaeX+q92V/PDeUkM354aq3Mehv+eJ8/KbbbimeZ6PDJSyFJf73BamrUMKh2N0iwcNhxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524508; c=relaxed/simple;
	bh=XfXZkuAUf4Ix4pJzvlhSfT45QXt2G6McWqAlPM1v1h4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tR2/3oJu5xsI09OCIe+igT1kKUSO8Y4dTekLM8hK+6GjR0fjWzOuFENzllR3sUea+aqWxJSk+bp7AAs37xzdrfFrGMN8iedzZId57tNt5Hqq9BpEKWaqFRe9D1de11fA9o2DrQ+16el573/4TLW6VR4CVXGjAMDmeZzgTJfftlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQVycLTy; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso42494535e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781524504; x=1782129304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6QIs/iyDkxw/4mUiNrEZcKwtf0SXTUuKL6ddVXg6e8=;
        b=hQVycLTyJqxVbDkr501ONSaNb7k6ZdCUfXgfzh2xQcI9QUuJPMjcpRFP4/ryBcZ1vY
         hSsQFzj1fqsqUffa0hLSX9a9nm9AKaJTpENHYQUbVbXLoO8VtPd4ftyy3fIoDbUY5TyE
         vuITw6juQISdz2ct0nOHnXQTIu2RqaP64Fyv3GgQ4qNxARqPsZnHRklInw8iI7nS1nIe
         NwCT3zLAJuJtFMXVZh/BjttD4g/Gr+7Q1QvM+JD3sNusRqHOKElkrSjLoncA350e+dSL
         xYEnrqeEB4kN0QK5ZYZI6YnMDddHX4UdvXbOXj5btKRwYvJNwJjuChUtb6G2okJSI2Yj
         1Ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524504; x=1782129304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u6QIs/iyDkxw/4mUiNrEZcKwtf0SXTUuKL6ddVXg6e8=;
        b=jzO7LkCqdWLZXndi6b+cZMroiHnn9PYmNTnFd0sARZDYPci+WEga74B2+eM+g2ySSL
         3KUPvbj7/zKq+busi49fXab3JOt+epXKMiWIGHzZsMTw1N+WMMsa59H02I+ZXo1NchqJ
         cgrfP6oFYF/9fS0N8A76JT0HSbuhr9vqhdKtZLG6EKAzYZqvBRf9rn+QO0OcSLJXNYX2
         w5IaXojKShD0VXMs64HM5fVZCr5LqMMtl+UqgYaKWBpJU5GEKGJ6VNXZae2yzzi7IxpB
         OHd41OgNzpSWLDfnYmVosd1GwQDkGpI847oFcyAS93ColFX728ToMXkxbtCYwjT6dhkO
         cwyg==
X-Gm-Message-State: AOJu0Yw+YEhtoHm6GUT+WNWXebkbJQFL2QCOh+634aCdaC8IWIoWLt26
	n+UTaDvQy7Z8GZdpAoVnioumgWcUXcQFHeCOKT6DbQK8780sNZ7XfQNU
X-Gm-Gg: Acq92OFdD2AY5SkASKI2JuCi3yhHvw9t5T1pwEK5UvZV6RSLAAtHxBaBMGvjU3CxcRd
	424Dr6OAJY23eOZHyngF6AAhPF3PY2qf/dSp337uSt95ZoHD9NLNYNazMIs2MllFPcTPBPCTwSU
	W2asz+ioGfjJwR4RuyVitcfpITm1pmCQ6tRSpkgffo9idPF2YeSBRVg2jJt3qo5VvnLReOHUN7u
	MpjR/PUJTCpoYd9ZoeWRi9m1+Bbg3Df6fIByogKO7u7j2nneoez+ry2akLbqtm9QiXt6qieWWdD
	RuQ8M2ZGm/CLjZYGvfzS1XatWE9bx+JYY99UhNYhWwSRObIe8uQpHS8V+q6uTCgjjSz5Caft0S8
	uiGyeCPCyAQZ2ZS32pTlisEKKoyDV4iyGophw6A/YCXe6CQbo7mglngEpSd1rvPm4qrxSq0YdVw
	FMSmY7op+mZtiXHa0v/vHdSX7WXGp7+zMozskw+dzgIcGZ6fOAFMBxgMCYZg7hZYrxxM+J4Tfey
	9e72UTFdBOjF5nyioi9OWj1X8NIVzunOXi5
X-Received: by 2002:a05:600c:8b16:b0:490:ab8b:1bb3 with SMTP id 5b1f17b1804b1-492200db664mr132669585e9.18.1781524504117;
        Mon, 15 Jun 2026 04:55:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203dd0b9sm240455485e9.15.2026.06.15.04.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:55:03 -0700 (PDT)
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
Subject: [PATCH v2 5/5] arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs with ADV7513
Date: Mon, 15 Jun 2026 12:54:55 +0100
Message-ID: <20260615115455.1412098-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34017-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C99CB685E49

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add DT overlay support enabling the DU/LCDC pipeline on the RZ/T2H
(r9a09g077) and RZ/N2H (r9a09g087) evaluation kits when fitted with a
CN15/CN20 ADV7513 HDMI transmitter.

Move the LED8 and LED9 preprocessor conditionals inside the node
definitions so that the nodes remain present in the base DTS. This
allows the LCDC overlay to reference and disable them when their pins
are reassigned to display functions.

According to the hardware manual, the LCDC pins should use slew-rate
setting 1 (fast). However, testing on the RZ/T2H and RZ/N2H EVKs with
the ADV7513 HDMI transmitter showed unstable display output with visible
screen flicker when configured for fast slew-rate operation. Configure
the LCDC pins with slew-rate setting 0 (slow) instead, which provides
stable display output on the evaluation platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Fixed typo in makefile for CONFIG_ARCH_R9A09G087
- Explicitly disabled the led7 and key-1 in the overlay
- Dropped comment about DSW5[3]
- Updated commit message
---
 arch/arm64/boot/dts/renesas/Makefile          |  6 +++
 .../renesas/r9a09g077m44-evk-cn15-lcdc.dtso   | 40 +++++++++++++++
 .../renesas/r9a09g087m44-evk-cn20-lcdc.dtso   | 50 +++++++++++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 12 +++--
 .../dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi | 50 +++++++++++++++++++
 5 files changed, 154 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8bf155badd11..e4a7d7ab5b0e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -216,8 +216,14 @@ r9a09g057h48-kakip-pixpaper-dtbs := r9a09g057h48-kakip.dtb r9a09g057h48-kakip-pi
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip-pixpaper.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-rzt2h-evk.dtb
+dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-evk-cn15-lcdc.dtbo
+r9a09g077m44-rzt2h-evk-cn15-lcdc-dtbs := r9a09g077m44-rzt2h-evk.dtb r9a09g077m44-evk-cn15-lcdc.dtbo
+dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G087) += r9a09g087m44-rzn2h-evk.dtb
+dtb-$(CONFIG_ARCH_R9A09G087) += r9a09g087m44-evk-cn20-lcdc.dtbo
+r9a09g087m44-rzn2h-evk-cn20-lcdc-dtbs := r9a09g087m44-rzn2h-evk.dtb r9a09g087m44-evk-cn20-lcdc.dtbo
+dtb-$(CONFIG_ARCH_R9A09G087) += r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb
 
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso b/arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
new file mode 100644
index 000000000000..41c695325729
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT overlay for the RZ/T2H EVK with ADV7513 transmitter
+ * connected to DU enabled.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+/*
+ * RZ/T2H LCDC configuration:
+ * ----------------------------------------------------------
+ * Function        Pin     SW Setting
+ * ----------------------------------------------------------
+ * LCDC_DATG0     P11_0, SW6[3]: OFF, SW6[4]: ON, SW6[5]: OFF
+ * LCDC_DATB1     P18_0, SW8[3]: OFF, SW8[4]: ON
+ * LCDC_DATB2     P18_1, SW8[1]: OFF, SW8[2]: ON
+ * HEADER_IRQ8    P22_6, SW2[1]: ON, SW2[2]: OFF
+ */
+#include "rzt2h-n2h-evk-du-adv7513.dtsi"
+
+&{/leds/led-4} {
+	/* P18_0 is used for DU function LCDC_DATB1. */
+	status = "disabled";
+};
+
+&{/leds/led-5} {
+	/* P18_1 is used for DU function LCDC_DATB2. */
+	status = "disabled";
+};
+
+/*
+ * Disable SDHI0 as SW2 settings for eMMC/SD card conflict with DU pin
+ * settings.
+ */
+&sdhi0 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
new file mode 100644
index 000000000000..17bc71380860
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT overlay for the RZ/N2H EVK with ADV7513 transmitter
+ * connected to DU enabled.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+/*
+ * RZ/N2H LCDC configuration:
+ * ----------------------------------------------------------
+ * Function        Pin     SW Setting
+ * ----------------------------------------------------------
+ * LCDC_DATG0     P11_0, DSW12[3]: ON, DSW12[4]: OFF
+ * LCDC_DATG3     P14_3, DSW18[5]: OFF, DSW18[6]: ON
+ * LCDC_DATG6     P14_6, DSW15[8]: ON, DSW15[9]: OFF, DSW15[10]: OFF
+ * LCDC_DATB2     P18_1, DSW18[9]: OFF, DSW18[10]: ON
+ * I2C_SDA1       P03_3, DSW7[1]: ON, DSW7[2]: OFF
+ * I2C_SCL1       P03_4, DSW7[3]: ON, DSW7[4]: OFF
+ * ------------------------------------------------
+ */
+
+#include "rzt2h-n2h-evk-du-adv7513.dtsi"
+
+&{/keys/key-1} {
+	/* P18_2 is used for DU function LCDC_DATB3. */
+	status = "disabled";
+};
+
+&{/leds/led-4} {
+	/* P18_1 is used for DU function LCDC_DATB2. */
+	status = "disabled";
+};
+
+&{/leds/led-7} {
+	/* P14_3 is used for DU function LCDC_DATG3. */
+	status = "disabled";
+};
+
+&{/leds/led-8} {
+	/* P14_6 is used for DU function LCDC_DATG6. */
+	status = "disabled";
+};
+
+&i2c0 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index 4e57d4fe195c..5176e620685a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -162,8 +162,8 @@ led-7 {
 			function-enumerator = <8>;
 		};
 
-#if LED8
 		led-8 {
+#if LED8
 			/*
 			 * USER_LED0
 			 * DSW15-8: OFF, DSW15-9: OFF, DSW15-10: ON
@@ -172,11 +172,13 @@ led-8 {
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DEBUG;
 			function-enumerator = <0>;
-		};
+#else
+			status = "disabled";
 #endif
+		};
 
-#if LED9
 		led-9 {
+#if LED9
 			/*
 			 * USER_LED1
 			 * DSW15-5: OFF, DSW15-6: ON
@@ -185,8 +187,10 @@ led-9 {
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DEBUG;
 			function-enumerator = <1>;
-		};
+#else
+			status = "disabled";
 #endif
+		};
 
 		led-10 {
 			/*
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi
new file mode 100644
index 000000000000..c537b2221fdc
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT overlay common parts for the RZ/{T2H/N2H} EVKs with ADV7513
+ * transmitter connected to DU enabled.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
+
+#define ADV7513_PARENT_I2C i2c1
+#include "rz-smarc-du-adv7513.dtsi"
+
+&pinctrl {
+	du_pins: du-pins {
+		pinmux = <RZT2H_PORT_PINMUX(9, 4, 0x28)>, /* LCDC_CLK */
+			 <RZT2H_PORT_PINMUX(9, 5, 0x28)>, /* LCDC_HSYNC */
+			 <RZT2H_PORT_PINMUX(9, 6, 0x28)>, /* LCDC_VSYNC */
+			 <RZT2H_PORT_PINMUX(9, 7, 0x28)>, /* LCDC_DE */
+			 <RZT2H_PORT_PINMUX(10, 0, 0x28)>, /* LCDC_DATR0 */
+			 <RZT2H_PORT_PINMUX(10, 1, 0x28)>, /* LCDC_DATR1 */
+			 <RZT2H_PORT_PINMUX(10, 2, 0x28)>, /* LCDC_DATR2 */
+			 <RZT2H_PORT_PINMUX(10, 3, 0x28)>, /* LCDC_DATR3 */
+			 <RZT2H_PORT_PINMUX(10, 4, 0x28)>, /* LCDC_DATR4 */
+			 <RZT2H_PORT_PINMUX(10, 5, 0x28)>, /* LCDC_DATR5 */
+			 <RZT2H_PORT_PINMUX(10, 6, 0x28)>, /* LCDC_DATR6 */
+			 <RZT2H_PORT_PINMUX(10, 7, 0x28)>, /* LCDC_DATR7 */
+			 <RZT2H_PORT_PINMUX(11, 0, 0x28)>, /* LCDC_DATG0 */
+			 <RZT2H_PORT_PINMUX(14, 1, 0x28)>, /* LCDC_DATG1 */
+			 <RZT2H_PORT_PINMUX(14, 2, 0x28)>, /* LCDC_DATG2 */
+			 <RZT2H_PORT_PINMUX(14, 3, 0x28)>, /* LCDC_DATG3 */
+			 <RZT2H_PORT_PINMUX(14, 4, 0x28)>, /* LCDC_DATG4 */
+			 <RZT2H_PORT_PINMUX(14, 5, 0x28)>, /* LCDC_DATG5 */
+			 <RZT2H_PORT_PINMUX(14, 6, 0x28)>, /* LCDC_DATG6 */
+			 <RZT2H_PORT_PINMUX(17, 6, 0x28)>, /* LCDC_DATG7 */
+			 <RZT2H_PORT_PINMUX(17, 7, 0x28)>, /* LCDC_DATB0 */
+			 <RZT2H_PORT_PINMUX(18, 0, 0x28)>, /* LCDC_DATB1 */
+			 <RZT2H_PORT_PINMUX(18, 1, 0x28)>, /* LCDC_DATB2 */
+			 <RZT2H_PORT_PINMUX(18, 2, 0x28)>, /* LCDC_DATB3 */
+			 <RZT2H_PORT_PINMUX(18, 3, 0x28)>, /* LCDC_DATB4 */
+			 <RZT2H_PORT_PINMUX(18, 4, 0x28)>, /* LCDC_DATB5 */
+			 <RZT2H_PORT_PINMUX(18, 5, 0x28)>, /* LCDC_DATB6 */
+			 <RZT2H_PORT_PINMUX(18, 6, 0x28)>; /* LCDC_DATB7 */
+		drive-strength-microamp = <11800>;
+		slew-rate = <0>;
+	};
+};
-- 
2.54.0


