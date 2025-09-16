Return-Path: <linux-renesas-soc+bounces-21938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB75AB59B7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 17:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C807B1BC7EC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 15:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55E2350D58;
	Tue, 16 Sep 2025 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+znDs0p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5893434A31F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034987; cv=none; b=kwpCB/AWd4k3HofdGYJsMrIXx4WEc90qgJs02xV7lb5nHkr+vK52X0sqj89O3m87nJy6Izqg24KXoJKXm2uczADHjQUy/Kn1sH3sVMXVtmPlV6eRYrswVjqHC6yR7Dgl/tKVCtnax37op9GdRXPvGF46mY8YYuNS2cCkKc8MDVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034987; c=relaxed/simple;
	bh=JWAOPJVJwm9JYWeWUAD5rygvd8/WMZojAO7MBTDFeao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9vIuUwrEsafyyndKcddV5TsyN3Ccvrlb7QXIDWrBRQkrE2artQrL92HRGWcsaWVHbpHSIX6oT+uiFrg1tXlpnO9mC8l4sBb9y/4I39pWIsbfYtanPIwl2wabuDKJA3avSGt+AOSsiR1XBI7QOJ8N/dapfYemrFmhjTs8VcJXUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+znDs0p; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ebc706eb7bso1196366f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758034982; x=1758639782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uuy6+KxTBsC6SlUdB1lv3rItTmRywfPxKGtKtkwquJE=;
        b=e+znDs0pGGlz4NGNnRj7sJynRZQsghAUSe9ow1UgR9AfWB0fUUaQzEGHk8WzKs1LkX
         jzRA2B0oXpx3SYs+0XBGH50UPYY4MeI6KG4skV8Uzh6fAhredjNSAYt8/MTNB3YSYSBu
         W68nLQz0KM46e9hWETj6rR4tXlIYDhhBE+jIiH4Vkj37T2r///Mt879u3tN+fXiKNQ8N
         BDhfL/x4KTVJNfCoZ5EWOLtaaTw8EM6Wr6nyOoRnAn0mU4Ce1l4oQsx115h4ctQPPHPO
         E7c00ad+H2xnXHE7wUXxuzWr35dIdhAmddfhkBXJZpXrXhzJVsp8gkzgxoDsdH/aMqBk
         HhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034982; x=1758639782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uuy6+KxTBsC6SlUdB1lv3rItTmRywfPxKGtKtkwquJE=;
        b=AGv5DDaKzJP6FXaNw+eN1psL2Mz0Y7jjE5oO66JQab4fbzBnT6QrqImkMDnFPoHic1
         9r6Wacoy2VqhwpB/Jytk5nd/3n0z1mHV1Bi2TjFzySDSbTM64ox44bIzicFbvg4C9F/a
         1wG3vHiG3B1DmVIKhzme6yQg4VLArCDiGqrvdrtZtp71DmAL9QnRbsfmG/EcGYy8CRSH
         aba2JNOB8OI0jHCeMmqtsh6LBcK+V+z3uOrdL8ZEFRUnNt8S9oUkKOcIJxS+U+5NjuOg
         G+NRMAq+4a8At/jxrJlxgifHYljKf8n8M2+gdF21q/y7mywJRjT/O6dwVcqydZ0ZyU46
         Wb/w==
X-Forwarded-Encrypted: i=1; AJvYcCWNEwoMiOBjwj1EiVCdR9KXMNMimYJWmVCmz4oDb1UibQEDgzxxx1u4cmLvP0keeD9F7heXDkNJz+MuoytzxQ37EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt6NAb7Wp+jHJpLYdpwxE1hcM5H2PWFkO/FV9P8hMSGlLJMioo
	O+VWaY9GblcBABU4dD9isf3TegidOwCfnC7aerx5gck2CwMjbKXMf18R
X-Gm-Gg: ASbGncuCJy2dQjnNxNBCncoYhHTpkqePiXE+PgwCjpegTCWJxnnrnKHFbHUyTP3XcgF
	4LiIj2HliQAauMcIcJigYUKhxtsfOVEn1FstBglpqK+420J2EU7n69tVbEEFbG5xDlpV+2muc/i
	ydMGmWYceK8w5gEGeJH1RNvQvtytabSj4EUtjj8T/PaabpsjnSkc1DMZ05IeEjHpO92PumC20w6
	fDb/SRSzfA3gE6OVT+Fui3eSjmIXtuPGSqWHlPwLYFDMt6t/CeRtnU7iP3N5gdmTi84y7eKZtNT
	85sHN09/h97KSJT2uioiqhZbvE/tXZyARu/ErChKF97xowEv+hRG9B5gfG59nog/UMd5VdcoiL/
	9rXhng0yBqGX2v4sOq1OYzc4XxpmenKhkK6G0+4kfY+uI5j6gUNQgCS45CeNt5zkSvZblc7yGQm
	Y4kg==
X-Google-Smtp-Source: AGHT+IGaK+iWpAtXwRiAraxvEqz36VioS/HwnWCyYlLR+y9IAHh0lXnlG9NgJ3OxFlqx32YU43DzKQ==
X-Received: by 2002:a05:6000:4023:b0:3eb:4e88:55e with SMTP id ffacd0b85a97d-3eb4e88099emr5348037f8f.41.1758034981581;
        Tue, 16 Sep 2025 08:03:01 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdc2deb20sm932154f8f.47.2025.09.16.08.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:03:01 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 4/9] usb: host: xhci-rcar: Move R-Car reg definitions
Date: Tue, 16 Sep 2025 16:02:40 +0100
Message-ID: <20250916150255.4231-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Move xhci-rcar reg definitions to a header file for the preparation of adding
support for RZ/G3E XHCI that has different register definitions.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/usb/host/xhci-rcar-regs.h | 49 +++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-rcar.c      | 45 +---------------------------
 2 files changed, 50 insertions(+), 44 deletions(-)
 create mode 100644 drivers/usb/host/xhci-rcar-regs.h

diff --git a/drivers/usb/host/xhci-rcar-regs.h b/drivers/usb/host/xhci-rcar-regs.h
new file mode 100644
index 000000000000..5ecbda858be0
--- /dev/null
+++ b/drivers/usb/host/xhci-rcar-regs.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __XHCI_RCAR_H
+#define __XHCI_RCAR_H
+
+/*** Register Offset ***/
+#define RCAR_USB3_AXH_STA	0x104	/* AXI Host Control Status */
+#define RCAR_USB3_INT_ENA	0x224	/* Interrupt Enable */
+#define RCAR_USB3_DL_CTRL	0x250	/* FW Download Control & Status */
+#define RCAR_USB3_FW_DATA0	0x258	/* FW Data0 */
+
+#define RCAR_USB3_LCLK		0xa44	/* LCLK Select */
+#define RCAR_USB3_CONF1		0xa48	/* USB3.0 Configuration1 */
+#define RCAR_USB3_CONF2		0xa5c	/* USB3.0 Configuration2 */
+#define RCAR_USB3_CONF3		0xaa8	/* USB3.0 Configuration3 */
+#define RCAR_USB3_RX_POL	0xab0	/* USB3.0 RX Polarity */
+#define RCAR_USB3_TX_POL	0xab8	/* USB3.0 TX Polarity */
+
+/*** Register Settings ***/
+/* AXI Host Control Status */
+#define RCAR_USB3_AXH_STA_B3_PLL_ACTIVE		0x00010000
+#define RCAR_USB3_AXH_STA_B2_PLL_ACTIVE		0x00000001
+#define RCAR_USB3_AXH_STA_PLL_ACTIVE_MASK (RCAR_USB3_AXH_STA_B3_PLL_ACTIVE | \
+					   RCAR_USB3_AXH_STA_B2_PLL_ACTIVE)
+
+/* Interrupt Enable */
+#define RCAR_USB3_INT_XHC_ENA	0x00000001
+#define RCAR_USB3_INT_PME_ENA	0x00000002
+#define RCAR_USB3_INT_HSE_ENA	0x00000004
+#define RCAR_USB3_INT_ENA_VAL	(RCAR_USB3_INT_XHC_ENA | \
+				RCAR_USB3_INT_PME_ENA | RCAR_USB3_INT_HSE_ENA)
+
+/* FW Download Control & Status */
+#define RCAR_USB3_DL_CTRL_ENABLE	0x00000001
+#define RCAR_USB3_DL_CTRL_FW_SUCCESS	0x00000010
+#define RCAR_USB3_DL_CTRL_FW_SET_DATA0	0x00000100
+
+/* LCLK Select */
+#define RCAR_USB3_LCLK_ENA_VAL	0x01030001
+
+/* USB3.0 Configuration */
+#define RCAR_USB3_CONF1_VAL	0x00030204
+#define RCAR_USB3_CONF2_VAL	0x00030300
+#define RCAR_USB3_CONF3_VAL	0x13802007
+
+/* USB3.0 Polarity */
+#define RCAR_USB3_RX_POL_VAL	BIT(21)
+#define RCAR_USB3_TX_POL_VAL	BIT(4)
+
+#endif /* __XHCI_RCAR_H */
diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index 1cc082a3b793..6d4662def87f 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -14,6 +14,7 @@
 
 #include "xhci.h"
 #include "xhci-plat.h"
+#include "xhci-rcar-regs.h"
 #include "xhci-rzv2m.h"
 
 #define XHCI_RCAR_FIRMWARE_NAME_V1	"r8a779x_usb3_v1.dlmem"
@@ -29,50 +30,6 @@
 MODULE_FIRMWARE(XHCI_RCAR_FIRMWARE_NAME_V1);
 MODULE_FIRMWARE(XHCI_RCAR_FIRMWARE_NAME_V3);
 
-/*** Register Offset ***/
-#define RCAR_USB3_AXH_STA	0x104	/* AXI Host Control Status */
-#define RCAR_USB3_INT_ENA	0x224	/* Interrupt Enable */
-#define RCAR_USB3_DL_CTRL	0x250	/* FW Download Control & Status */
-#define RCAR_USB3_FW_DATA0	0x258	/* FW Data0 */
-
-#define RCAR_USB3_LCLK		0xa44	/* LCLK Select */
-#define RCAR_USB3_CONF1		0xa48	/* USB3.0 Configuration1 */
-#define RCAR_USB3_CONF2		0xa5c	/* USB3.0 Configuration2 */
-#define RCAR_USB3_CONF3		0xaa8	/* USB3.0 Configuration3 */
-#define RCAR_USB3_RX_POL	0xab0	/* USB3.0 RX Polarity */
-#define RCAR_USB3_TX_POL	0xab8	/* USB3.0 TX Polarity */
-
-/*** Register Settings ***/
-/* AXI Host Control Status */
-#define RCAR_USB3_AXH_STA_B3_PLL_ACTIVE		0x00010000
-#define RCAR_USB3_AXH_STA_B2_PLL_ACTIVE		0x00000001
-#define RCAR_USB3_AXH_STA_PLL_ACTIVE_MASK (RCAR_USB3_AXH_STA_B3_PLL_ACTIVE | \
-					   RCAR_USB3_AXH_STA_B2_PLL_ACTIVE)
-
-/* Interrupt Enable */
-#define RCAR_USB3_INT_XHC_ENA	0x00000001
-#define RCAR_USB3_INT_PME_ENA	0x00000002
-#define RCAR_USB3_INT_HSE_ENA	0x00000004
-#define RCAR_USB3_INT_ENA_VAL	(RCAR_USB3_INT_XHC_ENA | \
-				RCAR_USB3_INT_PME_ENA | RCAR_USB3_INT_HSE_ENA)
-
-/* FW Download Control & Status */
-#define RCAR_USB3_DL_CTRL_ENABLE	0x00000001
-#define RCAR_USB3_DL_CTRL_FW_SUCCESS	0x00000010
-#define RCAR_USB3_DL_CTRL_FW_SET_DATA0	0x00000100
-
-/* LCLK Select */
-#define RCAR_USB3_LCLK_ENA_VAL	0x01030001
-
-/* USB3.0 Configuration */
-#define RCAR_USB3_CONF1_VAL	0x00030204
-#define RCAR_USB3_CONF2_VAL	0x00030300
-#define RCAR_USB3_CONF3_VAL	0x13802007
-
-/* USB3.0 Polarity */
-#define RCAR_USB3_RX_POL_VAL	BIT(21)
-#define RCAR_USB3_TX_POL_VAL	BIT(4)
-
 static void xhci_rcar_start_gen2(struct usb_hcd *hcd)
 {
 	/* LCLK Select */
-- 
2.43.0


