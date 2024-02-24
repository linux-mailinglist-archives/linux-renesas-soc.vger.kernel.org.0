Return-Path: <linux-renesas-soc+bounces-3156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 620C7862332
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Feb 2024 07:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAE8B1F2379C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Feb 2024 06:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEE718622;
	Sat, 24 Feb 2024 06:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZkeXl0Jb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0989822301
	for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Feb 2024 06:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708757760; cv=none; b=kSPeVNGDA/IezGcLJiIaqcR2X/l29a4ftl/vl0SOBPESuJ7u8zMAdXtyh5gcY393PHT2uFxHypJ8gAWvJ9m71G7qzOsE4TLP+WDdldvebDrh5F+qOFAOFRjvHeueIEELWqM2oiJcfdPOo6X4HSoRHKjUFHeW5EXrz17C6oVMnVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708757760; c=relaxed/simple;
	bh=lMx8jaitSygvuxgneq9A64SvIefKCHyxvtG/ZW2Dw20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tn/7zTYv4hBVKSrgOjPBEp2YQiexvLDR6MoZO2glS0Brkbgb+Ng79xK7Ck0B5AJofkMLV53jDXLbZZoXPpkhSqRtb90sbizhI4xkL0oOmXL5YAosDRHIDVCt/Pcg+uoaRnCQ4TusAL+GgLxgsLZaZHFafWViipmcAUm8/55za0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZkeXl0Jb; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5ce2aada130so1371423a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 22:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708757742; x=1709362542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWp8V5CHI0uxSxSBbNBsR7PWeN0w7yn0quv2v4HN+ko=;
        b=ZkeXl0Jb+MJlnGoDqdBJhCYyv1tqdkC1+tRTOLbAbyd8qUcdNJ4lv6WYw3g0B/n8AD
         gynYStUEBAWy9Lohy22jcD9zi6GqVU0f/nzNsCnIm6Yus280HgPgpDxWTiJxLH0NGSYY
         0nTsj4joRwPCBLOgEtwGjSfNazPfKxNhoCq2fg9IOnYfY8pWQMH6CNUtv0OueyiOw/v1
         pYgB1aJ5QF5c/8wGzkgFSUQYcM9WQHNa/o2k3bvg70F39dQPka8IN+8vhdXudS7VzfOh
         3kNJkQC164PPdLehzff51YzILCa3FmjJLMWXOBPfqPA0DNy39jFdXSkaOmtABqf8SRos
         Jc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708757742; x=1709362542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWp8V5CHI0uxSxSBbNBsR7PWeN0w7yn0quv2v4HN+ko=;
        b=QXOctg3eLxKhyMZwrPYGbCh2G5+wC2TGpoKk53D8p0sdLmhOl6A/vcrux/jrsBcx/T
         CmbT8M9NJxdxgsjPB/DmBqUciDGUKEJTxlmu1anEvlUGuoRtgur/SRVbBKDwGUng6ke+
         bbmdEQyScUMeIkULcCHsh4UCWp9qgFknZO910vsWA27ivWsAn2cIY/Jk+L/oMgNxkh9q
         2eEQM4UR4nHe2dF6bP1HLnv4tr63RBrvUS9gbdW1QWtTiusE4fDMbLq0mr30Lbkx4ODk
         2MMPXaUdJB1ERaPf7ytidqUUIyCAYN88H4sodzadO479rrFG7wTWkv/j8RKfXPQUlZUq
         j/4A==
X-Forwarded-Encrypted: i=1; AJvYcCUROBwKE/O6taaU3qz/wUZrM4qwxkDYip2AYLu4YCT0ytxcIY7dJ/QG+gQsKXOkfGZGjNZugsZ+H6oemo2KnVbaO4tScd1foYVPNN8aHIPBWsY=
X-Gm-Message-State: AOJu0YyP/7+AWjoWPvPg7gVSqaNplHENIFmDC/QhVAeUeyRnTPihMfrh
	oOCqw6uDTeokyuFbXjFeZuVLE2k7pzZyOC/rT6Bx4Vf7KIvWV2JMiZzcN7Jp0w==
X-Google-Smtp-Source: AGHT+IFIskgaUGsMeIsmD3wiZleHjPkQUC5UtWw1p5Y1MMAUTOUlX+m9mazTIw4TXKmo+YHlNBnbOg==
X-Received: by 2002:a05:6a00:929f:b0:6e2:84fd:f1fa with SMTP id jw31-20020a056a00929f00b006e284fdf1famr2371986pfb.27.1708757742305;
        Fri, 23 Feb 2024 22:55:42 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.46])
        by smtp.gmail.com with ESMTPSA id r5-20020aa78b85000000b006e4cb7f4393sm502932pfd.165.2024.02.23.22.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 22:55:41 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Sat, 24 Feb 2024 12:24:15 +0530
Subject: [PATCH v8 09/10] PCI: qcom-ep: Use the generic
 dw_pcie_ep_linkdown() API to handle LINK_DOWN event
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240224-pci-dbi-rework-v8-9-64c7fd0cfe64@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=lMx8jaitSygvuxgneq9A64SvIefKCHyxvtG/ZW2Dw20=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl2ZKYYNXTQqfakMhAc2cB0T7CbXovjsrJ1sBzi
 8zlVkSivSSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdmSmAAKCRBVnxHm/pHO
 9cmyB/4qQE8r3RLSi2d/HtaZZLx8MEt1MwfmzXRoVQvk0BpZk52ucQfYu9tPZHtvn0QhqaeguMG
 kHvpOq/OjK6ysW9Mz9sksSLuftRowU+M/XSD5auWFruzs+MttLNgKNQ+42pc+8/zaQWqqrWsIqm
 rTNN6OWSBX2S9AXzHQrGuye7rAP7yNqGKkz49WYveJ7BuIwOumJ1qYjSXZ6ivJotKM30t7m3IuC
 nFvuH4vEiySlwwuD7OyQLZI5Zc5WQC0TdoFhLKX/170qukRMqF5jK9ngyp750FYG7zK71N2lU5A
 cdKGTDKtlqjjQuKRQBcEFzzYW037RMl2AedyC9A5V0SNMvMe
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Now that the API is available, let's make use of it. It also handles the
reinitialization of DWC non-sticky registers in addition to sending the
notification to EPF drivers.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 2fb8c15e7a91..4e45bc4bca45 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -640,7 +640,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
 	if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
 		dev_dbg(dev, "Received Linkdown event\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_DOWN;
-		pci_epc_linkdown(pci->ep.epc);
+		dw_pcie_ep_linkdown(&pci->ep);
 	} else if (FIELD_GET(PARF_INT_ALL_BME, status)) {
 		dev_dbg(dev, "Received BME event. Link is enabled!\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_ENABLED;

-- 
2.25.1


