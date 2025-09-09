Return-Path: <linux-renesas-soc+bounces-21673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72294B504F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 20:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6317C5E604E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 18:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3CB36934F;
	Tue,  9 Sep 2025 18:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neSwnwxH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A4F362988;
	Tue,  9 Sep 2025 18:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441295; cv=none; b=bFEBVKK1yfcIDG2cxD7AdNnHjJrFUTC2UMBDzd6FY7H8GdYqYEmzbHVtklW2YIyknzAC0Q1w7RRCdY8bwsyCITnOWHatbUlwhoTK9Kw8Knr/DkO9cNdCXBRnw/bd0s+2+WzJxsGv6cqiPvHyvd8Ippd7kAKoEtH8aYpauLWzn3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441295; c=relaxed/simple;
	bh=QXN6ui8koLwxkiJuZO6e64rL8TFfhfstw4IEOinL4KQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLrR2LlSDBMZ6jNEu+V/twhaN7wTIDtTbq/DhaTRH8mY97oRYNuI5Ax4UB2rEeli73qOA/vMWbVUvPtR1RzSsuv3mqmxe2TDeuWRpRxizP0hjB7MhrQknkQL3/2BXEkDXnGeDeXf4f0ZmEdg+jicXQPty7pEaRtztvinPF6EfoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neSwnwxH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3df15fdf0caso4544478f8f.0;
        Tue, 09 Sep 2025 11:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757441292; x=1758046092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtgoC1iOeueD6v2dNa4JLHXcBGAaf8DrU7TRJZiMWKA=;
        b=neSwnwxHofDrIpyPHbXV6dtvPaK4dOdm/qgu3AltV+ydyTrmYBZiyDrgM8PiRKTIiL
         3GzFnhWvZPGMH/W9ZjvTr1VZ40RnBQSYjivdKopOAY1vG/zXeH/yhBshcfoXYb4QQ8Zm
         y72WcHJ4eyzvoeFr4LJwi6/lbVQjF2fjaU4YUcrKSo883q4qJzKx/AaAZBB4LXSsP/UO
         +D9H421w2JDJhZ1WtmSuGF2UB/0F0d4Fww7dZDhAjAYDHP9SkA67lz6gjmvkSAeEwusI
         HZEBVRbX6fdrT8X4JFwq5f+vyvIiTs5ZLje35Z33ZiCGYA45p6s2A7EroeXuwg5E77uM
         6C/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441292; x=1758046092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtgoC1iOeueD6v2dNa4JLHXcBGAaf8DrU7TRJZiMWKA=;
        b=V5y07AfQy1+yMNByr/8DJjcP6uG9l9o3mHYmdBshcO7B+MdPG53QgbG3NmhPxl0IhR
         ca7oAjLdrkCncv35PnDUOoeT7Mz/ZwEih/OfG2+A3HUJAHrMmZb49o7k3tdLPh9GAkIO
         8iGGabJUV6pwaTBmpHjkz+wJJulR4+gU1FZs8lHY6pwNCjxUvJpFTK+9j4jSMpBKjXzj
         44h0uebGs8LFXBTr2mSHwx7+pTjKLlBl5jJOv8nbuDoGZgapn9ro3VRSb27L/ZHTE6IW
         vKL1GNevOrevbVb7HuEGt/4Cwg2HDKK5J9++C5BV6MLyJRVD403/rzKDPBiHwSiQzrKp
         JhlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe2c/68WTn+TYG7Zy2458DfRam9Pmiyxmfhs1fwdbkhkyt3yMkQ5AJ/dvtDf3dDilJ54EITVeomSgI7d2lFTcehUg=@vger.kernel.org, AJvYcCX7OnlnC70a46DqGoC+jjWJYrt2/OQOCTKWHyZsgbA00y9/Z18EUR6C+q02O7ZldSRUlkUbrR/Gz+mH@vger.kernel.org, AJvYcCXSc/0g649RTv0FVWQ1rw3ZDnV9oaoeIl2DpuaN2jwBOk5FcbTPSdy7eV9H4JAAdMGTo/oDLGs2vvoz6Dw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVwZ21/r4yhnNVYYfFGZQ0qUdi8bCsyKq2LdIXI3pqxteuxFPt
	IuamOU6Z2xfrFC5j4E73IB4XNq4SWfZQLWXqikReu1YEwVKRM54/0FSS
X-Gm-Gg: ASbGncupvcW7adcgYxXgNBH24YJdqs6m+0tRwtZuKz4LQFKA0zV7zansjVR51fdRQkt
	kDGZYWSLl50mC30/+/3RfOfPsR7/BypqiPB1iK0+TqFxM4W/9hhtM9EauXFXLltNI1tDRLycmzw
	PKSSU5YTlmjTwiN9czTORIniq78UleV/KSVvb+0SY0+7IGGPpDm+/Y5a/QlAZgB3XqoWkBQUWop
	/PmzKeWhEbSvNpHKWBy2PJ9rtkgQ7rqfjwM2LK32GpkipWu8aOgTG/S8302rBuBlCBwlzzBBb7Z
	Bgal/QJvWwUP7gmaLKH/TCDRoS1wPO500QGQf+2aLcNQtPhOdMq4BfkRXbWI5NmOW6WpWhajDZz
	6rC/b6eypqVTW+kqLY4XdPscn8yzyWrewt+4SR+vM/1u+iY0FTpmJ+HPY/PEQKWWspung4MWj/g
	grqCXi+jkhMVHK
X-Google-Smtp-Source: AGHT+IEML9DA91qaCQap22hVs9zxDqMiUjCMenZYdxXRBKjDJ7zG4bXS40xu0ZdlwvMCA6EYh6jEng==
X-Received: by 2002:a5d:5f96:0:b0:3b7:8da6:1bb4 with SMTP id ffacd0b85a97d-3e64cd59b54mr9655478f8f.58.1757441291837;
        Tue, 09 Sep 2025 11:08:11 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df679a4c9sm4174015e9.3.2025.09.09.11.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:08:11 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 08/11] usb: host: xhci-rcar: Add Renesas RZ/G3E USB3 Host driver support
Date: Tue,  9 Sep 2025 19:07:53 +0100
Message-ID: <20250909180803.140939-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
References: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The USB3.2 Gen2 Host controller (a.k.a USB3HOST), IP found on the RZ/G3E
SoC is similar to R-Car XHCI, but it doesn't require any firmware.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/usb/host/Kconfig           |  2 +-
 drivers/usb/host/xhci-rcar.c       | 55 ++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-rzg3e-regs.h | 12 +++++++
 3 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/host/xhci-rzg3e-regs.h

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 109100cc77a3..c4f17ce5c77b 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -93,7 +93,7 @@ config USB_XHCI_RCAR
 	default ARCH_RENESAS
 	help
 	  Say 'Y' to enable the support for the xHCI host controller
-	  found in Renesas R-Car ARM SoCs.
+	  found in Renesas R-Car and RZ/G3E alike ARM SoCs.
 
 config USB_XHCI_RZV2M
 	bool "xHCI support for Renesas RZ/V2M SoC"
diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index 6d4662def87f..8a993ee21c87 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -11,10 +11,12 @@
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/usb/phy.h>
+#include <linux/reset.h>
 
 #include "xhci.h"
 #include "xhci-plat.h"
 #include "xhci-rcar-regs.h"
+#include "xhci-rzg3e-regs.h"
 #include "xhci-rzv2m.h"
 
 #define XHCI_RCAR_FIRMWARE_NAME_V1	"r8a779x_usb3_v1.dlmem"
@@ -67,6 +69,48 @@ static void xhci_rcar_start(struct usb_hcd *hcd)
 	}
 }
 
+static void xhci_rzg3e_start(struct usb_hcd *hcd)
+{
+	u32 int_en;
+
+	if (hcd->regs) {
+		/* Update the controller initial setting */
+		writel(0x03130200, hcd->regs + RZG3E_USB3_HOST_U3P0PIPESC(0));
+		writel(0x00160200, hcd->regs + RZG3E_USB3_HOST_U3P0PIPESC(1));
+		writel(0x03150000, hcd->regs + RZG3E_USB3_HOST_U3P0PIPESC(2));
+		writel(0x03130200, hcd->regs + RZG3E_USB3_HOST_U3P0PIPESC(3));
+		writel(0x00180000, hcd->regs + RZG3E_USB3_HOST_U3P0PIPESC(4));
+
+		/* Interrupt Enable */
+		int_en = readl(hcd->regs + RZG3E_USB3_HOST_INTEN);
+		int_en |= RZG3E_USB3_HOST_INTEN_ENA;
+		writel(int_en, hcd->regs + RZG3E_USB3_HOST_INTEN);
+	}
+}
+
+static int xhci_rzg3e_resume(struct usb_hcd *hcd)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+
+	return reset_control_deassert(xhci->reset);
+}
+
+static int xhci_rzg3e_post_resume(struct usb_hcd *hcd)
+{
+	xhci_rzg3e_start(hcd);
+
+	return 0;
+}
+
+static int xhci_rzg3e_suspend(struct usb_hcd *hcd)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+
+	reset_control_assert(xhci->reset);
+
+	return 0;
+}
+
 static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
 {
 	struct device *dev = hcd->self.controller;
@@ -190,6 +234,14 @@ static const struct xhci_plat_priv xhci_plat_renesas_rzv2m = {
 	.plat_start = xhci_rzv2m_start,
 };
 
+static const struct xhci_plat_priv xhci_plat_renesas_rzg3e = {
+	.quirks = XHCI_NO_64BIT_SUPPORT | XHCI_RESET_ON_RESUME | XHCI_SUSPEND_RESUME_CLKS,
+	.plat_start = xhci_rzg3e_start,
+	.suspend_quirk = xhci_rzg3e_suspend,
+	.resume_quirk = xhci_rzg3e_resume,
+	.post_resume_quirk = xhci_rzg3e_post_resume,
+};
+
 static const struct of_device_id usb_xhci_of_match[] = {
 	{
 		.compatible = "renesas,xhci-r8a7790",
@@ -206,6 +258,9 @@ static const struct of_device_id usb_xhci_of_match[] = {
 	}, {
 		.compatible = "renesas,xhci-r8a7796",
 		.data = &xhci_plat_renesas_rcar_gen3,
+	}, {
+		.compatible = "renesas,r9a09g047-xhci",
+		.data = &xhci_plat_renesas_rzg3e,
 	}, {
 		.compatible = "renesas,rcar-gen2-xhci",
 		.data = &xhci_plat_renesas_rcar_gen2,
diff --git a/drivers/usb/host/xhci-rzg3e-regs.h b/drivers/usb/host/xhci-rzg3e-regs.h
new file mode 100644
index 000000000000..7a244a47b882
--- /dev/null
+++ b/drivers/usb/host/xhci-rzg3e-regs.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __XHCI_RZG3E_H
+#define __XHCI_RZG3E_H
+
+#define RZG3E_USB3_HOST_INTEN		0x1044	/* Interrupt Enable */
+#define RZG3E_USB3_HOST_U3P0PIPESC(x)	(0x10c0 + (x) * 4) /* PIPE Status and Control Register */
+
+#define RZG3E_USB3_HOST_INTEN_XHC	BIT(0)
+#define RZG3E_USB3_HOST_INTEN_HSE	BIT(2)
+#define RZG3E_USB3_HOST_INTEN_ENA	(RZG3E_USB3_HOST_INTEN_XHC | RZG3E_USB3_HOST_INTEN_HSE)
+
+#endif /* __XHCI_RZG3E_H */
-- 
2.43.0


