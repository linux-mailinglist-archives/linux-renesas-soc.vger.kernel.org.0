Return-Path: <linux-renesas-soc+bounces-27036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D7D3A679
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 12:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 809CE30E9928
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 11:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05573590D9;
	Mon, 19 Jan 2026 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nep/NM8G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76403590B2;
	Mon, 19 Jan 2026 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820891; cv=none; b=u5LWggn5p+MdTEy/Hte3oIR3N6Y9eI4VkbImwspj34fW6TZ0V2TIvMGPWvL6BF1MtSMuovurTG8yW+XREPcXJmLhVpkJkSpWfDeYZUnR9gjEU8iSE8DGvfqjInlN/rFk8SAObhzag0adX+kihtJH/LU22BmM48JeD6fYJBD8fmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820891; c=relaxed/simple;
	bh=fOCQQatKJkAsP/8aCqj/CsMBsA/Znj0mtdxM6Z1bniQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MjaV3X2yJMNfCkDRG7si7odKPgKNl4PmDXA+HUlnPArM5LxWAmCooytzqlOYV8cw/+6hnj5ZRCmA3yGC6co6UUIgq+wr0uI920njiCmtgdj1PnmSrpaof35zs5d2LG7pukiLY5Sv/Z9bE3a8ecSxv7xuu6ffSJzWpfYZdmkLAac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nep/NM8G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C115C116C6;
	Mon, 19 Jan 2026 11:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820891;
	bh=fOCQQatKJkAsP/8aCqj/CsMBsA/Znj0mtdxM6Z1bniQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nep/NM8G8LkTEJd5plGPg9EQoqA/Jk3Te//DN57NcVg99WM5Tmu9m/En4Lq/XbxSW
	 8tFsNoGyCBi514D8uUE6IhigyDSkHHy9NNjZmPD7fH5G9f4G5fhV1XBdvuvlr7g+OP
	 MkSkyDiIh8gNd5hNBMXpbMPW/b31+MpuWPkyW8nK30G1C7793fOeq0FZ1GWa6rEOc2
	 F7ctsmLlXgEJrQo9kccckQ0JfYchVr42jjohlOOAZi1txpzP8gD2AgiJIA9ReX7F5F
	 A7TUSgK8XmxyIULpB18MIwQN0BybFvJnZK+F28d5q++GnKL/yryTTzZ4JP6H0Na9+4
	 F6JFGXJPWGAmg==
Message-ID: <db748d3f-53c8-43cc-a5bc-94940252ca0c@kernel.org>
Date: Mon, 19 Jan 2026 12:08:05 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] base: soc: export soc_device_get_machine()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 19/01/2026 à 11:40, Bartosz Golaszewski a écrit :
> Some SoC drivers reimplement the functionality of
> soc_device_get_machine(). Make this function accessible through the
> sys_soc.h header. Rework it slightly to return a negative error number
> on failure to read the machine string (SoC core can keep on ignoring
> it). While at it: make it use the __free() helper from cleanup.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   drivers/base/soc.c      | 16 +++++++++-------
>   include/linux/sys_soc.h | 10 ++++++++++
>   2 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> index 6f42632d2b0fcc8a729484e6ad270f9bcabe4a0b..bec8771d40f0590d4d7c3985c08fedfd4043a394 100644
> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -5,6 +5,7 @@
>    * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
>    */
>   
> +#include <linux/cleanup.h>
>   #include <linux/err.h>
>   #include <linux/glob.h>
>   #include <linux/idr.h>
> @@ -111,17 +112,18 @@ static void soc_release(struct device *dev)
>   	kfree(soc_dev);
>   }
>   
> -static void soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
>   {
> -	struct device_node *np;
> -
>   	if (soc_dev_attr->machine)
> -		return;
> +		return -EBUSY;
> +
> +	struct device_node *np __free(device_node) = of_find_node_by_path("/");
> +	if (!np)
> +		return -ENOENT;
>   
> -	np = of_find_node_by_path("/");
> -	of_property_read_string(np, "model", &soc_dev_attr->machine);
> -	of_node_put(np);
> +	return of_property_read_string(np, "model", &soc_dev_attr->machine);
>   }
> +EXPORT_SYMBOL_GPL(soc_device_get_machine);
>   
>   static struct soc_device_attribute *early_soc_dev_attr;
>   
> diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
> index d9b3cf0f410c8cfb509a4c1a4d6c83fde6fe33c6..2d2dbc18462a39ddee95e38826a769fab089026f 100644
> --- a/include/linux/sys_soc.h
> +++ b/include/linux/sys_soc.h
> @@ -37,6 +37,16 @@ void soc_device_unregister(struct soc_device *soc_dev);
>    */
>   struct device *soc_device_to_device(struct soc_device *soc);
>   
> +/**
> + * soc_device_get_machine - retrieve the machine model and store it in
> + *                          the soc_device_attribute structure
> + * @soc_dev_attr: SoC attribute structure to store the model in
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr);
> +
>   #ifdef CONFIG_SOC_BUS
>   const struct soc_device_attribute *soc_device_match(
>   	const struct soc_device_attribute *matches);
> 


