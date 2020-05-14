Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8BA81D34CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 17:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgENPRc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 May 2020 11:17:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39856 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgENPRc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 11:17:32 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E53FA259;
        Thu, 14 May 2020 17:17:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589469450;
        bh=IQ/w7wNceyepVhZCFavDD7WAfqN9SfwRMZjfpAXoYxo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y/Mj54TvBe8FySE2wDJYUPU6rnYLTLTzjRWUxwsBSWobCbdpzJYLmlZSEz9uBaDe1
         /ypUmEmHkSummueBxEXO3/x0eHNhrvnRy4DbvUgkmFamJef2IF2tGwnf3MovyG6DT2
         jP8qOajAXVuGxJjXAHw/g4hBKIH1edCshHUpggcw=
Date:   Thu, 14 May 2020 18:17:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v1.1 4/4] dt-bindings: display: bridge: renesas,lvds:
 Convert binding to YAML
Message-ID: <20200514151721.GF5955@pendragon.ideasonboard.com>
References: <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
 <20200513232840.22687-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXRiP3topBOeLdLhJ9wMBAMFEnLYJPPpdmmdK7TKN4X6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXRiP3topBOeLdLhJ9wMBAMFEnLYJPPpdmmdK7TKN4X6g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, May 14, 2020 at 09:31:53AM +0200, Geert Uytterhoeven wrote:
> On Thu, May 14, 2020 at 1:29 AM Laurent Pinchart wrote:
> > Convert the Renesas R-Car LVDS encoder text binding to YAML.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Acked-by: Maxime Ripard <mripard@kernel.org>
> 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> 
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> > +    #include <dt-bindings/power/r8a7795-sysc.h>
> > +
> > +    lvds@feb90000 {
> > +        compatible = "renesas,r8a7795-lvds";
> > +        reg = <0 0xfeb90000 0 0x14>;
> 
> #{address,size}-cells = <1> for examples.
> Applies to all nodes below, too.

Why ?

-- 
Regards,

Laurent Pinchart
