Return-Path: <linux-renesas-soc+bounces-7871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E95955E52
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 19:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25F201C208C1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 17:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B494813FD86;
	Sun, 18 Aug 2024 17:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YrPiZ03X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216C41386C6;
	Sun, 18 Aug 2024 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002928; cv=none; b=AOoZ+oVenHgQEy2QnZJog911oF1D5tYmhI6zt+9A8zMF+Udr8KaAW8EUfsXHVRbwDu55tCSFhFJS3WXRUxix5NaqTADnhI0mcMVrWIkyvbgi8rcTOGGZJVfeiyE0KPg5cPx4U/WwMqlpdlqx7WGFpoPG12qa6eFOnOFht1D8uII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002928; c=relaxed/simple;
	bh=9Kn5iCNdVlSdiKkudNGb31nJGyOtMWHeXPAxfDeHWpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xm4vUTgHIbsgqX2kDDYeXSaFblgXuCCfWBpEvd87XGXJUftPu+BKRX5dmzoqD8QZTOrloGafeFYQW1CFPbJOiP2tG6AYxtrzI0P7dCWu4bg0aaicl315pPVfwFzHntHnGY3lVySjcqboBMYBLKsqmZxky57cH7zjmXzl+gRdSy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YrPiZ03X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B195A8A9;
	Sun, 18 Aug 2024 19:41:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724002863;
	bh=9Kn5iCNdVlSdiKkudNGb31nJGyOtMWHeXPAxfDeHWpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YrPiZ03XueusGurJmwrCX6GwerHd+bw6fcDrXLNqSHJLVpE4g8QaAF0+HZ0s6YNEh
	 yaXXHf5ILfhKJxy+yfHrUorRbiDyGRaDE0QCDB5ubl94x5UIjuoupBNsQHtYrwWeBj
	 9GQ8Dn3x1AyZCwb8NCesR4LaNyfu+DzRvOdP5ZYU=
Date: Sun, 18 Aug 2024 20:41:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: renesas,du: narrow interrupts
 and resets per variants
Message-ID: <20240818174137.GC29465@pendragon.ideasonboard.com>
References: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

Thank you for the patch.

On Sun, Aug 18, 2024 at 07:30:02PM +0200, Krzysztof Kozlowski wrote:
> Each variable-length property like interrupts or resets must have fixed
> constraints on number of items for given variant in binding.  The
> clauses in "if:then:" block should define both limits: upper and lower.

I thought that, when only one of minItems or maxItems was specified, the
other automatically defaulted to the same value. I'm pretty sure I
recall Rob asking me to drop one of the two in some bindings. Has the
rule changes ? Is it documented somewhere ?

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/renesas,du.yaml          | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index c5b9e6812bce..147842b6465a 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -173,6 +173,7 @@ allOf:
>              - pattern: '^dclkin\.[01]$'
>  
>          interrupts:
> +          minItems: 2
>            maxItems: 2
>  
>          resets:
> @@ -228,6 +229,7 @@ allOf:
>              - pattern: '^dclkin\.[01]$'
>  
>          interrupts:
> +          minItems: 2
>            maxItems: 2
>  
>          resets:
> @@ -281,6 +283,7 @@ allOf:
>              - pattern: '^dclkin\.[01]$'
>  
>          interrupts:
> +          minItems: 2
>            maxItems: 2
>  
>          resets:
> @@ -335,6 +338,7 @@ allOf:
>              - pattern: '^dclkin\.[01]$'
>  
>          interrupts:
> +          minItems: 2
>            maxItems: 2
>  
>          resets:
> @@ -396,6 +400,7 @@ allOf:
>              - pattern: '^dclkin\.[012]$'
>  
>          interrupts:
> +          minItems: 3
>            maxItems: 3
>  
>          resets:
> @@ -460,9 +465,11 @@ allOf:
>              - pattern: '^dclkin\.[0123]$'
>  
>          interrupts:
> +          minItems: 4
>            maxItems: 4
>  
>          resets:
> +          minItems: 2
>            maxItems: 2
>  
>          reset-names:
> @@ -489,9 +496,11 @@ allOf:
>  
>          renesas,cmms:
>            minItems: 4
> +          maxItems: 4
>  
>          renesas,vsps:
>            minItems: 4
> +          maxItems: 4
>  
>        required:
>          - clock-names
> @@ -531,9 +540,11 @@ allOf:
>              - pattern: '^dclkin\.[012]$'
>  
>          interrupts:
> +          minItems: 3
>            maxItems: 3
>  
>          resets:
> +          minItems: 2
>            maxItems: 2
>  
>          reset-names:
> @@ -558,9 +569,11 @@ allOf:
>  
>          renesas,cmms:
>            minItems: 3
> +          maxItems: 3
>  
>          renesas,vsps:
>            minItems: 3
> +          maxItems: 3
>  
>        required:
>          - clock-names
> @@ -600,9 +613,11 @@ allOf:
>              - pattern: '^dclkin\.[013]$'
>  
>          interrupts:
> +          minItems: 3
>            maxItems: 3
>  
>          resets:
> +          minItems: 2
>            maxItems: 2
>  
>          reset-names:
> @@ -627,9 +642,11 @@ allOf:
>  
>          renesas,cmms:
>            minItems: 3
> +          maxItems: 3
>  
>          renesas,vsps:
>            minItems: 3
> +          maxItems: 3
>  
>        required:
>          - clock-names
> @@ -684,6 +701,7 @@ allOf:
>  
>          renesas,vsps:
>            minItems: 1
> +          maxItems: 1
>  
>        required:
>          - clock-names
> @@ -719,6 +737,7 @@ allOf:
>              - pattern: '^dclkin\.[01]$'
>  
>          interrupts:
> +          minItems: 2
>            maxItems: 2
>  
>          resets:
> @@ -746,9 +765,11 @@ allOf:
>  
>          renesas,cmms:
>            minItems: 2
> +          maxItems: 2
>  
>          renesas,vsps:
>            minItems: 2
> +          maxItems: 2
>  
>        required:
>          - clock-names
> @@ -799,6 +820,7 @@ allOf:
>  
>          renesas,vsps:
>            minItems: 2
> +          maxItems: 2
>  
>        required:
>          - clock-names

-- 
Regards,

Laurent Pinchart

