Return-Path: <linux-renesas-soc+bounces-11370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AAC9F2EB7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 12:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4DD0165709
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 11:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA732203D46;
	Mon, 16 Dec 2024 11:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JldSboMb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF70A937;
	Mon, 16 Dec 2024 11:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734346940; cv=none; b=NRBPNfcUgUuRAvLQcA5OT64a8hYjC4pRquciBUVCMKBOUSLDcJjSaMrpf+pbyO/F/42kOM8yWxMIsamSMrxlQmpZyKqICwrKwXr1ZAdjmIHcRU62miryS7LBFrgbPMn7vdJDmUM6jVlBcn+5QYS+04xNxvc58uTPAXJBxX5emBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734346940; c=relaxed/simple;
	bh=udCyMjh1CS/PW2tV7THb/yDetlsCfrLAJU/dKWJECDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUgVXXMrCMGMCTyRob3F1dMZQBC3OeKW1LoiZXEbZKkvifByYn023W3Ux82o17qxRK8xcQ/q57ln2tTgXAh3CKT/j422wHUTN8lQ8CxEZyZ9ML0sreNa7Q6PITBSS4LZnrHUQ7Ih+NvW21tqwjjmsxIKTot7oIIFIKHeDXyndQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JldSboMb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 541EC13C;
	Mon, 16 Dec 2024 12:01:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734346900;
	bh=udCyMjh1CS/PW2tV7THb/yDetlsCfrLAJU/dKWJECDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JldSboMbkpZz4y5srS00h2SA/bseewLAeGFVQPMcLU/0vLlG7QiYLap4PYdJu4ton
	 FrkOqOVsrfSAqACA0wSg62pdsVYLlikZSEN1CSP5wKVAZj+e5AxStyJQtagJVLaLk+
	 9fq+/ZfWoWMgETLXlyW3NwfD4uEK3ErA/i5eoBWE=
Date: Mon, 16 Dec 2024 13:02:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
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
Subject: Re: [PATCH v4 4/7] dt-bindings: display: renesas,du: Add r8a779h0
Message-ID: <20241216110200.GE31128@pendragon.ideasonboard.com>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
 <20241213-rcar-gh-dsi-v4-4-f8e41425207b@ideasonboard.com>
 <5xualllquamelkxnjqe32lasba5wkgxzy2jnbfyvoot2mz26bg@ns2bdnhpqknv>
 <78de3f8c-2f6c-4996-ba50-05bd956c6305@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <78de3f8c-2f6c-4996-ba50-05bd956c6305@ideasonboard.com>

On Mon, Dec 16, 2024 at 12:56:09PM +0200, Tomi Valkeinen wrote:
> On 16/12/2024 10:00, Krzysztof Kozlowski wrote:
> > On Fri, Dec 13, 2024 at 04:03:00PM +0200, Tomi Valkeinen wrote:
> >>   
> >> -    required:
> >> -      - port@0
> >> -      - port@1
> >> -
> >>       unevaluatedProperties: false
> >>   
> >>     renesas,cmms:
> >> @@ -817,6 +814,54 @@ allOf:
> >>           - reset-names
> >>           - renesas,vsps
> >>   
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - renesas,du-r8a779h0
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          items:
> >> +            - description: Functional clock
> >> +
> >> +        clock-names:
> >> +          items:
> >> +            - const: du.0
> >> +
> >> +        interrupts:
> >> +          maxItems: 1
> >> +
> >> +        resets:
> > 
> > No minItems here...
> > 
> >> +          maxItems: 1
> >> +
> >> +        reset-names:
> >> +          items:
> >> +            - const: du.0
> >> +
> >> +        ports:
> >> +          properties:
> >> +            port@0:
> >> +              description: DSI 0
> >> +            port@1: false
> >> +            port@2: false
> >> +            port@3: false
> >> +
> >> +          required:
> >> +            - port@0
> >> +
> >> +        renesas,vsps:
> >> +          minItems: 1
> > 
> > so drop minItems here as well.
> 
> Ok. I wanted to be consistent with the other vsps entries in the file, 
> so I added both min and max items. But I can drop it.

I'd favour consistency with the other vsps entries, but not enough to
fight over it.

-- 
Regards,

Laurent Pinchart

