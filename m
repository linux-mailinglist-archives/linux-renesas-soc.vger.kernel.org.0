Return-Path: <linux-renesas-soc+bounces-14823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 149DAA711A1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 08:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55BC817063D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 07:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C105D1A01BF;
	Wed, 26 Mar 2025 07:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAafwzOT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC29174EF0;
	Wed, 26 Mar 2025 07:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742975402; cv=none; b=s/uSVTXR4SWTktqPobsmjYw89UudQQuUWKxR3Q0EB3nhkEBRkfxwMygIPqs5TzyltkOwlS33/pAUeBhuLceXR2maALGfIr6G/k5TYsmUxdGJVkj5+z46uHCZUGO3RqwfkrLuudrcwXi9d3Tli+4A1lWJviNIDy+bSQA+AcW7ocA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742975402; c=relaxed/simple;
	bh=+HmoQmZ+e63wV91IkgWswXeGaR7GVD5Pdeyax7MBkHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CS1tzFr2Sud4Q8iyREzXcFtmrv5U3+Q9dAYyomNE4HrHAZLJEKjBbjx9GyKr25H1CE6MuCJGQBEWd+SE14d5EHOZYWYGw9xqusP3lptv2Ikqij17V1B4B7mwEORXE6s0h9HyxVPwdjpPBEjgDunkfA40RtZ8QT6B9bETroo6dJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAafwzOT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30505C4CEE2;
	Wed, 26 Mar 2025 07:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742975402;
	bh=+HmoQmZ+e63wV91IkgWswXeGaR7GVD5Pdeyax7MBkHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kAafwzOT0lqUjMuX53xExQ7/TqWhrFQcy8yTnO589rSH8pQKxFVH2wzK7MI296Bcg
	 ywuBTgLyJrqKW4h3xFIU4VmsZHvJYX5wO84uzxlecTGcdBslqgBER1nHk/SSuj1zzb
	 EHyThnjTCS5XBdsyiuDcWa4RCZwWdoX/Mb20CyDBmuORMauwh56q5ILjbbp3VMr0wj
	 ++s/X1zrVLkbbWrTd//rW4jIoGnqo6wNKmYknR6vm+fPemc2LZSu/hSUpvbEz6yTwr
	 dmlM3h64RA2/3DLaf6u0KMfQSVkgHNcym9iXR2Z2Q5QMKtKvu06QjfR6b4FCG359oe
	 dLoJmx1CnPmZA==
Date: Wed, 26 Mar 2025 08:49:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
Message-ID: <20250326-enigmatic-cuscus-of-enhancement-410130@krzk-bin>
References: <20250325160904.2688858-1-thierry.bultel.yh@bp.renesas.com>
 <20250325160904.2688858-3-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325160904.2688858-3-thierry.bultel.yh@bp.renesas.com>

On Tue, Mar 25, 2025 at 05:08:50PM +0100, Thierry Bultel wrote:
> Document RZ/T2H (a.k.a r9a09g077) cpg-mssr (Clock Pulse Generator) binding.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v4->v5:
>   - Set reg minItems and maxItems defaults at top level
> Changes v3->v4:
>   - Handle maxItems and clocks names properly in schema. 


Can you start using b4 or send patchsets in standard way? No links to
previous versions in changelog and b4 diff does not work:

b4 diff '20250325160904.2688858-1-thierry.bultel.yh@bp.renesas.com'
Grabbing thread from lore.kernel.org/all/20250325160904.2688858-1-thierry.bultel.yh@bp.renesas.com/t.mbox.gz
Checking for older revisions
Grabbing search results from lore.kernel.org
  Added from v4: 14 patches
---
Analyzing 140 messages in the thread
Preparing fake-am for v4: dt-bindings: soc: Add Renesas RZ/T2H (R9A09G077) SoC
ERROR: Could not fake-am version v4
---
Could not create fake-am range for lower series v4


> ---
>  .../bindings/clock/renesas,cpg-mssr.yaml      | 55 +++++++++++++------
>  .../clock/renesas,r9a09g077-cpg-mssr.h        | 49 +++++++++++++++++
>  2 files changed, 88 insertions(+), 16 deletions(-)
>  create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> index 77ce3615c65a..5181ff826dbe 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> @@ -52,9 +52,11 @@ properties:
>        - renesas,r8a779f0-cpg-mssr # R-Car S4-8
>        - renesas,r8a779g0-cpg-mssr # R-Car V4H
>        - renesas,r8a779h0-cpg-mssr # R-Car V4M
> +      - renesas,r9a09g077-cpg-mssr # RZ/T2H
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    clocks:
>      minItems: 1
> @@ -63,11 +65,6 @@ properties:
>    clock-names:
>      minItems: 1
>      maxItems: 2
> -    items:
> -      enum:
> -        - extal     # All
> -        - extalr    # Most R-Car Gen3 and RZ/G2
> -        - usb_extal # Most R-Car Gen2 and RZ/G1
>  
>    '#clock-cells':
>      description: |
> @@ -92,16 +89,6 @@ properties:
>        the datasheet.
>      const: 1
>  
> -if:
> -  not:
> -    properties:
> -      compatible:
> -        items:
> -          enum:
> -            - renesas,r7s9210-cpg-mssr
> -then:
> -  required:
> -    - '#reset-cells'
>  
>  required:
>    - compatible
> @@ -113,6 +100,42 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:

This goes befoer additionalProps. See example-schema.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-cpg-mssr
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2

Missing constriants for clocks.

Best regards,
Krzysztof


