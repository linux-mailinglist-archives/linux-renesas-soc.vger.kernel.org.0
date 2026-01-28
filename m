Return-Path: <linux-renesas-soc+bounces-27505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJuTMD7NeWmOzgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 09:47:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA809E5D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 09:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55D3A30159F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 08:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DE9339844;
	Wed, 28 Jan 2026 08:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aAV7Gp9z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9173382D2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 08:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590043; cv=none; b=FBmJICYzic3HN386ex075qqoBkj342ifmiGQJ//6dVExLr6FkY6UukuSRZ7AL+UTd/n10ImN+n0SL/grw5FOLZ79oRgETb6JXP5pcVqoeD8ErBusJUOt96zlNNnNLeC0Ms3FeGKtUiY335rG0Y8Wbbp7sTpqZMz/91nIWrC+6ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590043; c=relaxed/simple;
	bh=khrPDqCGTN5tnjPlkTiyZMZqvVOJ9sgSO4C4yr0b8Jo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XUpDeaQSQAbYHt5+JTHnGkCS1Tjn8/3montxmrJhR5YALB5ueEiomAcNsxjZcl/Si+8e8C+64hkUa9sPWtuAmSjtbXDY/S/onPmKpXSGHYvu1vhoYnbXoCm3reCp4mTncalZekfJ7CqoH+PNljC1h3GlkciwrDq2VJwMGNTtn+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aAV7Gp9z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1E6C2BCB7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 08:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769590043;
	bh=khrPDqCGTN5tnjPlkTiyZMZqvVOJ9sgSO4C4yr0b8Jo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=aAV7Gp9zgZdRc7KJh8R8OOeLontofODPP9Ox37X1U4RRytrMXtyFwpHI2uCafsA6O
	 N4M8SxdUBGEB6GG6wq9mldtPbeI3mWQ5Xhs5LSn4NPXoBCiQuI+RRzQ33rHJwB7ZJ9
	 mG4MR1ghW1OsEQjStQ9BdK9fclJC7XbBn5Txfz8ZbZwRzM5jv+29aGAdeRRy68ORsq
	 x22q+CT4ibKqsnVx4xg+c4tPQ/QgrPb4BYkxFqRLxsmkiF8rrDxZcNpUpZM9jwkGXe
	 IlOgm6h98tLMgRQTmXJUJkYGOrC9P3V5At5uPhTMiH878BkQMhVSuBuu7c+scobBaC
	 dDFw0NJqx1RVA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59dcd9b89ecso999839e87.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 00:47:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHPHlr9N4p3mYpP8PAtpdc7puhUNrq6vUq8SrrfeKgthB3IoYxRl6pJ+yCrioaO4DfeOgL+wlWaNHxoh1vUmJ31g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw701NPKFc62kZDQOxj5oYrbC2pfL8BzrfiPOjL32+K4klvEmvb
	70xs9YO7PsRKZkDqjggDt5ho7yxO9gBdq2MproDFpTk7c94eUFOZwit6pjbV6OA7cgCWcYVrN1R
	9tegKH4mgZmJI7uUDjzXE2Of+SB/ETOZTRyzNKuQ74Q==
X-Received: by 2002:ac2:464c:0:b0:59e:6f4:d224 with SMTP id
 2adb3069b0e04-59e06f4d2demr780740e87.26.1769590041709; Wed, 28 Jan 2026
 00:47:21 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 00:47:19 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 00:47:19 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-2-c55ec1b5d8bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-2-c55ec1b5d8bf@linaro.org>
Date: Wed, 28 Jan 2026 00:47:19 -0800
X-Gmail-Original-Message-ID: <CAMRc=MfOjd0RzAma+NgCVZvvaar+Wwe+jH6dYxzJ02h4GEBJdw@mail.gmail.com>
X-Gm-Features: AZwV_QhXUdGdxJQ8EWE3IEaSkM8UzBdAeGOMqY6dnujEk2icHg1EteXYkrLHpqM
Message-ID: <CAMRc=MfOjd0RzAma+NgCVZvvaar+Wwe+jH6dYxzJ02h4GEBJdw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] pci: pwrctrl: add PCI pwrctrl driver for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-27505-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7EA809E5D2
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 10:57:29 +0100, Neil Armstrong
<neil.armstrong@linaro.org> said:
> Add support fo the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller
> power control which connects over PCIe and requires specific power supplies
> to start up.
>
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
> +
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
> +
> +static void devm_pci_pwrctrl_upd720201_power_off(void *data)
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

dev_err_probe()?

> +		return ret;
> +	}
> +
> +	upd720201->num_supplies = ret;
> +	ret = regulator_bulk_enable(upd720201->num_supplies, upd720201->supplies);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Failed to enable upd720201 regulators\n");
> +		regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
> +		return ret;

Save a line by returning dev_err_probe() here?

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
>

Just nits with dev_err_probe(). With these LGTM.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Bartosz

