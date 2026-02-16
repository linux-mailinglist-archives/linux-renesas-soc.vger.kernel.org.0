Return-Path: <linux-renesas-soc+bounces-28258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJcDI303k2mV2gEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 16:27:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD05145920
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 16:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 945803020D41
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 15:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F6C32570A;
	Mon, 16 Feb 2026 15:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVke98TK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D38632549E;
	Mon, 16 Feb 2026 15:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771255335; cv=none; b=V0mF8SoGHaaueXTuJH0k8DjkbWZ2b8FNXZBHik4Uu9tOXdoyWbVMyvGOK9pm8bKbgQcKR7lZIHtG8EpTBNfMk11Kv/anoqc+B0FNMR8/rLC1iQNnBmbr7Xd2JZIUqoMF8MZx1F9C41gWHwH8MsWM7+ubwSigp2BO62tPx2CEjfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771255335; c=relaxed/simple;
	bh=+AXEKgqENXU9fJ8gY4Qy3D4BbMROQCeB1cT+WULKFsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQfEJpr1qM0mevO7CbsEVhs0dVnktzMSnTMTQkOGdWqh+U9JM7M5fmgUlhvj2ByzTaJGXSxJqE22ndpv5j3/kwcf+LvQBkwBHUWzKsN8N+RGu+KTibkPUghhUL9vSXClfHHG/CzM3Q6y/fPnVEAvkkLXowtrg942XIs/LGszitE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVke98TK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B5FC116C6;
	Mon, 16 Feb 2026 15:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771255335;
	bh=+AXEKgqENXU9fJ8gY4Qy3D4BbMROQCeB1cT+WULKFsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bVke98TKQHCmPp7aYCSq+FzJJwd1N7cDuLhGNulVsi3kDISO5a7AJFBm3a7kNw1Zs
	 5Iw5iKyil96Yjb2kaa996XtcP99USdiZnGFwboQyf93SxLti2oOp6RGusQa6tt0bF4
	 0vFtMznN3MpwWhSDzdS8LxrL4xOzXYaj2wJ8GWUrAJQmsxB/Oz7vODRYewD2J5wMOt
	 n/r6PbRevelbv2CgDMGB0hBJqf0/kttTTaqCaKmPDvRwbv46S7eNobKjhJZnoznYuD
	 xBCbX73IzTj1XGCShRVaUjJ2yNu4RTgdTUiUhws1iLJYbGP9PhfuNu3gDI2EgmCiUz
	 8W3J0k0Pz4V9A==
Date: Mon, 16 Feb 2026 20:51:51 +0530
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
Subject: Re: [PATCH 1/2] PCI: API changes for multi-port controller support
Message-ID: <qoz2odrfe5w47ibjskg2fa3bkgtqd3ctkqqeua446sfjrc2e2m@tg4vynyonu3r>
References: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
 <20260105-dt-parser-v1-1-b11c63cb5e2c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105-dt-parser-v1-1-b11c63cb5e2c@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-28258-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2DD05145920
X-Rspamd-Action: no action

On Mon, Jan 05, 2026 at 05:57:54PM +0530, Sumit Kumar wrote:
> For multi-port controllers, equalization preset properties should be
> specified in individual root port nodes rather than the controller node,

s/root port/Root Port

- Mani

> allowing each port to have its own configuration.
> 
> Change of_pci_get_equalization_presets() to accept a device_node pointer.
> This allows parsing equalization presets from any device tree node,
> which is needed for multi-port PCIe controllers.
> 
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
>  drivers/pci/of.c  | 6 ++++--
>  drivers/pci/pci.h | 2 ++
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index 3579265f119845637e163d9051437c89662762f8..d09eff40b523c920c9ca3eaa64f784765b3c5bf8 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -971,6 +971,7 @@ EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
>   * of_pci_get_equalization_presets - Parses the "eq-presets-Ngts" property.
>   *
>   * @dev: Device containing the properties.
> + * @node: Device tree node containing the properties.
>   * @presets: Pointer to store the parsed data.
>   * @num_lanes: Maximum number of lanes supported.
>   *
> @@ -981,6 +982,7 @@ EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
>   * errno otherwise.
>   */
>  int of_pci_get_equalization_presets(struct device *dev,
> +				    struct device_node *node,
>  				    struct pci_eq_presets *presets,
>  				    int num_lanes)
>  {
> @@ -988,7 +990,7 @@ int of_pci_get_equalization_presets(struct device *dev,
>  	int ret;
>  
>  	presets->eq_presets_8gts[0] = PCI_EQ_RESV;
> -	ret = of_property_read_u16_array(dev->of_node, "eq-presets-8gts",
> +	ret = of_property_read_u16_array(node, "eq-presets-8gts",
>  					 presets->eq_presets_8gts, num_lanes);
>  	if (ret && ret != -EINVAL) {
>  		dev_err(dev, "Error reading eq-presets-8gts: %d\n", ret);
> @@ -998,7 +1000,7 @@ int of_pci_get_equalization_presets(struct device *dev,
>  	for (int i = 0; i < EQ_PRESET_TYPE_MAX - 1; i++) {
>  		presets->eq_presets_Ngts[i][0] = PCI_EQ_RESV;
>  		snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << (i + 1));
> -		ret = of_property_read_u8_array(dev->of_node, name,
> +		ret = of_property_read_u8_array(node, name,
>  						presets->eq_presets_Ngts[i],
>  						num_lanes);
>  		if (ret && ret != -EINVAL) {
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 34f65d69662e9f61f0c489ec58de2ce17d21c0c6..72fa6db95b8a75f6e69b8019d1eb2262b6a46c13 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -965,6 +965,7 @@ void pci_release_bus_of_node(struct pci_bus *bus);
>  int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
>  bool of_pci_supply_present(struct device_node *np);
>  int of_pci_get_equalization_presets(struct device *dev,
> +				    struct device_node *node,
>  				    struct pci_eq_presets *presets,
>  				    int num_lanes);
>  #else
> @@ -1013,6 +1014,7 @@ static inline bool of_pci_supply_present(struct device_node *np)
>  }
>  
>  static inline int of_pci_get_equalization_presets(struct device *dev,
> +						  struct device_node *node,
>  						  struct pci_eq_presets *presets,
>  						  int num_lanes)
>  {
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

