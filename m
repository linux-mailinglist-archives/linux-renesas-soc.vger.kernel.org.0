Return-Path: <linux-renesas-soc+bounces-3169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0944A8673E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 12:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BBFDB287C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 11:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082D34F5FC;
	Mon, 26 Feb 2024 11:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o7NmKcXs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419234F1E3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 11:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708947501; cv=none; b=lH5fx09bUFIYZ/HAGLjJS6AJ2rstzqWar84bj+ITw7Y/bdvalgpxBf4oX0yOWisAycNfGDV9cG1fM/CrU+dHaz4XVLn0JVAiXOG0+yjrQ9P0mQKUop+zkkdhoh3antixafxD7wHATOYpaazn2i+YxCz9vjzAmHqXlDjED4J8/pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708947501; c=relaxed/simple;
	bh=rySUPOYrv9T+HZDbsprHAcPFbuAMziJaAQnsy9yh8Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AjoosNCI+mwEj4tW79bFF6bI60QIVCGNCpFu3NpTxmkNNx2hHmogtjdgOl8beiTFHyDNdq7oKideZOJYsbbnaXoTLDZN7+khwJy2QE6DxzWOh/2C5p5CQyYTD1RxcSBVu14A3rn9HCGe5uB21EUodllPrViLGfx3UIFoDuef+RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o7NmKcXs; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7810827e54eso244519285a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 03:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708947498; x=1709552298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+w+dz2LhhxLyj9g/T/Ynx7ET7ucJXKJT/WmnsqQcygw=;
        b=o7NmKcXszo+BqMNkU9Yb3xrTXkDX4fAEdnEZQ//UJo/OzdBqck2rYONAcgwvM+/09N
         cJLtfzO3Mzij4Cu0GxRVeIKtVNYqISFky24J+yLyJNbHk2hRA52qPMe+3pgH3G879nxE
         OA+mz8uQHU6IZfJWTALqVsYN6Gj1UlArV1mhdIRm35GKTF19Ljsih9QuDIWsCLD2J+o4
         JSBblX61IwUySiMuFveSy6pFiUCXH7uhWYyMek8nizWa27xoWPbMfLYcN+tGJMQiT3p1
         UboOwcvt73CmDcmpkiLglqwZzxmauIL2VTCLJzipwPj7HjPcJ3rnSo6JLLOkG0qOJEXj
         N8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947498; x=1709552298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+w+dz2LhhxLyj9g/T/Ynx7ET7ucJXKJT/WmnsqQcygw=;
        b=S1akAFpYja3U3dw7Px45r6f1F8hN8uOPkbZijZuym7EaZOPj77NWUXMseNHwluSZd1
         qUC4/hD31muBA00n9WvdJBntCL0RRitoezgZIUFCS/GRm+YBqhHsm94wJD/kH8o8xkCg
         qQICR5NVbsKkEDISd7Rwr5n+p+DbBPVtovAc7whqKBajhHfaN/5B1tFK4u2vbVkgjl/B
         oOfbFhOqKIruN9MqJZpTeEL/uV3UL3aUEtf+EjzBwPeoaaujYZBppQhnx1+0KwO+Hm0Y
         lopj/3gnUeIPDbkVYLhx70l2oC8m6UZhSiwT2KOFalKLpfe7kw6eakpSBqMbBDhZB7+J
         6VDw==
X-Forwarded-Encrypted: i=1; AJvYcCVw6b2feSH0VU01cuBkNTyI00Gyv49xZRt5hoYuYZtz0f1hpScADcZwrbp4ZTEfjgusbUOQdHwtBk5brGTQhXR2azkpXDB3ngCttZrvZTGOBok=
X-Gm-Message-State: AOJu0Yy1wLkwxcIvDoR7y6zkQLlN8ZfdyH/IdFyJ5O0P+7BhcdnB4wEK
	qoIRFmrYdYi84rAJui8KUnffot0NhsX2ZHcE+4+5MOEh5JZ40ZTXduQ2yGEvPQ==
X-Google-Smtp-Source: AGHT+IF7HmtMnaGrj80UYao6lQvALwBuMw8q3jvFf9UFrxEVWdxk0u5fePdkKkkBuQR3Or+GeX/gvw==
X-Received: by 2002:a05:620a:2014:b0:787:3769:d747 with SMTP id c20-20020a05620a201400b007873769d747mr6779105qka.59.1708947498204;
        Mon, 26 Feb 2024 03:38:18 -0800 (PST)
Received: from [127.0.1.1] ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id q15-20020a05620a0c8f00b007878babb96asm2341842qki.94.2024.02.26.03.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:38:17 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 26 Feb 2024 17:07:30 +0530
Subject: [PATCH v3 5/5] PCI: epf-mhi: Enable HDMA for SA8775P SoC
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-dw-hdma-v3-5-cfcb8171fc24@linaro.org>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
In-Reply-To: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
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
 Mrinmay Sarkar <quic_msarkar@quicinc.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=974;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=isUh7Dyx4QOFqnRUN5haG5ZOvquZ4WskKD+PqeTLyJ8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl3HgGRFaIIukjpQ+MlVp1t7r1KyH4o9t0giPf0
 ecjdOvjr4+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdx4BgAKCRBVnxHm/pHO
 9T0gB/wJn/wKQ4SsV6Ave0iIOFHg8ILRsYljtotpgZCkHh/5Kj1edf/8JHtagUfbFRpAG79lmH2
 O1MojHHi2V9sIKmQmUmcpuOTMRDxwbdCebgoSKNoHPArCydW0NeU4pzCKz9EE81+RlUR12fPoS/
 ZGPPGrolyRh6QD9wXY5iFzg3Yl3RNCEAC4lx3D4bFD3xbujKklIHTBHNUApv+5z8th9yggp7DRd
 sBP0G7dSjLssbgvE9DAsWGoXqVaz4aTH+jTEs9w1V1EuwHzla3+MJc2Sy0FL95Ga5Kdw3ZPRcLb
 k071qmHaETAfzo4PIDsL3SeyXE9Ic3T3xa5XDj6Fh1otg3tt
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

From: Mrinmay Sarkar <quic_msarkar@quicinc.com>

SA8775P SoC supports Hyper DMA (HDMA) DMA Engine present in the DWC IP. So,
let's enable it in the EPF driver so that the DMA Engine APIs can be used
for data transfer.

Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
[mani: reworded commit message]
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 2c54d80107cf..570c1d1fb12e 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -137,6 +137,7 @@ static const struct pci_epf_mhi_ep_info sa8775p_info = {
 	.epf_flags = PCI_BASE_ADDRESS_MEM_TYPE_32,
 	.msi_count = 32,
 	.mru = 0x8000,
+	.flags = MHI_EPF_USE_DMA,
 };
 
 struct pci_epf_mhi {

-- 
2.25.1


