Return-Path: <linux-renesas-soc+bounces-15965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3DDA893BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 08:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1690C3AEA29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 06:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83C7211299;
	Tue, 15 Apr 2025 06:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4+S3CTE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC2F18DB02
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Apr 2025 06:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744697816; cv=none; b=iNxiKuOZfyeS3S+afmNpbMjI/fjG5IGqglj1z9SQboeoaxLHL5lccYX5ImIJgxvgZKQZKlcXPSbFMnk0uaDgAFr6f3ulnepfnZ/PCA/Dd+75YwpAplh6LBdCJ3QDohMGlThognV/dmIkITTU4Hk/FFQBiqZJ3SOMOh9ERao1m38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744697816; c=relaxed/simple;
	bh=NJYA0Sd/M8fZ7qAW2pqgMm9yBA/J1tcAcR3OJFUUB6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8f3QTuZ2N5qSbpMqZj69dcMYF2s78wnt9DvlRP3msA+FXzXheXLcMZs+juYa70/ZoZN2ecqITxvz1n9MB18iJd+GEiCX+iSA3NfLjqfc7IkQLzgXsv5ldMowXRRCixGOP16uE5p9mem5uTZJf5X9Hcp5Dsq0Zr8zVdIPRDVjTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4+S3CTE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB7CC4CEDD;
	Tue, 15 Apr 2025 06:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744697815;
	bh=NJYA0Sd/M8fZ7qAW2pqgMm9yBA/J1tcAcR3OJFUUB6o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a4+S3CTEamQMO73M46HbyySNgfAuxKvkFsaU32IjABH1uXK2BWOv0IihP89awBM03
	 Cms+6YK9+YcYNWqUtMwPoLaUyb6JLeS4NSnrQa8I27Re4B1Xo6eBLDpVhUY3M4hBWr
	 nB8u9CmvUntlHjxQtCp2Uv479bWbHu732mUaJsW5Eu311rsY1sd/WYvmkNdxQlpc5z
	 I9+hFto6Wn6cPTI84Surl9jNJBHGJmKNCjbu04l14rPMzddeahRdcnN4V1pFECMpHS
	 g40y2VZq3WTxUAAuys9TWa94ywbgp0I8+H4bBl1pJKZozqbHjlwLXSf69a7BPhOPvp
	 67vQTn3kKTcrA==
Message-ID: <2e8723a1-ec3f-4a0e-9c9a-9657b025799e@kernel.org>
Date: Tue, 15 Apr 2025 08:16:50 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] memory: renesas-rpc-if: Add RZ/G3E xSPI support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Mark Brown <broonie@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
References: <20250401143537.224047-1-biju.das.jz@bp.renesas.com>
 <20250401143537.224047-9-biju.das.jz@bp.renesas.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250401143537.224047-9-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/04/2025 16:35, Biju Das wrote:
>  int rpcif_manual_xfer(struct device *dev)
>  {
>  	struct rpcif_priv *rpc = dev_get_drvdata(dev);
> @@ -493,7 +769,7 @@ int rpcif_manual_xfer(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	ret = rpcif_manual_xfer_impl(rpc);
> +	ret = rpc->info->impl->manual_xfer(rpc);
>  
>  	pm_runtime_put(dev);
>  
> @@ -543,6 +819,61 @@ static void memcpy_fromio_readw(void *to,
>  	}
>  }
>  

Missing kerneldoc. Exported functions shoud have kerneldoc.

> +ssize_t xspi_dirmap_write(struct device *dev, u64 offs, size_t len, const void *buf)
> +{
> +	struct rpcif_priv *xspi = dev_get_drvdata(dev);
> +	loff_t from = offs & (xspi->size - 1);
> +	u8 addsize = xspi->addr_nbytes - 1;
> +	size_t size = xspi->size - from;
> +	ssize_t writebytes;
> +	int ret;
> +> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	if (len > size)
> +		len = size;
> +
> +	if (len > MWRSIZE_MAX)
> +		writebytes = MWRSIZE_MAX;
> +	else
> +		writebytes = len;
> +
> +	regmap_update_bits(xspi->regmap, XSPI_CMCFG0CS0,
> +			   XSPI_CMCFG0_FFMT(0x3) | XSPI_CMCFG0_ADDSIZE(0x3),
> +			   XSPI_CMCFG0_FFMT(0) | XSPI_CMCFG0_ADDSIZE(addsize));
> +
> +	regmap_update_bits(xspi->regmap, XSPI_CMCFG2CS0,
> +			   XSPI_CMCFG2_WRCMD_UPPER(0xff) | XSPI_CMCFG2_WRLATE(0x1f),
> +			   XSPI_CMCFG2_WRCMD_UPPER(xspi->command) |
> +			   XSPI_CMCFG2_WRLATE(xspi->dummy));
> +
> +	regmap_update_bits(xspi->regmap, XSPI_BMCTL0,
> +			   XSPI_BMCTL0_CS0ACC(0xff), XSPI_BMCTL0_CS0ACC(0x03));
> +
> +	regmap_update_bits(xspi->regmap, XSPI_BMCFG,
> +			   XSPI_BMCFG_WRMD | XSPI_BMCFG_MWRCOMB |
> +			   XSPI_BMCFG_MWRSIZE(0xff) | XSPI_BMCFG_PREEN,
> +			   0 | XSPI_BMCFG_MWRCOMB | XSPI_BMCFG_MWRSIZE(0x0f) |
> +			   XSPI_BMCFG_PREEN);
> +
> +	regmap_update_bits(xspi->regmap, XSPI_LIOCFGCS0, XSPI_LIOCFG_PRTMD(0x3ff),
> +			   XSPI_LIOCFG_PRTMD(xspi->proto));
> +
> +	memcpy_toio(xspi->dirmap + from, buf, writebytes);
> +
> +	/* Request to push the pending data */
> +	if (writebytes < MWRSIZE_MAX)
> +		regmap_update_bits(xspi->regmap, XSPI_BMCTL1,
> +				   XSPI_BMCTL1_MWRPUSH, XSPI_BMCTL1_MWRPUSH);
> +
> +	pm_runtime_put(dev);
> +
> +	return writebytes;
> +}
> +EXPORT_SYMBOL(xspi_dirmap_write);

GPL

> +
Best regards,
Krzysztof

