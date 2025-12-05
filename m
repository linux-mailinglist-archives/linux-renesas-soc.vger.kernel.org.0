Return-Path: <linux-renesas-soc+bounces-25601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7FACA75C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 12:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E309830DA5EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 11:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9886932145B;
	Fri,  5 Dec 2025 11:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="o0tPXnH5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D82324B2B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Dec 2025 11:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933897; cv=none; b=Rjkf1R9Yls4TtHVcOf7eKUZrMo0QdWYJgsvO4eK4aL2aCiR/Xu+vUlN6c19fSES25t+N0PY0ca/VehtVrqtZWorvZkXnqkEFCQvdXoiH7V2dqmDN8zvgA4ue4Mha6ppFUjI1862D+gcQ3Jr+kpJEd2ZIg1XmGUdvr/UnRRAiLSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933897; c=relaxed/simple;
	bh=S4q0Yx7xsvH/ed/2Zds50/ams+v/OLsmUl+CcVJC02I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sO1jX7DfoOWFd5uhgN5a/6P1KGB1T+FUeAVXrZ6wYw9aY1vpbO7ndas+9nXH6wZmTwYbBBFhMSkwwrtxE9IB/LrSqsjS8pltqOiy12/HNrN4m38Pg7+a/VAUStz1IVlxbKvTmDqQSDROfnofpH7uDCmlccooXDi+34zxsUEkWiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=o0tPXnH5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso10175105e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Dec 2025 03:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1764933892; x=1765538692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uu4MexBEXCPtl1jE4HGivKSpyIrJG47ehUuEx58MLSQ=;
        b=o0tPXnH5WunfE4bYQYBgD6ClUj5jTSdyR+2+rtGedbQUR+rLIDWb5iBoaaTyANbuRo
         ddCcQwb8kTqpdcT5SG9dCMdgMq9R08LAiJkn/BoGnze958lqyZd0ipvEHntGRtFu6Vhw
         G8xKoaTxIsDvl8oMTYUuOW4VyMHY/SVa7rKqM5zRedU/WziBWHLuhrVG3jzenhulc48X
         oJHn3TXBW+ZF16RNKIowZftvtVCKrMKAkq+aN8JQGHM4N6x1lAHWG65vutjHBhIVSp7W
         ASp8YO3tnI0pc3zXKMEKGEO83y/4T01kJCEfZpEHl05EZBMAXGMU4tih7Dt7eQJRpx9a
         FGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764933892; x=1765538692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uu4MexBEXCPtl1jE4HGivKSpyIrJG47ehUuEx58MLSQ=;
        b=buMdmNWO//OpCwwAdui6P3UhqhMW1GgPjTQ0P9Vh1Zpf15unXzzblfe6/OFn0VbAcT
         Ss2PVvSnEtVNCOfOKxzYn5WhFPl9yZ6H371q66EoJNuqLAXJ56AVSCFIdF1tuPu+fS8u
         XQ9tg3jQLNXhxO/Q9xdj0juSk1DP0i9kGR5kQCfqyiZuK/IQJTgWJsMQO4cU8Ov8TDU6
         p2A016nq+XVC511DmNjqmBoSR0TAeiEeRMDr96c2vBRfmLC9oUQDDHwqb+ghnUtD1imf
         dUCO9Oev/O0iCaTwLqSz4jWljFH1YhmfVfZBE4aPp+9F7hzsXyclUGpICpoMKMJKtOUf
         epYA==
X-Forwarded-Encrypted: i=1; AJvYcCV9AK5mywg0/wx3Dg5TiHwNx5GgQSzpIrs3LgG3k89MIm1IK8qH95KWj0FN884wQvFaaeSqDNq5fnwn2kZlgQeV2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGsxPwhojBeTZBTphbAs2TJMSbihQRtLlye6hhyy2snya5NerT
	RN1JkFa3v9yAJlqDZTYoeThPDI3YAnSkt316JRCjEQY5k5i6sNXzCbpUWvS/1LqeAXs=
X-Gm-Gg: ASbGncvSlVENtg/hev5/8IYu7GcQOgtyUjjZ/fkgMwbUue7tyjIaeOWdICRki8PgVxo
	27U1A9W6iMgFZwaQ3HifCzStr8BvK5R/aN2sh2Pgi38dv8Zwil9YM0sLpsJfS1XJOIb8t/xF4Pt
	W8QzFNv4z9YIGdwPUnJjwflw5cSuAYLhw5iAy+1uPWktdiGgfx14R3+HPecBKierAMS4LBFjl4N
	lzhA19xQyy74xGrOenC1rYGsR2iEuSUNAz4UXgS9K8wts7pbIFfkEunUquKK3QmO2DYYdbnrjon
	ZZROQ1OnuZ+4E3hX6V0G5aJ1R3HfhKnkciq1qG2xeFHASKOtCSKJ6/aLcmLwprYghFctsFt1XUv
	ZtVv22FTF9Odo7ghFjhldUrenPvQsME/XKRrdRt8hXuLXVtdeCHkJNU9urSKYnxhjWnuSHViH/z
	/P/jfm2K32+HWYEKsV1U6Bb8hk5njEgzlCKJl1+jid
X-Google-Smtp-Source: AGHT+IF6JxQdFCw0cp0l/sCQ7tiVgzoNPx6Imh973eIPm8dPV0wXYqRXvKgw/ZZI0gNr5TMBKbfU3w==
X-Received: by 2002:a05:600c:3b05:b0:477:9650:3184 with SMTP id 5b1f17b1804b1-4792aedec40mr106624805e9.2.1764933891685;
        Fri, 05 Dec 2025 03:24:51 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6d9dsm78176435e9.2.2025.12.05.03.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:24:51 -0800 (PST)
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
Subject: [PATCH 1/2] PCI: rzg3s-host: Use pci_generic_config_write() for the root bus
Date: Fri,  5 Dec 2025 13:24:42 +0200
Message-ID: <20251205112443.1408518-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205112443.1408518-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251205112443.1408518-1-claudiu.beznea.uj@bp.renesas.com>
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

Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pci/controller/pcie-rzg3s-host.c | 27 ++++--------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 667e6d629474..547cbe676a25 100644
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


