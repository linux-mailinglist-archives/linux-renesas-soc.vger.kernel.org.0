Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E76F242D05
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Aug 2020 18:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgHLQTD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Aug 2020 12:19:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54200 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgHLQTD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Aug 2020 12:19:03 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 658AF9E7;
        Wed, 12 Aug 2020 18:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597249140;
        bh=QJ4CD1EkP28rc5rk+9Lb1tJIBgSCm6T6GSEvKyieOdI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rr2pwNXQf9uLGdQ5TLOld3ziVzcZjqADVXKo5OrK3RXVyNPqhGiOW/HB8fttasmJ1
         0LayrwLaQ6ct457H0QbJYvsHzBVNfvPH4E1pmb1lVjwjkWQp+LB0H6TAD1kn5sshTN
         Q3hVEZI6weugZYpbk1kR7qvoYC70zMRIfVhAqCNo=
Date:   Wed, 12 Aug 2020 19:18:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Subject: Re: [PATCH 4/9] dt-bindings: display: renesas,lvds: Document
 r8a774e1 bindings
Message-ID: <20200812161846.GO6057@pendragon.ideasonboard.com>
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812161757.GN6057@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200812161757.GN6057@pendragon.ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 12, 2020 at 07:17:59PM +0300, Laurent Pinchart wrote:
> Hi Prabhakar,
> 
> Thank you for the patch.
> 
> On Wed, Aug 12, 2020 at 03:02:12PM +0100, Lad Prabhakar wrote:
> > From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > 
> > Document the RZ/G2H (R8A774E1) LVDS bindings.
> > 
> > Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/display/bridge/renesas,lvds.txt          | 1 +
> 
> This binding has been converted to YAML. I'll apply the patch manually
> as it's a one-liner.
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> index 4ca5a904b0ea..0fe0c49403f8 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> @@ -22,6 +22,7 @@ properties:
>        - renesas,r8a774a1-lvds # for RZ/G2M compatible LVDS encoders
>        - renesas,r8a774b1-lvds # for RZ/G2N compatible LVDS encoders
>        - renesas,r8a774c0-lvds # for RZ/G2E compatible LVDS encoders
> +      - renesas,r8a774e1-lvds # for RZ/G2H compatible LVDS encoders
>        - renesas,r8a7790-lvds # for R-Car H2 compatible LVDS encoders
>        - renesas,r8a7791-lvds # for R-Car M2-W compatible LVDS encoders
>        - renesas,r8a7793-lvds # for R-Car M2-N compatible LVDS encoders
> 
> If you see any issue there, please let me know.

And I forgot to mention,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > index c62ce2494ed9..42743d0d24b3 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > @@ -12,6 +12,7 @@ Required properties:
> >    - "renesas,r8a774a1-lvds" for R8A774A1 (RZ/G2M) compatible LVDS encoders
> >    - "renesas,r8a774b1-lvds" for R8A774B1 (RZ/G2N) compatible LVDS encoders
> >    - "renesas,r8a774c0-lvds" for R8A774C0 (RZ/G2E) compatible LVDS encoders
> > +  - "renesas,r8a774e1-lvds" for R8A774E1 (RZ/G2H) compatible LVDS encoders
> >    - "renesas,r8a7790-lvds" for R8A7790 (R-Car H2) compatible LVDS encoders
> >    - "renesas,r8a7791-lvds" for R8A7791 (R-Car M2-W) compatible LVDS encoders
> >    - "renesas,r8a7793-lvds" for R8A7793 (R-Car M2-N) compatible LVDS encoders

-- 
Regards,

Laurent Pinchart
