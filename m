Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBAA258CBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Sep 2020 12:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgIAK1l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Sep 2020 06:27:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41328 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgIAK1l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 06:27:41 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8310AAF2;
        Tue,  1 Sep 2020 12:27:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598956055;
        bh=0qlmJYuDW2iryN+BmHfha+stqCE4Vy2hHMSYVH5pWCU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YxeO5Rvqwl8BlbXEcsJPTQfCHN/4l3Z5KHbvJtDs88j4uxh9kSFeGVCXcD9GA2elZ
         jy1LfR7KunAaxDIZ5eljN6etqK2FntgTzia0yeeeN5Sx8W5AnV4pGcjwCye4HTZRNo
         vOKxYeXuFcCXMb9XiV5MVEdAFNNbIMIMPISEj6Y8=
Date:   Tue, 1 Sep 2020 13:27:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: bridge: lvds-codec:
 Document vcc-supply property
Message-ID: <20200901102714.GC5821@pendragon.ideasonboard.com>
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
 <20200810152219.6254-2-biju.das.jz@bp.renesas.com>
 <20200824230458.GA3489164@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200824230458.GA3489164@bogus>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Mon, Aug 24, 2020 at 05:04:58PM -0600, Rob Herring wrote:
> On Mon, Aug 10, 2020 at 04:22:17PM +0100, Biju Das wrote:
> > Document optional vcc-supply property that may be used as VCC source.
> > 
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > New patch Ref: Ref:https://patchwork.kernel.org/patch/11705819/
> > ---
> >  .../devicetree/bindings/display/bridge/lvds-codec.yaml         | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > index 68951d56ebba..3248be31eceb 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > @@ -79,6 +79,9 @@ properties:
> >        The GPIO used to control the power down line of this device.
> >      maxItems: 1
> >  
> > +  vcc-supply:
> > +    maxItems: 1
> 
> Probably should be 'power-supply' to align with the 'simple' panels. 
> That's also to signify there's only 1 supply. Using 'vcc' would 
> encourage adding 'vdd-supply', 'vddio-supply', etc. A second supply I'll 
> NAK because at that point it's not a simple bridge with no configuration 
> (it's arguably already there).

Fully agreed.

Do I get your Ab or Rb line with s/vcc/power/ and the commit message
updated to

    dt-bindings: display: bridge: lvds-codec: Document power-supply property

    Document optional power-supply property that may be used to specify the
    regulator powering up the device.

?

-- 
Regards,

Laurent Pinchart
