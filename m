Return-Path: <linux-renesas-soc+bounces-4105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DBF88D9EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 10:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B35B81F2C095
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 09:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E30A381AF;
	Wed, 27 Mar 2024 09:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nB/muunx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65324AEE8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2024 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711530885; cv=none; b=U/4mCr6N+tzdSkRn2MgOhzkYRtE/+kCvZP5QI9qzn0fubojVCaPyfdU7rU7mT55z2KLaN5iSwuCyIqXdvOWLNSiqeKk3lFFoT73HvqnTWtIqO6tMmRm1i+LV7kaZ70sNgS1q6fGKVie2tcL4Tqn7nwV2N0o4UVyRg4xZOidisQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711530885; c=relaxed/simple;
	bh=xGVEiZ7J2TIauI1NZJAP+R7IoNGzHRfiU2LIamYdE4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lLuhGahN2J071ge1R63BIl9/7rBmGvgyKmr/GJLqrC/7Owc0UacwexqYZN3ftPWK7I3MgGkOT1aGtI5+uAzYe0oxRrCotQaRRBfz2tG4Z/xLscSUwR8fzEr23QKD159nzNGlgoQdkSaMvWKyIgkRW+hytkmN8/FRObnX6zR0MHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nB/muunx; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6da202aa138so3244885b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2024 02:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711530883; x=1712135683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZiY/N9QWjiUSrWkYkKKgVbAI8JcvjPgGcqjy1l+QIE=;
        b=nB/muunxTnoqBk63Sw30EHb7I4acBTzkoB/bJ9gqUWOcu+Jm+tz0oneDhQU/XRmg3n
         8vHPfhpkZrVIp8GDhB8lfGmTxXwce5/DU9JCoHYvW/7+m3Bxq7O/s5EMo1GPV/9No1jn
         wvQS26d4+7aO0S1dnSJ8R2e0rT6mdBaZgvRbmg6WRZ9bgynp8TmjnuEYHXKJaGGyOxbz
         uTgZfhl8dzkxLCv0P7N1tCkWms8O/o/hO2KSxxHN+4b9xCX/yve0/h2+GxFBWNVCxiNt
         NSz/+JfIBr1Le3gor9BJSilbxU2aV+EPlV5+hmmJg3Tr2ENKuoArmXjRm0LEyylGskWM
         +Gxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711530883; x=1712135683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZiY/N9QWjiUSrWkYkKKgVbAI8JcvjPgGcqjy1l+QIE=;
        b=WybRTx6ymUrQ/Zam/I9HZXpsA8AyHrE3RNhDecLQwI0ziLDtWUP8UXxshkC2HADd/P
         h1DGStqO+sbkaW7QEKGBGCCm+/+t5LnxqkhbDP/HVPHniL31+GTAa/O7lyundWQEMYfF
         b85F4DYlhmKb2+RcEtDZjRkUORna96lT1nRj4oNYobNgVbyqWmycldjMmUR9bqrBoXGY
         0GELf7YxLYB9wt/N6TPOGAR+M6H+gwvunnRFV2wGYt+1I/+Uxrbq2sFMeikgl03ZIhb+
         qHiigz27f9anPHs3KXrSWIvuTFfnL2K4EXLCOP5u77prgHlH4UtVOyTyhckdShFkAnyL
         GzqA==
X-Forwarded-Encrypted: i=1; AJvYcCVq6uVpJzhjlEG6PnEyPrJG8twL8uRizyF785QC+7qrt+A9i9gfKm1Ufth4Ij9JZjswIYpJxrXaWquOLpsWE2AJPafOiW0VfnmhmOJ1vZHTmq4=
X-Gm-Message-State: AOJu0YzqG5SyYdV0yYWKBpBdRYyNFN7NuKTNzqQ/U1GOEmMfWXHabuMH
	x8p+GLtbO0OwUyES1Vp75ppSFlUDyZtYSvklTyd6oifRafR2oJD/Qv2ne7ChIg==
X-Google-Smtp-Source: AGHT+IEhjrzAmhdc31Ckj+SKUIw8a5+ySLGll4S+n7ONvtok2U56QZlSSqe5kaYrOAdathooGe1xBg==
X-Received: by 2002:a05:6a00:2d25:b0:6ea:bf1c:9dfd with SMTP id fa37-20020a056a002d2500b006eabf1c9dfdmr2337979pfb.27.1711530882957;
        Wed, 27 Mar 2024 02:14:42 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.52.77])
        by smtp.gmail.com with ESMTPSA id h190-20020a6383c7000000b005dc4fc80b21sm8673871pge.70.2024.03.27.02.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 02:14:42 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 27 Mar 2024 14:43:33 +0530
Subject: [PATCH v12 4/8] PCI: dwc: ep: Rename dw_pcie_ep_exit() to
 dw_pcie_ep_deinit()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-pci-dbi-rework-v12-4-082625472414@linaro.org>
References: <20240327-pci-dbi-rework-v12-0-082625472414@linaro.org>
In-Reply-To: <20240327-pci-dbi-rework-v12-0-082625472414@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, 
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
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@axis.com, 
 linux-rockchip@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3334;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=xGVEiZ7J2TIauI1NZJAP+R7IoNGzHRfiU2LIamYdE4E=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmA+NJFpiteOu/bMaZydpCj3T9fJPQVQN/vgf+I
 pB4YUgDlCSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgPjSQAKCRBVnxHm/pHO
 9dD4B/0TWr4d5WLYoGlJRNd23GLjZofrVBBEdotNf5AQj9lgW1AwbW1nJPy48qrR6OmFgqtMwJU
 AoJRwRrLJd44NPcLVDU7k1DLcM2L6J0jwgpyc83rrCjVdhTIpCqP17u/lg9Tr6o3FaJWRAcR3qd
 UZ29lpeYmZT6uFNuM/VvklfmrSDKH/OoNtDQLszOKd51l/lmKCjdCnM+OEW5UuXSGNNMi2AJGCU
 4jyHZy/eESG8OMB4JoGH+B4jhUN1g55aJd+iEVEAHtrh0s/RQs3/EjMpe/ktSaRupYnD/Sa2eTH
 FDYOiC3JgEjJ7H5spaG21OJihpC5FZLMmkOI3TsWwwBuyCMC
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

dw_pcie_ep_exit() API is undoing what the dw_pcie_ep_init() API has done
already (at least partly). But the API name dw_pcie_ep_exit() is not quite
reflecting that. So let's rename it to dw_pcie_ep_deinit() to make the
purpose of this API clear. This also aligns with the DWC host driver.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 6 +++---
 drivers/pci/controller/dwc/pcie-designware.h    | 4 ++--
 drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index f06598715412..d87f7642d7f6 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -620,13 +620,13 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 /**
- * dw_pcie_ep_exit - Deinitialize the endpoint device
+ * dw_pcie_ep_deinit - Deinitialize the endpoint device
  * @ep: DWC EP device
  *
  * Deinitialize the endpoint device. EPC device is not destroyed since that will
  * be taken care by Devres.
  */
-void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct pci_epc *epc = ep->epc;
@@ -638,7 +638,7 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 
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
index 5d29c4cfe0a0..de4bdfaecab3 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -432,7 +432,7 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 
 static void rcar_gen4_remove_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 {
-	dw_pcie_ep_exit(&rcar->dw.ep);
+	dw_pcie_ep_deinit(&rcar->dw.ep);
 	rcar_gen4_pcie_ep_deinit(rcar);
 }
 

-- 
2.25.1


