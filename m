Return-Path: <linux-renesas-soc+bounces-21940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35268B59B89
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 17:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A6B55817EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 15:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3137A352FCA;
	Tue, 16 Sep 2025 15:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3zEWIdO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924A434AAF9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034989; cv=none; b=GgYIAETpbLy08v+QKVhIK66RaxJlzImOG2hevT/27cY29OpU00YmzDvwAUCPD0KlZEBkXLkJdY0SKE/HCNMvcUf1QUgRzQMCnQuwvqVGwwhZpU0uHINZ4ATLtmutC5jbvFXaa7AlKLUXLVW4d4I21N0mLJPzKuFvglgVQbAnDfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034989; c=relaxed/simple;
	bh=HX0/9vV4nsG2VK0flkL9CLFdbZrrCaQcxUeC3BzX7to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n46oFrhVf01eknWVsKxU3qFaE2aB1a+esQ/Nizilv7IZY+V3qCMUWh0q7eQjQ83aToCbGDHl2HurN5ybNsfcnfTNXLwMc9Qa4CjHVSZUsFsxuOMg2FfMNFMavnKCXP7gtOWQ7zlyD3XgDCo05LTsVaUs1YQgXQeEQUHaq2pde4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3zEWIdO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso41247685e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758034983; x=1758639783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubB9lLQ2IlTj0EhNE6RH/BeeiNP16KkUW7CpZ93zAnM=;
        b=C3zEWIdOL2CtHyjqUc+XnyrtAF17XDP61BiCSBshBfmcjT//LIk+ABQBK9GDld4eqT
         stHsaq4PZofVrsnaDy2v4K6J3kXSgIVXZnvMa3EJoOqoGMMamngsHvgryJOvTY4NLaJY
         R3kx5nEy9c4n9FNomnEm6GvFisdMAb5KSlU89jKtZUElKkb49wJPrS7v8lHRzYtg5Nx5
         hEZPK4j+gl3/r1JbUHUTH4m9PjeOr/rg7UqR5CeqO0JUNASlnMgLNknbMI50H0uYnvB0
         jLXOVs77LF8aW6/GV9ZleC1kiYoKjG1scgXDDpW9UDm4vm7gJ4W+DSf0WrLJFiMOYVEI
         I+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034983; x=1758639783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubB9lLQ2IlTj0EhNE6RH/BeeiNP16KkUW7CpZ93zAnM=;
        b=uGJZNe4rAmCvP3I3S5wMEdcUa/UIJ6ipInNGbtadUTt43f4mP0UsOCI2dpfkZxTd8f
         87slvCNLPBevqATbG0bpiKzth0CVnKtdMw4EGonDw/DWBrJfHDcf9FI8lTFmlt7hjHfh
         v8q+VcB0lA1bI0WTLzrwwieHKSgHNpPhpFMwF4QXzziTdY5aSYMr/V2B38Ov6StwpyXQ
         TVcUgxKqP8SQXcJBTijDLGfWa7dsBIGrcaFDGt6JptW3SJV4c2Smb4Y9YrefjkDdEEPr
         lLurRSrTYEgLlyooszd1TWGPpt0MlkkgeS+DcKun5XAyp4qnnksBrJZU/j7YM3Y1ooAo
         4arw==
X-Forwarded-Encrypted: i=1; AJvYcCUmnFwqC3wqi4exP4sjpxtVzXZzIsqBKsp4SMgRr079hRillCQdEmqW5ihMcfu9h/fJU4ZWw452aFN6MFPLBizc1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXVH71q+mVGBoTOMbZvIodxER1Rc4TUaz+bW13DAAbN+5uEEXQ
	dOZYsmXOAeWqYPPVU3RATbZ/pvMOPfWg+XhEcMV6D3wwmmWOVEVCpopr
X-Gm-Gg: ASbGncuJ44EjEKMMGy+WxwnJjGKnyfKfH9MGdm8T3xCqGsmqG8YbfMh408ZwFz1Bues
	OFPVdf1pKerQcbDDYD3JHyCj+xEgWhkYcODGOYM6ftvrAn/K/cEXBfbq7/C0TL4snv1f/iuzsmn
	KejOMkVl7plXQVdVS0Ply8jLAeJk3KiUrrNAbi9AXI8cxSDiSpAgUNkarjAA9QmW5Fcf+BpeL/s
	GRtZv1Ykl/tgnhDe2UlAUnJCdeYO8gMdInFmBxnudp2qXA2y19i8R31S9ITr7q41pF3XafIuiTj
	kMnXeUpnvalOMqpcDNcajDLLolIOHwMT26BmPoC0KcLeSBLn/WTtYmcKI/3R42w5wM88IbWNR6M
	ytNEMwu20Mg72hvVYi/30tfN2aoJq8P21/un2KneJjeC3TZvhVxdZ8rDunKk8nK+eDt7ks4oU8J
	HVSw==
X-Google-Smtp-Source: AGHT+IF3q2kdOQuXwG2xtjbouSVYLAjhkWaQW5FCoAO44l8O15Js2KDzq1AFV5++eyfxo/LvHVu2tQ==
X-Received: by 2002:a05:600c:3515:b0:45f:28ed:6e1e with SMTP id 5b1f17b1804b1-45f28ed71c9mr132894445e9.16.1758034982982;
        Tue, 16 Sep 2025 08:03:02 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdc2deb20sm932154f8f.47.2025.09.16.08.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:03:02 -0700 (PDT)
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
Subject: [PATCH v3 6/9] usb: host: xhci-rcar: Add Renesas RZ/G3E USB3 Host driver support
Date: Tue, 16 Sep 2025 16:02:42 +0100
Message-ID: <20250916150255.4231-7-biju.das.jz@bp.renesas.com>
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

The USB3.2 Gen2 Host controller (a.k.a USB3HOST), IP found on the RZ/G3E
SoC is similar to R-Car XHCI, but it doesn't require any firmware.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
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


