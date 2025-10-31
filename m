Return-Path: <linux-renesas-soc+bounces-23943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BA2C22C0C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 01:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D1234241C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 00:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C85A18FDBD;
	Fri, 31 Oct 2025 00:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLLrLbBu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8AFEEBB;
	Fri, 31 Oct 2025 00:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761868815; cv=none; b=rAc/s0Dy3bwx/obCt4SXH3MjE+W1NXYIaS7/nrX95tg/GgRYlJJureeDiNGSpNJLwXb4k5Eg4AVXLmR16z04/d74N07ZRfwjKQf/N5f+uvKV31s5TPqo69NcYmJUpiCaDTO9100DOGgSJULYaQq8789Zev1UPQHBMPvYgvM9n/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761868815; c=relaxed/simple;
	bh=TUf+wdfNUg9el5M5Nv3isGUeBuYRnhk0BXyx0z3Ncaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyeRd/d0rWXCUzBr8Hj8GAxC0g0xHW8PbKFVK7gC6YHWz6F039q/CIUcFdzFZP3fbmRp9B55GhR6MJgjEJ6qLSKcrvmzuZsVCDZWgl16zo8Xo5Lc00+qDcobWRtCn5hLAR5pUMGXm3JlMdhnntus18wFgvZl0UDsL/kpjcg6aBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLLrLbBu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6E6C4CEFF;
	Fri, 31 Oct 2025 00:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761868814;
	bh=TUf+wdfNUg9el5M5Nv3isGUeBuYRnhk0BXyx0z3Ncaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLLrLbBublA+gKuH86+JQcloscGilFLZDGuh++t89ick8zz5F36h9oUl8D/UUgrr0
	 gY0YQCDIQeSy2/jgOi7GJK5EzDX+FnBo9XMghrfMREjGu3lGq1rslHkam/h/PYqaIy
	 RQfJek4MXYMNN3SPzC8HHJOHYisk5F3WZZmv5eP00YcvYZRww+wdQuqF5b9VCsFTnD
	 +CNLaSaaOWLnm8UJ9HJnm6vWaxFwMlqNLHXU8SX5SnqLJvIwJTo8jcRiKSvAKxGUnd
	 Yrs49MXMyCkPPNB/Ck88tX9G5xy2s8kI+1AqOeBBtR5m3qO0OX6fuO9spMLmaLkAxO
	 Glr3JLndKGrhA==
Date: Thu, 30 Oct 2025 19:00:12 -0500
From: Rob Herring <robh@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/13] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Message-ID: <20251031000012.GA466250-robh@kernel.org>
References: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
 <20251030175526.607006-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030175526.607006-2-biju.das.jz@bp.renesas.com>

On Thu, Oct 30, 2025 at 05:55:05PM +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add documentation for the serial communication interface (RSCI) found on
> the Renesas RZ/G3E (R9A09G047) SoC. The RSCI IP on this SoC is identical
> to that on the RZ/T2H (R9A09G077) SoC, but it has a 32-stage FIFO compared
> to 16 on RZ/T2H. It supports both FIFO and non-FIFO mode operation. RZ/G3E
> has 6 clocks(5 module clocks + 1 external clock) compared to 3 clocks
> (2 module clocks + 1 external clock) on RZ/T2H, and it has multiple resets.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit message
>  * Added resets:false for non RZ/G3E SoCs.
> ---
>  .../bindings/serial/renesas,rsci.yaml         | 85 ++++++++++++++++---
>  1 file changed, 74 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> index 6b1f827a335b..1c2ed4cd58fd 100644
> --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> @@ -10,17 +10,16 @@ maintainers:
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
> +          - renesas,r9a09g047-rsci # RZ/G3E non FIFO mode
> +          - renesas,r9a09g047-rscif # RZ/G3E FIFO mode
> +          - renesas,r9a09g077-rsci # RZ/T2H
>  
>        - items:
> +          - const: renesas,r9a09g087-rsci # RZ/N2H
>            - const: renesas,r9a09g077-rsci # RZ/T2H
>  
>    reg:
> @@ -42,14 +41,40 @@ properties:
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
> +      - items:
> +          - const: operation
> +          - const: bus
> +          - const: sck # optional external clock input

           minItems: 2

And drop the 1st items list.

> +      - items:
> +          - const: bus
> +          - const: tclk
> +          - const: tclk_div64
> +          - const: tclk_div16
> +          - const: tclk_div4
> +      - items:
> +          - const: bus
> +          - const: tclk
> +          - const: tclk_div64
> +          - const: tclk_div16
> +          - const: tclk_div4
> +          - const: sck # optional external clock input

           minItems: 5

and drop the 3rd items list.

> +
> +  resets:
> +    items:
> +      - description: Input for resetting the APB clock
> +      - description: Input for resetting TCLK
> +
> +  reset-names:
>      items:
> -      - const: operation
> -      - const: bus
> -      - const: sck # optional external clock input
> +      - const: presetn
> +      - const: tresetn
>  
>    power-domains:
>      maxItems: 1
> @@ -62,6 +87,44 @@ required:
>    - clock-names
>    - power-domains
>  
> +allOf:
> +  - $ref: serial.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-rsci
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +
> +        clock-names:
> +          maxItems: 3

You need minItems and maxItems here as the range is 2-6 clocks.
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a09g047-rsci
> +              - renesas,r9a09g047-rscif
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +
> +        clock-names:
> +          minItems: 5

And maxItems here in addition.

> +
> +      required:
> +        - resets
> +        - reset-names
> +    else:
> +      properties:
> +        resets: false
> +
>  unevaluatedProperties: false
>  
>  examples:
> -- 
> 2.43.0
> 

