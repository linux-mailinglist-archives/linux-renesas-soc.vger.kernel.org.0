Return-Path: <linux-renesas-soc+bounces-3831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3417987E376
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 07:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3A051F2200C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 06:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0928C22619;
	Mon, 18 Mar 2024 06:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p+DuZSUL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A54225D6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Mar 2024 06:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710741893; cv=none; b=ru1kNOqnZ4TWvb7+sObJFqhXibCjPfOh3xgjoFjEF3dDJjetSDzH0VAJ/EVjWCvO8/UEHFAr5wr5nqXCJ19stQi6LotKi9XtcGcSfC+cO2mkkai2XxXS/382YuAB8W13zjIqf8u/Nbk7dd/ymxFPP0B5irSEJ3x9Y8nSw5od4So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710741893; c=relaxed/simple;
	bh=86BXpjeiKvoD3eM2AzEhNa0Ch1Lq3tU6C5/54jzx5IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tRMFxYwdTetm8O5j/naXShQJYe8mhNVS9UakoYA3aca899T7mAw0iSWayRltV9ngcZ5uSV842NS/12JgeCCaoPPQ/8PALa1ynclDRloQfrcLKfxnjFXZyuYUaLDzdrOk1i9ymwC3xLLKn6Hkswc4iKZS6RW3sKHGHrIgQw3HZc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p+DuZSUL; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e6ce174d45so3108832b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Mar 2024 23:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710741891; x=1711346691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7hkJTUn5S3FbbJcPOt+0+dwcuBzp9KKLGXVJu4U1Ms=;
        b=p+DuZSULoHIUM2W4JTsuT8asrRxgyrGCp/EWXNkZTL/CYeOvrnk5dGa6WCYHalUuGO
         Abpg8O5ejKcsZBMJQN7irnSibZTkU38b3oTEoPD4Rp7ebPkm2OQMEImmj108Btozvn+Z
         974pyEYR8zIyFMpFbuDDKsyDy0TopKbk5l2e6FzXLaGPampJNwhfVDfiuIuJvI1zKXjF
         xtIz034g9QYHlZ+Z+/ApXPj2hD3wZBrk1aVlWlMDGASK9A0Ux10ErUtR6w+bavyWw1es
         7Xa59u+PvcWkmiFStj1hror+IUX3hZOp3kajl9jHpbTNPKDA93/F0VlDNdFK/qSGbTBj
         c7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710741891; x=1711346691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7hkJTUn5S3FbbJcPOt+0+dwcuBzp9KKLGXVJu4U1Ms=;
        b=FzqkdZjx0ZMNdWRnfktwjTao1/gaaTEg+qT6HFgah3gHW4K3EIPJHOqs3YoBlVs9kT
         gEAOPEmHQXHBnhVlPOgJCX2LsvKKzgFQNLwtHcw0gYLJNQj9ayLezJpQf/XGyKmcPDRa
         B/8HK2yBvH2Cf7NvJ9qUCDY54CKpuHa48DK9mWI5aRPUrrmnth5uGV34dULA7PIOqwym
         JwAvnjqJ3BuyTs3CEGntByzFqrBpEpFBbBybJMGK6DlyjzekmYPyFka6M5S0cE2wv27P
         TRO4nqAwYtLEd+1wFvvYk3B6KMjvpbBqanQ2izR/N1elq08nsUSfKOjnTChPG94Io/k5
         GZOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxPYmuYwwbA1Q2Mn3d2uaqu3ZYSmKuaG9z+EPM0oPz+h9NxA/O6DNQ/tGS74CNgbbQlXPDxEYqc9JTXsk7zRTABuqDzgVvAo2iBm9uaQSz8+E=
X-Gm-Message-State: AOJu0YyFgKKsgk8l/4ctGqwi/bFldAGH99VBe9pkSdHd0fD3dPv8qBfF
	UVOVwF8Db7hCVkTV8Qs/CGDvFQ1l0wVr5RwzDJmeujIsW+kD8oPca2mockex3w==
X-Google-Smtp-Source: AGHT+IGpwvA/iOOZCui+dshJpYWOY5lAS4S3A9YKfkyJH3tuoQtCRVvzx+iiGrz3Z1fvl0i+pUeEmg==
X-Received: by 2002:a05:6a00:2d87:b0:6e7:2154:72ec with SMTP id fb7-20020a056a002d8700b006e7215472ecmr2969114pfb.17.1710741890524;
        Sun, 17 Mar 2024 23:04:50 -0700 (PDT)
Received: from [127.0.1.1] ([103.246.195.160])
        by smtp.gmail.com with ESMTPSA id p12-20020a62ab0c000000b006e6c5b065f5sm7064268pff.28.2024.03.17.23.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 23:04:50 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 18 Mar 2024 11:34:25 +0530
Subject: [PATCH v5 1/5] PCI: dwc: Refactor dw_pcie_edma_find_chip() API
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-dw-hdma-v5-1-f04c5cdde760@linaro.org>
References: <20240318-dw-hdma-v5-0-f04c5cdde760@linaro.org>
In-Reply-To: <20240318-dw-hdma-v5-0-f04c5cdde760@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2606;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=86BXpjeiKvoD3eM2AzEhNa0Ch1Lq3tU6C5/54jzx5IU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl99l3oRA4dgmqXKFGhOCXiDXoHXn9AkArhP+vc
 8JA4vk0vl2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZffZdwAKCRBVnxHm/pHO
 9RAnB/9DKwJeucvp12B3S9Be/ohn+ETGW5ME+tPVg/rwUbrGP5AtfBYKfxUDFV0K1j7X0gWyYUy
 TZzHnr7nUj15FtuFiK/Nlaols4BOXmS78mNrfzClpTy4ThTZHqNgyEIXaGxDtp2eezZ9pFir8bq
 RyOutokvcYgFIYKGbWunRAPxxpRiOoB6+LN0WQ2dtQwKEZNxfw2Aq5Z83dKKXbqUWbJPoL2FuiO
 JNil1CdiQyK5N5DyjvMkNAgHfZfgN9fj/M4wGaLBNw81Q5CBFyXMusqExUIsnDjZY25a6W+3C5s
 6oXqP4lsyoirYJFNPf/6VTUNsmUnfzV1oFwakDRVtUGTXlgF
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

In order to add support for Hyper DMA (HDMA), let's refactor the existing
dw_pcie_edma_find_chip() API by moving the common code to separate
functions.

No functional change.

Suggested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 37 ++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 250cf7f40b85..e591c1cd1efb 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -880,7 +880,17 @@ static struct dw_edma_plat_ops dw_pcie_edma_ops = {
 	.irq_vector = dw_pcie_edma_irq_vector,
 };
 
-static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
+static void dw_pcie_edma_init_data(struct dw_pcie *pci)
+{
+	pci->edma.dev = pci->dev;
+
+	if (!pci->edma.ops)
+		pci->edma.ops = &dw_pcie_edma_ops;
+
+	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
+}
+
+static int dw_pcie_edma_find_mf(struct dw_pcie *pci)
 {
 	u32 val;
 
@@ -902,8 +912,6 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
 
 	if (val == 0xFFFFFFFF && pci->edma.reg_base) {
 		pci->edma.mf = EDMA_MF_EDMA_UNROLL;
-
-		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
 	} else if (val != 0xFFFFFFFF) {
 		pci->edma.mf = EDMA_MF_EDMA_LEGACY;
 
@@ -912,12 +920,14 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
 		return -ENODEV;
 	}
 
-	pci->edma.dev = pci->dev;
+	return 0;
+}
 
-	if (!pci->edma.ops)
-		pci->edma.ops = &dw_pcie_edma_ops;
+static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
+{
+	u32 val;
 
-	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
+	val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
 
 	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
 	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
@@ -930,6 +940,19 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
 	return 0;
 }
 
+static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
+{
+	int ret;
+
+	dw_pcie_edma_init_data(pci);
+
+	ret = dw_pcie_edma_find_mf(pci);
+	if (ret)
+		return ret;
+
+	return dw_pcie_edma_find_channels(pci);
+}
+
 static int dw_pcie_edma_irq_verify(struct dw_pcie *pci)
 {
 	struct platform_device *pdev = to_platform_device(pci->dev);

-- 
2.25.1


