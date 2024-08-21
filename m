Return-Path: <linux-renesas-soc+bounces-7969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E5695982B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 12:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1967C1F235A1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 10:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4201A4AD4;
	Wed, 21 Aug 2024 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNm80Klq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A018719994A;
	Wed, 21 Aug 2024 08:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724230616; cv=none; b=XSGVn92ZfZcGP1h24LZFYoREgMQ6/cFbQbYyQJZfxExcYVWdDPskgUzCPI1PmOJYSFVW0wPe+F/GQOSsg7m0KvDAlBWPBcxMArVw92fqBZZpRFVG7YUoKhY9AD1dTsh+x0/I5/2uShzeMw4W8qxFZjkPe8iuPXU1ETOI/1ye/UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724230616; c=relaxed/simple;
	bh=IkXOWZfqBE40DiZXzr69ba0PkbUkEiKqfTR1c4dI3oY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EF5uiodZJyxxddLXVR6BCjm0PXXTuPwAt9hhH0w0jAf7ehm4uRsnJyuyw1fER4KMNwJON+46Ob0/TX/GqyHeR655CTJLdwQCUe4MNI5zkbM9sByE+xCl2pFcHo7n9ptOe7f/8b/1JS/nzxXie4QL2EYUa9PnqqDgcO2R3I9ESRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNm80Klq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7aabb71bb2so703670166b.2;
        Wed, 21 Aug 2024 01:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724230613; x=1724835413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEjMSHyv6ilWtu/GNsluGqy5RZkdfktJmS36ZSzEKTE=;
        b=WNm80KlqS+EGzggcRMpY3BtlpHKG+MdFm+Ykl9Semi3KTiIxwz7cpx1pwPrOT3xy69
         U0VtZg35UJG3mi6Ig8dsdqFx/h5SHSOn+gJozuHhhY3xJvGSCp8En8An2IHoLoBOpbQ8
         ydBfUVL7wW3te3/3v8C8x280v0E/WRAb8erhZ4KGH9DphunDBRxmE3GTCDjeummJR6ys
         8TJ038/PpbCPi9hsElteJ508udOE8pSN+7ms0clXXJIwL1CJT09W7YAYn4YNTbyg2UPt
         Sq8lNaMiBaEiBDG5dmviw/pM+HUkMEQHLWz3jtOe46Fk4ay66aJVHvwCKE3ToW3wau+f
         0VvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230613; x=1724835413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEjMSHyv6ilWtu/GNsluGqy5RZkdfktJmS36ZSzEKTE=;
        b=Hlnr3Uie/FA99cUm8DZ3FK3S3LqzslS822WV9UA5YA+FMNa0H+y3tDI6WCUu4xE0Tn
         jNAdIHF5SrPGnvw/7BTQx/Zhpf61Y7ChQNwcGCv/8djvveLauJZuXeI3FJYUgoSYZjVK
         UosSVdlJRyj8Qhc/+6f6rQU+GQA2OgRoRhpiPzoKP+I5h3mgxkwc83VywvDyONf9rPF2
         /g0kcMTh7QSB12mecn0YkkAPkJsq7vUVkF1X6MkTeDtPucw2OUac4CsDGQ0V+Q8B7uiM
         vgv7nAh+9hTAiwb5eZB9v5z9mwa0O/BFnsAZ3smUBe1yv6sCyJ1YdjTxmuebmbHemZMJ
         pvwg==
X-Forwarded-Encrypted: i=1; AJvYcCURn25i4GDHkP9rhqLJ+9VozKlcfGhCfPXoIQ/QnqY/cSoG7ZaM2y1Zl6GXpA9Uw4oH8uHhGiVFK9j/u5ck@vger.kernel.org, AJvYcCUcONNK/ru6eKfUw8DLigE/XUXP12k8wU5fzeCJu7DgfUh9QK7+K6k7USqvCwvJ5SjtSWzxUaVcIUg9@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQmoUrQqIz++f/Snd2oukSSq/wusgmeJ3LpUr0IRUmsYpMRZt
	oFa+Xp/CEJuomgBSi+iTMzAoQt91wuptcyasIT555VUKstIKL9A4
X-Google-Smtp-Source: AGHT+IFaAapmCm6MIzqV8nRxhgCqfySXtpof70YGKAwuwdvgXo4Y7FKvQnrQti8bspq6sk5ryQIuug==
X-Received: by 2002:a17:907:f155:b0:a7a:9f0f:ab2b with SMTP id a640c23a62f3a-a866f390e46mr127422066b.32.1724230612436;
        Wed, 21 Aug 2024 01:56:52 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:b9a9:40a4:353f:6481])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cf183sm873416266b.56.2024.08.21.01.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:56:52 -0700 (PDT)
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
Subject: [PATCH v3 2/8] arm64: dts: renesas: Add initial DTS for RZ/V2H GP-EVK board
Date: Wed, 21 Aug 2024 09:56:38 +0100
Message-Id: <20240821085644.240009-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add initial DTS for RZ/V2H GP-EVK board, adding the below support:
- Memory
- Clock inputs
- PINCTRL
- SCIF

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- No change.

v1->v2
- No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../boot/dts/renesas/r9a09g057h44-gp-evk.dts  | 61 +++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index fbd214a1a638..b2249a2710aa 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -137,5 +137,7 @@ dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
+dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-gp-evk.dtb
+
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
new file mode 100644
index 000000000000..593c48181248
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/V2H GP-EVK board
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+
+#include "r9a09g057.dtsi"
+
+/ {
+	model = "Renesas GP-EVK Board based on r9a09g057h44";
+	compatible = "renesas,gp-evk", "renesas,r9a09g057h44", "renesas,r9a09g057";
+
+	aliases {
+		serial0 = &scif;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x1 0xF8000000>;
+	};
+
+	memory@240000000 {
+		device_type = "memory";
+		reg = <0x2 0x40000000 0x2 0x00000000>;
+	};
+};
+
+&audio_extal_clk {
+	clock-frequency = <22579200>;
+};
+
+&pinctrl {
+	scif_pins: scif {
+		pins = "SCIF_TXD", "SCIF_RXD";
+		renesas,output-impedance = <1>;
+	};
+};
+
+&qextal_clk {
+	clock-frequency = <24000000>;
+};
+
+&rtxin_clk {
+	clock-frequency = <32768>;
+};
+
+&scif {
+	pinctrl-0 = <&scif_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
2.34.1


