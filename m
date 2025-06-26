Return-Path: <linux-renesas-soc+bounces-18812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66340AEAA31
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 01:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00560562AA5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 23:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6EC224B05;
	Thu, 26 Jun 2025 23:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6HSjCRP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDE12236F8;
	Thu, 26 Jun 2025 23:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979354; cv=none; b=BA/a4081JoVoEl2k9QSFoyxa1dC64OEHf/D0LaW0QqZS2suekyaXoMtLbWNphIfzLmXoM06OAebLfyg40YaHiifHKbCqpSCoORndu7Ee/9rXIqZcX0uE0Q5grb6RW/nUJSLOt9oW+dx2uAhiky658fuBpBWIxbroy9w5y8Qj5oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979354; c=relaxed/simple;
	bh=NldmZOZLq6IiyJ7LGJYUM4TN7NywgseMK5R0ow1fO/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQTc5TVwKzv93wHmj7mpqtHq0FleC7fnDLBrTt9wP2IhS4X75NI9SpCOkHQEpYB4WU8/sa/Uf8/gV9RXS/x4fxZa24nFozYiMTGlWC0FDjgb6H1/wiSH3LK9Aov22VlLQzTRex5kdXLGpIlsjE4IK/GbFQZ4sbWdtBKs1j1qzmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6HSjCRP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADE8C4CEEB;
	Thu, 26 Jun 2025 23:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750979354;
	bh=NldmZOZLq6IiyJ7LGJYUM4TN7NywgseMK5R0ow1fO/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E6HSjCRPb3tBYcmnXFW9/p22GYEtwy21hP711lYkpkPd4mwOBVxRGjnHQ3R0KjkjH
	 SEYaHKTFRmOrsANeVQbR/0gO0lyVdUySyGuN/rY0tc7d2HYUz/nPff/5x5H/IaCFpy
	 fnE8s17wbZRpNTjj6dQ0BNJEnU68NHfABTerdjf+qRrS/oPTDeR+tWonZQsbATzqMI
	 JT6yYp1vKUSvDC1luTlH51pdNzV3zoUnDoGheZ2voD4CZw+O5WGtv8WQisUrxEM0ew
	 G7tnTvIhhICfW6iAUzzKrc5B3go9Hu8Kaz39mIX5GklyOJQKnMReDZIaMdXQe75dNU
	 SEebhsihP8elA==
Date: Thu, 26 Jun 2025 18:09:13 -0500
From: Rob Herring <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v12 1/7] dt-bindings: serial: Added secondary clock for
 RZ/T2H RSCI
Message-ID: <20250626230913.GA1338561-robh@kernel.org>
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250617134504.126313-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617134504.126313-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Jun 17, 2025 at 02:44:58PM +0100, Prabhakar wrote:
> From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> 
> At boot, the default clock is the PCLKM core clock (synchronous
> clock, which is enabled by the bootloader).
> For different baudrates, the asynchronous clock input must be used.
> Clock selection is made by an internal register of RCSI.
> 
> Add the optional "sck", external clock input.
> 
> Also remove the unneeded serial0 alias from the dts example.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Hi Rob,
> As mentioned in the thread [1] below there are no users of the RSCI binding
> hence this change doesn not break any ABI.
> 
> [1] https://lore.kernel.org/all/CAMuHMdUThuWxxznhjvcn5cOFCWOkb5u-fRYwTOoenDRY=4H6FA@mail.gmail.com/

Please state this in the commit message. If you want to break the ABI 
you have to say that you are and why it is okay.

> 
> Cheers, Prabhakar
> ---
>  .../bindings/serial/renesas,rsci.yaml           | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> index ea879db5f485..1bf255407df0 100644
> --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> @@ -35,10 +35,15 @@ properties:
>        - const: tei
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 2
> +    maxItems: 3
>  
>    clock-names:
> -    const: fck # UART functional clock
> +    minItems: 2
> +    items:
> +      - const: operation
> +      - const: bus
> +      - const: sck # optional external clock input
>  
>    power-domains:
>      maxItems: 1
> @@ -60,10 +65,6 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/clock/renesas-cpg-mssr.h>
>  
> -    aliases {
> -        serial0 = &sci0;
> -    };
> -
>      sci0: serial@80005000 {
>          compatible = "renesas,r9a09g077-rsci";
>          reg = <0x80005000 0x400>;
> @@ -72,7 +73,7 @@ examples:
>                       <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
>                       <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
>          interrupt-names = "eri", "rxi", "txi", "tei";
> -        clocks = <&cpg CPG_MOD 108>;
> -        clock-names = "fck";
> +        clocks = <&cpg CPG_MOD 8>, <&cpg CPG_CORE 13>;
> +        clock-names = "operation", "bus";
>          power-domains = <&cpg>;
>      };
> -- 
> 2.49.0
> 

