Return-Path: <linux-renesas-soc+bounces-3832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC35D87E377
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 07:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 087A71C205E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 06:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D68225D9;
	Mon, 18 Mar 2024 06:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xp+arcRO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622BB2209B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Mar 2024 06:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710741897; cv=none; b=tOVRLuts4pFdJ5oARA5HISPkF7iyBlj/irU+KjQag8QjC2GbNwmjbkEM6nhfPqeHaRc9mM0BWl4rlk/U9hsEURiMflRIQUcsB+8cKSmmFaktU8qonWIxsRVmVLdJdXDMcORN+DGFv0QfDvbXG+ep4LkKeVWcwt66r2y7ynAONF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710741897; c=relaxed/simple;
	bh=Z8yc5kS/Xk3EUHfDIyIs2RMRtLJ4RDqGCzWQ1mNuKIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nPwCW30FMIL0sGLczKfaODMy7Sf6x2z3/gM4MVdoDUwDIN2Dh6gO7fxrcGVUR0VLbfzZaboCrDuJTjiD84nLOYsZQ1iQcRddgrAhfoUAHZLK9D0Kb5Pxb7bXrMB7+G6BB2259lL16cBDDnRALUoyCww/PBkbPjuD2QzSHvigEY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xp+arcRO; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e6a9fafacdso3206760b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Mar 2024 23:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710741895; x=1711346695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTM5ZErKcaRFWc0GzJqy/id8CdgJhbx2a4ZepQEFvSI=;
        b=Xp+arcROE1EDjeC2iICSyb2wE4Ngr96ZZX7jPaNZPYbhOTzFyEqPEinUid3iE/ivXw
         KkhmvS8uTpTCo1GDLVmRdtnXZJuIoqlBkF+xOsiv3fQWZA3JrXPpOCCiTsbMEdCwNk3O
         LmYSQfiKHMSfTNf8Glo6+p3brNc82zn8rmGWb6j6UHoZYsk7mghuH/NfTPN78SnM9tgq
         z/72G5uGxGD9NEgAnsLq5ySCA6y/h5jqzV4LFL4wyMEtlGGTSLgFUr962yjZiqeuadRk
         qehpwe3f0ih3+4ubvYvtoVPmtDGF72iFirHU7i2fi8r15Thaf8eQ7ak2XWwT0v9PGZRP
         Li7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710741895; x=1711346695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTM5ZErKcaRFWc0GzJqy/id8CdgJhbx2a4ZepQEFvSI=;
        b=k8hhJLXRSKKlNIjOTKmTm5sRWYGv0oGL6XCsp/yTWi0P3Q0VsT4BiVp/8virHeNNPw
         CCO6lKvh0aB/yD8C2nrsyT21TBvoQK4DNztFYLiMXjodl8gdyXpMHU+CvEVzAbe3kTNE
         stsbqLDmGE5ZGIzomWuvK3+OfX3AkLY5zD2KgyepyEg80EUjfqSnYB/9c/Da9jPcVzlm
         lDS48E7aSAcfDXs/xL3bJ7J4dvgi1dci0FlMlm/dr5m4+XMHpgw46bZyG1istVuMhJ8Y
         U8M+7ynWegKFBkv4PONr4Pnh+B8nEOoG7fONa6cmyVCfm2iLVcwPKHTVgaHC30jenb/C
         X3ow==
X-Forwarded-Encrypted: i=1; AJvYcCV/0lwS2Vdhq2A5oZdNPa+PVBGGLgblHquOpxWNE2Il87cO4BmgQFmc9MGNt7JdosvCCGrF91lnXvq7Qj6VAtVHbkpYjWY+cVZ0Q3dxgOWK43g=
X-Gm-Message-State: AOJu0YyepxKp/t5jwS2mcgtFh4T1bUscUB3M3AOSzMnJ6QNBEyanyR1c
	Edh6laM08MQdc+ewAYEktHIkNYzHF1N/CnuqgdQG8wDR9DftwtaFPXgylt/u/Q==
X-Google-Smtp-Source: AGHT+IHnEdlpqwSxdB8NU89n4D/kCtbLpMcmTwyraHnP8Wkb9MSrw7TZEgbRlT5Yb02IybzPYJ5M1g==
X-Received: by 2002:a05:6a00:2d0b:b0:6e5:736e:9e4c with SMTP id fa11-20020a056a002d0b00b006e5736e9e4cmr9952086pfb.29.1710741895486;
        Sun, 17 Mar 2024 23:04:55 -0700 (PDT)
Received: from [127.0.1.1] ([103.246.195.160])
        by smtp.gmail.com with ESMTPSA id p12-20020a62ab0c000000b006e6c5b065f5sm7064268pff.28.2024.03.17.23.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 23:04:55 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 18 Mar 2024 11:34:26 +0530
Subject: [PATCH v5 2/5] PCI: dwc: Skip finding eDMA channels count for HDMA
 platforms
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-dw-hdma-v5-2-f04c5cdde760@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Z8yc5kS/Xk3EUHfDIyIs2RMRtLJ4RDqGCzWQ1mNuKIw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl99l3q47qkLp0U9npo6Py5yQ4OY+WK/EHpE3Yl
 4W6m1leXY2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZffZdwAKCRBVnxHm/pHO
 9QUmB/46ll/6UrviIDKiSHi5sdZ/noJukn7at6SDWAZIY/BNdd50G5WLQ6/nNVf3eA/oUV97E2N
 lWIoVYJScC7suTJc/ZClLS0zLXElwMcGXJ4XobHQVgmtLqirIHX0U9Qk7NylcDe71hmGvF414/C
 6PcvFGinwyWE8IEqofam/rmPm6HkzG35+izBTnf8LG1AfDKtAiGt7EPpPEKUD9gKTptNQKtGuCY
 otQBBXdGaIIJUcYXGJB1yfTKMXNus2/02jl+hx+TiLmA4atTVeW+B0AywIgmpb/JthczOecMFZ2
 AFOisWnlY+z898Dflj0CJ6q9G0XjUMy6oUy7EM/tZ2l0uiay
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

In the case of Hyper DMA (HDMA) present in DWC controllers, there is no way
the drivers can auto detect the number of read/write channels as like its
predecessor embedded DMA (eDMA). So the glue drivers making use of HDMA
have to pass the channels count during probe.

To accommodate that, let's skip the existing auto detection of channels
count procedure for HDMA based platforms. If the channels count passed by
the glue drivers were wrong in any form, then the existing sanity check
will catch it.

Suggested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index e591c1cd1efb..d17549f67e72 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -927,10 +927,18 @@ static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
 {
 	u32 val;
 
-	val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
+	/*
+	 * Autodetect the read/write channels count only for non-HDMA platforms.
+	 * HDMA platforms with native CSR mapping doesn't support autodetect,
+	 * so the glue drivers should've passed the valid count already. If not,
+	 * the below sanity check will catch it.
+	 */
+	if (pci->edma.mf != EDMA_MF_HDMA_NATIVE) {
+		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
 
-	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
-	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
+		pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
+		pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
+	}
 
 	/* Sanity check the channels count if the mapping was incorrect */
 	if (!pci->edma.ll_wr_cnt || pci->edma.ll_wr_cnt > EDMA_MAX_WR_CH ||

-- 
2.25.1


