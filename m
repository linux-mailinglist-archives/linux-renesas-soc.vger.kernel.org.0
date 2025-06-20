Return-Path: <linux-renesas-soc+bounces-18583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0DFAE1AAF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 14:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F090C7AFEDD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 12:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E9328C2DE;
	Fri, 20 Jun 2025 12:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxXo6nRW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4399128B7C6;
	Fri, 20 Jun 2025 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421462; cv=none; b=J3XcWm9I9ANkWigDu+7TipftiY+3Uuvfk60YGdnJFNgPOjgxL7Fxc/1LrYMC0nKI/mubPTS12aYW94Rs70OElXpf//VWjydKeuCFZxqz5Y7U1XOzPh6ZQyOviU6eQUGQbr+/A0ABjYWed6NDIkdOraeyWIOGcxYaTLrEhx5XsLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421462; c=relaxed/simple;
	bh=AnGRAkc9BMpPvg3geLJcR4vv/ZfyXpKFYjT72sWIAn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kkWZPD11IS+/WGSegDxH9jrhhG89yZJPDv03lfIbF0S30D94FxN8ND7+0Ut/8ix1FhscxLqh5YDLFs/ayY9SYATsZO5Pvtoik2uWhXHg4L6to1h0PkKOK8qJ8Alvf5b1ZwmhQGcmEIDyBqjn3KHMc35AGqCRcnKyrXSN9VQJoMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxXo6nRW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so13416725e9.0;
        Fri, 20 Jun 2025 05:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750421458; x=1751026258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aP9xujfHxj5r05oJlluxnAgUZ86qmiSmeE+yMyUkYY8=;
        b=IxXo6nRW6HSyo+vwXHDw49Tq/aBidSLJY7GXR7hQbXsvI3Y+MYfnbqVvB5N8Gf+Hrx
         D5UkkaGAD3Kz3VQd3TDKLGimy9o6zRy378oyMlPzvZTlsTaMsBhMcLNMVdrPPjV012Vc
         MRiFOkoZPf4SiIlRr8gPY+80Srl28W6KEjq0GWbX+7roKivzI6eXozFtrFcO0NL3n6mw
         VSz/7jUnm3c4ksWVS9z/ZcnBU5GDoNvJ5x6cci4dxrl18WtYJwUCZdAZcPicIcXTTXTw
         A21hnYj4Y7fNn+ZpPv5URgY4dFyXQA1QYb7k6mTBA2OBYzRKh6j7pDNtRcSjMamFMtcQ
         QZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421458; x=1751026258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aP9xujfHxj5r05oJlluxnAgUZ86qmiSmeE+yMyUkYY8=;
        b=kAEAly8B/qxfoeCaDclrdIqp4mDkPrVZADP4mQ/DzxlX6hJUiPSn0qn12tIUmpvQ6h
         Zpgj0o4FFFpZdMu8fp6ptSRwiK3O4+JLltiY7EnhW8m9Etx2l3wFtmar6zuedjDOzEf3
         qrElu32YKZHYBD7+rPp459asYGdvUGdnEa9QNOmfdawvn53BfbP/CZdHTaB79BsXxcs/
         GZoYkxumuIJUfl8qGQEVShhsCNBqTEKdxMyYUOKC0dowlzwAlE/sJJYPA5gO0mquZWk8
         37fuZ247UEjiQggpfBLkrc0T+/t5177BixASLIY38uPNFpVQY23rjj2li/n42aQaKv1c
         3kCw==
X-Forwarded-Encrypted: i=1; AJvYcCW/fhcugiLmoEaUtjGt1zculfAxtdVxKENxsBIP0HZr8gmnJXzritHeGfji6DjgtXpr1yKPldEFH5zH/wMs@vger.kernel.org, AJvYcCWHsuVaUgkzxEPWWJyvFFJlMi4+7PqbaRmWIBnyp+jC1A3p2IOJQm+NTOaX167Jab0VvdnBnOe0QCaI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz+aYNS9FbdHxQcti5zbnqe0jWuQAP6CgwLn4LliuIDRzKGt6L
	hba4cF1oFQmCQGxMxvix5SMFkY9WZvvO0OLrcDeKbVILQgOEtIo08SnW
X-Gm-Gg: ASbGnctVahOSYCqfYm4lKVhGyruT1Ux7cZzRFXOTv5TpeEVfCXyxuTTjTatXNv74/H+
	l5as+pbx2zRUlRoebLHHrXZNKMlv2Vim5HbsngvXyWhFJiSLNZhA9wizW1jvgXC9o0Y57WzoUzN
	jiZpbrJFfIZRcJUzHYd8Nq3Xl25YGsGcPpEoX+2mkbXcSNhrkGuIEjDgNKls1WHh38VI8Ikp/71
	j2G6+EacoduPKQ6MujKCIGeLy1wjl5E9VkjoUq/sAGpqmsiWMVcVSQRj5lNlPSqoY+NAo/WnDTC
	Wr4dc1HCMx/vnouG3sqqFKUN/P2rtsuNaanMXdGtLlDQkhzozTH0KBzedg3dOsdZBb128p/2bfX
	S+7Ja9y43DGD0BuYQ3ycX
X-Google-Smtp-Source: AGHT+IFEa3C/AcgeqxqSFGTqcyqJroZzEp8+WF1neicE6h9J5RYegCWvfhFFwltJcwaQ5vhFdvdmsw==
X-Received: by 2002:a05:6000:2482:b0:3a5:8abe:a264 with SMTP id ffacd0b85a97d-3a6d12fb9f9mr2014463f8f.37.1750421458395;
        Fri, 20 Jun 2025 05:10:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e188:15d5:9cc6:1db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97a915sm58234645e9.7.2025.06.20.05.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:10:57 -0700 (PDT)
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
Subject: [PATCH 3/3] arm64: dts: renesas: Add CN15 eMMC and SD overlays for RZ/V2H EVK
Date: Fri, 20 Jun 2025 13:10:45 +0100
Message-ID: <20250620121045.56114-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620121045.56114-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250620121045.56114-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce device tree overlays to support the eMMC (RTK0EF0186B02000BJ)
and microSD (RTK0EF0186B01000BJ) sub-boards via the CN15 connector on the
RZ/V2H EVK. These overlays make use of shared DTSI fragments
(`rzv2-evk-cn15-emmc-common.dtsi` and `rzv2-evk-cn15-sd-common.dtsi`)
that encapsulate common CN15-specific configurations, including pinctrl
settings, SDHI0 setup, and required regulators.

Additionally, the base board DTS is updated to define an `mmc0` alias
pointing to `&sdhi0`, and to add a fixed 1.8V regulator node (`reg_1p8v`)
intended for use by the optional eMMC sub-board and, in the future, the
ADV7535 HDMI encoder (not yet enabled in the DTS).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile             |  4 ++++
 .../r9a09g057h44-rzv2h-evk-cn15-emmc.dtso        | 15 +++++++++++++++
 .../renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtso  | 16 ++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts  | 10 ++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 130ef8f34d52..8fa93ca8204e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -167,6 +167,10 @@ dtb-$(CONFIG_ARCH_R9A09G056) += r9a09g056n48-rzv2n-evk-cn15-sd.dtbo
 r9a09g056n48-rzv2n-evk-cn15-sd.dts := r9a09g056n48-rzv2n-evk.dtb r9a09g056n48-rzv2n-evk-cn15-sd.dtbo
 
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
+dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk-cn15-emmc.dtbo
+r9a09g057h44-rzv2h-evk-cn15-emmc.dts := r9a09g057h44-rzv2h-evk.dtb r9a09g057h44-rzv2h-evk-cn15-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk-cn15-sd.dtbo
+r9a09g057h44-rzv2h-evk-cn15-sd.dts := r9a09g057h44-rzv2h-evk.dtb r9a09g057h44-rzv2h-evk-cn15-sd.dtbo
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
 
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtso b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtso
new file mode 100644
index 000000000000..b9a17f505efd
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree overlay for the RZ/V2H EVK with the eMMC sub-board
+ * (RTK0EF0186802000BJ) connected to the CN15 connector.
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#define RZV2H_PA		10
+#define EMMC_GPIO(port, pin)	RZG2L_GPIO(RZV2H_P##port, pin)
+
+#include "rzv2-evk-cn15-emmc-common.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtso b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtso
new file mode 100644
index 000000000000..47cb581c1add
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree overlay for the RZ/V2H EVK with the SD sub-board
+ * (RTK0EF0186B01000BJ) connected to the CN15 connector.
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#define RZV2H_PA		10
+#define SD_GPIO(port, pin)	RZG2L_GPIO(RZV2H_P##port, pin)
+#define SD_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(RZV2H_P##b, p, f)
+
+#include "rzv2-evk-cn15-sd-common.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 01b2e0c7c7db..219347d73753 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -25,6 +25,7 @@ aliases {
 		i2c6 = &i2c6;
 		i2c7 = &i2c7;
 		i2c8 = &i2c8;
+		mmc0 = &sdhi0;
 		mmc1 = &sdhi1;
 		serial0 = &scif;
 	};
@@ -55,6 +56,15 @@ reg_0p8v: regulator-0p8v {
 		regulator-always-on;
 	};
 
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 
-- 
2.49.0


