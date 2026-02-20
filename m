Return-Path: <linux-renesas-soc+bounces-28346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFt7O2Z4mGlrJAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 16:06:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC2E168ACD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 16:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 137C730532AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 15:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F97A34F484;
	Fri, 20 Feb 2026 15:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T/A4a7yj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47BE34E761
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 15:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599895; cv=none; b=meUur3TTvJFSDx+22sAMZ6wSDWvqjAo41LSF0R3fEFiX6Qlo/E0mH2zomdYw45QV34vGOyQkVytudW6xi6tHfAloMIrl8BJCaNEsEhJAvuSnXywRkIXSerhxYtuQ+thiFxfq5z11lg9SntxQxnLmIOAvjP3bLIPk4+JWXxR9d+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599895; c=relaxed/simple;
	bh=YuxSOv9VX3tAM43H/mZdqAb77YkjqUcBbc4EzjFvNuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k5LslOVvw+6agznXj7YKj5vkXGhqIgEECxjKZSahURKJZ/NFJuzaqaLlIM6WbR/bu3p7Y2OTb03ThNmCHKJij3NbArpOztiZqDtO6TkPf/KRJ83Y3zZw/TXMESCZEd/U6eW8vRGaJPSUaf6mFi4Uda6raF9tMfecutU+0qtRBsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T/A4a7yj; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4834826e555so20894975e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 07:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771599891; x=1772204691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rX+H6vhxaMpbjCvEe0dhOglO89IbsRxSTfxDCUCa78U=;
        b=T/A4a7yjVgx4XDe/xLfYpPpVPr3dRgjrokkKj7gPNA7XfXmly4J38xUlyfXidMjITU
         /cwX5pyqa+u3Pr79XqGmrDN/YIito5Rge6Ok7weI0SWxGXVnZa5EmVpAB1OerJugJREb
         MaDOwY5HCbNsRUiyO7DuqkB3AiA7saTVPs3p7E4mrAMwob+ISKNL0JvcKlv3J+sKRn5L
         zFDPNIsRQpyD6l80Ou5n9USbCMoMultMrz1d0LvYMwRralBj46HGBWplejIuhewxiPWg
         rTpFepsMHh1xhk/Hd2xEKpLcw73HutPLBjeIAXBPELWcu0+2Ya8TKsqY+GHv+90Zu1+o
         r9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771599891; x=1772204691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rX+H6vhxaMpbjCvEe0dhOglO89IbsRxSTfxDCUCa78U=;
        b=FAUAFOwSIwrS6BQ+I6WKHMWdWDXY9xdRxX0lF47KkYdhLNdhjLUJ67H7+yjPmLuHOM
         h8m8j21ecZxomnEeLHL7vGXFcnSFZ/3chOuYnXlULNfgvxlQpl1kbiVGuYlXzWBfhaKX
         1XF5iq1JaPXXjbPATZsG4EOpdgXATWqLN07KorDTPQzOilwTH3sgSRi39fkUk/fcMRoK
         ucKrGx6kDjM0tqgdwAEs6mD4/t9e2cIIIGklc9HpItSIjenxpM0labx1h/CeXoGcRz9B
         1AAXIzqKG/2BF/V1kr5vdEU43LoMEuVIxeQ/nNh6Drfnhp9YAipQdJ+WH/cRYHZfh+Y0
         ipTg==
X-Forwarded-Encrypted: i=1; AJvYcCVu/AbKWFZEeNLkVXFUD/sNaPJfiYBI8ANcjnhWwX72MzlJ125cNoBnl8NSY+LobLoOW1l+5hX+N2Rsj8Yh1xGhew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxZWv1qdFM0o8wMJOfXLl7WXcDzPXp9BMmBjU2fjBnWyqf3wcX
	U9cO64U3r42uDjQHbxHrFDVuKi1LRi7/jtEdA+GOnvunG3CMsOQ5ltjyTd0VRCYC6+Y=
X-Gm-Gg: AZuq6aJLX5lEApWebas8uVxBPU5t5rdaL1Qg07uIvwVlY2fQ3YBWxBhp/41P5Z4hQG3
	CRrZAjge1b9qZXm4D+34Cva9WBwB8DgkYCO8d4bsdEXKTgFWbZQcVc3GspdJgxYVxZm/z/xksLW
	r7VHJaXRuTeC2/eW5F2KS8X61wtDxrPhTRv49v/6lHrYzOL6PBVChsmoj/O8sQMUJmcJmlKzbwX
	iFVuP0UuRQGr+x4eKiIX45f4Pid9fFvQu/DC0LksPfI9Rca0fAOS0+3S5MASVG5fFnGQ+mRkUXw
	vdKkF8AS4qtvtFEvhwHAT5qB/SXbdM0SZ8f6LMGPhF5q19RppkA3ceYgIOje6Yg2+IepY2GKNyE
	6FF1vX2pR70xBw6mE4ZllXXwT4K/JNCOSduNvGbPKw+KPQ+AEYvGyZsFNm/8lKSEm/A+rsabO2I
	p+o3TFMYZnFyrrNnHdjeyahISjvbo+OHToDIdsI4ApzXK6
X-Received: by 2002:a05:600c:6098:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-48379ba08a6mr350182465e9.12.1771599891220;
        Fri, 20 Feb 2026 07:04:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm122064505e9.8.2026.02.20.07.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:04:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Feb 2026 16:04:42 +0100
Subject: [PATCH v5 3/9] pci: pwrctrl: rename pci-pwrctrl-slot as generic
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-3-1ad79caa1efa@linaro.org>
References: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
In-Reply-To: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11164;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YuxSOv9VX3tAM43H/mZdqAb77YkjqUcBbc4EzjFvNuc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpmHgLmCF3CTo535m1bfJkOpv8ACv7dYrDYD3b49tl
 ENGFzYKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZh4CwAKCRB33NvayMhJ0Xg+EA
 CgyxFK/tDMA38L24NXVn5UJEeqh+2aCdRCiIDgBjofNJoPYWJd0D7Nk1kaIheKgn1+FEVFZthiM4FO
 s5lGnKGUASU5vtHNZIjeSqFDzHpKuKww6kCGuRSWzu0iiOvNXfR6oHPlJfOfGP1W0/LbkOmLstMbQ7
 uLWKeWJF5vP3MOc883gu8P9PeZ2ues3/rs/KgrtU1Qhp1LXz1n7ro5I9qQjDgIX7fS73F1l+hnyKpZ
 TlGet9GmqrHAF1MUtDSVRXFjXzF+j5z+6ekVPo82iSBblZtUoTcKZoqNo5J1T4rWvkbAPve+aPOHNL
 9666u1GBD4MJy+UTmNnyn+I8P6Eq3+91QJ2TLFsb48x0W/L0ldUt9VemYTQrQEb/d/RpeQztI8FLfA
 TaqgaaL64cEPime7QZEXpZRlmqnNM3XUWgq7kzLYAjh/Naq66E3XkOYI93Axc/SitKTd8HkVFZSC3n
 b7c65ekWX3kTP0wLZlGTws8c+c/3BIs/A61JhtDjAqK4vJ002zlQsr9rJMNAkVMwe2npiINVI+D4vk
 O7Kwn8ORtX0wgK/SXp6ebA1DvoXA/yvUfzlZSj+p6XP9jzBdCasJufVAq96hFeaRAMIKusfK8JDK+C
 cq0y7dbsB/fOBqzAi1S56MvrxkQ6C+h8G4VTt2i8D4MpgOtwthfYNBvORNNw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28346-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 6EC2E168ACD
X-Rspamd-Action: no action

The driver is pretty generic and would fit for either
PCI Slots or endpoints connected to PCI ports, so rename
the driver and module as pci-pwrctrl-generic.

Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pci/controller/dwc/Kconfig |   4 +-
 drivers/pci/pwrctrl/Kconfig        |  13 ++--
 drivers/pci/pwrctrl/Makefile       |   4 +-
 drivers/pci/pwrctrl/generic.c      | 139 +++++++++++++++++++++++++++++++++++++
 drivers/pci/pwrctrl/slot.c         | 137 ------------------------------------
 5 files changed, 150 insertions(+), 147 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index d0aa031397fa..4bd36e133ca6 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -309,7 +309,7 @@ config PCIE_QCOM
 	select CRC8
 	select PCIE_QCOM_COMMON
 	select PCI_HOST_COMMON
-	select PCI_PWRCTRL_SLOT
+	select PCI_PWRCTRL_GENERIC
 	help
 	  Say Y here to enable PCIe controller support on Qualcomm SoCs. The
 	  PCIe controller uses the DesignWare core plus Qualcomm-specific
@@ -431,7 +431,7 @@ config PCIE_SPACEMIT_K1
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	select PCIE_DW_HOST
-	select PCI_PWRCTRL_SLOT
+	select PCI_PWRCTRL_GENERIC
 	default ARCH_SPACEMIT
 	help
 	  Enables support for the DesignWare based PCIe controller in
diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
index cd3aa15bad00..ff67bec5b500 100644
--- a/drivers/pci/pwrctrl/Kconfig
+++ b/drivers/pci/pwrctrl/Kconfig
@@ -11,17 +11,18 @@ config PCI_PWRCTRL_PWRSEQ
 	select POWER_SEQUENCING
 	select PCI_PWRCTRL
 
-config PCI_PWRCTRL_SLOT
-	tristate "PCI Power Control driver for PCI slots"
+config PCI_PWRCTRL_GENERIC
+	tristate "Generic PCI Power Control driver for PCI slots and endpoints"
 	select POWER_SEQUENCING
 	select PCI_PWRCTRL
 	help
-	  Say Y here to enable the PCI Power Control driver to control the power
-	  state of PCI slots.
+	  Say Y here to enable the generic PCI Power Control driver to control
+	  the power state of PCI slots and endpoints.
 
 	  This is a generic driver that controls the power state of different
-	  PCI slots. The voltage regulators powering the rails of the PCI slots
-	  are expected to be defined in the devicetree node of the PCI bridge.
+	  PCI slots and endpoints. The voltage regulators powering the rails
+	  of the PCI slots or endpoints are expected to be defined in the
+	  devicetree node of the PCI bridge.
 
 config PCI_PWRCTRL_TC9563
 	tristate "PCI Power Control driver for TC9563 PCIe switch"
diff --git a/drivers/pci/pwrctrl/Makefile b/drivers/pci/pwrctrl/Makefile
index 13b02282106c..f6bb4fb9a410 100644
--- a/drivers/pci/pwrctrl/Makefile
+++ b/drivers/pci/pwrctrl/Makefile
@@ -5,7 +5,7 @@ pci-pwrctrl-core-y			:= core.o
 
 obj-$(CONFIG_PCI_PWRCTRL_PWRSEQ)	+= pci-pwrctrl-pwrseq.o
 
-obj-$(CONFIG_PCI_PWRCTRL_SLOT)		+= pci-pwrctrl-slot.o
-pci-pwrctrl-slot-y			:= slot.o
+obj-$(CONFIG_PCI_PWRCTRL_GENERIC)	+= pci-pwrctrl-generic.o
+pci-pwrctrl-generic-y			:= generic.o
 
 obj-$(CONFIG_PCI_PWRCTRL_TC9563)	+= pci-pwrctrl-tc9563.o
diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
new file mode 100644
index 000000000000..8e6f2fd5bcaf
--- /dev/null
+++ b/drivers/pci/pwrctrl/generic.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Linaro Ltd.
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/pci-pwrctrl.h>
+#include <linux/platform_device.h>
+#include <linux/pwrseq/consumer.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+struct generic_pwrctrl {
+	struct pci_pwrctrl pwrctrl;
+	struct regulator_bulk_data *supplies;
+	int num_supplies;
+	struct clk *clk;
+	struct pwrseq_desc *pwrseq;
+};
+
+static int generic_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
+{
+	struct generic_pwrctrl *generic =
+				container_of(pwrctrl,
+					     struct generic_pwrctrl, pwrctrl);
+	int ret;
+
+	if (generic->pwrseq) {
+		pwrseq_power_on(generic->pwrseq);
+		return 0;
+	}
+
+	ret = regulator_bulk_enable(generic->num_supplies, generic->supplies);
+	if (ret < 0) {
+		dev_err(generic->pwrctrl.dev, "Failed to enable generic regulators\n");
+		return ret;
+	}
+
+	return clk_prepare_enable(generic->clk);
+}
+
+static int generic_pwrctrl_power_off(struct pci_pwrctrl *pwrctrl)
+{
+	struct generic_pwrctrl *generic =
+				container_of(pwrctrl,
+					     struct generic_pwrctrl, pwrctrl);
+
+	if (generic->pwrseq) {
+		pwrseq_power_off(generic->pwrseq);
+		return 0;
+	}
+
+	regulator_bulk_disable(generic->num_supplies, generic->supplies);
+	clk_disable_unprepare(generic->clk);
+
+	return 0;
+}
+
+static void devm_generic_pwrctrl_release(void *data)
+{
+	struct generic_pwrctrl *generic = data;
+
+	generic_pwrctrl_power_off(&generic->pwrctrl);
+	regulator_bulk_free(generic->num_supplies, generic->supplies);
+}
+
+static int generic_pwrctrl_probe(struct platform_device *pdev)
+{
+	struct generic_pwrctrl *generic;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	generic = devm_kzalloc(dev, sizeof(*generic), GFP_KERNEL);
+	if (!generic)
+		return -ENOMEM;
+
+	if (of_graph_is_present(dev_of_node(dev))) {
+		generic->pwrseq = devm_pwrseq_get(dev, "pcie");
+		if (IS_ERR(generic->pwrseq))
+			return dev_err_probe(dev, PTR_ERR(generic->pwrseq),
+				     "Failed to get the power sequencer\n");
+
+		goto skip_resources;
+	}
+
+	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
+					&generic->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get generic regulators\n");
+
+	generic->num_supplies = ret;
+
+	generic->clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(generic->clk))
+		return dev_err_probe(dev, PTR_ERR(generic->clk),
+				     "Failed to enable generic clock\n");
+
+skip_resources:
+	generic->pwrctrl.power_on = generic_pwrctrl_power_on;
+	generic->pwrctrl.power_off = generic_pwrctrl_power_off;
+
+	ret = devm_add_action_or_reset(dev, devm_generic_pwrctrl_release, generic);
+	if (ret)
+		return ret;
+
+	pci_pwrctrl_init(&generic->pwrctrl, dev);
+
+	ret = devm_pci_pwrctrl_device_set_ready(dev, &generic->pwrctrl);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register pwrctrl driver\n");
+
+	return 0;
+}
+
+static const struct of_device_id generic_pwrctrl_of_match[] = {
+	{
+		.compatible = "pciclass,0604",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, generic_pwrctrl_of_match);
+
+static struct platform_driver generic_pwrctrl_driver = {
+	.driver = {
+		.name = "pci-pwrctrl-generic",
+		.of_match_table = generic_pwrctrl_of_match,
+	},
+	.probe = generic_pwrctrl_probe,
+};
+module_platform_driver(generic_pwrctrl_driver);
+
+MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>");
+MODULE_DESCRIPTION("Generic PCI Power Control driver for PCI Slots and Endpoints");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/slot.c
deleted file mode 100644
index f03debabbc73..000000000000
--- a/drivers/pci/pwrctrl/slot.c
+++ /dev/null
@@ -1,137 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2024 Linaro Ltd.
- * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
- */
-
-#include <linux/clk.h>
-#include <linux/device.h>
-#include <linux/mod_devicetable.h>
-#include <linux/module.h>
-#include <linux/of_graph.h>
-#include <linux/pci-pwrctrl.h>
-#include <linux/platform_device.h>
-#include <linux/pwrseq/consumer.h>
-#include <linux/regulator/consumer.h>
-#include <linux/slab.h>
-
-struct slot_pwrctrl {
-	struct pci_pwrctrl pwrctrl;
-	struct regulator_bulk_data *supplies;
-	int num_supplies;
-	struct clk *clk;
-	struct pwrseq_desc *pwrseq;
-};
-
-static int slot_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
-{
-	struct slot_pwrctrl *slot = container_of(pwrctrl,
-						struct slot_pwrctrl, pwrctrl);
-	int ret;
-
-	if (slot->pwrseq) {
-		pwrseq_power_on(slot->pwrseq);
-		return 0;
-	}
-
-	ret = regulator_bulk_enable(slot->num_supplies, slot->supplies);
-	if (ret < 0) {
-		dev_err(slot->pwrctrl.dev, "Failed to enable slot regulators\n");
-		return ret;
-	}
-
-	return clk_prepare_enable(slot->clk);
-}
-
-static int slot_pwrctrl_power_off(struct pci_pwrctrl *pwrctrl)
-{
-	struct slot_pwrctrl *slot = container_of(pwrctrl,
-						struct slot_pwrctrl, pwrctrl);
-
-	if (slot->pwrseq) {
-		pwrseq_power_off(slot->pwrseq);
-		return 0;
-	}
-
-	regulator_bulk_disable(slot->num_supplies, slot->supplies);
-	clk_disable_unprepare(slot->clk);
-
-	return 0;
-}
-
-static void devm_slot_pwrctrl_release(void *data)
-{
-	struct slot_pwrctrl *slot = data;
-
-	slot_pwrctrl_power_off(&slot->pwrctrl);
-	regulator_bulk_free(slot->num_supplies, slot->supplies);
-}
-
-static int slot_pwrctrl_probe(struct platform_device *pdev)
-{
-	struct slot_pwrctrl *slot;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	slot = devm_kzalloc(dev, sizeof(*slot), GFP_KERNEL);
-	if (!slot)
-		return -ENOMEM;
-
-	if (of_graph_is_present(dev_of_node(dev))) {
-		slot->pwrseq = devm_pwrseq_get(dev, "pcie");
-		if (IS_ERR(slot->pwrseq))
-			return dev_err_probe(dev, PTR_ERR(slot->pwrseq),
-				     "Failed to get the power sequencer\n");
-
-		goto skip_resources;
-	}
-
-	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
-					&slot->supplies);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to get slot regulators\n");
-
-	slot->num_supplies = ret;
-
-	slot->clk = devm_clk_get_optional(dev, NULL);
-	if (IS_ERR(slot->clk))
-		return dev_err_probe(dev, PTR_ERR(slot->clk),
-				     "Failed to enable slot clock\n");
-
-skip_resources:
-	slot->pwrctrl.power_on = slot_pwrctrl_power_on;
-	slot->pwrctrl.power_off = slot_pwrctrl_power_off;
-
-	ret = devm_add_action_or_reset(dev, devm_slot_pwrctrl_release, slot);
-	if (ret)
-		return ret;
-
-	pci_pwrctrl_init(&slot->pwrctrl, dev);
-
-	ret = devm_pci_pwrctrl_device_set_ready(dev, &slot->pwrctrl);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to register pwrctrl driver\n");
-
-	return 0;
-}
-
-static const struct of_device_id slot_pwrctrl_of_match[] = {
-	{
-		.compatible = "pciclass,0604",
-	},
-	{ }
-};
-MODULE_DEVICE_TABLE(of, slot_pwrctrl_of_match);
-
-static struct platform_driver slot_pwrctrl_driver = {
-	.driver = {
-		.name = "pci-pwrctrl-slot",
-		.of_match_table = slot_pwrctrl_of_match,
-	},
-	.probe = slot_pwrctrl_probe,
-};
-module_platform_driver(slot_pwrctrl_driver);
-
-MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>");
-MODULE_DESCRIPTION("Generic PCI Power Control driver for PCI Slots");
-MODULE_LICENSE("GPL");

-- 
2.34.1


