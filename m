Return-Path: <linux-renesas-soc+bounces-20775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B40B2E3CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 19:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DCDF1C853CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 17:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C6A350852;
	Wed, 20 Aug 2025 17:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAhDoWnZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885A134F464;
	Wed, 20 Aug 2025 17:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710304; cv=none; b=XZGwPb6gPjaYZufxkNuEaeDsPEQhVaPlJXb6B7olT2CK02HyDSoDVv9NF7Qumy61usME5xCA2ardpUHlWkAXo1Rb+Z5W0LzYdJNOU4lb2GVn7GVT3CIcHhL56Tp0fZSiFToLMGP6wWzOjx9zNhQ1jGRGj6uOy4v0mQ+qPTz4OCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710304; c=relaxed/simple;
	bh=JD5Wjlqs57QEUNrTMStgKvAPR+toQnySVXUUacQu+Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UaB7FGhnmqkrQmAaz6Bza7EUVvZhcv9KhTRgemNKq/dOXwjpQmBPYFd5DaByGj/P/HM39H0E2YTn1OckhAcNp71vNuTu8AVxfI/p90hJuZUzRod2//8JegGafeF0p/+bu56rePRP1B86jSQo/zcZYBVMvK+UvCMWB2PoVp4Rs/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAhDoWnZ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b916fda762so561540f8f.0;
        Wed, 20 Aug 2025 10:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755710300; x=1756315100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOSf0kIWt+pJisPXs1kX3E5il09X9aXcK+9kICdw/LQ=;
        b=NAhDoWnZjgYwOJt91tJyI36sYLro5gc1cN1PqUTAVGMZz209imV2YkneVALCYl0L26
         wpZUMDjNcS4L9+m8pG52IIClwl4ExqfVfxTEc+orDBfTaz6M0XAxwtNPdNrSag+BBw/z
         tzNSvn+aAaVYDq4TWs9vIIvRXStk5aHCKYyOaMmVjGF05qzdntFJFmIkdXmbg1e55I6t
         bA8c831za5JNQZ+WSc5wd1H4cXUxmw8U+Q2tfNh4qoXVexIGuA8gByPO7DwuTiKEnG4I
         EsEGsJ78ogIc1zI7AiJIdEW0GLGKJXuVVkt6f35qNpIWJdXUGzALzE0x+TYuh8xk1D9z
         mf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710300; x=1756315100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOSf0kIWt+pJisPXs1kX3E5il09X9aXcK+9kICdw/LQ=;
        b=ddU05QbLeqXNisYdSBTT0FfI25SNb1/PU/nftcFEugFpflID1YwOUWtLnKG2bUnBoY
         BowRG/2637zzzoiBM6QN4Ysbzt6Ag1nBtXe9w0YGNRFDQXLKtPL8hD/fTuFdrwkcx9FF
         F+PCy8Sl7BMcS/vqUdyl6rXynFGY3YW1TGcZN+fik7JHEElihbqYOgTg4/SChOH2eo2J
         UhNoHST+us4Kwe/hhkwW+N8iY+Iokriixk/cxFbMAVixjwZksmNcqeTc4RaOrsZbgzbg
         a4QglcdvU82dtWpOUlsxCDli+b9oUX+7pquSLenuGzqgWxvtDWkK6bQmS3XoavPE9juY
         RWSw==
X-Forwarded-Encrypted: i=1; AJvYcCUENDhKSyZ5VrumVqvtEPsE0OW/0qqvvaTL82oo004/1Er8y3dSg/ZYEbSHe4JTt1URl8PUp6tx5t3A8+w=@vger.kernel.org, AJvYcCVzuQaJK36ryX/Khjrf2vTCl2s4hzPgZNT19a4BYyZSEqSaqAp9MxBjVhpgsepFaqJpnejN60nlGJ36@vger.kernel.org, AJvYcCWOmNffSZ0YNECCC/NX4bNMTQ11i78GvaYg48+jkTDxJ5fpl58Gs/0PgpHBdbpEpEtNIz2jMJcfDeW2bNvL1TDxRVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YypdzCyiLrSZEm4LtyfxYKzoyv88MRqBrt913XlqFwtaP13e7Tq
	7SpZweeXdZ90Cu8rXr4AQtIcETCgFMlvRIOYafna9CdEcc6r5B9on5CQ
X-Gm-Gg: ASbGncu4GuNEEU4Hp/Dzwu9z2z4/nP2EZf65bi+3ZtUcM1+7XI1QxXq1MtfXDkC1wkT
	qT2qx9c4GzJLjQpHKj4brdfgNhap3YguXzXsJ2xBNgU4RjwHuFqdoGGzVV1Z6oJk68EwC3gnVLt
	HagxiUGOQLKsIa2Pl18VqpZlV274qNf2adaz02qE2KIHbBzFsew7aY6f+E8+9UMNnJRIq6byDTE
	f6zdrwEFWzD90AMxoeM6Nok/mgguRFMQdAxCSMH8OKnjDabR4mZ6ZU+YDJlkXOzkcb9qPqn3uS6
	TN8GOhZTgDq2HkMx0gIAVoyeGBuUnvrfxbJ465jhLKNxHXSWmPNywD6ToW2wKrGESuUaivsfKFu
	EEmpR9WeScxVJ4zG0y9GztrixQ47Fde/cbmyM9EHzuFxocTHBHwtKi9zqg/J8KNqwCoBN+HAS0g
	==
X-Google-Smtp-Source: AGHT+IE2s+cQM7Ahr6fhQe7EqIXTsUqlvasg/TJm4ZNhXhp3t8D229omjFLsWxFq4JVcDvI3ePVVdA==
X-Received: by 2002:a5d:5d0d:0:b0:3b7:8842:8a0c with SMTP id ffacd0b85a97d-3c46026f9bfmr222804f8f.19.1755710299722;
        Wed, 20 Aug 2025 10:18:19 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c2865dsm40319815e9.2.2025.08.20.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:18:19 -0700 (PDT)
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
Subject: [PATCH 08/11] usb: host: xhci-rcar: Add Renesas RZ/G3E USB3 Host driver support
Date: Wed, 20 Aug 2025 18:17:55 +0100
Message-ID: <20250820171812.402519-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
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


