Return-Path: <linux-renesas-soc+bounces-2915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF858858428
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 18:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6712928529D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 17:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBBC133296;
	Fri, 16 Feb 2024 17:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FBHDoMzD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8B2132C2E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2024 17:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708104905; cv=none; b=hrm/6iE0vxM9oUKF41JyL/Hfq9Tly+9M9I07ufNCcYPgO0lshK9Mpy1WC2t4+hUQFYECKx6dqxSvYlTcrfj7cA+tzSKoRUeHoD7VOTmewNnAAW7OgmM3Juu3T8uOwOFhnCkqjNEcElavNbyr4AjifXNERc/ENUGQX9bQVGq2pSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708104905; c=relaxed/simple;
	bh=m8AOqRiSHCcO5mZcayvtN8wItwmC4U+br9OIM450sVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V7DKRJJ1KV6UauA4TMMjulxZDll+uSReIiEkAd8XIkKajCJ38w705L1j+JhRLzBuVLJ0vvdo2T3rk06gocAEGIICHc16jdTFINQyFFRiG75mAG54tuTWyjUxl9YvAwSnCu1tETvGxhEP4WAuJDTOkpA7AhVtx2iSzD+ZJvam3PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FBHDoMzD; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d944e8f367so22044385ad.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2024 09:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708104903; x=1708709703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8efIfXj3EDiKaREh1NVON3UM6rTKzHGcjeds+XSN7t8=;
        b=FBHDoMzDAD1CPsX06sBmXhCQksFkKDaNL9zLIJ2JQUp3lUC8uDGLgS2b+o4/e2/d7P
         BeTqaY9WxVMS3q1Uhc4ORJLZTnNKUGYyC7+SM4eYQg6m4SRvgX89IpDhR5WuU+NciKM9
         nmJ6xwfFlpjVe4GJaoEdj3IGpJi9nqE2xgt9RWSQrw1BUrMmLfKH1Wu90D05TLU7fWEQ
         3yWzEr+ts59nsgdR5BTbcjHeuk6p4mBL96gsFy2dn5h6JT/zINBSLmXxhqvrpSqkKWZ/
         F6inbWCC9mcEeYwrLTAB3A8AbcpHkw8Sj8Y8RJNH5ii/fCxONg59tAXCWFnNj6tgBdbw
         aoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708104903; x=1708709703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8efIfXj3EDiKaREh1NVON3UM6rTKzHGcjeds+XSN7t8=;
        b=T6qRQM8zxdaQ7EUK8dYntlRdIA5CjuCQ+zxifUKq7OSVrD1o+bkJbDZEPaWIQakxrz
         b3nrbUt5n00RMBZ8jwJf3hkDdJZselCJgryhWQsNjBcoXHH6fEpZ/J7tACv6w/YeEiJn
         dobUE0SYnXBbh7oANaw94xS5DiXGt5AlBzA2NyTPTRazGLxZ8nG+P6rd0ZSO4lVvLfKX
         7bPBXZRpftWJwp2D6zvfRan8H2IFnMl8LlNwq3FQSby0p4pmfm13IQauMTNf+OHyihtF
         RBo1PHrYKVzPWXJO93Ue6D4ZGKjL7JJ0tUj/WsjCjVKAsQt3dC8Nw5747FdczJiQTxA3
         bZgA==
X-Forwarded-Encrypted: i=1; AJvYcCV44D84Xll/rbFBl35dfb55RdTFsE9ZbbfA5eG2fFiYWtbX+ctjUNPXnJL9SAWG7RdlLOdUmO4O9vfYdYsCIzRjMBcz8Z2Q3QAzMNsAVw8+se0=
X-Gm-Message-State: AOJu0Yxoq26AOab8NbP7TAuFJ+yLxYxocdVy4V5H/vL0xvh4GXyTnziU
	nkxu9vKWgxXzWmBBFEHEo4RE3eZPETzyga7jTdb+XKtooKGWLI9mq9VQmQe3IQ==
X-Google-Smtp-Source: AGHT+IHhf48sMNsZjk+5ryOE5aPaQpeinWYitnNYmxoUYkAZXFN1gOx8tA2CK++qhgZJk6goGvJLhQ==
X-Received: by 2002:a17:902:784e:b0:1d8:cbca:8fdd with SMTP id e14-20020a170902784e00b001d8cbca8fddmr4808375pln.67.1708104903225;
        Fri, 16 Feb 2024 09:35:03 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id v9-20020a170902b7c900b001db5241100fsm118592plz.183.2024.02.16.09.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 09:35:02 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Fri, 16 Feb 2024 23:04:40 +0530
Subject: [PATCH v2 1/5] PCI: dwc: Refactor dw_pcie_edma_find_chip() API
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-dw-hdma-v2-1-b42329003f43@linaro.org>
References: <20240216-dw-hdma-v2-0-b42329003f43@linaro.org>
In-Reply-To: <20240216-dw-hdma-v2-0-b42329003f43@linaro.org>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2569;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=m8AOqRiSHCcO5mZcayvtN8wItwmC4U+br9OIM450sVs=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlz5y9jEZ2MRbDlRIXAc5qpjEUTe25c9uY3Tc10
 XimLXNNSDmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZc+cvQAKCRBVnxHm/pHO
 9WCIB/4h1XrbJ1DWyjTcM1TdQqqfBBN+Z+xZG3crirTEU5kZDMjdNtqocFqZeRGAFIt5i/hlpZu
 kplHDhsJEkzg+SX5kiNzDxQi31ohbsHNuSAE6w9rq5cFHUnskEGVaZQe2m4swo/DoQth1mmkBTf
 va7X+7V/pMxdJngff46zw/cTgD7ijo07T1OWTh7GHHZfZVmLYDfrBmkIIaaxI44hWkiAlfs9AFr
 NdeJA1V/r3iVv1n/NiXmyEq8B+v5Kiv5m5HwXkyKP0qEA7BLGRtuydpaNt3guQ/LHGBNY12g3V2
 T4U32kGOxzkpF2ZjXdBGm0K5kjhldjuVtsVNMhYsJoJdEWoL
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

In order to add support for Hyper DMA (HDMA), let's refactor the existing
dw_pcie_edma_find_chip() API by moving the common code to separate
functions.

No functional change.

Suggested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 40 +++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 250cf7f40b85..3a26dfc5368f 100644
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
 
@@ -912,12 +920,17 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
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
+	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
+		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
+	else
+		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
 
 	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
 	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
@@ -930,6 +943,19 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
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


