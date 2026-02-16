Return-Path: <linux-renesas-soc+bounces-28260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBnTAog6k2mV2gEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 16:40:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A874145B6C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 16:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 747593038A4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 15:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC6B33123C;
	Mon, 16 Feb 2026 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGWiOZKp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A668531195B;
	Mon, 16 Feb 2026 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771256170; cv=none; b=Y2ExrXwuybXYofCJWTvI8g5b5kQuUAdGiEiZFvgtQIDug9zC0QV6o10vhuMmDi3kdHgnCkbcu0PUmD6vgVK5YUL1k2t827djbqA6IIjnb/tVQ2jTnpFHKCLUn3R70dpikR3JCKBdNX0/gfHKwhdUXZmKvkO1t2qCpZZAFLNrGPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771256170; c=relaxed/simple;
	bh=oHPLw2/QBa0tOYo+6wZXHwiQUno5nMJSwU1uEe4E59I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCXQOBw+cRl29v8eWqLpOI7YpX+Qg2tNh81EHYoxmCL/EGG+1O3/TUpUGnOaNNXKdEwj/Uqmp9E990Gt44GoKbtyU9m0sYU98rOqwhQA8jPCOd8H1HG69AJKLhT/rkmuUY6/kPRYiqf+3M7WjtWiCmoCyDt1Je8P938PJM8FAEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGWiOZKp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A913C19424;
	Mon, 16 Feb 2026 15:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771256170;
	bh=oHPLw2/QBa0tOYo+6wZXHwiQUno5nMJSwU1uEe4E59I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LGWiOZKpfsawgJlzIQ+ve9jrm1mjzyRjGDhY95Ftv2Dqfqo71Z126BNFKVUu7k1+1
	 ruFeMHVeD3E43zyuAoV+x7UO3G+EgE3iXBILvyijRoemyy8n3JNtsAH+C0J8YmV8Ut
	 pP9UGk7a0DftEQkl/QLem6u3Ii0ULC8B/INJ0JTVUISmDgZapBcl4Ht2q94c1Y3wNe
	 Fek5nDLxnOGQ6MTj/krGEXGFmyDZttpDp7MtNhOrDrqb4fyMW2mZnZC1QJe562XSef
	 gXlCOmiuU5b1YBu6XSXDDDemC+xyY9ABHKgyastFFFAQwp50LTSmQ/SnMdUc0PPBx/
	 /PQtjGq6dsrMQ==
Date: Mon, 16 Feb 2026 21:05:46 +0530
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
Subject: Re: [PATCH 2/2] PCI: dwc: Add multi-port controller support
Message-ID: <c3aes3z2scnzlsa56qhzlcoizvbejmpmzi2mesi56hnvskkmio@lqxqyfdtwozi>
References: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
 <20260105-dt-parser-v1-2-b11c63cb5e2c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105-dt-parser-v1-2-b11c63cb5e2c@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28260-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[40];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,gmail.com,kernel.org,samsung.com,nxp.com,pengutronix.de,amlogic.com,linaro.org,baylibre.com,googlemail.com,sifive.com,maxlinear.com,renesas.com,glider.be,nvidia.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,n:email]
X-Rspamd-Queue-Id: 5A874145B6C
X-Rspamd-Action: no action

On Mon, Jan 05, 2026 at 05:57:55PM +0530, Sumit Kumar wrote:
> The current DesignWare PCIe RC implementation supports only the controller
> (Host Bridge) node for specifying the Root Port properties in an assumption
> that the underlying platform only supports a single root Port per
> controller instance. This limits support for multi-port controllers where
> different ports may have different lane configurations and speed limits.
> 
> Introduce a separate dw_pcie_port structure to enable multi-port support.
> Each Root Port can have independent lane count, speed limit through pcie@N
> child nodes in device tree. Add dw_pcie_parse_root_ports()
> API to parse these child nodes.
> 
> Equalization presets and link width detection currently use common DBI
> space for all the root ports. Per-port DBI space assignment for these
> features will be added in future.
> 
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pci-exynos.c           |   4 +-
>  drivers/pci/controller/dwc/pci-imx6.c             |  15 +-
>  drivers/pci/controller/dwc/pci-meson.c            |   1 -
>  drivers/pci/controller/dwc/pcie-designware-host.c | 168 ++++++++++++++++++----
>  drivers/pci/controller/dwc/pcie-designware.c      |  32 ++---
>  drivers/pci/controller/dwc/pcie-designware.h      |  17 ++-
>  drivers/pci/controller/dwc/pcie-fu740.c           |   6 +-
>  drivers/pci/controller/dwc/pcie-intel-gw.c        |  13 +-
>  drivers/pci/controller/dwc/pcie-qcom-common.c     |   5 +-
>  drivers/pci/controller/dwc/pcie-qcom-ep.c         |   4 +-
>  drivers/pci/controller/dwc/pcie-qcom.c            |   4 +-
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  13 +-
>  drivers/pci/controller/dwc/pcie-spear13xx.c       |   5 +-
>  drivers/pci/controller/dwc/pcie-tegra194.c        |   4 +-
>  14 files changed, 220 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
> index 1f0e98d07109353e7321667e98ead2695151184c..af991a14b52792d2376fd30875854c46fd65155a 100644
> --- a/drivers/pci/controller/dwc/pci-exynos.c
> +++ b/drivers/pci/controller/dwc/pci-exynos.c
> @@ -358,6 +358,8 @@ static int exynos_pcie_resume_noirq(struct device *dev)
>  	struct exynos_pcie *ep = dev_get_drvdata(dev);
>  	struct dw_pcie *pci = &ep->pci;
>  	struct dw_pcie_rp *pp = &pci->pp;
> +	struct dw_pcie_port *port = list_first_entry(&pci->pp.ports,
> +						struct dw_pcie_port, list);
>  	int ret;
>  
>  	ret = regulator_bulk_enable(ARRAY_SIZE(ep->supplies), ep->supplies);
> @@ -368,7 +370,7 @@ static int exynos_pcie_resume_noirq(struct device *dev)
>  	exynos_pcie_host_init(pp);
>  	dw_pcie_setup_rc(pp);
>  	exynos_pcie_start_link(pci);
> -	return dw_pcie_wait_for_link(pci);
> +	return dw_pcie_wait_for_link(pci, port);
>  }
>  
>  static const struct dev_pm_ops exynos_pcie_pm_ops = {
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 80e48746bbaf6815d8b9e879be5fa0bb992d9189..107367b72afc937daf26305dea2b5ad9ce3f86ae 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -939,6 +939,8 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  	struct imx_pcie *imx_pcie = to_imx_pcie(pci);
>  	struct device *dev = pci->dev;
>  	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	struct dw_pcie_port *port = list_first_entry(&pci->pp.ports,
> +						struct dw_pcie_port, list);
>  	u32 tmp;
>  	int ret;
>  
> @@ -963,8 +965,8 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  	/* Start LTSSM. */
>  	imx_pcie_ltssm_enable(dev);
>  
> -	if (pci->max_link_speed > 1) {
> -		ret = dw_pcie_wait_for_link(pci);
> +	if (port->max_link_speed > 1) {
> +		ret = dw_pcie_wait_for_link(pci, port);
>  		if (ret)
>  			goto err_reset_phy;
>  
> @@ -972,7 +974,7 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  		dw_pcie_dbi_ro_wr_en(pci);
>  		tmp = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
>  		tmp &= ~PCI_EXP_LNKCAP_SLS;
> -		tmp |= pci->max_link_speed;
> +		tmp |= port->max_link_speed;
>  		dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, tmp);
>  
>  		/*
> @@ -1605,6 +1607,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	struct dw_pcie *pci;
>  	struct imx_pcie *imx_pcie;
>  	struct device_node *np;
> +	struct dw_pcie_port *port;
>  	struct device_node *node = dev->of_node;
>  	int ret, domain;
>  	u16 val;
> @@ -1741,9 +1744,9 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  				 &imx_pcie->tx_swing_low))
>  		imx_pcie->tx_swing_low = 127;
>  
> -	/* Limit link speed */
> -	pci->max_link_speed = 1;
> -	of_property_read_u32(node, "fsl,max-link-speed", &pci->max_link_speed);
> +	port = list_first_entry(&pci->pp.ports, struct dw_pcie_port, list);
> +	port->max_link_speed = 1;
> +	of_property_read_u32(node, "fsl,max-link-speed", &port->max_link_speed);
>  
>  	imx_pcie->vpcie = devm_regulator_get_optional(&pdev->dev, "vpcie");
>  	if (IS_ERR(imx_pcie->vpcie)) {
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index 787469d1b396d4c7b3e28edfe276b7b997fb8aee..45d855e72e8479432c66b5c00a9755163ecd2741 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -411,7 +411,6 @@ static int meson_pcie_probe(struct platform_device *pdev)
>  	pci->dev = dev;
>  	pci->ops = &dw_pcie_ops;
>  	pci->pp.ops = &meson_pcie_host_ops;
> -	pci->num_lanes = 1;
>  
>  	mp->phy = devm_phy_get(dev, "pcie");
>  	if (IS_ERR(mp->phy)) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 952f8594b501254d2b2de5d5e056e16d2aa8d4b7..a864b90bd51ce475a2fd7de83573cf3ddea196e7 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -456,11 +456,86 @@ static int dw_pcie_host_get_resources(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static int dw_pcie_parse_root_ports(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct dw_pcie_port *port, *tmp;
> +	struct device *dev = pci->dev;
> +	int max_link_speed;
> +	u32 num_lanes;
> +	int ret;

Should this be initialized to -ENOENT?

> +
> +	if (!of_get_available_child_count(dev->of_node)) {
> +		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> +		if (!port)
> +			return -ENOMEM;
> +
> +		port->dev_node = dev->of_node;
> +		list_add_tail(&port->list, &pp->ports);
> +
> +		return 0;
> +	}
> +
> +	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
> +		num_lanes = 0;
> +		max_link_speed = 0;
> +		of_property_read_u32(of_port, "num-lanes", &num_lanes);
> +		max_link_speed = of_pci_get_max_link_speed(of_port);
> +
> +		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> +		if (!port) {
> +			ret = -ENOMEM;
> +			goto err_port_del;
> +		}
> +
> +		port->dev_node = of_port;
> +		port->num_lanes = num_lanes;
> +		port->max_link_speed = max_link_speed;
> +		list_add_tail(&port->list, &pp->ports);
> +	}
> +
> +	return 0;
> +
> +err_port_del:
> +	list_for_each_entry_safe(port, tmp, &pp->ports, list)
> +		list_del(&port->list);
> +
> +	return ret;
> +}
> +
> +static int dw_pcie_parse_legacy_binding(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct device *dev = pci->dev;
> +	struct dw_pcie_port *port;
> +	int max_link_speed;
> +	u32 num_lanes;
> +	int ret;
> +
> +	ret = of_property_read_u32(dev->of_node, "num-lanes", &num_lanes);
> +	max_link_speed = of_pci_get_max_link_speed(dev->of_node);
> +
> +	if (ret && max_link_speed <= 0)
> +		return -ENOENT;
> +
> +	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	port->dev_node = dev->of_node;
> +	port->num_lanes = num_lanes;
> +	port->max_link_speed = max_link_speed;
> +	list_add_tail(&port->list, &pp->ports);
> +
> +	return 0;
> +}
> +
>  int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>  	struct device *dev = pci->dev;
>  	struct device_node *np = dev->of_node;
> +	struct dw_pcie_port *port, *tmp;
>  	struct pci_host_bridge *bridge;
>  	int ret;
>  
> @@ -472,6 +547,8 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  
>  	pp->bridge = bridge;
>  
> +	INIT_LIST_HEAD(&pp->ports);
> +
>  	ret = dw_pcie_host_get_resources(pp);
>  	if (ret)
>  		return ret;
> @@ -480,10 +557,25 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	bridge->ops = &dw_pcie_ops;
>  	bridge->child_ops = &dw_child_pcie_ops;
>  
> +	/*
> +	 * Try to parse legacy binding first (properties in Host Bridge node).
> +	 * If not found, try parsing Root Port child nodes.
> +	 */
> +	ret = dw_pcie_parse_legacy_binding(pp);
> +	if (ret == -ENOENT) {
> +		ret = dw_pcie_parse_root_ports(pp);
> +		if (ret && ret != -ENOENT) {

Skipping -ENOENT failure is OK at this point since this driver only parses the
optional properties like 'num-lanes'... But once the code gets extended to parse
non-optional ones like PHYs in the future skipping might become problematic.
Maybe we should treat those properties as optional then.

> +			dev_err(dev, "Failed to parse Root Port: %d\n", ret);
> +			return ret;
> +		}
> +	} else if (ret) {
> +		return ret;
> +	}
> +
>  	if (pp->ops->init) {
>  		ret = pp->ops->init(pp);
>  		if (ret)
> -			return ret;
> +			goto err_cleanup_ports;
>  	}
>  
>  	if (pci_msi_enabled()) {
> @@ -518,12 +610,15 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  
>  	dw_pcie_iatu_detect(pci);
>  
> -	if (pci->num_lanes < 1)
> -		pci->num_lanes = dw_pcie_link_get_max_link_width(pci);
> +	list_for_each_entry(port, &pp->ports, list) {
> +		if (port->num_lanes < 1)
> +			port->num_lanes = dw_pcie_link_get_max_link_width(pci, port);
>  
> -	ret = of_pci_get_equalization_presets(dev, &pp->presets, pci->num_lanes);
> -	if (ret)
> -		goto err_free_msi;
> +		ret = of_pci_get_equalization_presets(dev, port->dev_node,
> +						      &port->presets, port->num_lanes);
> +		if (ret)
> +			goto err_free_msi;
> +	}
>  
>  	/*
>  	 * Allocate the resource for MSG TLP before programming the iATU
> @@ -557,8 +652,8 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	 * because that would require users to manually rescan for devices.
>  	 */
>  	if (!pp->use_linkup_irq)
> -		/* Ignore errors, the link may come up later */
> -		dw_pcie_wait_for_link(pci);
> +		list_for_each_entry(port, &pp->ports, list)
> +			dw_pcie_wait_for_link(pci, port);
>  
>  	bridge->sysdata = pp;
>  
> @@ -586,6 +681,9 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  err_deinit_host:
>  	if (pp->ops->deinit)
>  		pp->ops->deinit(pp);
> +err_cleanup_ports:
> +	list_for_each_entry_safe(port, tmp, &pp->ports, list)
> +		list_del(&port->list);
>  
>  	return ret;
>  }
> @@ -594,6 +692,7 @@ EXPORT_SYMBOL_GPL(dw_pcie_host_init);
>  void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct dw_pcie_port *port, *tmp;
>  
>  	dwc_pcie_debugfs_deinit(pci);
>  
> @@ -607,6 +706,9 @@ void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
>  	if (pp->has_msi_ctrl)
>  		dw_pcie_free_msi(pp);
>  
> +	list_for_each_entry_safe(port, tmp, &pp->ports, list)
> +		list_del(&port->list);
> +
>  	if (pp->ops->deinit)
>  		pp->ops->deinit(pp);
>  }
> @@ -830,7 +932,9 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> -static void dw_pcie_program_presets(struct dw_pcie_rp *pp, enum pci_bus_speed speed)
> +/*TODO: Handling preset values according to dbi space of each port */
> +static void dw_pcie_program_presets(struct dw_pcie_rp *pp, struct dw_pcie_port *port,
> +				    enum pci_bus_speed speed)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>  	u8 lane_eq_offset, lane_reg_size, cap_id;
> @@ -839,23 +943,23 @@ static void dw_pcie_program_presets(struct dw_pcie_rp *pp, enum pci_bus_speed sp
>  	int i;
>  
>  	if (speed == PCIE_SPEED_8_0GT) {
> -		presets = (u8 *)pp->presets.eq_presets_8gts;
> +		presets = (u8 *)port->presets.eq_presets_8gts;
>  		lane_eq_offset =  PCI_SECPCI_LE_CTRL;
>  		cap_id = PCI_EXT_CAP_ID_SECPCI;
>  		/* For data rate of 8 GT/S each lane equalization control is 16bits wide*/
>  		lane_reg_size = 0x2;
>  	} else if (speed == PCIE_SPEED_16_0GT) {
> -		presets = pp->presets.eq_presets_Ngts[EQ_PRESET_TYPE_16GTS - 1];
> +		presets = port->presets.eq_presets_Ngts[EQ_PRESET_TYPE_16GTS - 1];
>  		lane_eq_offset = PCI_PL_16GT_LE_CTRL;
>  		cap_id = PCI_EXT_CAP_ID_PL_16GT;
>  		lane_reg_size = 0x1;
>  	} else if (speed == PCIE_SPEED_32_0GT) {
> -		presets =  pp->presets.eq_presets_Ngts[EQ_PRESET_TYPE_32GTS - 1];
> +		presets =  port->presets.eq_presets_Ngts[EQ_PRESET_TYPE_32GTS - 1];
>  		lane_eq_offset = PCI_PL_32GT_LE_CTRL;
>  		cap_id = PCI_EXT_CAP_ID_PL_32GT;
>  		lane_reg_size = 0x1;
>  	} else if (speed == PCIE_SPEED_64_0GT) {
> -		presets =  pp->presets.eq_presets_Ngts[EQ_PRESET_TYPE_64GTS - 1];
> +		presets =  port->presets.eq_presets_Ngts[EQ_PRESET_TYPE_64GTS - 1];
>  		lane_eq_offset = PCI_PL_64GT_LE_CTRL;
>  		cap_id = PCI_EXT_CAP_ID_PL_64GT;
>  		lane_reg_size = 0x1;
> @@ -874,31 +978,38 @@ static void dw_pcie_program_presets(struct dw_pcie_rp *pp, enum pci_bus_speed sp
>  	 * Write preset values to the registers byte-by-byte for the given
>  	 * number of lanes and register size.
>  	 */
> -	for (i = 0; i < pci->num_lanes * lane_reg_size; i++)
> +	for (i = 0; i < port->num_lanes * lane_reg_size; i++)
>  		dw_pcie_writeb_dbi(pci, cap + lane_eq_offset + i, presets[i]);
>  }
>  
>  static void dw_pcie_config_presets(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> -	enum pci_bus_speed speed = pcie_link_speed[pci->max_link_speed];
> +	enum pci_bus_speed port_speed;
> +	struct dw_pcie_port *port;
>  
>  	/*
> -	 * Lane equalization settings need to be applied for all data rates the
> -	 * controller supports and for all supported lanes.
> +	 * Lane equalization settings need to be applied for all data rates each
> +	 * port supports and for all supported lanes per port.
>  	 */
> +	list_for_each_entry(port, &pp->ports, list) {
> +		if (port->max_link_speed > 0)
> +			port_speed = pcie_link_speed[port->max_link_speed];
> +		else
> +			port_speed = PCIE_SPEED_2_5GT;
>  
> -	if (speed >= PCIE_SPEED_8_0GT)
> -		dw_pcie_program_presets(pp, PCIE_SPEED_8_0GT);
> +		if (port_speed >= PCIE_SPEED_8_0GT)
> +			dw_pcie_program_presets(pp, port, PCIE_SPEED_8_0GT);
>  
> -	if (speed >= PCIE_SPEED_16_0GT)
> -		dw_pcie_program_presets(pp, PCIE_SPEED_16_0GT);
> +		if (port_speed >= PCIE_SPEED_16_0GT)
> +			dw_pcie_program_presets(pp, port, PCIE_SPEED_16_0GT);
>  
> -	if (speed >= PCIE_SPEED_32_0GT)
> -		dw_pcie_program_presets(pp, PCIE_SPEED_32_0GT);
> +		if (port_speed >= PCIE_SPEED_32_0GT)
> +			dw_pcie_program_presets(pp, port, PCIE_SPEED_32_0GT);
>  
> -	if (speed >= PCIE_SPEED_64_0GT)
> -		dw_pcie_program_presets(pp, PCIE_SPEED_64_0GT);
> +		if (port_speed >= PCIE_SPEED_64_0GT)
> +			dw_pcie_program_presets(pp, port, PCIE_SPEED_64_0GT);
> +	}
>  }
>  
>  int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
> @@ -1054,6 +1165,7 @@ EXPORT_SYMBOL_GPL(dw_pcie_suspend_noirq);
>  
>  int dw_pcie_resume_noirq(struct dw_pcie *pci)
>  {
> +	struct dw_pcie_port *port;
>  	int ret;
>  
>  	if (!pci->suspended)
> @@ -1075,9 +1187,9 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
>  	if (ret)
>  		return ret;
>  
> -	ret = dw_pcie_wait_for_link(pci);
> -	if (ret)
> -		return ret;
> +	list_for_each_entry(port, &pci->pp.ports, list)
> +		if (dw_pcie_wait_for_link(pci, port))
> +			return -ETIMEDOUT;

Why are you overriding the errno?

- Mani

>  
>  	return ret;
>  }
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 89aad5a08928cc29870ab258d33bee9ff8f83143..804f633874a7a33c7788e90ea45b529a5622060c 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -178,11 +178,6 @@ int dw_pcie_get_resources(struct dw_pcie *pci)
>  			return ret;
>  	}
>  
> -	if (pci->max_link_speed < 1)
> -		pci->max_link_speed = of_pci_get_max_link_speed(np);
> -
> -	of_property_read_u32(np, "num-lanes", &pci->num_lanes);
> -
>  	if (of_property_read_bool(np, "snps,enable-cdm-check"))
>  		dw_pcie_cap_set(pci, CDM_CHECK);
>  
> @@ -696,7 +691,7 @@ void dw_pcie_disable_atu(struct dw_pcie *pci, u32 dir, int index)
>  	dw_pcie_writel_atu(pci, dir, index, PCIE_ATU_REGION_CTRL2, 0);
>  }
>  
> -int dw_pcie_wait_for_link(struct dw_pcie *pci)
> +int dw_pcie_wait_for_link(struct dw_pcie *pci, struct dw_pcie_port *port)
>  {
>  	u32 offset, val;
>  	int retries;
> @@ -719,7 +714,7 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci)
>  	 * speeds greater than 5.0 GT/s, software must wait a minimum of 100 ms
>  	 * after Link training completes before sending a Configuration Request.
>  	 */
> -	if (pci->max_link_speed > 2)
> +	if (port && port->max_link_speed > 2)
>  		msleep(PCIE_RESET_CONFIG_WAIT_MS);
>  
>  	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> @@ -756,10 +751,11 @@ void dw_pcie_upconfig_setup(struct dw_pcie *pci)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_upconfig_setup);
>  
> -static void dw_pcie_link_set_max_speed(struct dw_pcie *pci)
> +static void dw_pcie_link_set_max_speed(struct dw_pcie *pci, struct dw_pcie_port *port)
>  {
>  	u32 cap, ctrl2, link_speed;
>  	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	int max_speed = port->max_link_speed;
>  
>  	cap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
>  
> @@ -768,15 +764,16 @@ static void dw_pcie_link_set_max_speed(struct dw_pcie *pci)
>  	 * just cache the hardware default value so that the vendor drivers can
>  	 * use it to do any link specific configuration.
>  	 */
> -	if (pci->max_link_speed < 1) {
> -		pci->max_link_speed = FIELD_GET(PCI_EXP_LNKCAP_SLS, cap);
> +	if (max_speed < 1) {
> +		max_speed = FIELD_GET(PCI_EXP_LNKCAP_SLS, cap);
> +		port->max_link_speed = max_speed;
>  		return;
>  	}
>  
>  	ctrl2 = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCTL2);
>  	ctrl2 &= ~PCI_EXP_LNKCTL2_TLS;
>  
> -	switch (pcie_link_speed[pci->max_link_speed]) {
> +	switch (pcie_link_speed[max_speed]) {
>  	case PCIE_SPEED_2_5GT:
>  		link_speed = PCI_EXP_LNKCTL2_TLS_2_5GT;
>  		break;
> @@ -800,10 +797,10 @@ static void dw_pcie_link_set_max_speed(struct dw_pcie *pci)
>  
>  	cap &= ~((u32)PCI_EXP_LNKCAP_SLS);
>  	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, cap | link_speed);
> -
>  }
>  
> -int dw_pcie_link_get_max_link_width(struct dw_pcie *pci)
> +/* TODO: Implement per-port max link width detection using port-specific DBI space */
> +int dw_pcie_link_get_max_link_width(struct dw_pcie *pci, struct dw_pcie_port *port)
>  {
>  	u8 cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>  	u32 lnkcap = dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCAP);
> @@ -1141,9 +1138,14 @@ void dw_pcie_edma_remove(struct dw_pcie *pci)
>  
>  void dw_pcie_setup(struct dw_pcie *pci)
>  {
> +	struct dw_pcie_port *port;
>  	u32 val;
>  
> -	dw_pcie_link_set_max_speed(pci);
> +	/* Configure per-port settings */
> +	list_for_each_entry(port, &pci->pp.ports, list) {
> +		dw_pcie_link_set_max_speed(pci, port);
> +		dw_pcie_link_set_max_link_width(pci, port->num_lanes);
> +	}
>  
>  	/* Configure Gen1 N_FTS */
>  	if (pci->n_fts[0]) {
> @@ -1173,8 +1175,6 @@ void dw_pcie_setup(struct dw_pcie *pci)
>  	val &= ~PORT_LINK_FAST_LINK_MODE;
>  	val |= PORT_LINK_DLL_LINK_EN;
>  	dw_pcie_writel_dbi(pci, PCIE_PORT_LINK_CONTROL, val);
> -
> -	dw_pcie_link_set_max_link_width(pci, pci->num_lanes);
>  }
>  
>  resource_size_t dw_pcie_parent_bus_offset(struct dw_pcie *pci,
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 00f52d472dcdd794013a865ad6c4c7cc251edb48..5ead9a40f0e91fb33d65d77cfa3cb61b19dceea7 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -18,6 +18,7 @@
>  #include <linux/dma/edma.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/irq.h>
> +#include <linux/list.h>
>  #include <linux/msi.h>
>  #include <linux/pci.h>
>  #include <linux/reset.h>
> @@ -392,6 +393,14 @@ struct dw_pcie_ob_atu_cfg {
>  	u64 size;
>  };
>  
> +struct dw_pcie_port {
> +	struct list_head	list;
> +	struct device_node	*dev_node;
> +	u32			num_lanes;
> +	int			max_link_speed;
> +	struct pci_eq_presets	presets;
> +};
> +
>  struct dw_pcie_host_ops {
>  	int (*init)(struct dw_pcie_rp *pp);
>  	void (*deinit)(struct dw_pcie_rp *pp);
> @@ -424,7 +433,7 @@ struct dw_pcie_rp {
>  	int			msg_atu_index;
>  	struct resource		*msg_res;
>  	bool			use_linkup_irq;
> -	struct pci_eq_presets	presets;
> +	struct list_head	ports;		/* List of dw_pcie_port structures */
>  };
>  
>  struct dw_pcie_ep_ops {
> @@ -505,8 +514,6 @@ struct dw_pcie {
>  	u32			version;
>  	u32			type;
>  	unsigned long		caps;
> -	int			num_lanes;
> -	int			max_link_speed;
>  	u8			n_fts[2];
>  	struct dw_edma_chip	edma;
>  	struct clk_bulk_data	app_clks[DW_PCIE_NUM_APP_CLKS];
> @@ -556,8 +563,8 @@ void dw_pcie_write_dbi(struct dw_pcie *pci, u32 reg, size_t size, u32 val);
>  void dw_pcie_write_dbi2(struct dw_pcie *pci, u32 reg, size_t size, u32 val);
>  bool dw_pcie_link_up(struct dw_pcie *pci);
>  void dw_pcie_upconfig_setup(struct dw_pcie *pci);
> -int dw_pcie_wait_for_link(struct dw_pcie *pci);
> -int dw_pcie_link_get_max_link_width(struct dw_pcie *pci);
> +int dw_pcie_wait_for_link(struct dw_pcie *pci, struct dw_pcie_port *port);
> +int dw_pcie_link_get_max_link_width(struct dw_pcie *pci, struct dw_pcie_port *port);
>  int dw_pcie_prog_outbound_atu(struct dw_pcie *pci,
>  			      const struct dw_pcie_ob_atu_cfg *atu);
>  int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int type,
> diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
> index 66367252032b84fd42c719287057471b1fe44e9a..39d9d2c8e1806dd805b669371ae4abc194469e57 100644
> --- a/drivers/pci/controller/dwc/pcie-fu740.c
> +++ b/drivers/pci/controller/dwc/pcie-fu740.c
> @@ -179,6 +179,8 @@ static int fu740_pcie_start_link(struct dw_pcie *pci)
>  {
>  	struct device *dev = pci->dev;
>  	struct fu740_pcie *afp = dev_get_drvdata(dev);
> +	struct dw_pcie_port *port = list_first_entry(&pci->pp.ports,
> +						struct dw_pcie_port, list);
>  	u8 cap_exp = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>  	int ret;
>  	u32 orig, tmp;
> @@ -202,7 +204,7 @@ static int fu740_pcie_start_link(struct dw_pcie *pci)
>  	/* Enable LTSSM */
>  	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_APP_LTSSM_ENABLE);
>  
> -	ret = dw_pcie_wait_for_link(pci);
> +	ret = dw_pcie_wait_for_link(pci, port);
>  	if (ret) {
>  		dev_err(dev, "error: link did not start\n");
>  		goto err;
> @@ -220,7 +222,7 @@ static int fu740_pcie_start_link(struct dw_pcie *pci)
>  		tmp |= PORT_LOGIC_SPEED_CHANGE;
>  		dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, tmp);
>  
> -		ret = dw_pcie_wait_for_link(pci);
> +		ret = dw_pcie_wait_for_link(pci, port);
>  		if (ret) {
>  			dev_err(dev, "error: link did not start at new speed\n");
>  			goto err;
> diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
> index c21906eced61896c8a8307dbd6b72d229f9a5c5f..565aaa3da635749c64693268a8e5c1a59e1f040e 100644
> --- a/drivers/pci/controller/dwc/pcie-intel-gw.c
> +++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
> @@ -131,7 +131,10 @@ static void intel_pcie_link_setup(struct intel_pcie *pcie)
>  
>  static void intel_pcie_init_n_fts(struct dw_pcie *pci)
>  {
> -	switch (pci->max_link_speed) {
> +	struct dw_pcie_port *port = list_first_entry(&pci->pp.ports,
> +							struct dw_pcie_port, list);
> +
> +	switch (port->max_link_speed) {
>  	case 3:
>  		pci->n_fts[1] = PORT_AFR_N_FTS_GEN3;
>  		break;
> @@ -250,8 +253,10 @@ static int intel_pcie_wait_l2(struct intel_pcie *pcie)
>  	u32 value;
>  	int ret;
>  	struct dw_pcie *pci = &pcie->pci;
> +	struct dw_pcie_port *port = list_first_entry(&pci->pp.ports,
> +						      struct dw_pcie_port, list);
>  
> -	if (pci->max_link_speed < 3)
> +	if (port->max_link_speed < 3)
>  		return 0;
>  
>  	/* Send PME_TURN_OFF message */
> @@ -282,6 +287,8 @@ static int intel_pcie_host_setup(struct intel_pcie *pcie)
>  {
>  	int ret;
>  	struct dw_pcie *pci = &pcie->pci;
> +	struct dw_pcie_port *port = list_first_entry(&pci->pp.ports,
> +						struct dw_pcie_port, list);
>  
>  	intel_pcie_core_rst_assert(pcie);
>  	intel_pcie_device_rst_assert(pcie);
> @@ -313,7 +320,7 @@ static int intel_pcie_host_setup(struct intel_pcie *pcie)
>  	intel_pcie_device_rst_deassert(pcie);
>  	intel_pcie_ltssm_enable(pcie);
>  
> -	ret = dw_pcie_wait_for_link(pci);
> +	ret = dw_pcie_wait_for_link(pci, port);
>  	if (ret)
>  		goto app_init_err;
>  
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-common.c b/drivers/pci/controller/dwc/pcie-qcom-common.c
> index 3aad19b56da8f6ea6525f1aad0102a4d8df0369b..2d0295bd0b377f158017f7dba7a64b88e1dd8f68 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-common.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-common.c
> @@ -49,6 +49,8 @@ EXPORT_SYMBOL_GPL(qcom_pcie_common_set_16gt_equalization);
>  void qcom_pcie_common_set_16gt_lane_margining(struct dw_pcie *pci)
>  {
>  	u32 reg;
> +	struct dw_pcie_port *port = list_first_entry(&pci->pp.ports,
> +					struct dw_pcie_port, list);
>  
>  	reg = dw_pcie_readl_dbi(pci, GEN4_LANE_MARGINING_1_OFF);
>  	reg &= ~(MARGINING_MAX_VOLTAGE_OFFSET |
> @@ -70,7 +72,8 @@ void qcom_pcie_common_set_16gt_lane_margining(struct dw_pcie *pci)
>  		MARGINING_MAXLANES |
>  		MARGINING_SAMPLE_RATE_TIMING |
>  		MARGINING_SAMPLE_RATE_VOLTAGE);
> -	reg |= FIELD_PREP(MARGINING_MAXLANES, pci->num_lanes) |
> +
> +	reg |= FIELD_PREP(MARGINING_MAXLANES, port->num_lanes) |
>  		FIELD_PREP(MARGINING_SAMPLE_RATE_TIMING, 0x3f) |
>  		FIELD_PREP(MARGINING_SAMPLE_RATE_VOLTAGE, 0x3f);
>  	dw_pcie_writel_dbi(pci, GEN4_LANE_MARGINING_2_OFF, reg);
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index bf7c6ac0f3e3962de8346ab6e75dfff1d9642aad..6812ab020b3bdb99733dc12a0615ea98a471da63 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -389,6 +389,8 @@ static void qcom_pcie_disable_resources(struct qcom_pcie_ep *pcie_ep)
>  
>  static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
>  {
> +	struct dw_pcie_port *port = list_first_entry(&pci->pp.ports,
> +					struct dw_pcie_port, list);
>  	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
>  	struct device *dev = pci->dev;
>  	u32 val, offset;
> @@ -511,7 +513,7 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
>  		goto err_disable_resources;
>  	}
>  
> -	if (pcie_link_speed[pci->max_link_speed] == PCIE_SPEED_16_0GT) {
> +	if (pcie_link_speed[port->max_link_speed] == PCIE_SPEED_16_0GT) {
>  		qcom_pcie_common_set_16gt_equalization(pci);
>  		qcom_pcie_common_set_16gt_lane_margining(pci);
>  	}
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 294babe1816e4d0c2b2343fe22d89af72afcd6cd..9690ab97cc01160a26034bf8026fe4dbafe48731 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -321,8 +321,10 @@ static void qcom_ep_reset_deassert(struct qcom_pcie *pcie)
>  static int qcom_pcie_start_link(struct dw_pcie *pci)
>  {
>  	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> +	struct dw_pcie_port *port = list_first_entry(&pci->pp.ports,
> +						      struct dw_pcie_port, list);
>  
> -	if (pcie_link_speed[pci->max_link_speed] == PCIE_SPEED_16_0GT) {
> +	if (pcie_link_speed[port->max_link_speed] == PCIE_SPEED_16_0GT) {
>  		qcom_pcie_common_set_16gt_equalization(pci);
>  		qcom_pcie_common_set_16gt_lane_margining(pci);
>  	}
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 18055807a4f5f9f1233097e1e47604a3555dccf0..f8c85984025a329b092c788dae270911aec9c51f 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -132,6 +132,8 @@ static int rcar_gen4_pcie_speed_change(struct dw_pcie *dw)
>  static int rcar_gen4_pcie_start_link(struct dw_pcie *dw)
>  {
>  	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
> +	struct dw_pcie_port *port = list_first_entry(&dw->pp.ports,
> +						struct dw_pcie_port, list);
>  	int i, changes, ret;
>  
>  	if (rcar->drvdata->ltssm_control) {
> @@ -144,7 +146,7 @@ static int rcar_gen4_pcie_start_link(struct dw_pcie *dw)
>  	 * Require direct speed change with retrying here if the max_link_speed
>  	 * is PCIe Gen2 or higher.
>  	 */
> -	changes = min_not_zero(dw->max_link_speed, RCAR_MAX_LINK_SPEED) - 1;
> +	changes = min_not_zero(port->max_link_speed, RCAR_MAX_LINK_SPEED) - 1;
>  
>  	/*
>  	 * Since dw_pcie_setup_rc() sets it once, PCIe Gen2 will be trained.
> @@ -173,6 +175,8 @@ static void rcar_gen4_pcie_stop_link(struct dw_pcie *dw)
>  static int rcar_gen4_pcie_common_init(struct rcar_gen4_pcie *rcar)
>  {
>  	struct dw_pcie *dw = &rcar->dw;
> +	struct dw_pcie_port *port = list_first_entry(&dw->pp.ports,
> +						struct dw_pcie_port, list);
>  	u32 val;
>  	int ret;
>  
> @@ -195,7 +199,7 @@ static int rcar_gen4_pcie_common_init(struct rcar_gen4_pcie *rcar)
>  		goto err_unprepare;
>  	}
>  
> -	if (dw->num_lanes < 4)
> +	if (port->num_lanes < 4)
>  		val |= BIFUR_MOD_SET_ON;
>  
>  	writel(val, rcar->base + PCIEMSR0);
> @@ -563,12 +567,15 @@ static int r8a779f0_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable)
>  static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
>  {
>  	struct dw_pcie *dw = &rcar->dw;
> +	struct dw_pcie_port *port = list_first_entry(&dw->pp.ports,
> +						struct dw_pcie_port, list);
>  	u32 val;
>  
>  	val = dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW);
>  	val &= ~PORT_LANE_SKEW_INSERT_MASK;
> -	if (dw->num_lanes < 4)
> +	if (port->num_lanes < 4)
>  		val |= BIT(6);
> +
>  	dw_pcie_writel_dbi(dw, PCIE_PORT_LANE_SKEW, val);
>  
>  	val = readl(rcar->base + PCIEPWRMNGCTRL);
> diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
> index 01794a9d3ad293419c9322ca53fe86036689b287..9221b37cc58ec75986bfc2898ab2879eee794cdc 100644
> --- a/drivers/pci/controller/dwc/pcie-spear13xx.c
> +++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
> @@ -191,6 +191,7 @@ static int spear13xx_pcie_probe(struct platform_device *pdev)
>  	struct dw_pcie *pci;
>  	struct spear13xx_pcie *spear13xx_pcie;
>  	struct device_node *np = dev->of_node;
> +	struct dw_pcie_port *port;
>  	int ret;
>  
>  	spear13xx_pcie = devm_kzalloc(dev, sizeof(*spear13xx_pcie), GFP_KERNEL);
> @@ -228,9 +229,9 @@ static int spear13xx_pcie_probe(struct platform_device *pdev)
>  		dev_err(dev, "couldn't enable clk for pcie\n");
>  		return ret;
>  	}
> -
> +	port = list_first_entry(&pci->pp.ports, struct dw_pcie_port, list);
>  	if (of_property_read_bool(np, "st,pcie-is-gen1"))
> -		pci->max_link_speed = 1;
> +		port->max_link_speed = 1;
>  
>  	platform_set_drvdata(pdev, spear13xx_pcie);
>  
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 4f26086f25daf8e23cafbb2b460e1934734f4103..7b82c2509e966404892a29691f7c21a27279b71f 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -957,6 +957,8 @@ static int tegra_pcie_dw_host_init(struct dw_pcie_rp *pp)
>  static int tegra_pcie_dw_start_link(struct dw_pcie *pci)
>  {
>  	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
> +	struct dw_pcie_port *port = list_first_entry(&pci->pp.ports,
> +						struct dw_pcie_port, list);
>  	struct dw_pcie_rp *pp = &pci->pp;
>  	u32 val, offset, tmp;
>  	bool retry = true;
> @@ -986,7 +988,7 @@ static int tegra_pcie_dw_start_link(struct dw_pcie *pci)
>  
>  	msleep(100);
>  
> -	if (dw_pcie_wait_for_link(pci)) {
> +	if (dw_pcie_wait_for_link(pci, port)) {
>  		if (!retry)
>  			return 0;
>  		/*
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

