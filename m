Return-Path: <linux-renesas-soc+bounces-30380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F83JfJoxWl1+AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 18:12:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E70E1338F2A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 18:12:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E773303779C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 16:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44ED141C305;
	Thu, 26 Mar 2026 16:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="stOtUva7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1760637755C;
	Thu, 26 Mar 2026 16:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774544223; cv=none; b=Sipp7yutThkkR1p9CI5lTupFlgy8dhuhLOZrF+E94vAtUI7NOhZqeuUhW4c+lqHNml17Q4DK8n4j/09hkryqAq4+n9YQt3a6sFAumlwQO4MuKEjYq0K6O3opmBEhzVLwYxudDOxqYsug4E/ANGCDnMDMgzOCdcsnCcGI0e2q5Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774544223; c=relaxed/simple;
	bh=tr+9fNAQNqGsuZCPn0EwTdspBeuzqbTTR89MFy19qdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kbh2mL7acsTf1wimDzFcxj0EM/cStLBcBhDABO0jMxxNrxg5bPny3+BCNO42Y4zL5hvjGJUrO2Y3W9bPb5p3PWBJOmG0VENyOgN3YhuzS+zIxNar7v+T7bAP6KaCe0anPnYepjxXN10gb56qwEGnRt/vVTTcaRcCzdDDkCpUQUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=stOtUva7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFC2C116C6;
	Thu, 26 Mar 2026 16:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774544222;
	bh=tr+9fNAQNqGsuZCPn0EwTdspBeuzqbTTR89MFy19qdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=stOtUva7Sd7FQSWNmcGkhGLZugI5j7Fu2CtWbWqq0feqBH45KJVj1SwSgjEtshfuA
	 u3XZes7NQeWH3mSRD0/1aqabnAxICLFxr028HePUwdbgtDlohLqz83XgB24EIwd+qj
	 iddlTgjMFbQfNG3wepAs+pEMfZbkgg0qKGvcrzkPcUtVZwC4QD9tWWFqzoHk1si/Bz
	 +GdPkwh4nzND9/SezB+7Zf5LDO9RAnXAqPmaPLhzUTamcxe/+8pIVwc288cmxAMrAu
	 W/yFu9VJhOcGYgL+3t2hCwnspKUbtsy6CetHnzGSHNpFoF4i4woC/hpijnDmE97JpU
	 DPDCLIctgg4IQ==
Date: Thu, 26 Mar 2026 22:26:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Pratyush Anand <pratyush.anand@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] PCI: dwc: Add multi-port controller support
Message-ID: <nokpoxfotjlirqs735sse3f5copimqwmd7fblegrcozkmpkgae@6bw6u3qazbme>
References: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30380-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,gmail.com,kernel.org,samsung.com,nxp.com,pengutronix.de,amlogic.com,linaro.org,baylibre.com,googlemail.com,sifive.com,maxlinear.com,renesas.com,glider.be,nvidia.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,n:email]
X-Rspamd-Queue-Id: E70E1338F2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 05, 2026 at 11:50:35AM +0530, Sumit Kumar wrote:
> This series adds support for multi-port PCIe controllers in the DesignWare
> driver. Currently, the driver only supports a single Root Port with
> controller-level properties, which doesn't work for multi-port controllers
> where each port may have different configurations.
> 
> This series introduces a per-port structure and parsing API that allows 
> each Root Port to be configured independently via pcie@N child nodes in
> device tree, while maintaining backward compatibility with existing 
> single-port bindings.
> 

This patch touches multiple host controller drivers. I'd appreciate if the
platform maintainers could test this series and give their tested-by tag to make
sure we don't regress.

- Mani

> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix error code preservation in dw_pcie_resume_noirq() to return actual
>   error from dw_pcie_wait_for_link() instead of hardcoded -ETIMEDOUT (Mani).
> - Initialize ret variable to -ENOENT in dw_pcie_parse_root_ports() (Mani).
> - dw_pcie_host_init(): Remove -ENOENT error skipping to make parsing
>   failures fatal for now, add TODO comment about making properties
>   optional later (Mani).
> - Link to v1: https://lore.kernel.org/r/20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com
> 
> ---
> Sumit Kumar (2):
>       PCI: API changes for multi-port controller support
>       PCI: dwc: Add multi-port controller support
> 
>  drivers/pci/controller/dwc/pci-exynos.c           |   4 +-
>  drivers/pci/controller/dwc/pci-imx6.c             |  15 +-
>  drivers/pci/controller/dwc/pci-meson.c            |   1 -
>  drivers/pci/controller/dwc/pcie-designware-host.c | 175 ++++++++++++++++++----
>  drivers/pci/controller/dwc/pcie-designware.c      |  32 ++--
>  drivers/pci/controller/dwc/pcie-designware.h      |  17 ++-
>  drivers/pci/controller/dwc/pcie-fu740.c           |   6 +-
>  drivers/pci/controller/dwc/pcie-intel-gw.c        |  13 +-
>  drivers/pci/controller/dwc/pcie-qcom-common.c     |   5 +-
>  drivers/pci/controller/dwc/pcie-qcom-ep.c         |   4 +-
>  drivers/pci/controller/dwc/pcie-qcom.c            |   4 +-
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  13 +-
>  drivers/pci/controller/dwc/pcie-spear13xx.c       |   5 +-
>  drivers/pci/controller/dwc/pcie-tegra194.c        |   4 +-
>  drivers/pci/of.c                                  |   6 +-
>  drivers/pci/pci.h                                 |   2 +
>  16 files changed, 232 insertions(+), 74 deletions(-)
> ---
> base-commit: 097a6c336d0080725c626fda118ecfec448acd0f
> change-id: 20251010-dt-parser-98b50ce18fc1
> 
> Best regards,
> -- 
> Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

