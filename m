Return-Path: <linux-renesas-soc+bounces-27034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F63ED3A669
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 12:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C920307DAD5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 11:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5203590D8;
	Mon, 19 Jan 2026 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/3rPe+V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3751DE3B7;
	Mon, 19 Jan 2026 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820819; cv=none; b=YQkSqsTUGmDV0aNH8BVSZ4nXj40JNPhx+pRgTE/VETO5eE3rUEoVJ0yUEEcFI8TApHIiMo/xnrmQIPV9tctoHs9SoAkJhDV8WqfajRIP5KpAO5cqcWkyjtZ0Wz2Guo3BaTmzagJhlXmas/Xkryu2j4VlPt9RIqEpm/mskx0ZQZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820819; c=relaxed/simple;
	bh=FSHtm5y+0kZFCu8h7MAlOolnmcLEJiXQsqC8mgqCK0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYoOA+kdz0SYjrf8Otie6tPdY6iADBAXErJH/ICcw5RF+X+Z42ea/hVfjL1MjhKpD/wpPd9ttmn6VhGNrvb/i+8Qm1NFGVc1+A5JhoB2wVcoV7nJdMOnUWBIGc6ZNOHslnzQOcjRF0t0vXP7Dce3EPN4MQAql1t+s7xahWTdtxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/3rPe+V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BEC8C116C6;
	Mon, 19 Jan 2026 11:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820818;
	bh=FSHtm5y+0kZFCu8h7MAlOolnmcLEJiXQsqC8mgqCK0I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M/3rPe+VeDwVPcMY41CgntHHzX52DrZ0Q9LntDEdhFwNDiNZ+STK82e5P8+fTyKDM
	 DyPXKjY5ovs4CJIuPMfV4bFzgLkuVtS9YVZxtJVrjT3KTCx6Lt50yKGHNFtwjJiioZ
	 nRo+/iFAN2Yo41CvjEQUqCEYz+oCH0IdS9UATPlAo/IjYIH20q8aTsdTpeQSk7f+Qz
	 8eou2/M7Ip9TXxzlIaBsgTffX6DujbxZky1fjiNwbe1DQLng6YsJKWQD40SP/jF/2q
	 1OLSx6lcmdOrWzcG4u/cDPaN57epDjYD//Wwa+BRG53He0SLZsLR2jz5ALHlw9R7Rn
	 813vdS2ZEk1iA==
Message-ID: <ff8db3d9-cb27-4ea3-8953-a7786eb54a01@kernel.org>
Date: Mon, 19 Jan 2026 12:06:51 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] of: provide of_machine_get_compatible()
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
 <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 19/01/2026 à 11:40, Bartosz Golaszewski a écrit :
> Provide a helper function allowing users to read the compatible string
> of the machine, hiding the access to the root node.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   drivers/of/base.c  | 13 +++++++++++++
>   include/linux/of.h |  2 ++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 0b65039ece53aa90f30da2420a893a02ab4c6dd8..a7e27d5355929abd6d156b80c52f8f8b08fe6da1 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -434,6 +434,19 @@ bool of_machine_compatible_match(const char *const *compats)
>   }
>   EXPORT_SYMBOL(of_machine_compatible_match);
>   
> +/**
> + * of_machine_get_compatible - Get the compatible string of this machine
> + * @compatible: address at which the compatible string will be stored
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int of_machine_get_compatible(const char **compatible)
> +{
> +	return of_property_read_string(of_root, "compatible", compatible);
> +}
> +EXPORT_SYMBOL_GPL(of_machine_get_compatible);
> +
>   /**
>    * of_machine_device_match - Test root of device tree against a of_device_id array
>    * @matches:	NULL terminated array of of_device_id match structures to search in
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 9bbdcf25a2b448ba4ec5ddee8b35a105ca4aab8b..75423fb556ee4c108ce25144a0bdc252a89f7d1d 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -426,6 +426,8 @@ static inline bool of_machine_is_compatible(const char *compat)
>   	return of_machine_compatible_match(compats);
>   }
>   
> +int of_machine_get_compatible(const char **compatible);
> +
>   extern int of_add_property(struct device_node *np, struct property *prop);
>   extern int of_remove_property(struct device_node *np, struct property *prop);
>   extern int of_update_property(struct device_node *np, struct property *newprop);
> 


