Return-Path: <linux-renesas-soc+bounces-14232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B260CA5A63E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 22:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 677A13A6B74
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 21:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622D11DD0E7;
	Mon, 10 Mar 2025 21:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bj7X+4xV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A63A1DFFD;
	Mon, 10 Mar 2025 21:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741642258; cv=none; b=Xunc6sWu6/dnN/UTFVuILCLKQ5FfCiHtOSioALGZYJfwDsGqDsXldUYEDTdJHqhPng12p6FVNzpxEhq+5h7urNT0jxHC4AvBBWyYuIli7P1U6D8ViGntECJMjOmLkmT0CneSr8aj4hF9jzFwb/as5aYw9vJt0T7ZExcSSCnbiZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741642258; c=relaxed/simple;
	bh=57tbpPBX1YgkIQFCnnh1iR1yyY6DIOZPwgcUTQre1F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XwNTNlXg/augVyisk/2uwARQiIbBoEaULy4oz8hPMaRVsmTba8SOfIz9KsXItZ13R4d6zK1BKtNSmRdnl80esljnpyiNN1p0qNk9uWZYYTuiBKKlZgde9rtJRpsil37yvH619kj6tv/zORl5k+TUcNx/sGTJdrvdIWuhAq6Tw34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bj7X+4xV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65959C4CEE5;
	Mon, 10 Mar 2025 21:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741642257;
	bh=57tbpPBX1YgkIQFCnnh1iR1yyY6DIOZPwgcUTQre1F0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bj7X+4xVe5p+0NSZYbpGvyqTx74qiQ6H///mVSWebVsdZ2TtWQ1FILXJiXHoCgJkd
	 2y55OaZZAv9znpc8kLqG7M8S/936GED8cIiBdRvnnmIXiixJjaX9SiMRWVP4uB6uUZ
	 MI9An+OdlsbWjOxp/xpH+TGxUcbxHDjyfJbCYwRIW6/0PNvCi7PsgEyn5+JvT1hdtK
	 m2FQGxFu3GqsCsCHC1EH2fKYxV8xIIEF4OSvC86mCh2tDVp9jlpPYpo0dudqefoxvC
	 aEnsAAE5hecdxpd6iypKDRn2E/6EpDdb4nh6QdrcYpDpYBL+4gOT4Lm7O23swGdFUG
	 IEvrrtp/Q61WQ==
Date: Mon, 10 Mar 2025 16:30:56 -0500
From: Rob Herring <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: net: dwmac: Increase
 'maxItems' for 'interrupts' and 'interrupt-names'
Message-ID: <20250310213056.GA904881-robh@kernel.org>
References: <20250308200921.1089980-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250308200921.1089980-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308200921.1089980-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Sat, Mar 08, 2025 at 08:09:19PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Increase the `maxItems` value for the `interrupts` and `interrupt-names`
> properties to accommodate the Renesas RZ/V2H(P) SoC, which features the
> `snps,dwmac-5.20` IP with 11 interrupts.
> 
> Also add `additionalItems: true` to allow specifying extra interrupts
> beyond the predefined ones. Update the `interrupt-names` property to
> allow specifying extra `interrupt-names`.
> 
> Also refactor the optional `interrupt-names` property by consolidating
> repeated enums into a single enum list.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Note, for this change I will be sending a sperate patch for vendor
> bindings to add constraints.
> 
> v1->v2
> - No change
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 3f0aa46d798e..fad0d611a75c 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -114,6 +114,8 @@ properties:
>  
>    interrupts:
>      minItems: 1
> +    maxItems: 11
> +    additionalItems: true
>      items:
>        - description: Combined signal for various interrupt events
>        - description: The interrupt to manage the remote wake-up packet detection
> @@ -122,11 +124,11 @@ properties:
>  
>    interrupt-names:
>      minItems: 1
> +    maxItems: 11
> +    additionalItems: true
>      items:
>        - const: macirq
>        - enum: [eth_wake_irq, eth_lpi, sfty]
> -      - enum: [eth_wake_irq, eth_lpi, sfty]
> -      - enum: [eth_wake_irq, eth_lpi, sfty]

I think this should be structured similar to the DWC PCIe binding where 
we define all possible names, but not the order:

minItems: 1
maxItems: 11
items:
  oneOf:
    - const: macirq
      description: ...
    - const: eth_wake_irq
      description: ...
    - pattern: '^rx-queue-[0-3]$'
      description: ...
    - pattern: '^tx-queue-[0-3]$'
      description: ...

And so on. Move the descriptions from 'interrupts' and drop 'items' and 
'additionalItems' from it.

Rob

