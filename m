Return-Path: <linux-renesas-soc+bounces-11459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4FE9F4A1D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 12:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A6B2188C578
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 11:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749D51EF090;
	Tue, 17 Dec 2024 11:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o06c0iOV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06391E3DF7;
	Tue, 17 Dec 2024 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734435754; cv=none; b=o3SonI5herEj2YMfHTdu6//Nqsq6woZ63g20PnBb0+jICVCLa3qhWsL827nHQ6e9L3uFA5uEynqjHShOq7pyQImr3cscj/ZcpTyBg6xdu8Ijrixn1PwEQuMCXoCHLyzEhI+YNMTEjftNdUIRv3GfepvWiZJ84Unc6qcOtL0DDqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734435754; c=relaxed/simple;
	bh=/rYOAc8y4xEE7cn1aBZucNkEfLE/Pmtkk79KqNgF9j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hn3mTl+wp+a46y+zQoVFZE3wmL8FSfGwybKois2EOlGgrUAH13ZxQFwUoLj7h2WtrXL1X+auxN0EGC/tApJJrvwxCxsBx4bKtnve/TmAB8ZyukQvCelY6to8yf9NW+pRuh5uEVU/cDLYFPKciuLm4kd7tx7h/e7u9BJysjo/kuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o06c0iOV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC1BF4C7;
	Tue, 17 Dec 2024 12:41:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734435713;
	bh=/rYOAc8y4xEE7cn1aBZucNkEfLE/Pmtkk79KqNgF9j4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o06c0iOVU3ndycoPKNCasdwF6VUpwytQgSQfuOK2rjZjt886XIfFjQKhMLoxNlaYC
	 nughHi0KMlOrmN0MTWSKmWRMqc6VpZ11qW8xzDbDaAsCDRtmsE9QR3H0EaOG8CHrol
	 85GqP6uN+co5qb9NY/ayyJ7pA1eGGQq+TsmhgUCs=
Date: Tue, 17 Dec 2024 13:42:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
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
Subject: Re: [PATCH v5 3/7] dt-bindings: display: renesas,du: Add missing
 constraints
Message-ID: <20241217114227.GB32392@pendragon.ideasonboard.com>
References: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
 <20241217-rcar-gh-dsi-v5-3-e77421093c05@ideasonboard.com>
 <CAMuHMdUczNArF7JSfjrb11OTpd8LvHv5-gUFPFCayr+Qezsbbg@mail.gmail.com>
 <f10be07d-6bfa-4d09-9a45-81179592ec5c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f10be07d-6bfa-4d09-9a45-81179592ec5c@ideasonboard.com>

On Tue, Dec 17, 2024 at 11:59:53AM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 17/12/2024 10:14, Geert Uytterhoeven wrote:
> > Hi Tomi,
> > 
> > On Tue, Dec 17, 2024 at 6:32 AM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> The binding is missing maxItems for all renesas,cmms and renesas,vsps
> >> properties. As the amount of cmms or vsps is always a fixed amount, set
> >> the maxItems to match the minItems.
> >>
> >> Also add the minItems and maxItems to the top level properties.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > 
> > Thanks for your patch!
> > 
> >> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> >> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> >> @@ -77,6 +77,8 @@ properties:
> >>
> >>     renesas,cmms:
> >>       $ref: /schemas/types.yaml#/definitions/phandle-array
> >> +    minItems: 1
> >> +    maxItems: 4
> >>       items:
> >>         maxItems: 1
> >>       description:
> >> @@ -85,6 +87,8 @@ properties:
> >>
> >>     renesas,vsps:
> >>       $ref: /schemas/types.yaml#/definitions/phandle-array
> >> +    minItems: 1
> >> +    maxItems: 4
> >>       items:
> >>         items:
> >>           - description: phandle to VSP instance that serves the DU channel
> >> @@ -489,9 +493,11 @@ allOf:
> >>
> >>           renesas,cmms:
> >>             minItems: 4
> >> +          maxItems: 4
> >>
> >>           renesas,vsps:
> >>             minItems: 4
> >> +          maxItems: 4
> > 
> > AFAIK these two additions are not needed, as they already match the
> > values defined at the top level.
> 
> But if we add a new SoC, which has 5 vsps, we would need to increase the 
> values in the top level. Which would then mean these are needed, and I'm 
> sure adding them could be missed.

Let's keep things consistent with maxItems specified everywhere (my
preference is to not specify the items count at the top level hereas I
don't see any value in doing so, but I won't fight on that one if it's
what it takes to get the bindings merged).

-- 
Regards,

Laurent Pinchart

