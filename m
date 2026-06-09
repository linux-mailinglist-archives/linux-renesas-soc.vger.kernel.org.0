Return-Path: <linux-renesas-soc+bounces-33766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2JplHjQOKGq89AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 14:59:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C54BA660505
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 14:59:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BPRqVMpi;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FC9B3046D53
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 12:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C517D419306;
	Tue,  9 Jun 2026 12:54:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D29941C302
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 12:54:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009697; cv=none; b=apxLnmiu/A57r+qjeslInsyAV3GoS3gHsKVaXwoPEWTtk/NyJyxC6QYy0j67t0h91WNWObAKPwtRIUBAUTYnZfIZYF5YEOwR/9/IpzLoaHDtcxmVC1i7hYxR6qu/8bQXJs6mATypfSnmTjqVyGQZZbwAdL7IZDQgcz5rVZfM0Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009697; c=relaxed/simple;
	bh=iz03Z1NaE44FQhbRLk2qmAuM3AGwtExdDUN1CNs5vEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CeGYfanA0BUQWBnVsiKionKQELivhqcOy1BnOuBeTBM6ARBVcrKhxqOaKoMqQf7TEspXrA6SJS+zY56P/ZvmVWDyLPTYJdLNMSFdK/jpkLbZ5RGGeyms59xgsbQoevqPidr/DhTeXjOz5hhcKh7IL0hQAslnvgnC1YLeDa/0vQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPRqVMpi; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b3e03939so45904735e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 05:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009688; x=1781614488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAjB1VHYXFjETydFoOxS7JGYlIYDv3A4wa5H74v2Xx8=;
        b=BPRqVMpiKANUeAZnHNS+bTuwX2GJ6FlRTEEpnUqZxLsQd368J/krTUY6dwc5aiUFOi
         UfivklJ3MdEDORYpmjecFMrrSq9ypoeOEypSnxakPRlZllx+2+SqSuVvsMOZatzNMij5
         pNuss9wGlfenmx/0UvCJx8MaznKVGsdYxz8HZzZiPH43qqzSvWy4ueAkuTeaamfMolbE
         d0QAV6b30DrzPJq22pAYNE4YZRUadBybi07wktq48zdinB04KcKibkyOG1LP4lCjGr8A
         T6aJ3G3VAY/dfkW1ltutnovcHRZce1Jonlba65QFjam0U4ni6Kir11DVLoK0H7WCbqp7
         RdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009688; x=1781614488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jAjB1VHYXFjETydFoOxS7JGYlIYDv3A4wa5H74v2Xx8=;
        b=itnuPh1hteHoUzmtcHZrBnJObjp5Tfyyhz2wLDU74gjz4cGpnLIzfMxLCGWuoIm1eh
         27HlMX1mrb3fAOyPvS7tEU4h0fEu/vIZb1IQgf/6eg7zob9Doksqz4wQhKJohLFxHuZP
         Ke+5bAKrHFnfcSw7pMUVtkdLhWLU9o0zjUAkgfsXPTq1PjaVggU1LS6e6riN3jolZJ52
         Q67qbaqi5IdMi6V8RhL/oNO8fWQjinCFpON/6UKC/6O4Y4k31/DnRuL8J3epLHgd2tFN
         f1rg1z+GVvvir7zS63OB28zfRWhQZJyOeeSTNKZwWs8pL+nh80QWir9HdjzMh9YN4DB6
         YdjA==
X-Gm-Message-State: AOJu0YxOTKxgOcVAF19tERxXh7QHhJiF2SXHkT7tqOwpNrEldB7oDeRd
	co7sAM7sPKrsAPPBWbtgNSW5SXwmxmdkK3nvVeLxcCoVNvdJDaA2NkNx
X-Gm-Gg: Acq92OFpZUTRn8dpBi6krml8tooHSXkDivJ4Ui/WKtjvYqAx+6KT0yijvbo4CCXbtmT
	5SdcxN0A/sYm28aaBirUL45UUhkHqbBk5Ci//w/tUkboPuUxcVPXR7r1//FvLWePB8J9FCDNj4J
	iqwge+OjvLB3CS6w2mtnKeVuspM4VHmXokqbWw9foneNyE93H/od0qeFjc6baFZ7w+wzqGonamp
	FHigD1tCMtbqUQ+g68A0BlI748KkFVmawnyW/P9Hw0J/9WKb8OzMT2/wyuJa16Cclbv+y6yOSja
	fhGjnRUHh8pewd6oVYB/UmQw0hBn6fzUYihQkRxmDJgamGcbPu6CSQ9xGpK9zvy0xQak0i8uw8t
	hS0S1mvyILhhoT6EBMAggUMLyCzWB9efZbYeVJoHEw272tqnRMiugXZMELUu+aCrIYML2S2MyJw
	ti47B/KDvraDRyZZU3btHMewHa+68Vyvm/ZZhadkDOBm0xnrzNqw1hxbhX6AR8OXfMe8QevB3/n
	zV73rMfSUM44rDVQ8f4+0ak2HIDYNBVFGM2r1gwEBXC96CPr4VHwnenrw==
X-Received: by 2002:a05:600c:8010:b0:490:b4a8:e031 with SMTP id 5b1f17b1804b1-490c2cba8e7mr261351355e9.4.1781009688151;
        Tue, 09 Jun 2026 05:54:48 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b06sm435968425e9.3.2026.06.09.05.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:54:47 -0700 (PDT)
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
Subject: [PATCH 5/5] arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs with ADV7513
Date: Tue,  9 Jun 2026 13:53:53 +0100
Message-ID: <20260609125353.401124-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33766-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C54BA660505

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add DT overlay support enabling the DU/LCDC pipeline on the RZ/T2H
(r9a09g077) and RZ/N2H (r9a09g087) evaluation kits when fitted with a
CN15/CN20 ADV7513 HDMI transmitter.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, as per the HW manual the slew rate setting for the LCDC pins should
be 1 (fast), but while testing on the EVKs with ADV7513, the display output
was unstable (flickers were seen) with slew rate 1. Setting the slew rate
to 0 (slow) resolved the issue.
---
 arch/arm64/boot/dts/renesas/Makefile          |  6 +++
 .../renesas/r9a09g077m44-evk-cn15-lcdc.dtso   | 40 +++++++++++++++
 .../renesas/r9a09g087m44-evk-cn20-lcdc.dtso   | 35 +++++++++++++
 .../dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi | 50 +++++++++++++++++++
 4 files changed, 131 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8bf155badd11..34a4ef0d715a 100644
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
+r9a09g087m44-rzt2h-evk-cn20-lcdc-dtbs := r9a09g087m44-rzn2h-evk.dtb r9a09g087m44-evk-cn20-lcdc.dtbo
+dtb-$(CONFIG_ARCH_R9A09G087) += r9a09g087m44-rzt2h-evk-cn20-lcdc.dtb
 
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
index 000000000000..bc8a91278920
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
@@ -0,0 +1,35 @@
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
+ * LCDC_DATG3     P14_3, DSW5[3]: OFF, DSW18[5]: OFF, DSW18[6]: ON
+ * LCDC_DATG6     P14_6, DSW15[8]: ON, DSW15[9]: OFF, DSW15[10]: OFF
+ * LCDC_DATB2     P18_1, DSW18[9]: OFF, DSW18[10]: ON
+ * I2C_SDA1       P03_3, DSW7[1]: ON, DSW7[2]: OFF
+ * I2C_SCL1       P03_4, DSW7[3]: ON, DSW7[4]: OFF
+ * ------------------------------------------------
+ */
+
+#include "rzt2h-n2h-evk-du-adv7513.dtsi"
+
+&{/leds/led-4} {
+	/* P18_1 is used for DU function LCDC_DATB2. */
+	status = "disabled";
+};
+
+&i2c0 {
+	status = "disabled";
+};
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


