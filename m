Return-Path: <linux-renesas-soc+bounces-7821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 606D3950A32
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Aug 2024 18:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC610B265C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Aug 2024 16:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7779019CCF2;
	Tue, 13 Aug 2024 16:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5TkZNoV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF70370;
	Tue, 13 Aug 2024 16:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723566742; cv=none; b=Eeb14F5uJq5IMAY3rZKvg7cfffQLP2TlikUDds3gLoTcRRU24NOsF84xNWk3+Lv2QozYJjWWYBtFKXPpt/AnOKhBFiaZnSI6JfZ6SdQGxhfVRH5DR59OMGyQI31mRr9l+q82rjhaCjXxSG9IxT0hRwxPIIjjGln3SvB2p0ap4Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723566742; c=relaxed/simple;
	bh=HuyCj2tPGVO2IiAHdy0cfOexKXFnn+hyoO6SKOtDQko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cr20B44KTou27QTQiPnkHGGg57+xzK6mXy6PoTAr92slCONTe3gG8AdLvyyKFBFNzmEERuarqahQhITd6NKwg2w3YvfT7tx6Y/y2vTNL5Zy8lu6zv/cqpBYfsF6DirlJ3loGqupQOmzOHE0+wUcE9H96nXuFIiFmXrkV9aEiZmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5TkZNoV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3E4C4AF09;
	Tue, 13 Aug 2024 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723566741;
	bh=HuyCj2tPGVO2IiAHdy0cfOexKXFnn+hyoO6SKOtDQko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j5TkZNoVMcsBgfpVjTlXUuMIILDxDwbSuagPpj+O55WlDHV4IRlSvnc7tPeSffXhf
	 x4xmAJcB72OPQCdZt8yPntPAEOcyiHBHI6FCAKiyhG1gG1Kb/SAmbI6lAmGZirLGJ8
	 FOL07CVmPnMDGaIqpzz4ZaAmWziHGr8a0MyiXJvbN4vq7yIcKrK2rYzzEiHA0FiTnP
	 5ojyZWao6e3ZEVhE75CYg6y6dueLHzmsjjqxsVF2LsTP3LAY+T5k8o2dT4Fqe2YX6q
	 b8nAn1bo68Oy182SbHJb0bU0GZlN9HymjTpnL3PNsr73uURBR+V/jl2Y5qqZanIBkV
	 q99/SzwaAN6KA==
Date: Tue, 13 Aug 2024 10:32:20 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Message-ID: <20240813163220.GA1164014-robh@kernel.org>
References: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
 <20240805155242.151661-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805155242.151661-2-biju.das.jz@bp.renesas.com>

On Mon, Aug 05, 2024 at 04:52:35PM +0100, Biju Das wrote:
> Document DU found in RZ/G2UL SoC. The DU block is identical to RZ/G2L
> SoC, but has only DPI interface.
> 
> While at it, add missing required property port@1 for RZ/G2L and RZ/V2L
> SoCs. Currently there is no user for the DPI interface and hence there
> won't be any ABI breakage for adding port@1 as required property for
> RZ/G2L and RZ/V2L SoCs.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Replaced ports->port property for RZ/G2UL as it supports only DPI.
>    and retained ports property for RZ/{G2L,V2L} as it supports both DSI
>    and DPI output interface.

Why? Having port and ports is just a needless complication.

>  * Added missing blank line before example.
>  * Dropped tags from Conor and Geert as there are new changes.
> v1->v2:
>  * Updated commit description related to non ABI breakage.
>  * Added Ack from Conor.
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 35 +++++++++++++++++--
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index 08e5b9478051..ca01bf26c4c0 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - renesas,r9a07g043u-du # RZ/G2UL
>            - renesas,r9a07g044-du # RZ/G2{L,LC}
>        - items:
>            - enum:
> @@ -60,8 +61,9 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          unevaluatedProperties: false
>  
> -    required:
> -      - port@0
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Connection to the DU output video port.
>  
>      unevaluatedProperties: false
>  
> @@ -83,11 +85,38 @@ required:
>    - clock-names
>    - resets
>    - power-domains
> -  - ports
>    - renesas,vsps
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g043u-du
> +    then:
> +      properties:
> +        port:
> +          description: DPI

This is equivalent to 'port@0'. IMO, this case should have a 'port@1' 
node so that DPI interface is *always* the same port.

> +
> +      required:
> +        - port
> +    else:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI
> +            port@1:
> +              description: DPI
> +
> +          required:
> +            - port@0
> +            - port@1
> +      required:
> +        - ports
> +
>  examples:
>    # RZ/G2L DU
>    - |
> -- 
> 2.43.0
> 

