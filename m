Return-Path: <linux-renesas-soc+bounces-25639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB653CABB73
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 02:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A39E30006F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 01:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EDB1F583D;
	Mon,  8 Dec 2025 01:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pg2bdCqO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0915B17A2FA;
	Mon,  8 Dec 2025 01:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765157097; cv=none; b=JNCxydwvu+Ka6sRYSGWiGCfnzO3CfliJF9LfZSnkGY42lTDUL48j7e0k8H8AxrUp4Chh1oDykDLspgz9dwrxiWBuo2/eo96o4ANUDwwSmC8JJxhxTpWx9Xv/E9AQIoUS7eV9acgsUZ7M15dPlw1CfKZvhpE5P8/1SZhrnrKjIQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765157097; c=relaxed/simple;
	bh=3Bpixj/4gqkX3EYz/IvQb94AyE5xu6hEmqQEufswfks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+OO06YyphcZDKx+bB6pWTlzDirmSvwAgJeD6YanNdeAqVj5FOBINz5WEoyc5hvCi6ktk9WgNX2VKnCILS7K9UmlKOEeZ4xRv2AOuaYvVsof4mt9Bw5h0nw9hmSubJOWHzbfIqN3geJKIwowd/gCDp4NXGFQMLsDDq1t5QAgEgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pg2bdCqO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90518C4CEFB;
	Mon,  8 Dec 2025 01:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765157096;
	bh=3Bpixj/4gqkX3EYz/IvQb94AyE5xu6hEmqQEufswfks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pg2bdCqOZYgttlTO66NmYzDAOB4rmTS1GPgOx9T/b+tzF+fNwHcn6QELcjsBCvWMS
	 PL/iZaIAZfgp4fnFgOVCa9LI5las69wjVNTzSfIS+G3tYDdKfaBc2Hak4czliXdCGj
	 llwup4PzcOtGKm6xlsQqw8t34aLRKoCRAaEIpdJpfQjLu2MKqruLf6ouGYIwMHfz+F
	 ph8zZzd/rCh/OGRtxDzXyQEzMrvzz6FkMqnNcB0ZemzTR/KD6Blia9yYza0p9kljnC
	 7DuhmgoOCtYgtztSUtT1uQnWSZMnCTKhJXUQzqAtKom6a5VSOtcl8FM6lL84O0lIP2
	 GvGzflA3Esz+A==
Date: Sun, 7 Dec 2025 19:24:53 -0600
From: Rob Herring <robh@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
Message-ID: <20251208012453.GA333127-robh@kernel.org>
References: <20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com>
 <20251201-rz-sdio-mux-v2-2-bcb581b88dd7@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-rz-sdio-mux-v2-2-bcb581b88dd7@solid-run.com>

On Mon, Dec 01, 2025 at 01:31:11PM +0100, Josua Mayer wrote:
> Some hardware designs route sdio signals through a mux to support
> multiple devices on a single sdio controller.
> In particular SolidRun RZ/G2L/G2LC/V2L System on Module use a mux for
> switching between soldered eMMC and an optional microSD on a carrier
> board, e.g. for development or provisioning.
> 
> SDIO is not well suited for runtime switching between different cards,
> however boot-time selection is possible and useful in particular with dt
> overlays.
> 
> Add support for an optional sdio mux defined in dt and select it during
> probe.
> 
> Similar functionality already exists in other places, e.g. i2c-omap.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  drivers/mmc/host/Kconfig             |  1 +
>  drivers/mmc/host/renesas_sdhi.h      |  1 +
>  drivers/mmc/host/renesas_sdhi_core.c | 27 ++++++++++++++++++++++++---
>  3 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 2c963cb6724b9..c01ab7d81a5af 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -707,6 +707,7 @@ config MMC_SDHI
>  	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
>  	depends on (RESET_CONTROLLER && REGULATOR) || !OF
>  	select MMC_TMIO_CORE
> +	select MULTIPLEXER
>  	help
>  	  This provides support for the SDHI SD/SDIO controller found in
>  	  Renesas SuperH, ARM and ARM64 based SoCs
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index 084964cecf9d8..9508908d8179f 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -97,6 +97,7 @@ struct renesas_sdhi {
>  	struct reset_control *rstc;
>  	struct tmio_mmc_host *host;
>  	struct regulator_dev *rdev;
> +	struct mux_state *mux_state;
>  };
>  
>  #define host_to_priv(host) \
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index f56fa2cd208dd..c58f412ea2028 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -26,6 +26,7 @@
>  #include <linux/mmc/mmc.h>
>  #include <linux/mmc/slot-gpio.h>
>  #include <linux/module.h>
> +#include <linux/mux/consumer.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pinctrl/pinctrl-state.h>
>  #include <linux/platform_data/tmio.h>
> @@ -1061,6 +1062,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  	struct regulator_dev *rdev;
>  	struct renesas_sdhi_dma *dma_priv;
>  	struct device *dev = &pdev->dev;
> +	struct device_node *node = pdev->dev.of_node;
>  	struct tmio_mmc_host *host;
>  	struct renesas_sdhi *priv;
>  	int num_irqs, irq, ret, i;
> @@ -1115,9 +1117,25 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  						"state_uhs");
>  	}
>  
> +	if (of_property_present(node, "mux-states")) {
> +		priv->mux_state = devm_mux_state_get(&pdev->dev, NULL);

These 2 lines are really just devm_mux_state_get_optional(). Add it if 
it doesn't exist.

> +		if (IS_ERR(priv->mux_state)) {
> +			ret = PTR_ERR(priv->mux_state);
> +			dev_dbg(&pdev->dev, "failed to get SDIO mux: %d\n", ret);
> +			return ret;
> +		}
> +		ret = mux_state_select(priv->mux_state);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to select SDIO mux: %d\n", ret);

Is there a case where mux_state_select() failing is not an error? If 
not, mux_state_select() should do the printing.

> +			return ret;
> +		}
> +	}

