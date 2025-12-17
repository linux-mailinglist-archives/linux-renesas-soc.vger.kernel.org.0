Return-Path: <linux-renesas-soc+bounces-25838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EDACC7462
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Dec 2025 12:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65CEF301A6DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Dec 2025 11:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9C4343D92;
	Wed, 17 Dec 2025 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l2bVoHxk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E3633AD94
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Dec 2025 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765970120; cv=none; b=EO2swI1krM0dXavdTKdFJ8NJdglwLEak9i99iHvxpgNbhvjQE+W7smkJZBcCRVshLoKLUWM4GrvJbo99h0YEG7vrMmvVLBdBwUchkAgmhmqdeNPNbrExMUSMiB1dGshU+X6w/KntZQdRP5mvFED5SEye/SuA+wIAZNQSHXRcxCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765970120; c=relaxed/simple;
	bh=tELzXXkk4oo6zBbXVS1TJTiw2ptFpzmnNZxBUTbCsk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jygft9uFHGRvJDOgLrYwFOmyCOjfDyeludadW5Mcs+VwMU9TXy/L93OY1Ct9A7fBLQP4hhlQzNAAVA7UikjQct3jmBn8Q4gemkVtl6+4sSsfmXb1Z4sIL+nCkFQdqL813v4+cAWixBjbtzgtPPg/KWYUostQa9E6x+sbFqroMjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=l2bVoHxk; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b73161849e1so1314918766b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Dec 2025 03:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765970115; x=1766574915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wDUddDoFILHwCBU7oSL38U5bGT7x1S1Cv5uHbCqjv8=;
        b=l2bVoHxkeH9M7i93YuQQe/CxE3jTKVqBPC/yaaRWqK44HCNB808mZ1ndAn8X0NcZpR
         DQHK4RvyDTKZvUiUKEAXkxdMZKwYZcTPs29YBsWi3YUH6QXJJdvOKLeXaGrEknVkMPJT
         Gx25BiInstmrpC/xiGKMnvIdGZHAKkkQlP1TABSvCtjullVwUj3GTWaGEwGrmFz/tLwR
         v5zpGM8jwqtLCcpP6YaBdv92cNbCRdKa4N4F4uVW6j3Upg9ypmudRK8zdDUP4HRgVHux
         hmgdyUZTCqiWXoCHP0DqvJwoo3RYZw2iE1cMYkp3D0L8osMk5dRVGHEcHBEshPadQCTV
         CNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765970115; x=1766574915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5wDUddDoFILHwCBU7oSL38U5bGT7x1S1Cv5uHbCqjv8=;
        b=RbRZgVsVV1430LcSkHp0TUE/wMYB5MKt9+qjd0DsrycOef/UP3dypaltPU2KJTZyBN
         6e3rQeqIFLqEbtJDkavWB3rqfcDBL4GrlqWzkqNc00ee+MerDYuJPEfbKj06WX/PdzrG
         mAxcWak4/PBBhA4RaA9Kw+IDwXgyK0AZXiHBIJua/+oHQ/Q0QZm6i1Z66kJtpqhHqRrT
         rGRKb6cKRogA1z+STEDXN7j/EMM2o86J2WD13MwrBDflMTU2zbGwKBGVxR/hluMmGXzY
         ekxZnqFKm1lPKFfQi5nRAkeI3UtGC76WRPpq4rstUF5f/Ts2T+LOSCKT1G0kuUs7e2a0
         vUZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBzeG4rAdqCiQUBjWIExV8XHTdXLzF4pStzMj8V7p2D3YzNaqei9jyfZCr76rHVeWthKJdK2Omhle1xyUSaJBRsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9EUTrlppXhn/BoI5rV4uF+MAG/ok5azenRt0ypT//mw7DtT5J
	DIUnyFhMAJhYMk/HkcEbtuZoxGntLxxZvz0HPhqgJINmbORIwTFH+fR28/fFTCmC7uo=
X-Gm-Gg: AY/fxX6uthmhbh135LlGcXJyPXLN6ywKJFzHHcyhmjE2jOOZ+NAMo+WRvDreCO8+JM8
	O/pA6WCL9X+OKoReNFNBzuQa9TnuhJDlv8SMATMMXQN6DQoIE8J69E3oXRKZrs7V5azP/Kom9j4
	XSm67EaoABYUaoMv/3XWVfNdFPfsymyDtmfONKcux+dZpkhOTn4KcO6UIRg3puyOcXP6t6sMp+M
	YWkiag6zYgwgusTXO9QBavQEm5pP3kZwqolXkzIVf41MI91CvSS6EdnLq43k5ynbhAVOc0zsxp1
	VHwmK5XcB8ZhUQoYrA/4x9eK6zt+7GHmRFK8d62/TIKmqgok2Ud85lEaRxARytUrx6eOOqhHlt+
	dh5oOvNynI5hlVSkktI34O62fwizW0bDg+f7TIZowPvOhnrcoZTADN8CU1h7BV3Cv8qDOTJ6GQ0
	kGf7jfjJoxW9FyAbGnRoq2FGKa7C/FUioThMWs6FFPbRjsPnPDvW0=
X-Google-Smtp-Source: AGHT+IFn0YqbxgiZtiVRkJ+QtMmjGYmLvsJLkNrhsbqEX9TV5iWWuHuT6ttcHc//6S4/IzyW9RNJew==
X-Received: by 2002:a17:907:1ca1:b0:b73:75ea:febf with SMTP id a640c23a62f3a-b7d23a7581dmr1722711766b.55.1765970114962;
        Wed, 17 Dec 2025 03:15:14 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2e817csm1933465066b.19.2025.12.17.03.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 03:15:14 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v2 1/2] PCI: rzg3s-host: Use pci_generic_config_write() for the root bus
Date: Wed, 17 Dec 2025 13:15:09 +0200
Message-ID: <20251217111510.138848-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217111510.138848-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251217111510.138848-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S host controller allows writing to read-only PCIe
configuration registers when the RZG3S_PCI_PERM_CFG_HWINIT_EN bit is set in
the RZG3S_PCI_PERM register. However, callers of struct pci_ops::write
expect the semantics defined by the PCIe specification, meaning that writes
to read-only registers must not be allowed.

The previous custom struct pci_ops::write implementation for the root bus
temporarily enabled write access before calling pci_generic_config_write().
This breaks the expected semantics.

Remove the custom implementation and simply use pci_generic_config_write().

Along with this change, the updates of the PCI_PRIMARY_BUS,
PCI_SECONDARY_BUS, and PCI_SUBORDINATE_BUS registers were moved so that
they no longer depends on the RZG3S_PCI_PERM_CFG_HWINIT_EN bit in the
RZG3S_PCI_PERM_CFG register, since these registers are R/W.

Fixes: 7ef502fb35b2 ("PCI: Add Renesas RZ/G3S host controller driver")
Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- added fixes tag

 drivers/pci/controller/pcie-rzg3s-host.c | 27 ++++--------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 83ec66a70823..ae6d9c7dc2c1 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -439,28 +439,9 @@ static void __iomem *rzg3s_pcie_root_map_bus(struct pci_bus *bus,
 	return host->pcie + where;
 }
 
-/* Serialized by 'pci_lock' */
-static int rzg3s_pcie_root_write(struct pci_bus *bus, unsigned int devfn,
-				 int where, int size, u32 val)
-{
-	struct rzg3s_pcie_host *host = bus->sysdata;
-	int ret;
-
-	/* Enable access control to the CFGU */
-	writel_relaxed(RZG3S_PCI_PERM_CFG_HWINIT_EN,
-		       host->axi + RZG3S_PCI_PERM);
-
-	ret = pci_generic_config_write(bus, devfn, where, size, val);
-
-	/* Disable access control to the CFGU */
-	writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
-
-	return ret;
-}
-
 static struct pci_ops rzg3s_pcie_root_ops = {
 	.read		= pci_generic_config_read,
-	.write		= rzg3s_pcie_root_write,
+	.write		= pci_generic_config_write,
 	.map_bus	= rzg3s_pcie_root_map_bus,
 };
 
@@ -1065,14 +1046,14 @@ static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
 	writel_relaxed(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00L);
 	writel_relaxed(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00U);
 
+	/* Disable access control to the CFGU */
+	writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
+
 	/* Update bus info */
 	writeb_relaxed(primary_bus, host->pcie + PCI_PRIMARY_BUS);
 	writeb_relaxed(secondary_bus, host->pcie + PCI_SECONDARY_BUS);
 	writeb_relaxed(subordinate_bus, host->pcie + PCI_SUBORDINATE_BUS);
 
-	/* Disable access control to the CFGU */
-	writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
-
 	return 0;
 }
 
-- 
2.43.0


