Return-Path: <linux-renesas-soc+bounces-11305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED9A9F12BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 17:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69F64188DEA6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 16:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FC41E3DC2;
	Fri, 13 Dec 2024 16:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mJnvKbi1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69B61DFE01;
	Fri, 13 Dec 2024 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734108370; cv=none; b=t5zZ3WSUvztNZYi8RCsT7jVLCYmeL9EECQO2659IQutzIPWodf6463sOZs7bja2nvkhdIXav7KjNpieFNQ+IeVvsMllTFEUn4ohGHVlQeiNTIS2do5J/n67HdLDKuHCzAgsVbx9DAF2KTP22QzXcbAzo3lgutl2cJFm4A0kAPDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734108370; c=relaxed/simple;
	bh=M8kcQm2A0ykm55axI3kDdeYhrMewZUX1CR/r0W7/ncU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdxDmulnjKrucYA+azvX2/j/TItS05MeF99WL6AMgu3UJ7w75ynjzZkhbDpHdYn7P8X2lueukCKYmBdac/ZhEVkQRHIQi6KZBn96qlmsSwtV4yFJLxdCPKVY0tpghmlXkEQ56PVXkN7MFfJSTE0sOTmKWIBjuJn4fdSGACGlf/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mJnvKbi1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07B21465;
	Fri, 13 Dec 2024 17:45:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734108324;
	bh=M8kcQm2A0ykm55axI3kDdeYhrMewZUX1CR/r0W7/ncU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJnvKbi1XTtUpAOhk1oNAuwTRxLq6PdodzjHwaWfSPT1zZ25ymT+Idk2kOPmxIlzX
	 Fmv/2mL0Jr2fVFdq22MHWsA3t80mVE+kJQxRcSXq9+ekcpzdg4EQJRzOUhzOctEeDk
	 Sw1MP6/DuoQuoqnj6cfGf7CE1COc70mNUrALakHk=
Date: Fri, 13 Dec 2024 18:45:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 3/7] dt-bindings: display: renesas,du: Add missing
 maxItems
Message-ID: <20241213164541.GA8294@pendragon.ideasonboard.com>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
 <20241213-rcar-gh-dsi-v4-3-f8e41425207b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241213-rcar-gh-dsi-v4-3-f8e41425207b@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, Dec 13, 2024 at 04:02:59PM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> The binding is missing maxItems for all renesas,cmms and renesas,vsps
> properties. As the amount of cmms or vsps is always a fixed amount, set
> the maxItems to match the minItems.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index c5b9e6812bce..e5fbc4ffe29c 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -489,9 +489,11 @@ allOf:
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
> @@ -558,9 +560,11 @@ allOf:
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
> @@ -627,9 +631,11 @@ allOf:
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
> @@ -684,6 +690,7 @@ allOf:
>  
>          renesas,vsps:
>            minItems: 1
> +          maxItems: 1
>  
>        required:
>          - clock-names
> @@ -746,9 +753,11 @@ allOf:
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
> @@ -799,6 +808,7 @@ allOf:
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

