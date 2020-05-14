Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD701D402F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 23:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727853AbgENVhw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 May 2020 17:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgENVhw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 17:37:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DEAC061A0C;
        Thu, 14 May 2020 14:37:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E16B626A;
        Thu, 14 May 2020 23:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589492270;
        bh=r7w1seKk94lC635xvi8ddGdPNjZzV7G8rR6A8E6Nsaw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ax8svKia4yEKShB3qJmaCJybaNITWBYQC5Ogg3Bw0vlgSXWM2ZC8KEgvzYDH7s5gr
         yQmt/IxAmMTHQZqAjxs1IhZDGyovMWc1L+EB+oyUrgvQGKtjBqJnbrWZCbAykJT2BJ
         Dg8HueHTzqZ4v08G9ATowJ8Bj5QlpX4wuy9w9vKg=
Date:   Fri, 15 May 2020 00:37:42 +0300
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
Message-ID: <20200514213742.GO5955@pendragon.ideasonboard.com>
References: <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
 <20200513232840.22687-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXRiP3topBOeLdLhJ9wMBAMFEnLYJPPpdmmdK7TKN4X6g@mail.gmail.com>
 <20200514151721.GF5955@pendragon.ideasonboard.com>
 <CAMuHMdVrO8WfKVdp2wONSYg=cbK=CWyXMyC+Hqv4tkiuCm5WAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVrO8WfKVdp2wONSYg=cbK=CWyXMyC+Hqv4tkiuCm5WAQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, May 14, 2020 at 09:02:54PM +0200, Geert Uytterhoeven wrote:
> On Thu, May 14, 2020 at 5:17 PM Laurent Pinchart wrote:
> > On Thu, May 14, 2020 at 09:31:53AM +0200, Geert Uytterhoeven wrote:
> > > On Thu, May 14, 2020 at 1:29 AM Laurent Pinchart wrote:
> > > > Convert the Renesas R-Car LVDS encoder text binding to YAML.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > Acked-by: Maxime Ripard <mripard@kernel.org>
> > >
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> > >
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> > > > +    #include <dt-bindings/power/r8a7795-sysc.h>
> > > > +
> > > > +    lvds@feb90000 {
> > > > +        compatible = "renesas,r8a7795-lvds";
> > > > +        reg = <0 0xfeb90000 0 0x14>;
> > >
> > > #{address,size}-cells = <1> for examples.
> > > Applies to all nodes below, too.
> >
> > Why ?
> 
> See "[PATCH 5/5] dt-bindings: Fix incorrect 'reg' property sizes"
> https://lore.kernel.org/linux-devicetree/20200512204543.22090-5-robh@kernel.org/

I don't like this much as it creates invalid examples, but until we have
a better solution, I'll reduce the number of cells.

-- 
Regards,

Laurent Pinchart
