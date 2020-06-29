Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B8420E977
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 01:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgF2XmK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jun 2020 19:42:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37144 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbgF2XmK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 19:42:10 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A502299;
        Tue, 30 Jun 2020 01:42:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593474128;
        bh=T1iden6Vlf5KKvBUkdJt1bpgWZzESjRHafhJ//bGhy4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WBR3E7e3mjuyzfiGf9W3lCZsKyMq7YWX93q+vcxnp3momOqmxnGXCLcq/Cy6Pu7Oc
         hM5FfUTBvD2A0/H2wta/Zs2rSlm0n5rntFVZ6JqMe5+8eKCy+AP6t37iBgcf8WEt5+
         F7Ddp7xT/LvgntbZsYvJmfwcoZfAXo83pjSuBhO0=
Date:   Tue, 30 Jun 2020 02:42:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 6/4] dt-bindings: display: renesas: lvds: RZ/G2E needs
 renesas,companion too
Message-ID: <20200629234204.GJ21452@pendragon.ideasonboard.com>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200513233908.23629-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWL9xhzbVhZ6N1xbh+YmP_RBMO4H1uMXXexbJXq6amcLA@mail.gmail.com>
 <20200629081140.GG227119@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200629081140.GG227119@ravnborg.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

On Mon, Jun 29, 2020 at 10:11:40AM +0200, Sam Ravnborg wrote:
> On Thu, May 14, 2020 at 08:44:19AM +0200, Geert Uytterhoeven wrote:
> > On Thu, May 14, 2020 at 1:39 AM Laurent Pinchart wrote:
> > > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > Document RZ/G2E support for property renesas,companion.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> > > @@ -81,9 +81,9 @@ properties:
> > >      $ref: /schemas/types.yaml#/definitions/phandle
> > >      description:
> > >        phandle to the companion LVDS encoder. This property is mandatory
> > > -      for the first LVDS encoder on D3 and E3 SoCs, and shall point to
> > > -      the second encoder to be used as a companion in dual-link mode. It
> > > -      shall not be set for any other LVDS encoder.
> > > +      for the first LVDS encoder on D3, R-Car E3 and RZ/G2E SoCs, and shall
> > 
> > R-Car D3 and E3, and RZ/G2E SoCs
> > 
> > > +      point to the second encoder to be used as a companion in dual-link mode.
> > > +      It shall not be set for any other LVDS encoder.
> 
> Laurent, I assume you will re-spin a ne version wth the changelog
> corrected.

Yes I will. Thanks for checking.

-- 
Regards,

Laurent Pinchart
