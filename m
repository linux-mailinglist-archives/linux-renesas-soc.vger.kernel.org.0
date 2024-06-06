Return-Path: <linux-renesas-soc+bounces-5895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFC98FDB6E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 02:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A19481C2332D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 00:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FB95256;
	Thu,  6 Jun 2024 00:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LN2eheQr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864236FD0;
	Thu,  6 Jun 2024 00:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717633609; cv=none; b=bzivyi1sJz3ZTGG5fDYIF8rb+fcafy/K4X2L0VGYqUBYEl9vX7BuGeiy+Oyw5VzA1beQkExWFMqYcOzFIXu7FfsA/YEAo79bJDAC5tjIEEtPns7v8DJ3//LEKcLCu2gIxsTWdCqUQ3KYWsdVGzSOo3l5etB2xUJXDGvwdycpPSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717633609; c=relaxed/simple;
	bh=MM2QMsLe0ZgjuDnS73yE9zszh8M3oKt5xpWPRXHXlmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQnqfrTnqMD3D30bHG+bC+5R8tsaCuSc7QNRPRirOnhgLVAbRfFjENhHGid0O+VZanqMn25ExqNAHIEET0i3QOsJuFD22UlPZhCiTpqu9u0OMfs5l/+mGbSMz4+pSnUBDBi6Ypypsvr0e8gQBtHE57kKdBB59GSc2gtFLfYyISw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LN2eheQr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69C8C2BD11;
	Thu,  6 Jun 2024 00:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717633609;
	bh=MM2QMsLe0ZgjuDnS73yE9zszh8M3oKt5xpWPRXHXlmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LN2eheQrWpwtH/IqSC6KHJvOdTTmeEc3ZOyb68UIJETLdERLNTpkxSfytI/fI+gfY
	 PAyNBZ6frbn/j0Dy1Bxmrxyp8JKWZof9Vw5Y9+KdY7LMxBgFA6ijG2LvAiZ1DlI9cE
	 g42vtbuwRqYVhh2fXww+1nMBCYb3TFI28HDPqawaH/dMtLr9yotqPZvADWOrwFblcb
	 pDO/M97IvRnBEFNQDfsEz1t9dH93Vnx56oCNyM0VXnKfMTGnK86fKLYhYjcJQ5IKfK
	 4dXwo1628JeOHqAn4OvWThps3oxN+56OAImLj/0dVRPPJA3jl8WzLpp+GwW2VnjpT3
	 5VmLiIKMzuUKQ==
Date: Wed, 5 Jun 2024 18:26:46 -0600
From: Rob Herring <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH 3/4] dt-bindings: mmc: renesas,sdhi: Document
 RZ/V2H(P) support
Message-ID: <20240606002646.GA3509352-robh@kernel.org>
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240605074936.578687-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605074936.578687-4-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Wed, Jun 05, 2024 at 08:49:35AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to that
> of the R-Car Gen3, but it has some differences:
> - HS400 is not supported.
> - It supports the SD_IOVS bit to control the IO voltage level.
> - It supports fixed address mode.
> 
> To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g057'
> compatible string is added.
> 
> A "vqmmc-r9a09g057-regulator" regulator object is added to handle the
> voltage level switch of the SD/MMC pins.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 3d0e61e59856..154f5767cf03 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -18,6 +18,7 @@ properties:
>            - renesas,sdhi-r7s9210 # SH-Mobile AG5
>            - renesas,sdhi-r8a73a4 # R-Mobile APE6
>            - renesas,sdhi-r8a7740 # R-Mobile A1
> +          - renesas,sdhi-r9a09g057 # RZ/V2H(P)
>            - renesas,sdhi-sh73a0  # R-Mobile APE6
>        - items:
>            - enum:
> @@ -118,7 +119,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: renesas,rzg2l-sdhi
> +            enum:
> +              - renesas,sdhi-r9a09g057
> +              - renesas,rzg2l-sdhi
>      then:
>        properties:
>          clocks:
> @@ -204,6 +207,21 @@ allOf:
>          sectioned off to be run by a separate second clock source to allow
>          the main core clock to be turned off to save power.
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,sdhi-r9a09g057
> +    then:
> +      properties:
> +        vqmmc-r9a09g057-regulator:

The node is already conditional on the compatible, so why the chip name? 
Then it doesn't work when the 2nd chip needs this.


> +          type: object
> +          description: VQMMC SD regulator
> +          $ref: /schemas/regulator/regulator.yaml#
> +          unevaluatedProperties: false
> +      required:
> +        - vqmmc-r9a09g057-regulator
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.34.1
> 

