Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 879A820E46A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 00:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgF2VZU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jun 2020 17:25:20 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:53500 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728392AbgF2Stz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 14:49:55 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 68F48804A4;
        Mon, 29 Jun 2020 10:11:42 +0200 (CEST)
Date:   Mon, 29 Jun 2020 10:11:40 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 6/4] dt-bindings: display: renesas: lvds: RZ/G2E needs
 renesas,companion too
Message-ID: <20200629081140.GG227119@ravnborg.org>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200513233908.23629-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWL9xhzbVhZ6N1xbh+YmP_RBMO4H1uMXXexbJXq6amcLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWL9xhzbVhZ6N1xbh+YmP_RBMO4H1uMXXexbJXq6amcLA@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=yC-0_ovQAAAA:8 a=tBb2bbeoAAAA:8
        a=e5mUnYsNAAAA:8 a=vFHsjM1-0c_F3_rMw0gA:9 a=CjuIK1q_8ugA:10
        a=CojVow1nldcA:10 a=D0XLA9XvdZm18NrgonBM:22 a=QsnFDINu91a9xkgZirup:22
        a=Oj-tNtZlA1e06AYgeCfH:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 14, 2020 at 08:44:19AM +0200, Geert Uytterhoeven wrote:
> On Thu, May 14, 2020 at 1:39 AM Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Document RZ/G2E support for property renesas,companion.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> > --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> > @@ -81,9 +81,9 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >      description:
> >        phandle to the companion LVDS encoder. This property is mandatory
> > -      for the first LVDS encoder on D3 and E3 SoCs, and shall point to
> > -      the second encoder to be used as a companion in dual-link mode. It
> > -      shall not be set for any other LVDS encoder.
> > +      for the first LVDS encoder on D3, R-Car E3 and RZ/G2E SoCs, and shall
> 
> R-Car D3 and E3, and RZ/G2E SoCs
> 
> > +      point to the second encoder to be used as a companion in dual-link mode.
> > +      It shall not be set for any other LVDS encoder.

Laurent, I assume you will re-spin a ne version wth the changelog
corrected.

	Sam

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
