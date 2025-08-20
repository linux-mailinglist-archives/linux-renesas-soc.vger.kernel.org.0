Return-Path: <linux-renesas-soc+bounces-20770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FACAB2E3BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 19:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCD975C1798
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 17:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF0F34DCEE;
	Wed, 20 Aug 2025 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHuNi7rM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0390B34AB03;
	Wed, 20 Aug 2025 17:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710302; cv=none; b=KgvfbbC8s9ZPqdJEKMjRVWm3nNSLradCYz95LVeZ+zQXUS1XFQot3nIe/FC665bjnkcGXHmlEKJIl259Z7Zzci5ExMO/ElP+pqQmf5A8RF6vGMrjew0+gfXFcv0iLLBR+JpAx9MkCv8he8RBpibosH1rwceJ4dGcxWWKcE4BYvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710302; c=relaxed/simple;
	bh=1Af1u/6YB6Tkw4i+EXjE7A+0wK7OyCRmHpIATBeCFjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nth8+4tfRplAwwpkxaPoa1fZcCvW5KOU6X7lfeBJpzUla6YT5705zufeTBmBoXFmT+gdq4dR1ALJM/rqBgGb2FS9Zg3TH/XoV6BjU3T9IFxVjBFTWuVj0aF7V59/hnGOpN2ZiWC5+roE3n/wEwQxu6f93ThjxFkI1McQmgMguIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHuNi7rM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b05d252so825695e9.1;
        Wed, 20 Aug 2025 10:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755710298; x=1756315098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgcfc4oMqiHIvxscpOzML2DeRE/fipSRdwCc0zAgns8=;
        b=DHuNi7rMGeDQMmsnBVpGVEt0NF84JWaNNTdJ1N1rL4KBld1MUYfzdYJKybzPfmetHB
         apZN6lp9NcfF8Xh9vUlbdk1T41jT+E86XuMasw77VNpO0fqi1nYwIwwblTgVLo8ASUuc
         ZTHrI3a2s7gZm7cV6abbRYoQRvzFBSk9ZBYN/zEHVMUzbylbyErNRGkBVMnEV0Lwvxde
         csT+WoIZ0WYG1TqUdg8MZ9vIbR/Z/edwcocKcjshXzMHSD0jrV4NiSH7nrmWtu7DWd1k
         K6rYz/3uIIO5Psn/zGagedhHVLDosP6KfMh4d3arKZtCf+btLtEvM4nXKVUlMdSJARBn
         xLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710298; x=1756315098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgcfc4oMqiHIvxscpOzML2DeRE/fipSRdwCc0zAgns8=;
        b=R2mjvF3zQVUfH1F2ncv0QHXLsWXDXao68Ctfipv6y63/w0/x6xcSytwkEVzRl+UD07
         saRtMJiMHAlDAxBbzP0IL3INhqFHWdbJ8cp1F0+wdRVEu+sBTcBIlJ7sBYhNx3AL8pRk
         xZeDl2w+Zm/jUK3RK/FN51+3/SiMWsWEVM4tgvBCCCFx5RnHJaGis6QI6SsHrmwbLMpW
         PHsNvsHkHDgMEYYKXKt7/SGR7dfMR4t777/R7wE0ACg6te1WM+GWTJqoyRPxM7HRPHIR
         GJGNnYpFaeNLh+P5NjxbvlkDD7eMi6mhxtWaTlcqPI1i7gRyHZn093peKweYJ83rTMBf
         0IKw==
X-Forwarded-Encrypted: i=1; AJvYcCULhZeUlb+/3KIGmVHu/aq6xt3ffjbrjwqRAMtvUjkegmCTr15ycgBldRdw46HLYTrwPnvLTSgojEyU@vger.kernel.org, AJvYcCWLuksPM3CRNvX7jNdc7KZDdfi3/Lare5Htzxe0dt9t7cL5z8EEt2CFatojAsRWcpZO8IKT6UVg2vk7Uyw=@vger.kernel.org, AJvYcCWQ3vBKgibEPUqIfDwhk8vun5Oq9X6l0hMZ1+hJ5G2HVO+VjESPS1faT6++Kn3zpgb6DiuKXY3kbllcmyn0LGZaYXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXQeJJWwNLr5LGVRvD0lFvW65slPMwD/+jvR82UV4CaMI/v4Qs
	tK3n42UJx/k24f857vjOnKy12fP0Bo+sRpzvwUwLeIywLqYaM/BxCSu+
X-Gm-Gg: ASbGncuSnq/97boNI4A23ABxAbE0+6ia59hjjoHi6wRAPFaGgSIDJsCTv5Yd2xou6NG
	qNU9JF+kLxe3dJk5m4rx33eI1ZRi3DjNyHYp541Wolfkt2ia0Om2E9pecQ+eA4LV1dgns05cDFs
	6Moep/mDnX995zfczySO+ES+rJVxeVpaTI7cc+5nFC1kGF3mHisZYPp8CDmXMPTGCyK7eWAvSbw
	EhtzZpvCu/puyUXwcIDzIy2gIeBUng022QtO10IyyjjWKuTq7VTU0FWywhrnCPZF9iMRgA8S6v7
	pqj1H5snlammOYsHiPY7Ey+1YMtNcb3P+L0bNpF1l2QNyZuXKZbsa7+8NQZiLbNNjKApvrNwMLO
	vacvUIrm4NNup8C0zlbiMkRlALZd7YX52tXcEMI7IhzCPdXdnuKE64noU8GmytdHaqG9RtEoW9A
	==
X-Google-Smtp-Source: AGHT+IF95qEMES4bZwiZoXf7o+Kt5HPc5voGqlobEhwLYmDkDEnd/MDdZSPMsfHfkxL/RcTRTYSmYQ==
X-Received: by 2002:a05:600c:468a:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-45b479eb890mr29146425e9.20.1755710297955;
        Wed, 20 Aug 2025 10:18:17 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c2865dsm40319815e9.2.2025.08.20.10.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:18:17 -0700 (PDT)
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
Subject: [PATCH 05/11] usb: host: xhci-rcar: Move R-Car reg definitions
Date: Wed, 20 Aug 2025 18:17:52 +0100
Message-ID: <20250820171812.402519-6-biju.das.jz@bp.renesas.com>
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

Move xhci-rcar reg definitions to a header file for the preparation of adding
support for RZ/G3E XHCI that has different register definitions.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


