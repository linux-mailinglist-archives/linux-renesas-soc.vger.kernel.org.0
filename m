Return-Path: <linux-renesas-soc+bounces-28266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL4xJehGk2mi3AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 17:33:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0904114638D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 17:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CCC9301DDB7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 16:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EDA3314DD;
	Mon, 16 Feb 2026 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeYyKSTN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED9830F7E0;
	Mon, 16 Feb 2026 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771259622; cv=none; b=oKLONiONl1eYLDGT/askLJRWtDQTYnWOde8ZhPJD7wWxxH0LJnlc6crBTAHtV5k+WSlT4gfmI18j/ZXYH84q5nv+5D1Go0tAe6lUDA48BZTEyBovEe9u+iDZi3gyJoZBnJmDuP8zIX5wjn8livnXZRz1/cI3XHQaNkdJHk9rBq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771259622; c=relaxed/simple;
	bh=S3Mqb5ft5AivoMejjykr04UuAyT+R10t+7iYkjZXXtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yzcyvjd6MwZ9SfuO8MupKbeH4IwW4GreREIiHs4Exdwp9XLcKbymko2vzKrz/CKEM5WSKkKAptBsGh3tC6Wm3Wu8xv8JNh92SHIgY2rA8q86n1/LWQNCAB7xCiQ+miK6MxJUGWqpbwTdseirTxlt7HVoaPXu605PMrA63ZqAJN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeYyKSTN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6955C116C6;
	Mon, 16 Feb 2026 16:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771259621;
	bh=S3Mqb5ft5AivoMejjykr04UuAyT+R10t+7iYkjZXXtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WeYyKSTNsC/SN33/PIkMCeyOr2Pj2ISF6AH4b5o6s+WT1nc1fKeKf5unV7PgYttQ/
	 5824u774/jqVZtEP/7nlw1TdtbbRWuIBTDmVQpCK+P+f8Am4NkI+0Zimu6ChUi4v/C
	 z4VcuDX2n4w/174OEQh3uvoJ7fWEnXq6V0jDhobz1Y6L3CuxQKrAwdbTqnmPFVFmLo
	 z6o6W/QgPA7cDX19iUuCUILbuQfzhKl0szr7EZtJmqdRsFOzDJ4WW4d6s9aczNhaeT
	 srezyIvV7QmvKZfPGV4DF46w8N6xwLEfc/ffaNDVvjQ7UvIgdP80UytJLqowa9sAkC
	 XYiswYFomBV1Q==
Date: Mon, 16 Feb 2026 22:03:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 3/9] pci: pwrctrl: rename pci-pwrctrl-slot as generic
Message-ID: <xiizfsm7tbcqqb2w2bittscipyxac5xdx7fhmplc6e7ogl74o5@p2gsjolien6c>
References: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
 <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-3-802c82795431@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-3-802c82795431@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28266-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 0904114638D
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 03:21:47PM +0100, Neil Armstrong wrote:
> The driver is pretty generic and would fit for either
> PCI Slots or endpoints connected to PCI ports, so rename
> the driver and module as pci-pwrctrl-generic.
> 
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/pci/pwrctrl/Kconfig   | 13 ++++---
>  drivers/pci/pwrctrl/Makefile  |  4 +-
>  drivers/pci/pwrctrl/generic.c | 91 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/pci/pwrctrl/slot.c    | 91 -------------------------------------------
>  4 files changed, 100 insertions(+), 99 deletions(-)
> 
> diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> index e0f999f299bb..0ba095729694 100644
> --- a/drivers/pci/pwrctrl/Kconfig
> +++ b/drivers/pci/pwrctrl/Kconfig
> @@ -11,16 +11,17 @@ config PCI_PWRCTRL_PWRSEQ
>  	select POWER_SEQUENCING
>  	select PCI_PWRCTRL
>  
> -config PCI_PWRCTRL_SLOT
> -	tristate "PCI Power Control driver for PCI slots"

This symbol is selected by a few controller drivers also in:
drivers/pci/controller/dwc/Kconfig

> +config PCI_PWRCTRL_GENERIC
> +	tristate "Generic PCI Power Control driver for PCI slots and endpoints"
>  	select PCI_PWRCTRL
>  	help
> -	  Say Y here to enable the PCI Power Control driver to control the power
> -	  state of PCI slots.
> +	  Say Y here to enable the generic PCI Power Control driver to control
> +	  the power state of PCI slots and endpoints.
>  
>  	  This is a generic driver that controls the power state of different
> -	  PCI slots. The voltage regulators powering the rails of the PCI slots
> -	  are expected to be defined in the devicetree node of the PCI bridge.
> +	  PCI slots and endpoints. The voltage regulators powering the rails
> +	  of the PCI slots or endpoints are expected to be defined in the
> +	  devicetree node of the PCI bridge.
>  
>  config PCI_PWRCTRL_TC9563
>  	tristate "PCI Power Control driver for TC9563 PCIe switch"
> diff --git a/drivers/pci/pwrctrl/Makefile b/drivers/pci/pwrctrl/Makefile
> index 13b02282106c..f6bb4fb9a410 100644
> --- a/drivers/pci/pwrctrl/Makefile
> +++ b/drivers/pci/pwrctrl/Makefile
> @@ -5,7 +5,7 @@ pci-pwrctrl-core-y			:= core.o
>  
>  obj-$(CONFIG_PCI_PWRCTRL_PWRSEQ)	+= pci-pwrctrl-pwrseq.o
>  
> -obj-$(CONFIG_PCI_PWRCTRL_SLOT)		+= pci-pwrctrl-slot.o
> -pci-pwrctrl-slot-y			:= slot.o
> +obj-$(CONFIG_PCI_PWRCTRL_GENERIC)	+= pci-pwrctrl-generic.o
> +pci-pwrctrl-generic-y			:= generic.o
>  
>  obj-$(CONFIG_PCI_PWRCTRL_TC9563)	+= pci-pwrctrl-tc9563.o
> diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
> new file mode 100644
> index 000000000000..a5b7b7965f46
> --- /dev/null
> +++ b/drivers/pci/pwrctrl/generic.c
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024 Linaro Ltd.
> + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/pci-pwrctrl.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +
> +struct pci_pwrctrl_generic_data {

Ah, just realised that Bjorn renamed these structures and helpers in
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/drivers/pci/pwrctrl/slot.c?h=next&id=e40d16e6c23994b28894179b87f9747edd63062a

So this needs some adapting...

- Mani

> +	struct pci_pwrctrl ctx;
> +	struct regulator_bulk_data *supplies;
> +	int num_supplies;
> +};
> +
> +static void devm_pci_pwrctrl_generic_power_off(void *data)
> +{
> +	struct pci_pwrctrl_generic_data *generic = data;
> +
> +	regulator_bulk_disable(generic->num_supplies, generic->supplies);
> +	regulator_bulk_free(generic->num_supplies, generic->supplies);
> +}
> +
> +static int pci_pwrctrl_generic_probe(struct platform_device *pdev)
> +{
> +	struct pci_pwrctrl_generic_data *generic;
> +	struct device *dev = &pdev->dev;
> +	struct clk *clk;
> +	int ret;
> +
> +	generic = devm_kzalloc(dev, sizeof(*generic), GFP_KERNEL);
> +	if (!generic)
> +		return -ENOMEM;
> +
> +	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
> +					&generic->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
> +
> +	generic->num_supplies = ret;
> +	ret = regulator_bulk_enable(generic->num_supplies, generic->supplies);
> +	if (ret < 0) {
> +		regulator_bulk_free(generic->num_supplies, generic->supplies);
> +		return dev_err_probe(dev, ret, "Failed to enable regulators\n");
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_generic_power_off,
> +				       generic);
> +	if (ret)
> +		return ret;
> +
> +	clk = devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "Failed to enable clock\n");
> +
> +	pci_pwrctrl_init(&generic->ctx, dev);
> +
> +	ret = devm_pci_pwrctrl_device_set_ready(dev, &generic->ctx);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register generic pwrctrl driver\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id pci_pwrctrl_generic_of_match[] = {
> +	{
> +		.compatible = "pciclass,0604",
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, pci_pwrctrl_generic_of_match);
> +
> +static struct platform_driver pci_pwrctrl_generic_driver = {
> +	.driver = {
> +		.name = "pci-pwrctrl-generic",
> +		.of_match_table = pci_pwrctrl_generic_of_match,
> +	},
> +	.probe = pci_pwrctrl_generic_probe,
> +};
> +module_platform_driver(pci_pwrctrl_generic_driver);
> +
> +MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>");
> +MODULE_DESCRIPTION("Generic PCI Power Control driver for PCI Slots");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/slot.c
> deleted file mode 100644
> index 08e53243cdbd..000000000000
> --- a/drivers/pci/pwrctrl/slot.c
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (C) 2024 Linaro Ltd.
> - * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> - */
> -
> -#include <linux/clk.h>
> -#include <linux/device.h>
> -#include <linux/mod_devicetable.h>
> -#include <linux/module.h>
> -#include <linux/pci-pwrctrl.h>
> -#include <linux/platform_device.h>
> -#include <linux/regulator/consumer.h>
> -#include <linux/slab.h>
> -
> -struct pci_pwrctrl_slot_data {
> -	struct pci_pwrctrl ctx;
> -	struct regulator_bulk_data *supplies;
> -	int num_supplies;
> -};
> -
> -static void devm_pci_pwrctrl_slot_power_off(void *data)
> -{
> -	struct pci_pwrctrl_slot_data *slot = data;
> -
> -	regulator_bulk_disable(slot->num_supplies, slot->supplies);
> -	regulator_bulk_free(slot->num_supplies, slot->supplies);
> -}
> -
> -static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
> -{
> -	struct pci_pwrctrl_slot_data *slot;
> -	struct device *dev = &pdev->dev;
> -	struct clk *clk;
> -	int ret;
> -
> -	slot = devm_kzalloc(dev, sizeof(*slot), GFP_KERNEL);
> -	if (!slot)
> -		return -ENOMEM;
> -
> -	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
> -					&slot->supplies);
> -	if (ret < 0)
> -		return dev_err_probe(dev, ret, "Failed to get slot regulators\n");
> -
> -	slot->num_supplies = ret;
> -	ret = regulator_bulk_enable(slot->num_supplies, slot->supplies);
> -	if (ret < 0) {
> -		regulator_bulk_free(slot->num_supplies, slot->supplies);
> -		return dev_err_probe(dev, ret, "Failed to enable slot regulators\n");
> -	}
> -
> -	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_slot_power_off,
> -				       slot);
> -	if (ret)
> -		return ret;
> -
> -	clk = devm_clk_get_optional_enabled(dev, NULL);
> -	if (IS_ERR(clk))
> -		return dev_err_probe(dev, PTR_ERR(clk),
> -				     "Failed to enable slot clock\n");
> -
> -	pci_pwrctrl_init(&slot->ctx, dev);
> -
> -	ret = devm_pci_pwrctrl_device_set_ready(dev, &slot->ctx);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to register pwrctrl driver\n");
> -
> -	return 0;
> -}
> -
> -static const struct of_device_id pci_pwrctrl_slot_of_match[] = {
> -	{
> -		.compatible = "pciclass,0604",
> -	},
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(of, pci_pwrctrl_slot_of_match);
> -
> -static struct platform_driver pci_pwrctrl_slot_driver = {
> -	.driver = {
> -		.name = "pci-pwrctrl-slot",
> -		.of_match_table = pci_pwrctrl_slot_of_match,
> -	},
> -	.probe = pci_pwrctrl_slot_probe,
> -};
> -module_platform_driver(pci_pwrctrl_slot_driver);
> -
> -MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>");
> -MODULE_DESCRIPTION("Generic PCI Power Control driver for PCI Slots");
> -MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

