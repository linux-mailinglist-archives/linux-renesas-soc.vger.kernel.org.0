Return-Path: <linux-renesas-soc+bounces-27033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A9DD3A663
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 12:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C48D030A5E9C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 11:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5176834887E;
	Mon, 19 Jan 2026 11:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLLu2Tkf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1062D29B7;
	Mon, 19 Jan 2026 11:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820796; cv=none; b=F4M15I3bwl34nuDbRLMI80W5s3Dt/9OL3TAQqpgDFYNJmsZyxPTSg0VI3RzaBfVOVat53sYln8DCC8oOPhKBBU6UQnPNPAYpI7mq+I621OXL8eo/GYnrkUZ02Zg5WrggyHVP562rgADH1H6qNyB4iFeJe4Na4PgjfKyc4DXnMlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820796; c=relaxed/simple;
	bh=vH6Vlkg2BY1oUWpSb3QdiyQ62uOlof27g0kCxt0BO8E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=K9g1dPc0NUMQU9x3NdJvxmAY7Clr4JsSKd3mzQzILmEnqm+zL6J6Qxx03CCZrCIagcFoLqBRwpSeXdDb3pZl2HlTHs1LcdjjSB+h0f1CN8UT+KcbMrhi94hmkB3hUU4OtCZH5GJUWR38nJ4VYluAbKz8+Ox6hc0TMAonENBHKd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLLu2Tkf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567EEC116C6;
	Mon, 19 Jan 2026 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820796;
	bh=vH6Vlkg2BY1oUWpSb3QdiyQ62uOlof27g0kCxt0BO8E=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=CLLu2TkfsudAo/bZ7JuCbtFNh8LcOSZNlfBRZvzcdm5D/xVD2rH81SrtkypRhLLnO
	 UqT0CH4uHuPPzxJDmSrXnwfUtWK+OC047MUKYp1nsHBz97lHPXlzt/x+hN8y/gp0MP
	 UYmeS8ASB6B4UXk6GqFIRKD5+A5JIGkDVL7/2b5x7nzBpq/NZtntetCRW5EyU9TSBN
	 q64nfm73xVcfypAej5Iu8oOkpB6EbjW9v9+cz/iGU79FRsBHhn4arUae+a9kp9mNYv
	 up9PwtgEsBkDdHkH92WL0RJjiY4LHT+feX8z+w3nooL2Hb9ZY+eAZ8gtbeEqslJxBC
	 Hg/xhyFbkLSdg==
Message-ID: <d6986e8a-e3d6-4974-acda-962e1c240121@kernel.org>
Date: Mon, 19 Jan 2026 12:06:28 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: [PATCH 4/8] soc: fsl: guts: don't access of_root directly
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
 <20260119-soc-of-root-v1-4-32a0fa9a78b4@oss.qualcomm.com>
Content-Language: fr-FR
In-Reply-To: <20260119-soc-of-root-v1-4-32a0fa9a78b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 19/01/2026 à 11:40, Bartosz Golaszewski a écrit :
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> to retrieve the relevant information.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Acked-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   drivers/soc/fsl/guts.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index 6bf3e6a980ffc67c21ed7b62b5b638e37f27454e..88ba32a40f6a27f8ffd13624e940aa0edf48586f 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
> @@ -186,7 +186,6 @@ static int __init fsl_guts_init(void)
>   	const struct fsl_soc_data *soc_data;
>   	const struct of_device_id *match;
>   	struct ccsr_guts __iomem *regs;
> -	const char *machine = NULL;
>   	struct device_node *np;
>   	bool little_endian;
>   	u64 soc_uid = 0;
> @@ -217,13 +216,9 @@ static int __init fsl_guts_init(void)
>   	if (!soc_dev_attr)
>   		return -ENOMEM;
>   
> -	if (of_property_read_string(of_root, "model", &machine))
> -		of_property_read_string_index(of_root, "compatible", 0, &machine);
> -	if (machine) {
> -		soc_dev_attr->machine = kstrdup(machine, GFP_KERNEL);
> -		if (!soc_dev_attr->machine)
> -			goto err_nomem;
> -	}
> +	ret = soc_device_get_machine(soc_dev_attr);
> +	if (ret)
> +		of_machine_get_compatible(&soc_dev_attr->machine);
>   
>   	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
>   	if (soc_die) {
> @@ -267,7 +262,6 @@ static int __init fsl_guts_init(void)
>   err_nomem:
>   	ret = -ENOMEM;
>   err:
> -	kfree(soc_dev_attr->machine);
>   	kfree(soc_dev_attr->family);
>   	kfree(soc_dev_attr->soc_id);
>   	kfree(soc_dev_attr->revision);
> 


