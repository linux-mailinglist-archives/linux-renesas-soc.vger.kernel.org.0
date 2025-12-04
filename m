Return-Path: <linux-renesas-soc+bounces-25547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3058CA2BC4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 09:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B3263011751
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 08:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C4632827F;
	Thu,  4 Dec 2025 08:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xnpz/7Nz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6B1323411;
	Thu,  4 Dec 2025 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764835386; cv=none; b=YpGQ+nvfd3bIpRtyOv1OTNQsNW6/3mScWYyE2qxeGGDdoxVTc34B1JK45uB1q97K13QeKxHkdD4T4/dYbQxqUU3p2WkBIyieUX2HMT+7FPI7yg/MNR5dWwIQ3YUznOggINExI8C10GigOZMCEbNDEnRKYUM31IhRSvYD25xgil0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764835386; c=relaxed/simple;
	bh=Lr1kagNMRrCzust7hfdVoo8cE6Tah3QuP0usoo/mNWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmgqVSc3WRSnjYPoCqVpcQpxbSqZAODtNLsE4rpmOwUcgHvWHXEarn9vDL66y74qRzpjakyye+UwpMV1Sq93p2fbIfm4dlePZtK71prt47M6yrHISYL7+r1lAL/BwE105HDNIskV9bAspat3dVqOF1Ae3h4xdRNTmcdpTv1ixWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xnpz/7Nz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DBBC113D0;
	Thu,  4 Dec 2025 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764835385;
	bh=Lr1kagNMRrCzust7hfdVoo8cE6Tah3QuP0usoo/mNWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xnpz/7Nza9sTqs96S/fnSFiQ0lpqtCdtxmTXcz93X0yAsYxpYqp5Wi6yOIr/gQ2ad
	 jRB6lPjAUJfyoNfVk8siNdH7s7Rx0Ws3RfGzr/mlu6Z+sMVSRFyHItI4vrDDQn0SUE
	 wVJnY/lhmxem82Jtc6CCRf4An0qtHT9+u/m+iRdVtiLY4T6mHSGj9tX9iycI/FirVE
	 rWQxtokezE7tEJ1dM9E92ISjD7MkZ1kSCHHgxz5/YRn0bJOuY0GSZN/RyV6bcL63LR
	 NM+/yP+SEHoAKPDm/Hvu27X0Uhqz6cAk6p+GNn8hBP0Z945EiQVaEEiWsqqH4VDwbY
	 Eu7ly9omVUbHA==
Date: Thu, 4 Dec 2025 09:03:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 01/17] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Message-ID: <20251204-cute-slim-husky-aa4dc4@quoll>
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
 <20251129164325.209213-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251129164325.209213-2-biju.das.jz@bp.renesas.com>

On Sat, Nov 29, 2025 at 04:42:57PM +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add documentation for the serial communication interface (RSCI) found on
> the Renesas RZ/G3E (R9A09G047) SoC. The RSCI IP on this SoC is identical
> to that on the RZ/T2H (R9A09G077) SoC, but it has a 32-stage FIFO compared
> to 16 on RZ/T2H. It supports both FIFO and non-FIFO mode operation. RZ/G3E
> has 6 clocks(5 module clocks + 1 external clock) compared to 3 clocks
> (2 module clocks + 1 external clock) on RZ/T2H, and it has multiple resets.
> It has 6 interrupts compared to 4 on RZ/T2H.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
>  * Updated commit description related to IRQ difference
>  * Added aed and bfd irqs for RZ/G3E.
>  * Moved reset: false to RZ/T2H SoC and dropped the else part for RZ/G3E.
>  * Updated conditional schema with interrupts and interrupts-names.
>  * Dropped the tag as there are new changes.
> v3->v4:
>  * Dropped separate compatible for non-FIFO mode and instead using single
>    compatible "renesas,r9a09g047-rsci" as non-FIFO mode can be achieved
>    by software configuration.
>  * Renamed clock-names bus->pclk
>  * Rearranged clock-names tclk{4, 16, 64}
>  * Retained the tag as the changes are trivial.
> v2->v3:
>  * Dropped 1st and 3rd items from clk-names and added minItems for the
>    range.
>  * Added minItems for clk and clk-names for RZ/T2H as the range is 2-3
>  * Added maxItems for clk and clk-names for RZ/G3E as the range is 5-6
>  * Retained the tag as it is trivial change.
> v1->v2:
>  * Updated commit message
>  * Added resets:false for non RZ/G3E SoCs.
> ---
>  .../bindings/serial/renesas,rsci.yaml         | 99 ++++++++++++++++---
>  1 file changed, 88 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> index 6b1f827a335b..1f8cee8171de 100644
> --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> @@ -10,46 +10,72 @@ maintainers:
>    - Geert Uytterhoeven <geert+renesas@glider.be>
>    - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>  
> -allOf:
> -  - $ref: serial.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> -      - items:
> -          - const: renesas,r9a09g087-rsci # RZ/N2H
> -          - const: renesas,r9a09g077-rsci # RZ/T2H
> +      - enum:
> +          - renesas,r9a09g047-rsci # RZ/G3E
> +          - renesas,r9a09g077-rsci # RZ/T2H
>  
>        - items:
> +          - const: renesas,r9a09g087-rsci # RZ/N2H
>            - const: renesas,r9a09g077-rsci # RZ/T2H
>  
>    reg:
>      maxItems: 1
>  
>    interrupts:
> +    minItems: 4
>      items:
>        - description: Error interrupt
>        - description: Receive buffer full interrupt
>        - description: Transmit buffer empty interrupt
>        - description: Transmit end interrupt
> +      - description: Active edge detection interrupt
> +      - description: Break field detection interrupt
>  
>    interrupt-names:
> +    minItems: 4
>      items:
>        - const: eri
>        - const: rxi
>        - const: txi
>        - const: tei
> +      - const: aed
> +      - const: bfd
>  
>    clocks:
>      minItems: 2
> -    maxItems: 3
> +    maxItems: 6
>  
>    clock-names:
> -    minItems: 2
> +    oneOf:
> +      - items:
> +          - const: operation
> +          - const: bus
> +          - const: sck # optional external clock input
> +
> +        minItems: 2
> +
> +      - items:
> +          - const: pclk
> +          - const: tclk
> +          - const: tclk_div4
> +          - const: tclk_div16
> +          - const: tclk_div64
> +          - const: sck # optional external clock input
> +
> +        minItems: 5
> +
> +  resets:
>      items:
> -      - const: operation
> -      - const: bus
> -      - const: sck # optional external clock input
> +      - description: Input for resetting the APB clock
> +      - description: Input for resetting TCLK
> +
> +  reset-names:
> +    items:
> +      - const: presetn
> +      - const: tresetn

You did not include lore links, so I cannot check whether we already
talked about this (why you still do not send big patchsets like this
with b4?), but you are mixing here devices with completely different
innputs. This does not make the binding readable.

Split the binding.

Best regards,
Krzysztof


