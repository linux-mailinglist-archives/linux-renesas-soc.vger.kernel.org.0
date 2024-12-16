Return-Path: <linux-renesas-soc+bounces-11369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F18699F2EAE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 12:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3128216498A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 11:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8351D200138;
	Mon, 16 Dec 2024 11:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SMlth3zu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAADA937;
	Mon, 16 Dec 2024 11:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734346849; cv=none; b=i1/XLYSYCTNOM3rOJMla9biHYip7QeHMqRiGOlXaPEGFiu+BN7Pb+UkyaxrT3cgbDgW6OwwgfjgFm9hKhIUB2o+Y+3SKovm2lmmHh+SHKysYaSApxGt0eIVzQkHQnKJRLesmiB2LGxL+datN+F7YIMd7+822+YjtMNh7Wqq3jsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734346849; c=relaxed/simple;
	bh=oAt7KRdJ/jQfbkitGGkqyOeJ/rn5yv50BSyyPLvTaHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4ZNtT6BPsqL1i7kws/+HIN3DJYprpRXYqydvPMzDaSlQZfwTZ4FDctB1pBovMYg4ctllmmXesUbm62frufZSi5pK8ilLtfIWOu5VjwFL25CCsQM6oq4urm84L8+Qx3io0NxGo+yOj+b/r5tahlow+lqLiMBp/DuT6hDGVFcNBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SMlth3zu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 392B77E1;
	Mon, 16 Dec 2024 12:00:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734346807;
	bh=oAt7KRdJ/jQfbkitGGkqyOeJ/rn5yv50BSyyPLvTaHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SMlth3zujCY5XCF3+mAIBcCeJtZ21mPYPM/44PuoAd2jcxOB8gR02LRGOayRnY/Rx
	 HAePBlz41ASaqjvazU+sMqcr/flrnKxwqvrhYVwKECanZMiwMISYMzNmWNWwhKTI+o
	 v+3MxpiTibS4bzpowAAGzQp4szFQPLtdm4wtayNI=
Date: Mon, 16 Dec 2024 13:00:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
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
Message-ID: <20241216110027.GD31128@pendragon.ideasonboard.com>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
 <20241213-rcar-gh-dsi-v4-3-f8e41425207b@ideasonboard.com>
 <l2r53ipif43k7kkjqc66z2mq6tyw6niiz4t4nnfge23hygx2pw@xrgk4mv5ljzx>
 <20241216083239.GC32204@pendragon.ideasonboard.com>
 <12d157af-e309-4c8d-9c14-bd0e9da8194d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <12d157af-e309-4c8d-9c14-bd0e9da8194d@kernel.org>

On Mon, Dec 16, 2024 at 11:42:30AM +0100, Krzysztof Kozlowski wrote:
> On 16/12/2024 09:32, Laurent Pinchart wrote:
> > On Mon, Dec 16, 2024 at 08:58:49AM +0100, Krzysztof Kozlowski wrote:
> >> On Fri, Dec 13, 2024 at 04:02:59PM +0200, Tomi Valkeinen wrote:
> >>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>>
> >>> The binding is missing maxItems for all renesas,cmms and renesas,vsps
> >>> properties. As the amount of cmms or vsps is always a fixed amount, set
> >>> the maxItems to match the minItems.
> >>>
> >>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/display/renesas,du.yaml | 10 ++++++++++
> >>>  1 file changed, 10 insertions(+)
> >>
> >> The top level property should define widest constraints as well.
> > 
> > I'm curious, why is that ? I understand why a top-level default would
> > make sense when it's optionally overridden by model-specific values, but
> > in this case there's no such default. Every SoC has its own fixed value.
> 
> Because otherwise top level property does not have proper description
> and we expect properties to be defined at top-level.

Is it invalid YAML schema to have

  renesas,cmms:
    description: ......

with the min/maxItems in the conditional blocks ? Or did you mean, by
proper description, not just the description field ? We could have

  renesas,cmms:
    description: ......
    minItems: 1
    maxItems: 256

but I really don't see what that would bring from a documentation point
of view. Are there tools that depend on minItems and maxItems being
present at the top level ?

-- 
Regards,

Laurent Pinchart

