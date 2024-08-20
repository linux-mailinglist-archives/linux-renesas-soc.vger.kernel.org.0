Return-Path: <linux-renesas-soc+bounces-7942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4278E95811C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 10:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 677D71C20B9F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 08:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A541718A6C8;
	Tue, 20 Aug 2024 08:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RhMOgmVL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A9B18E342;
	Tue, 20 Aug 2024 08:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724143042; cv=none; b=Ho9DmYrqoUDZkYsXKdQ5rtfno6/K9kCOrejKLD9BnCc9kkcM28Kvmi/cp+KebLGZxjLs8mULqZo8G6ZJNFdaL6EQxFbNEaT76m2kqapteRjKGtXQdg01SId8QZKg60qH5Lqj7LAlZhm1rgZpyakf9fhzLVpbz/VechKsRwoXa2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724143042; c=relaxed/simple;
	bh=jhuHOkbZr/nS0ttotBq7H9QyyCuY5ssWy0mXwk53M5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnbJJ7xxreeb68Ff3Kf8k8+kTm6ySovjp2PDdSRS4VU5SQxkAkuEDk6706bwmNOYDWTJ+bwLEdpVFpnuP39NQu4KPQJy4TqihAOQllg6rpuejQOeF5cHw449zqrmKa1SuHH5sSlKteMhhrkFZjxq8MWN36NDwdHhFIfgrM7p5K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RhMOgmVL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AB444CC;
	Tue, 20 Aug 2024 10:36:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724142970;
	bh=jhuHOkbZr/nS0ttotBq7H9QyyCuY5ssWy0mXwk53M5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RhMOgmVLwFkHOUdUUoetl3XULAnXTeF5RyetPdiJs09Ps/L0D33IWfE62KhovqT48
	 cS3/rEA+UxaGwMT7810f3Ii2wK9DrKHP3H0ztZ7y51ql0p2vCch66qwbKhp601JYg4
	 3WIo+YnVBQYr8R+GpX3GWoyyBAEEboS1CWBYRTzY=
Date: Tue, 20 Aug 2024 11:36:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Message-ID: <20240820083644.GE24895@pendragon.ideasonboard.com>
References: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
 <20240805155242.151661-2-biju.das.jz@bp.renesas.com>
 <20240813163220.GA1164014-robh@kernel.org>
 <20240813193913.GH24634@pendragon.ideasonboard.com>
 <TY3PR01MB11346EC4C14C99A1771DE9A6C868C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346FE2410784131B61DF0E1868D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346FE2410784131B61DF0E1868D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Tue, Aug 20, 2024 at 06:42:48AM +0000, Biju Das wrote:
> Hi Rob and all,
> 
> > -----Original Message-----
> > From: Biju Das
> > Sent: Monday, August 19, 2024 1:37 PM
> > Subject: RE: [PATCH v3 1/4] dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings
> > 
> > Hi Laurent and Rob,
> > 
> > Thanks for the feedback
> > 
> > > -----Original Message-----
> > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Sent: Tuesday, August 13, 2024 8:39 PM
> > > Subject: Re: [PATCH v3 1/4] dt-bindings: display: renesas,rzg2l-du:
> > > Document RZ/G2UL DU bindings
> > >
> > > Hi Rob,
> > >
> > > On Tue, Aug 13, 2024 at 10:32:20AM -0600, Rob Herring wrote:
> > > > On Mon, Aug 05, 2024 at 04:52:35PM +0100, Biju Das wrote:
> > > > > Document DU found in RZ/G2UL SoC. The DU block is identical to
> > > > > RZ/G2L SoC, but has only DPI interface.
> > > > >
> > > > > While at it, add missing required property port@1 for RZ/G2L and
> > > > > RZ/V2L SoCs. Currently there is no user for the DPI interface and
> > > > > hence there won't be any ABI breakage for adding port@1 as
> > > > > required property for RZ/G2L and RZ/V2L SoCs.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > > > v2->v3:
> > > > >  * Replaced ports->port property for RZ/G2UL as it supports only DPI.
> > > > >    and retained ports property for RZ/{G2L,V2L} as it supports both DSI
> > > > >    and DPI output interface.
> > > >
> > > > Why? Having port and ports is just a needless complication.
> > >
> > > I agree that making the ports node mandatory, even when the device has
> > > a single port, will simplify the bindings. In hindsight we should never have made ports optional,
> > but that can't be changed.
> > >
> > > > >  * Added missing blank line before example.
> > > > >  * Dropped tags from Conor and Geert as there are new changes.
> > > > > v1->v2:
> > > > >  * Updated commit description related to non ABI breakage.
> > > > >  * Added Ack from Conor.
> > > > > ---
> > > > >  .../bindings/display/renesas,rzg2l-du.yaml    | 35 +++++++++++++++++--
> > > > >  1 file changed, 32 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > > > b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > > > index 08e5b9478051..ca01bf26c4c0 100644
> > > > > ---
> > > > > a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.y
> > > > > +++ am
> > > > > +++ l
> > > > > @@ -18,6 +18,7 @@ properties:
> > > > >    compatible:
> > > > >      oneOf:
> > > > >        - enum:
> > > > > +          - renesas,r9a07g043u-du # RZ/G2UL
> > > > >            - renesas,r9a07g044-du # RZ/G2{L,LC}
> > > > >        - items:
> > > > >            - enum:
> > > > > @@ -60,8 +61,9 @@ properties:
> > > > >          $ref: /schemas/graph.yaml#/properties/port
> > > > >          unevaluatedProperties: false
> > > > >
> > > > > -    required:
> > > > > -      - port@0
> > > > > +  port:
> > > > > +    $ref: /schemas/graph.yaml#/properties/port
> > > > > +    description: Connection to the DU output video port.
> > > > >
> > > > >      unevaluatedProperties: false
> > > > >
> > > > > @@ -83,11 +85,38 @@ required:
> > > > >    - clock-names
> > > > >    - resets
> > > > >    - power-domains
> > > > > -  - ports
> > > > >    - renesas,vsps
> > > > >
> > > > >  additionalProperties: false
> > > > >
> > > > > +allOf:
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          contains:
> > > > > +            const: renesas,r9a07g043u-du
> > > > > +    then:
> > > > > +      properties:
> > > > > +        port:
> > > > > +          description: DPI
> > > >
> > > > This is equivalent to 'port@0'. IMO, this case should have a 'port@1'
> > > > node so that DPI interface is *always* the same port.
> > >
> > > That's what Biju did in the previous version, and I recommended to
> > > number the ports based on hardware indices, not types. Mapping port
> > > numbers to the hardware documentation makes it more consistent for DT
> > > writers, makes the logic simpler to understand (in my opinion, based
> > > on my experience with the R-Car
> > > DU) on the driver side, but most importantly, type-based numbering
> > > wouldn't scale as SoCs could have multiple ports of the same type
> > > (we've seen that happening with R-Car).
> > 
> > OK, I will send bindings based on hardware indices.
> 
> I get a warning, if I use ports and port@0 for single port. I don't
> see this warning if I use ports and port@1
> 
> arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:169.9-178.5: Warning (graph_child_address): /soc/display@10890000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> 
> Can we fix the dt-schema to getting consistent results for single port
> usage involving ports?

I would like that too.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g043u-du
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPI
> +
> +          required:
> +            - port@0

-- 
Regards,

Laurent Pinchart

