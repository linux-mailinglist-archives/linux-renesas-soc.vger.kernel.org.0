Return-Path: <linux-renesas-soc+bounces-3149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAB9862303
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Feb 2024 07:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5490D1F231E8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Feb 2024 06:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84AC18C31;
	Sat, 24 Feb 2024 06:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zcEHuA5i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107DC1862A
	for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Feb 2024 06:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708757684; cv=none; b=SLt4aUvXRrAI9DdlfGV3dttmcXleh4mCp/g91SJSPFmPPA5Z/528X38w2cIysZHO/wwV4AlzND9EthjyNdAXUzsfdUfWDQMVsxggSTkk7l/nvsR5vz8nWxJ3nlFJOwNQ3lVxm/FFdPtl2oIr4lxDe7NVnDe01u24wgJF/7F9DSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708757684; c=relaxed/simple;
	bh=CvKJcI2GoHpQh51Boj5towsTve0nBMUjEP2Ds5TPKjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dIgpOpDc/64PvjRuAJpmweXOUeGE3j8ZFLqWWEUqOxoi2nYYfJH7aIxCzfTVN2TUxFIIhq6zj1eYmG+2Ndc8TwDIapFWYK1QDQAh7i3+pmpTsFwj3Z323dtkK56vjw/Cftij5eqNs1cjM+NgPVvUQYBKv6olTcCe9DO4map+Rzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zcEHuA5i; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3c0d59a219dso1147115b6e.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 22:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708757682; x=1709362482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrRq1/AvWfoH6zIGVeIk1jFST0MUBywtAymy8iGNyNo=;
        b=zcEHuA5ieTQVMJ6agMa6/2TcsjVF8fVNFX+Hqf2W3u4U6pHUOOVSJpAXqKq7TvzEiG
         usW1ZEIIt5i33Yq+41VNqErHaiih6BZy06YiAZYPPsr16SouDr/8xf2ga0MtdDazVvQv
         QjFdgHzzXjarBsv87MZm1jryZj9/+Ogefz7/+F7UqufJHeVTGuAmdngyO1SGZ6igjmld
         3zwvAn+kjjvo0IB8J0kl/DDXfMcjSsyXwXr3iTWEuxTL/SCeuL47sJLjMKHPXvGT7Wff
         kS5i4b5D1P7ThgQb4xEa00s4SDYzkQ8f7lgbEMFaRIGbG+UG1itNErFjRmyaE13Lydcj
         XLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708757682; x=1709362482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrRq1/AvWfoH6zIGVeIk1jFST0MUBywtAymy8iGNyNo=;
        b=iVWcfj7hlIuBtdqvb44HsXm0RqHRX6wYgTarO62ZlCCZaLBo2y7VsN3jPUVLZ/sTP0
         8ww9sNIb4EAZMFKIKb5Y1kJ6rxeIoOZ0HOcoALY3Sp7U12O7HD0Kqnf6kbbbwjhW8Cvm
         6Ktrrmkt+mPLHKY3/aqX5WO3T457GvWTSpyGPfvQ5/W1NIsyevlKg+HOXnwkcqx1kmsv
         0HSCKJorO3ymc6gg39XlNA8DG4vD2WivbDr7sQLQkRfSJ7edwx0vE4Vox5akbFM8wKrE
         D8kyawA6bTRGLaVlB1u0v6IpC7a6KKkQN58/0/vxyfb1xh4CYZgdRWQqqdD8H/woyZI1
         OBRw==
X-Forwarded-Encrypted: i=1; AJvYcCWUA/EYrO8TbN8goUdr91GgLtZyrDBvR7yGN35GILYWQcgkThQLLyfJa4KEwBbQdM++uFbp5X23KKOnYI6gnB56y7/AWTlUboQxiKe8JAN0RNI=
X-Gm-Message-State: AOJu0YwgIFZ+M1/FaOIwGy7BgDXfXcxSNH3uLTRjzivt7N0fY1aK1EbT
	UET61iKEn7rM5g+fSJ33B0DV0ZgD5dwhFxoy9ijdDFnKESiIEzDAldcfOWRozQ==
X-Google-Smtp-Source: AGHT+IFibM5pzclLgfVnWQ4q04YXZMJ7dUMTwZy1iwdyXNkxIyosF3kkQlye3pmzcpuyS0AlJbR0Dw==
X-Received: by 2002:a05:6808:2a8d:b0:3c1:823c:b1bd with SMTP id fc13-20020a0568082a8d00b003c1823cb1bdmr1832555oib.45.1708757682265;
        Fri, 23 Feb 2024 22:54:42 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.46])
        by smtp.gmail.com with ESMTPSA id r5-20020aa78b85000000b006e4cb7f4393sm502932pfd.165.2024.02.23.22.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 22:54:41 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Sat, 24 Feb 2024 12:24:08 +0530
Subject: [PATCH v8 02/10] PCI: dwc: ep: Rename dw_pcie_ep_exit() to
 dw_pcie_ep_deinit()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240224-pci-dbi-rework-v8-2-64c7fd0cfe64@linaro.org>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
In-Reply-To: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=CvKJcI2GoHpQh51Boj5towsTve0nBMUjEP2Ds5TPKjI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl2ZKWG4loyEX1PEXJOdKId2sdqeLbJUkwZLok2
 Moo1uGlljqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdmSlgAKCRBVnxHm/pHO
 9brkCACCV3ENWKeo83c0pKegS+iCQkTVUm7uxJuMA4icLm9vKffetGG+G1medZQ6vUtnp+xYgM8
 jtr/r51Dpdvf/+tKOfvW4IfFsHykbamiHO0EN5/hNph48t8h4ieskst7PY1fFBtS4np9OCr4uok
 2H1aAYLQ7au5Qj39kSKXI1o1cG5U7d/0Y+Y7Ybq9nXIAJxMG4KlVOd5yQBd3U8HhJ9kkQ8mK6S5
 V2pdxgQ4+hLFmuLuSKFaHvhqXoBqmlzWvOkfrjprSZcR8R9suy6B2U9nEIDPsEj8y+xWBmaOevz
 tv7BLVrXYcdUd9VpmP7rtLOYndcgCDhDE45aRvv3dp1KZXTa
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

dw_pcie_ep_exit() API is undoing what the dw_pcie_ep_init() API has done
already (at least partly). But the API name dw_pcie_ep_exit() is not quite
reflecting that. So let's rename it to dw_pcie_ep_deinit() to make the
purpose of this API clear. This also aligns with the DWC host driver.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 4 ++--
 drivers/pci/controller/dwc/pcie-designware.h    | 4 ++--
 drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index d305f9b4cdfe..2b11290aab4c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -564,7 +564,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct pci_epc *epc = ep->epc;
@@ -576,7 +576,7 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 
 	pci_epc_mem_exit(epc);
 }
-EXPORT_SYMBOL_GPL(dw_pcie_ep_exit);
+EXPORT_SYMBOL_GPL(dw_pcie_ep_deinit);
 
 static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index ab7431a37209..61465203bb60 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -671,7 +671,7 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
-void dw_pcie_ep_exit(struct dw_pcie_ep *ep);
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
 int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no);
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num);
@@ -701,7 +701,7 @@ static inline void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 {
 }
 
-static inline void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
+static inline void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 }
 
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index ac97d594ea47..9d9d22e367bb 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -430,7 +430,7 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 
 static void rcar_gen4_remove_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 {
-	dw_pcie_ep_exit(&rcar->dw.ep);
+	dw_pcie_ep_deinit(&rcar->dw.ep);
 	rcar_gen4_pcie_ep_deinit(rcar);
 }
 

-- 
2.25.1


