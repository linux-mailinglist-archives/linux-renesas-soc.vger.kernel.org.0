Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E15F626208D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 22:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730182AbgIHUNE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 16:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729961AbgIHPLR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 11:11:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FAAC09B050;
        Tue,  8 Sep 2020 07:48:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E6623B;
        Tue,  8 Sep 2020 16:43:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599576222;
        bh=BdI0mo6eUHVfUXSrDwJy0WdXPPXWR7rIn+Hw/QeDrUw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b2/TxslKry0QOEPzP+VPWZS2buO+bF1ApD4YuLmYmBCQVnezP83TYeYXiqUxsFVUQ
         gb1DC0bMQtlZydH4ZklFF2exgipcn//n+6y3E5R3RLI1taAiyIT1TVNCVh5iP+Rwi2
         8wL3ttJUUp3OTR/nRVCQmRzvrRlf54Q4xNaEmFSE=
Date:   Tue, 8 Sep 2020 17:43:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        "(Renesas) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 02/10] dt-bindings: display: renesas: dw-hdmi: tidyup
 example compatible.
Message-ID: <20200908144317.GA11405@pendragon.ideasonboard.com>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhlrtwp.wl-kuninori.morimoto.gx@renesas.com>
 <6e1eedf0-d05f-81cd-e437-33fc4c7337f3@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e1eedf0-d05f-81cd-e437-33fc4c7337f3@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Tue, Sep 08, 2020 at 03:18:20PM +0100, Kieran Bingham wrote:
> On 08/09/2020 01:34, Kuninori Morimoto wrote:
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > 
> > required is "renesas,r8a7795-hdmi", instead of "renesas,r8a7795-dw-hdmi"
> 
> Hrm, technically the driver will currently only match on :
>   "renesas,rcar-gen3-hdmi"
> 
> But I see how the '-dw-' has probably snuck in from other devices, and
> is inappropriate.
> 
> Perhaps this should be more clear that it matches on the generic compatible:
> 	renesas,rcar-gen3-hdmi
> 
> (or a combination of both?)
>
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> But if the generic isn't required, then this patch alone does fix what I
> would call an error, so ...

You're right, the generic compatible string should be required. I'll
update this patch accordingly, and will address the bindings as part of
the conversion to YAML.

> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> We could always make this more clear when converting to YAML.
>
> > ---
> >  .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt      | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> > index 819f3e31013c..e6526ab485d0 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> > @@ -42,7 +42,7 @@ Optional properties:
> >  Example:
> >  
> >  	hdmi0: hdmi@fead0000 {
> > -		compatible = "renesas,r8a7795-dw-hdmi";
> > +		compatible = "renesas,r8a7795-hdmi";
> >  		reg = <0 0xfead0000 0 0x10000>;
> >  		interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
> >  		clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
> > 

-- 
Regards,

Laurent Pinchart
