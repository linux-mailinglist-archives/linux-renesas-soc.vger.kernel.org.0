Return-Path: <linux-renesas-soc+bounces-29416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LjGI4Tgtmn2JwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 17:38:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5280C2917B9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 17:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C10FB300CFD4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 16:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFC4372EE0;
	Sun, 15 Mar 2026 16:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODlndx/l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A972B9BA;
	Sun, 15 Mar 2026 16:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773592705; cv=none; b=EOS0JoSO64qvDMxhTdmbrhB8PpLJgqmI/ww6SIiVC2brXtI2or3hrO9QGF4DI3VtDm4VHAPiz5gRtgGeuMBNamRB7cKTpgvFIOzz75Ojz5stm2EA/OWcWW3hUhhZdtwK7HCsZmxVm/1UofPih+L1kHOdl7rMu+stcWXTG1mRLlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773592705; c=relaxed/simple;
	bh=WrNeMYsAA03DHVECs98FC7knzVMNjLmWyKvwlzN4Krw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHBmT8NL4pQcHhjEgl4wif5HRLz1rz23MlvfmD2CyOsax86i3au41AN+3WAcgkz/QzCkwAWXAktLTbyf3na7CePt0jcjXeLxILJ3+ucdZvt3pwfPl2vMrcEOUkk5fH7cYyLam550l6b5kLGqkRv9RdYF8KZ0a+dz8Pipu32RQ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODlndx/l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A308C4CEF7;
	Sun, 15 Mar 2026 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773592705;
	bh=WrNeMYsAA03DHVECs98FC7knzVMNjLmWyKvwlzN4Krw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ODlndx/l2BTSbPjRspV9GLT7+5T3/4XNm1uJzTAR5k+bHedYGFbm7JcgrzbAMgwWW
	 h3t+0iwi22VFwi/vk45Kz2w9HYLdExgXOq8xBGIQKNkp/kZKGRqwYWpyQfSimyVgB7
	 WrKPZMlYKJl6FxwhgiR9lK+Hi0KC8ofixzUzYoWcVFS2xLl6FqTtVBCdp6trj9wHFZ
	 G1cjoMWJmWsNxRMB0F4r6FJFjTbPCymS+hka/0zDBbmt7PBcrnAvIG9To3of5IcfVp
	 JWhdazvUhIMZ2QhFYQA0dxWVuzXyQyBnyelMGJ1ME9cZe/XmLRTuJJVXnFz+VDnPI7
	 1D2bXfJj7EFFg==
Date: Sun, 15 Mar 2026 22:08:06 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
	Jesper Nilsson <jesper.nilsson@axis.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Srikanth Thokala <srikanth.thokala@intel.com>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Manikanta Maddireddy <mmaddireddy@nvidia.com>, Koichiro Den <den@valinux.co.jp>, 
	Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 00/10] PCI: endpoint: Differentiate between disabled
 and reserved BARs
Message-ID: <skfqxnugt4t7eidfny5ojczq3wpu4u5yjfd6wdk3ikjmbgru7t@63nfqvrl5mvs>
References: <20260312130229.2282001-12-cassel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260312130229.2282001-12-cassel@kernel.org>
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
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,linuxfoundation.org,ti.com,google.com,nxp.com,pengutronix.de,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,valinux.co.jp,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-29416-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5280C2917B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 02:02:28PM +0100, Niklas Cassel wrote:
> Hello all,
> 
> This series was originally written in response to the patch series from
> Manikanta Maddireddy that was posted here:
> https://lore.kernel.org/linux-pci/291dab65-3fa6-4fc8-90a2-4ad608ca015c@nvidia.com/T/#t
> 
> Manikanta has reviewed this series and will send a small series on top of
> this one.
> 

Applied to pci/endpoint, thanks!

- Mani

> 
> Changes since v3:
> -Modified patch 1 to simply drop BAR_RESERVED for a BAR following an
>  only_64bit BAR (Manivannan).
> -Added a patch from Manikanta, to make his follow-up series smaller,
>  since this series touches the same lines anyway.
> 
> Link to v3:
> https://lore.kernel.org/linux-pci/20260302095913.48155-11-cassel@kernel.org/
> 
> 
> Koichiro Den (2):
>   PCI: endpoint: Describe reserved subregions within BARs
>   PCI: dw-rockchip: Describe RK3588 BAR4 DMA ctrl window
> 
> Manikanta Maddireddy (1):
>   PCI: endpoint: Allow only_64bit on BAR_RESERVED
> 
> Niklas Cassel (7):
>   PCI: endpoint: Do not mark the BAR succeeding a 64-bit BAR as
>     BAR_RESERVED
>   PCI: endpoint: Introduce pci_epc_bar_type BAR_DISABLED
>   PCI: dwc: Replace certain BAR_RESERVED with BAR_DISABLED in glue
>     drivers
>   PCI: dwc: Disable BARs in common code instead of in each glue driver
>   PCI: endpoint: pci-epf-test: Advertise reserved BARs
>   misc: pci_endpoint_test: Give reserved BARs a distinct error code
>   selftests: pci_endpoint: Skip reserved BARs
> 
>  drivers/misc/pci_endpoint_test.c              | 21 ++++++++-
>  drivers/pci/controller/dwc/pci-dra7xx.c       |  4 --
>  drivers/pci/controller/dwc/pci-imx6.c         | 22 +++------
>  drivers/pci/controller/dwc/pci-keystone.c     | 12 +++++
>  .../pci/controller/dwc/pci-layerscape-ep.c    |  6 ---
>  drivers/pci/controller/dwc/pcie-artpec6.c     |  4 --
>  .../pci/controller/dwc/pcie-designware-ep.c   | 24 ++++++++++
>  .../pci/controller/dwc/pcie-designware-plat.c | 10 ----
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 23 ++++++----
>  drivers/pci/controller/dwc/pcie-keembay.c     |  3 --
>  drivers/pci/controller/dwc/pcie-qcom-ep.c     | 12 -----
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 16 ++-----
>  drivers/pci/controller/dwc/pcie-stm32-ep.c    | 10 ----
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 19 ++------
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c | 19 +-------
>  drivers/pci/controller/pcie-rcar-ep.c         |  3 --
>  drivers/pci/endpoint/functions/pci-epf-test.c | 24 ++++++++++
>  drivers/pci/endpoint/pci-epc-core.c           |  5 +-
>  include/linux/pci-epc.h                       | 46 +++++++++++++++----
>  .../pci_endpoint/pci_endpoint_test.c          |  4 ++
>  20 files changed, 154 insertions(+), 133 deletions(-)
> 
> 
> base-commit: 0b74f7d72399d4c4422ed3d68ef28b3612f71e74
> -- 
> 2.53.0
> 

-- 
மணிவண்ணன் சதாசிவம்

