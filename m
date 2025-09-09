Return-Path: <linux-renesas-soc+bounces-21670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99938B504EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 20:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91AF51C61C65
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 18:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86252362093;
	Tue,  9 Sep 2025 18:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1baMVLQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C0035FC07;
	Tue,  9 Sep 2025 18:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441293; cv=none; b=ujv7dgSFS7XbdTknfp6H383jjg/DkWP2Gk7rbSeb/FtnsEXSbIXSY45fdb/8DhxMZm/wdw9DyrBM8rKXyZfcMs1xSXzY/AckbFUBooPsFc/M/Rwgd+gmRdMB2YjjUvivo9Pf5AbRCdoR++7U9jRKGPLpTuV0Ai1wKyl53YteI9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441293; c=relaxed/simple;
	bh=t2tLpBQrYONykipVZiOsJAPkofw2zz/fB80dVoKfMbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8/XeuLLeF1EWxEtr8e0wGISA1hmGSoVUecuS/VOAXjNJ3H1g3Gulg6C3McAgLdxYr7aH4k0QGf+cVtmyaej+KNS+9UaDbk0GaYKR6dgqpZdR+mYirSvZd26Kf0lK1D5Z6bhrth0GSioeKWZBRuf5ZweWGl8Yjqp1IdO7Mk+d4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1baMVLQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45de6ab6ce7so16211975e9.1;
        Tue, 09 Sep 2025 11:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757441290; x=1758046090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCg5zR6kg664qoWr7lVeJ5dKDVkZuroDlXG17/22/RU=;
        b=V1baMVLQW7TtJHArWZWUnYMujWbsnPr7WPioKYNRWQv5bZzDi1R5Xb+1MAhNJSZps6
         ZDpCXAjMBbDZlewzUz58tSACg75qkh2vjtQUQ+GyINSnOKvcksCdReBobi/RF7glDatD
         2FKkEDuuR8DBtUE+87AIQMjXilwQHrGzlfKbf3fgE6xPS6X2m4RQXO+Z92h0jvkdlB41
         wbC9QjyAdUrHAujQGGStHxkpGGdYBT9Dn6nc5EfJPL4YsMl/c01Ui56PSjDjneiHoFIB
         8jjb5leReODW8hlinvWqcHWFXWb4XF0sNIQ0GVTab4WgMIcKhK1MSPDyDq7WWXSai4wF
         seSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441290; x=1758046090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCg5zR6kg664qoWr7lVeJ5dKDVkZuroDlXG17/22/RU=;
        b=FTtqdtIu8LfNvWdk2pZBbYWa+Ts4rrZ93p2hPgr7KVR5ZBWD5ef+rgEfM4KSSCOrDE
         YZD1XhsHc3a38/Yff3Wrdpc9WW2Of8g1f3JDri4YMLi+oGsFMvo0I2akgtSIflanEqWL
         UHPZ45nC6ByBcOII4IVWcEbGAosenT1XLEfwSdsiXsIDGKUWDy38JcvNmaFrv/lRyMeN
         pFgWbL4O1zozdebCMiBtQBgju273gnf2fYw33eT0wOEUTlQ/tKUUobYxiXt4lKrScQmt
         VXnh/PwFm6XPh+aFxDGyCj9lj5+rEqL8ieZ3iNiplDMyif4FonCW9bT5HQNj09yab0ZN
         uj7g==
X-Forwarded-Encrypted: i=1; AJvYcCV/7h3ZlNrfhCOAW2Ezx4OEXBWGO5y8Lzs9o4OvUYIQMGiqnjijWjgDyVeJM/ZFNFyJRHlWuiKU5jNow9c=@vger.kernel.org, AJvYcCVXKwHmajpq9KXwPfMnh0AvaFwVR4A2VUmzllFtcHpxzdVfDcPNQco9YXF9/4Bd+9WlxgM5l9isx/ZDpW/rQ1/i3XI=@vger.kernel.org, AJvYcCXl5hD3ndMacjDoCbDGnYdo+V1co16NAWqBfEBpzOIr4BxYjQb6i3W4OrnN1blleKLdhp5qUvUAZKnb@vger.kernel.org
X-Gm-Message-State: AOJu0YxcwIlHefa7Q+LhCQZXskDUyl80a2a/U5R+jshQSIJZ7A6yCMHZ
	1YnpAGTCYCsJxnc/o11whlQNz7MZCfCOb/0WSE5OweRqEUI30Y5/5EVo
X-Gm-Gg: ASbGnct8LzrwLK+m5J9jBqQoil2Fa3VuJB5lsL5wcki0dk+Xbeny0q7IvV5mCVfZa7x
	oMw2SWTU1zJS/6Znsv06NhGs+VxnCXtT0Qj3Wq6F/0AhGZ33x80g+aZBLPqyC9SRqj97D8TqyDS
	1F0t2XKJ83s1DnrOKenUGpdCPwuFZAd9lWiI+mJoWTXhcGf7sdcjxvnvAbUJUStg29wTVT/qPA0
	m3yZhui0QnXJhfku6/BsgAnn8/N9nqI0QXdA0yTzUZmbemybtycC0lhrBCNS+ubAzZJWNtJT7SK
	yD1+oneAmb7cU+0/yUb+xE7C+sPQixTKCbStp9MvSC1hcnUwKtI5CkhIaluWXkmEfhXbf0s2vlO
	6AuDzsMWctmVT6Gje8TDV/hpODJsay/7HrzibH7s0NYZ9ZYQfr7k0hVp0eWxqzSzbQgF0alA1Ao
	Wp9w==
X-Google-Smtp-Source: AGHT+IECNDuEk+BkBtJKG/TKCmVucsCz1n4HN/85qS7KnZE3tlrgIckCTGmVneYO2Hsm/UWF1MT7QQ==
X-Received: by 2002:a05:600c:45cc:b0:459:dde3:1a55 with SMTP id 5b1f17b1804b1-45dddec78d3mr112311935e9.24.1757441289594;
        Tue, 09 Sep 2025 11:08:09 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df679a4c9sm4174015e9.3.2025.09.09.11.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:08:09 -0700 (PDT)
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
Subject: [PATCH v2 05/11] usb: host: xhci-rcar: Move R-Car reg definitions
Date: Tue,  9 Sep 2025 19:07:50 +0100
Message-ID: <20250909180803.140939-6-biju.das.jz@bp.renesas.com>
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

Move xhci-rcar reg definitions to a header file for the preparation of adding
support for RZ/G3E XHCI that has different register definitions.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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


