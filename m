Return-Path: <linux-renesas-soc+bounces-22862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D90EBCB74E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 04:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E9BF408880
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 02:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C310B176FB1;
	Fri, 10 Oct 2025 02:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DoE7yU7W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B6314F9FB;
	Fri, 10 Oct 2025 02:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760064533; cv=none; b=GF92hpt9Lv0zAYLgcvi/WR0swo2hn8FvIv+nFlLRPCdqDzjVMPbTPQqptVl+oNvE6lchhvpRAAph2L9iT19humuODXZ9oJICCOL5qS9Ys1g1FXSY3WVqNs5WJ0vF1T8ET9gNX4sdW5L/daZ64rpwJq8xSqmNyETGu4/a1wG/WRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760064533; c=relaxed/simple;
	bh=dpHvJ3fXY5TGb269aSKXP1Sb8xv7H1F0krpu0an6SWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOEPGVzgH//gVqDO+xB2uStHAU9efZRGKX8kJdzovwA+HSu303mSlL17BkjQklUbCEQRhICzj0VR8bASvxahit11ySvAJi+7ESyTEgeUBhzmvok5Khm+lRDbFPFzf52iFais4FYtGU69zcpG9HZ1DN5FMKEtmAV0R4NP365rIDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DoE7yU7W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52BCC4CEE7;
	Fri, 10 Oct 2025 02:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760064533;
	bh=dpHvJ3fXY5TGb269aSKXP1Sb8xv7H1F0krpu0an6SWg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DoE7yU7WXBy06VP9Dofh+2qXhJ6nB0/LI0pvzA7fkWCHph4P+6b1nm8WKFCs6jduf
	 3Swy2O5eBg1OX2d7jM2u8PlLUNx2+EUZOaHk9+dvrmyln8WHqd25Tk57Htu0ytOVnW
	 /KLm9WAGiqEJCvw8VoYDCsk8f+zNwWvGI7CA/+VzHfpfcKN1PXlf8DM9TvLxV++QsE
	 Hq3bJ6AGQIRFyeLqX4Qd812NF/VAKyfZmBPb/SlubG2q7aDW4n73OJ2MxaIKckHMgm
	 2iwpX76GgVp68SbzxgqHClHXrDfbCXpkgtdZAD+oizuqU/sDv/E5Cebxf2/b40gTXS
	 ZfDbTvu/ZrLnQ==
Message-ID: <4f490516-20d8-485f-8e1a-a1fb8c23e526@kernel.org>
Date: Fri, 10 Oct 2025 04:48:48 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] memory: renesas-rpc-if: Add suspend/resume support
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
References: <20250923151437.287721-1-biju.das.jz@bp.renesas.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20250923151437.287721-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/2025 17:14, Biju wrote:
>  	if (rpc->info->type == XSPI_RZ_G3E) {
> -		struct clk *spi_clk;
> -
> -		spi_clk = devm_clk_get_enabled(dev, "spix2");
> -		if (IS_ERR(spi_clk))
> -			return dev_err_probe(dev, PTR_ERR(spi_clk),
> +		rpc->spix2_clk = devm_clk_get_enabled(dev, "spix2");
> +		if (IS_ERR(rpc->spix2_clk))
> +			return dev_err_probe(dev, PTR_ERR(rpc->spix2_clk),
>  					     "cannot get enabled spix2 clk\n");
>  
> -		spi_clk = devm_clk_get_enabled(dev, "spi");
> -		if (IS_ERR(spi_clk))
> -			return dev_err_probe(dev, PTR_ERR(spi_clk),
> +		rpc->spi_clk = devm_clk_get_enabled(dev, "spi");
> +		if (IS_ERR(rpc->spi_clk))
> +			return dev_err_probe(dev, PTR_ERR(rpc->spi_clk),
>  					     "cannot get enabled spi clk\n");
>  	}
>  
> @@ -1063,6 +1063,44 @@ static void rpcif_remove(struct platform_device *pdev)
>  	platform_device_unregister(rpc->vdev);
>  }
>  
> +static int rpcif_suspend(struct device *dev)
> +{
> +	struct rpcif_priv *rpc = dev_get_drvdata(dev);
> +
> +	if (rpc->info->type == XSPI_RZ_G3E) {

clk are null in other case, so you can simplify it by dropping this if().

> +		clk_disable_unprepare(rpc->spi_clk);
> +		clk_disable_unprepare(rpc->spix2_clk);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rpcif_resume(struct device *dev)
> +{
> +	struct rpcif_priv *rpc = dev_get_drvdata(dev);
> +
> +	if (rpc->info->type == XSPI_RZ_G3E) {


... which would save you one indentation here making it a bit more readable.

> +		int ret;
> +
> +		ret = clk_prepare_enable(rpc->spix2_clk);
> +		if (ret) {
> +			dev_err(dev, "failed to enable spix2 clock: %pe\n",
> +				ERR_PTR(ret));
> +			return ret;


Best regards,
Krzysztof

