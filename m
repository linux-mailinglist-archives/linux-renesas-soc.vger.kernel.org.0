Return-Path: <linux-renesas-soc+bounces-27489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kL0lKDLxeGmGuAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 18:09:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F34A9834E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 18:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A29B130AF486
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 17:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA0B363C55;
	Tue, 27 Jan 2026 17:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXj9+9tF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D810A3624BF;
	Tue, 27 Jan 2026 17:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533496; cv=none; b=CAKElr4wbOIBP5AhLaHD0zTsIA4M+WyBnXRsmoSC5lOc2GY17HMhENsqTTWZjaZzaRNXPKWoCnBT8Qhci9Mg7eH6H0O8O1EDUMxUef3GaxnEctAAjX5ckwljC5CUJKBWX+AOpmQPGJe9QlrL3oW+cUXMM2aDDieWf/zmxJ5+QmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533496; c=relaxed/simple;
	bh=poCPnd4zFMjtSit8xD03/GV5rPSvHmcbMOzBQ9KlptE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=bWpdOkedU60TU5nMGi/bolXWf59wRI0TRaHcKQ7Fj5Oy+5bJ2N2ck9gLHKw+oqhm8EZzIbjl58zzcXikQIFb+OZS2wgF1tOrG6YMd1H6OY8MYBiy4NguTLiSYkx0V5fi4wQKmaWATKMZTQJuVR8+mc4L0FZr/WoAk1BdglZ6pJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXj9+9tF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD6BC116C6;
	Tue, 27 Jan 2026 17:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769533496;
	bh=poCPnd4zFMjtSit8xD03/GV5rPSvHmcbMOzBQ9KlptE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=EXj9+9tFbUrcdXOg/gNZ0xtF0AANmEMZn7gE9OmsDvKPWFilOXbzhgganOOqg0a5h
	 QxlN29XF4sYATOJ+A72JrE4WEjRMG+yw01F0oZNDKW53UG86h7zKvwkJBiU7ezZ7+w
	 NfjFs7sUmjmzJ4YJprHnkc3Q5Ktdj8tsQql5XfJKIMtRI0SywIyKabPZFe78+eWd5W
	 DGSSoMZtSGXB7TPPZUoln5ulzw3FTd1anFe6dEDFiphujvDfDFq512lX4TDir6fsk8
	 myWqw96UvNR6VrKwSLL1zpJJH+3BkoXmA3i/l6GZwlyrb8d4zv9hHMnncTL43nb8BC
	 gDheOQS+ka2UQ==
Date: Tue, 27 Jan 2026 11:04:55 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 2/7] pci: pwrctrl: add PCI pwrctrl driver for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Message-ID: <20260127170455.GA364177@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-2-c55ec1b5d8bf@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27489-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1F34A9834E
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:57:29AM +0100, Neil Armstrong wrote:
> Add support fo the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller
> power control which connects over PCIe and requires specific power supplies
> to start up.

s/fo /for /

In subject, "PCI/pwrctrl: Add ..." to match history (see
"git log --oneline drivers/pci/pwrctrl/")

> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/pci/pwrctrl/Kconfig                 | 10 ++++
>  drivers/pci/pwrctrl/Makefile                |  2 +
>  drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c | 88 +++++++++++++++++++++++++++++
>  3 files changed, 100 insertions(+)
> 
> diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> index e0f999f299bb..5a94e60d0d3e 100644
> --- a/drivers/pci/pwrctrl/Kconfig
> +++ b/drivers/pci/pwrctrl/Kconfig
> @@ -11,6 +11,16 @@ config PCI_PWRCTRL_PWRSEQ
>  	select POWER_SEQUENCING
>  	select PCI_PWRCTRL
>  
> +config PCI_PWRCTRL_UPD720201
> +	tristate "PCI Power Control driver for the UPD720201 USB3 Host Controller"
> +	select PCI_PWRCTRL
> +	help
> +	  Say Y here to enable the PCI Power Control driver of the UPD720201
> +	  USB3 Host Controller.
> +
> +	  The voltage regulators powering the rails of the PCI slots
> +	  are expected to be defined in the devicetree node of the PCI device.

I assume this is a function of the platform design, not an intrinsic
feature of UPD720201?  I.e., my guess is that this driver is not
required for every platform that includes a UPD720201 device?

Maybe this is just another way of asking Mani's question about using
pwrctrl-slot.  *Every* device requires specific power supplies to
start up (re patch 1/7), and this driver doesn't appear to depend on
anything unique about UPD720201.

>  config PCI_PWRCTRL_SLOT
>  	tristate "PCI Power Control driver for PCI slots"
>  	select PCI_PWRCTRL
> diff --git a/drivers/pci/pwrctrl/Makefile b/drivers/pci/pwrctrl/Makefile
> index 13b02282106c..a99f85de8a3d 100644
> --- a/drivers/pci/pwrctrl/Makefile
> +++ b/drivers/pci/pwrctrl/Makefile
> @@ -5,6 +5,8 @@ pci-pwrctrl-core-y			:= core.o
>  
>  obj-$(CONFIG_PCI_PWRCTRL_PWRSEQ)	+= pci-pwrctrl-pwrseq.o
>  
> +obj-$(CONFIG_PCI_PWRCTRL_UPD720201)	+= pci-pwrctrl-upd720201.o
> +
>  obj-$(CONFIG_PCI_PWRCTRL_SLOT)		+= pci-pwrctrl-slot.o
>  pci-pwrctrl-slot-y			:= slot.o
>  
> diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
> new file mode 100644
> index 000000000000..db96bbb69c21
> --- /dev/null
> +++ b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Based on upd720201.c:
> + * Copyright (C) 2024 Linaro Ltd.
> + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/pci-pwrctrl.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +
> +struct pci_pwrctrl_upd720201_data {
> +	struct pci_pwrctrl ctx;
> +	struct regulator_bulk_data *supplies;
> +	int num_supplies;
> +};

To match recent rework of nearby drivers:

s/pci_pwrctrl_upd720201_data/upd720201_pwrctrl/
s/ctx/pwrctrl/

> +static void devm_pci_pwrctrl_upd720201_power_off(void *data)

and:

s/devm_pci_pwrctrl_upd720201_power_off/devm_upd720201_release/
s/pci_pwrctrl_upd720201_probe/upd720201_pwrctrl_probe/

Might be more opportunities to be more similar to slot.c and
pci-pwrctrl-tc9563.c, e.g., adding:

  upd720201->pwrctrl.power_on = ...;
  upd720201->pwrctrl.power_off = ...;

(would have to be based on pci/pwrctrl branch, which is where this
patch would be applied)

> +{
> +	struct pci_pwrctrl_upd720201_data *upd720201 = data;
> +
> +	regulator_bulk_disable(upd720201->num_supplies, upd720201->supplies);
> +	regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
> +}
> +
> +static int pci_pwrctrl_upd720201_probe(struct platform_device *pdev)
> +{
> +	struct pci_pwrctrl_upd720201_data *upd720201;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	upd720201 = devm_kzalloc(dev, sizeof(*upd720201), GFP_KERNEL);
> +	if (!upd720201)
> +		return -ENOMEM;
> +
> +	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
> +					&upd720201->supplies);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Failed to get upd720201 regulators\n");
> +		return ret;
> +	}
> +
> +	upd720201->num_supplies = ret;
> +	ret = regulator_bulk_enable(upd720201->num_supplies, upd720201->supplies);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Failed to enable upd720201 regulators\n");
> +		regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
> +		return ret;
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_upd720201_power_off,
> +				       upd720201);
> +	if (ret)
> +		return ret;
> +
> +	pci_pwrctrl_init(&upd720201->ctx, dev);
> +
> +	ret = devm_pci_pwrctrl_device_set_ready(dev, &upd720201->ctx);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register pwrctrl driver\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id pci_pwrctrl_upd720201_of_match[] = {
> +	{
> +		.compatible = "pci1912,0014",
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, pci_pwrctrl_upd720201_of_match);
> +
> +static struct platform_driver pci_pwrctrl_upd720201_driver = {
> +	.driver = {
> +		.name = "pci-pwrctrl-upd720201",
> +		.of_match_table = pci_pwrctrl_upd720201_of_match,
> +	},
> +	.probe = pci_pwrctrl_upd720201_probe,
> +};
> +module_platform_driver(pci_pwrctrl_upd720201_driver);
> +
> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
> +MODULE_DESCRIPTION("PCI Power Control driver for UPD720201 USB3 Host Controller");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

