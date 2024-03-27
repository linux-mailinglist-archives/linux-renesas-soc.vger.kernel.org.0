Return-Path: <linux-renesas-soc+bounces-4090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E49388D69F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 07:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70BED1C252A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 06:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5DE3612C;
	Wed, 27 Mar 2024 06:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q4NclsD3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB3A36114
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2024 06:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711521486; cv=none; b=vCuSS2LQI2oGRS/DnVUgKo4ffD1rZ2dIFs2O5hAXp9BTO/kLGw4S1JKtv7Ct+dRQO5BDYJLWmgMHCml0SJ9X+k+/+3X0Qrhzuk/kivm+4tbIevS+b2kthbHcIkWDMvflTQNS+4EhKSv+27BRFYZZWMU+8xHOmJvbeBCnET/mar4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711521486; c=relaxed/simple;
	bh=qsrXEYDJ7iRM5G49lWMuNsUTn79ZQLOBCbqctpAd/Xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvPXbyysYOVU6x6/21jWKAC2hOI5nJs2HS+A5fzbJc9Kl+gh1raqB291AjPlLhBVFEWr17wf0rz6kcWMF3BOLX2Loow4QqF6pcsW3nGXldrYlbWlDuNsKQYmwLRfgbJakUHzNPBwfxz7u749u+b1dOs2NojsW2ORpQH+fPpLVdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q4NclsD3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1def3340682so52870105ad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Mar 2024 23:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711521483; x=1712126283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mivPPYHKcOKy4Ao8y34XOU96LcUYepuBhGKc2WiBoys=;
        b=q4NclsD3/Pvn5OvVmCmeRwdSIKEv46Xeg8T2s3OtozdWY1bXvIp9atfvZeL7Ok4Bcq
         hiA6aRpuXaYdBQ7PYbcJfTzX/cBrddLvRtkHgqgtx2sc9BsQD59cMRxGz0CRc2IDaG8d
         S6C7maDu86/bhH3XhgAFbA674uSQy7e64uKtlJ5kD+QvrWBBqk0kOWOPvH204euzzocL
         ND/mn2nPvQ2EnU3Qu+Iv9zvlJn23E0qU/yKLgyFFPIuRLchSvIqIjVVLgWhNvFOFvv6S
         0wGGh4Wy8j14A8JOefH8ZtOJFtQSzILnhqkCvGVmHsXURfNgC6yzy4NrnAde62wF0ulA
         eCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711521483; x=1712126283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mivPPYHKcOKy4Ao8y34XOU96LcUYepuBhGKc2WiBoys=;
        b=NiPV7zOYCE0nqTlCLZnbLeGKiGdSLGam+rvcZnUW5Xu5fh9Cp9BZfCb2DHk4WQKThG
         mrENAwfNrPsm29CmARSE89TtDUQvorSasB6J9LAJohJ+/r46awUs44pO6Aw0x9fhjPbR
         /0sdJ5HJNM3knbN8fBNA6WvnNM72POd5Kvt/ERKVBHFqMefKNVZZ9gXhO5aU3YMcdjTW
         sVkgKuIkV2HClzE7C/oqr9OWpe3t5tY/ZeXM7h6jQdqXVfUWRqvgkZ3Ywz//Tq+dEO79
         QdjyA65rjgDr7K8RmURf0stjS6Zxc+154S1q+uL6tVHb2Ywq6ulDl+peUHo1mWKyBApn
         AOSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMrpUyrADA2PqOjK4P9bW1ZaBXzF2UX05X44OWg+hZFRPD8nHAck9VK5QALIP6CcRjjWsd9aTJWIykxOvjhVsPUeLhXE44iLA8Eh+JTJsBCJY=
X-Gm-Message-State: AOJu0Yz7VqCywO6irL44F6SajL6pXQiN9ypS8aR+OqJODBh3tTrO+tvJ
	WzL+wMpdG/r9bTvHwhFlBcj4V7e362TYx0zd/RZsMom78lOZMX0BQQpL22wjFQ==
X-Google-Smtp-Source: AGHT+IEuNX01LcBtzwtH1ZI1Dnk/TQQT/XSxPGrtDLuR/pAohoCQdzccf1w7VRPss1JRAfOGZf94TQ==
X-Received: by 2002:a17:902:ea09:b0:1e0:bd8e:5a66 with SMTP id s9-20020a170902ea0900b001e0bd8e5a66mr442911plg.8.1711521483320;
        Tue, 26 Mar 2024 23:38:03 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id r9-20020a170902be0900b001e14807c7dfsm602553pls.86.2024.03.26.23.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 23:38:02 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 27 Mar 2024 12:05:51 +0530
Subject: [PATCH v11 5/8] PCI: dwc: ep: Introduce dw_pcie_ep_cleanup() API
 for drivers supporting PERST#
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-pci-dbi-rework-v11-5-6f5259f90673@linaro.org>
References: <20240327-pci-dbi-rework-v11-0-6f5259f90673@linaro.org>
In-Reply-To: <20240327-pci-dbi-rework-v11-0-6f5259f90673@linaro.org>
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
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Srikanth Thokala <srikanth.thokala@intel.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@axis.com, 
 linux-rockchip@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4250;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=qsrXEYDJ7iRM5G49lWMuNsUTn79ZQLOBCbqctpAd/Xc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmA75WoMjoLUGDerPhNIv6VyZTOayQ0uU/PY+4B
 kAPbZoTMMyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgO+VgAKCRBVnxHm/pHO
 9ZymB/42xHgi+oA0QmT/QC4mzKmaeoOjY/JSPU1j3L93vbjOssxOJeezhE7Swp/n6lyaHPxoY+r
 ZUoL9JO8pKFg9cX69Kz2fjso7GFmQTr+32IhNeaQjJKvCFAgudmbh1oJodl/NyDHnbqkGnprS2d
 L5o+eAB6f4MmYT6ecfcpzH4aHPJzkjC5Tn8H16P4w7vjT63h0WZCZe2RRRTaI5ieaRGE2Gm1H49
 /tjWHhmjJlptTfyF0MFN9Qfy2Bba9LzKYjsPZrWo/d1ip0fYBaYxDBHdlShr0Ea4mHZRVM+gOn8
 W6QF6ehLfXxKTDiMLCJ3CLVqU3YxefS9Wy+lpHGuCAJcVkzG
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

For DWC glue drivers supporting PERST# (currently Qcom and Tegra194), some
of the DWC resources like eDMA should be cleaned up during the PERST#
assert time.

So let's introduce a dw_pcie_ep_cleanup() API that could be called by these
drivers to cleanup the DWC specific resources. Currently, it just removes
eDMA.

Reported-by: Niklas Cassel <cassel@kernel.org>
Closes: https://lore.kernel.org/linux-pci/ZWYmX8Y%2F7Q9WMxES@x1-carbon
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 19 +++++++++++++++++--
 drivers/pci/controller/dwc/pcie-designware.h    |  5 +++++
 drivers/pci/controller/dwc/pcie-qcom-ep.c       |  1 +
 drivers/pci/controller/dwc/pcie-tegra194.c      |  2 ++
 4 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 7ff2015736ef..7509fa1d1e7d 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -617,6 +617,22 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
+/**
+ * dw_pcie_ep_cleanup - Cleanup DWC EP resources after fundamental reset
+ * @ep: DWC EP device
+ *
+ * Cleans up the DWC EP specific resources like eDMA etc... after fundamental
+ * reset like PERST#. Note that this API is only applicable for drivers
+ * supporting PERST# or any other methods of fundamental reset.
+ */
+void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+
+	dw_pcie_edma_remove(pci);
+}
+EXPORT_SYMBOL_GPL(dw_pcie_ep_cleanup);
+
 /**
  * dw_pcie_ep_deinit - Deinitialize the endpoint device
  * @ep: DWC EP device
@@ -626,10 +642,9 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
  */
 void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct pci_epc *epc = ep->epc;
 
-	dw_pcie_edma_remove(pci);
+	dw_pcie_ep_cleanup(ep);
 
 	pci_epc_mem_free_addr(epc, ep->msi_mem_phys, ep->msi_mem,
 			      epc->mem->window.page_size);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 61465203bb60..351d2fe3ea4d 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -672,6 +672,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
 void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
+void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no);
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num);
@@ -705,6 +706,10 @@ static inline void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 }
 
+static inline void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
+{
+}
+
 static inline int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
 {
 	return 0;
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 36e5e80cd22f..59b1c0110288 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -507,6 +507,7 @@ static void qcom_pcie_perst_assert(struct dw_pcie *pci)
 		return;
 	}
 
+	dw_pcie_ep_cleanup(&pci->ep);
 	qcom_pcie_disable_resources(pcie_ep);
 	pcie_ep->link_status = QCOM_PCIE_EP_LINK_DISABLED;
 }
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 7afa9e9aabe2..68bfeed3429b 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1715,6 +1715,8 @@ static void pex_ep_event_pex_rst_assert(struct tegra_pcie_dw *pcie)
 	if (ret)
 		dev_err(pcie->dev, "Failed to go Detect state: %d\n", ret);
 
+	dw_pcie_ep_cleanup(&pcie->pci.ep);
+
 	reset_control_assert(pcie->core_rst);
 
 	tegra_pcie_disable_phy(pcie);

-- 
2.25.1


