Return-Path: <linux-renesas-soc+bounces-2917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C638985842E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 18:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 845EA2866A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 17:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B349131726;
	Fri, 16 Feb 2024 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XdMP6QGo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFAC133420
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2024 17:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708104915; cv=none; b=tHnm4qZbig5pu0uxgeZzg0Nuxxr0elr8K1/zx9CIv49DRBVX63oPeA3Ziqb8ECez0v8ZUe2ig5DplB2FKv7DWwJIT6QbPGmUzZDaMSmVSp1F77m7lH2cH0u9UkowdKeo4nzv6fSGZ4JGnGLSrp0puHEm+tz+ua+/3UFxFqBf/Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708104915; c=relaxed/simple;
	bh=bNnVXR6L3kcnzQ1W5qCDxOjLhMtpGjDiA8ja4nbUZBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JNP8rDxWDFYW9fZ0P+Im8GVOR9ZyZrX3R9+5HQtEDS/gFilz4AYcLgYYMCJuSMasuxdxIaYUDBnzGPNHLJ1bU98CelHMCmwnAGD9wtMpEpyz4d3GEL6V9nwy0Vd40aTbh5TStqdTXZp3awyzJ/B12pL4IMilQx2W1rpd9eke58Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XdMP6QGo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d72f71f222so8045885ad.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2024 09:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708104913; x=1708709713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDNeyW6m4BTGEiUVj7puFwGWPFjKwT7Zu5mdH9vjNlo=;
        b=XdMP6QGoGj8bVU6PIJ/5+6SBe1gvx9ktMO+T9Zde+84ei5owXlvr+rT3nFgAzbQ5+z
         hYtqUtPhj1sfpBP1vkNlE6WZ/pBq+n/1LvM8mFFTWYf9A8cqmTsHtBMZCZAotpfI1i1x
         4pnqIkXDyEHQ+ztp91XvhP/4u2QwCJJd2GxG3nXuACD5/sj7ClodP5grxdhCJ+ZrG6Lk
         uStIWQsITr2JydmLGVTxoCoOzOXTF5o7c3NK6uvsP/5LTRULIPOWJNRFpTuQxM01SfQN
         EnfP9oAjlNeC7sxB17e/VHf41ZaUfrcBWMPlhoRWNecKh5IRZscpxE/4nLO2W4DofC5+
         0z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708104913; x=1708709713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDNeyW6m4BTGEiUVj7puFwGWPFjKwT7Zu5mdH9vjNlo=;
        b=cVPY6FQWcbU3lfPs1/Dlb85GVtIUnAmOKBymvAaH4djcbtGOeMb4+ilS1Nq5bZ2Gkc
         fYBg4ujkYMkK/hs8P6ZPTGgwzBNjpfy0shPJshMFBFBhXO84xEUMbntTemj387PmGYsF
         QTz4ybI6+Vp/1b1frSoceMbyTfLuaZgp7FvI97eim5o63EWDLJYnmHnys8uMNh856iTv
         8IzLi/rn20KQg80Lh4MeTRXNPQyYtb80C5frTC+aYjtRoQ9gYFc6vhD+H0xK+fg7AGME
         viENqhd18AuiLfD07it981+znYeVxIc1pSU9HpeWvLC+hjI3IacUo/I/7ubiIlprAiDZ
         oceA==
X-Forwarded-Encrypted: i=1; AJvYcCVu3l0anNkH55DGvuJM/BpiGGVLbtmIfYEFP3SjsOgut0er3rHVeDJfC5PdQBqv/c2Rnjq73OFg35yVQ8M09PGdY53qNQUS53cM3JIvOfjZuL4=
X-Gm-Message-State: AOJu0Yxmmbo1DxHSbI1V+whi463VwqAZnxE/5Kv2h4OrW8rhDlDHhc1I
	Xyuoa5PhO0gtEKgLpn3qUoa4z+Q2IcxYpeES3qGPw8fEzviS6LNEXPvvVZRoJg==
X-Google-Smtp-Source: AGHT+IGsyNn3mNv12tgQelDLLoo35aQUFAw/kHVMCOOKEv8w8Wkzb6KwjfgLIwjtiKot37EuV2E0Yw==
X-Received: by 2002:a17:902:784b:b0:1db:4b29:9b21 with SMTP id e11-20020a170902784b00b001db4b299b21mr5227700pln.23.1708104913087;
        Fri, 16 Feb 2024 09:35:13 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id v9-20020a170902b7c900b001db5241100fsm118592plz.183.2024.02.16.09.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 09:35:12 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Fri, 16 Feb 2024 23:04:42 +0530
Subject: [PATCH v2 3/5] PCI: dwc: Pass the eDMA mapping format flag
 directly from glue drivers
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-dw-hdma-v2-3-b42329003f43@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3317;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=bNnVXR6L3kcnzQ1W5qCDxOjLhMtpGjDiA8ja4nbUZBM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlz5y9ST0H2R6ShbbqEzDuD117Tis4bX9tke/qy
 ZDo5Q/SdWKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZc+cvQAKCRBVnxHm/pHO
 9Zk+B/wK63dSxW1bW2CzlTD3p4svLzBTxAAADKqa5609ZLV2lzA5c+F1+wWIaGjeORKNzMdbMSJ
 f6z7IcaFqqwvDrScULenCSF6eunG88xP41wIg1EF/p21hcTwjh1eVvXy2LtnTizeXQSMzp9PgRQ
 qokAbMVPf2XINZMTsYjYLxLQyjTw6V4DPMC087YNu0W/S6ABi3kLAZFYIobL+byp6f/gXeJmzzT
 fXl4XLkjnJ2POiJR+xFmY4IoVJeqRc6p4Y6Q+rwxM3yf3ihyDxI8l1levR/Qy93poZH9lVI8WNR
 qkkH950uk6qnrTrEuhXF1nxP3kFlbgDj3TLIBYgNy5vdLVC1
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Instead of maintaining a separate capability for glue drivers that cannot
support auto detection of the eDMA mapping format, let's pass the mapping
format directly from them.

This will simplify the code and also allow adding HDMA support that also
doesn't support auto detection of mapping format.

Suggested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 16 +++++++++-------
 drivers/pci/controller/dwc/pcie-designware.h |  5 ++---
 drivers/pci/controller/dwc/pcie-rcar-gen4.c  |  2 +-
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index d07747b75947..54ecd536756d 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -894,18 +894,20 @@ static int dw_pcie_edma_find_mf(struct dw_pcie *pci)
 {
 	u32 val;
 
+	/*
+	 * Bail out finding the mapping format if it is already set by the glue
+	 * driver. Also ensure that the edma.reg_base is pointing to a valid
+	 * memory region.
+	 */
+	if (pci->edma.mf != EDMA_MF_EDMA_LEGACY)
+		return pci->edma.reg_base ? 0 : -ENODEV;
+
 	/*
 	 * Indirect eDMA CSRs access has been completely removed since v5.40a
 	 * thus no space is now reserved for the eDMA channels viewport and
 	 * former DMA CTRL register is no longer fixed to FFs.
-	 *
-	 * Note that Renesas R-Car S4-8's PCIe controllers for unknown reason
-	 * have zeros in the eDMA CTRL register even though the HW-manual
-	 * explicitly states there must FFs if the unrolled mapping is enabled.
-	 * For such cases the low-level drivers are supposed to manually
-	 * activate the unrolled mapping to bypass the auto-detection procedure.
 	 */
-	if (dw_pcie_ver_is_ge(pci, 540A) || dw_pcie_cap_is(pci, EDMA_UNROLL))
+	if (dw_pcie_ver_is_ge(pci, 540A))
 		val = 0xFFFFFFFF;
 	else
 		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 26dae4837462..995805279021 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -51,9 +51,8 @@
 
 /* DWC PCIe controller capabilities */
 #define DW_PCIE_CAP_REQ_RES		0
-#define DW_PCIE_CAP_EDMA_UNROLL		1
-#define DW_PCIE_CAP_IATU_UNROLL		2
-#define DW_PCIE_CAP_CDM_CHECK		3
+#define DW_PCIE_CAP_IATU_UNROLL		1
+#define DW_PCIE_CAP_CDM_CHECK		2
 
 #define dw_pcie_cap_is(_pci, _cap) \
 	test_bit(DW_PCIE_CAP_ ## _cap, &(_pci)->caps)
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index e9166619b1f9..3c535ef5ea91 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -255,7 +255,7 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
 	rcar->dw.ops = &dw_pcie_ops;
 	rcar->dw.dev = dev;
 	rcar->pdev = pdev;
-	dw_pcie_cap_set(&rcar->dw, EDMA_UNROLL);
+	rcar->dw.edma.mf = EDMA_MF_EDMA_UNROLL;
 	dw_pcie_cap_set(&rcar->dw, REQ_RES);
 	platform_set_drvdata(pdev, rcar);
 

-- 
2.25.1


