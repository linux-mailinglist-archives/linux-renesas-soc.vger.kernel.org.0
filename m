Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31FDD967C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 19:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730689AbfHTRlT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 13:41:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42164 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730680AbfHTRlS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 13:41:18 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 925D533D;
        Tue, 20 Aug 2019 19:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566322876;
        bh=8TSAbOc99oaocNanYpIuNSjuJymG5rkFZtxYVVqu2wU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oTJV/F9uYWNZIyTdvp2beSi864kYUk09+Kil83mxRJqLnCUfKp6GLjFjFhe+0qzGK
         j1kpG8z5++Fhw2CUBIXfW/mSDmYrqPfUYpadGJVMau+4lBA6pj6N/V1xvjNsiENKFi
         XuoF6BLOH+sSnElD/PbT4xEU5K10CwPnYsKDQHMQ=
Date:   Tue, 20 Aug 2019 20:41:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 01/19] dt-bindings: display: renesas,cmm: Add R-Car
 CMM documentation
Message-ID: <20190820174110.GH10820@pendragon.ideasonboard.com>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-2-jacopo+renesas@jmondi.org>
 <CAMuHMdWVzm8yoZSoKZh3MJsaX4jCRXQCbn2x2LAu4UWtb1yYjw@mail.gmail.com>
 <CAMuHMdWFHDGPSZt2_H_sC9rCKDYBR0XDLn0TGxzPRxZsrOTEHw@mail.gmail.com>
 <20190820074826.5rdzeqyk6ylpjr7o@uno.localdomain>
 <CAMuHMdXNJLLRqZCZ5KHkdUKgtwmE-F-s5Vi6P10xHR38n_=HrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXNJLLRqZCZ5KHkdUKgtwmE-F-s5Vi6P10xHR38n_=HrA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Aug 20, 2019 at 09:53:44AM +0200, Geert Uytterhoeven wrote:
> On Tue, Aug 20, 2019 at 9:47 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> > On Mon, Aug 19, 2019 at 03:45:54PM +0200, Geert Uytterhoeven wrote:
> >> On Mon, Jul 8, 2019 at 9:58 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >>> On Sat, Jul 6, 2019 at 4:07 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> >>>> Add device tree bindings documentation for the Renesas R-Car Display
> >>>> Unit Color Management Module.
> >>>>
> >>>> CMM is the image enhancement module available on each R-Car DU video
> >>>> channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).
> >>>>
> >>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>
> >>> Thanks for your patch!
> >>>
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> >>>> @@ -0,0 +1,25 @@
> >>>> +* Renesas R-Car Color Management Module (CMM)
> >>>> +
> >>>> +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> >>>> +
> >>>> +Required properties:
> >>>> + - compatible: shall be one of:
> >>>> +   - "renesas,rcar-gen3-cmm"
> >>>> +   - "renesas,rcar-gen2-cmm"
> >>>
> >>> Why do you think you do not need SoC-specific compatible values?
> >>> What if you discover a different across the R-Car Gen3 line tomorrow?
> >>> Does the IP block have a version register?
> >>
> >> Do you have an answer to these questions?
> >
> > It does not seem to me that CMM has any version register, nor there
> > are differences between the different Gen3 SoCs..
> >
> > However, even if we now define a single compatible property for
> > gen3/gen2 and we later find out one of the SoC needs a soc-specific
> > property we can safely add it and keep the generic gen3/gen2 one as
> > fallback.. Does it work for you?
> 
> Unfortunately that won't work, as the existing DTBs won't have the
> soc-specific compatible value.
> You could still resort to soc_device_match(), but it is better to avoid that.

We've had the same discussion over and over for quite a long time :-) I
wonder, now that we have implemented SoC-specific compatible values for
many IP cores, how many of them have actually benefited from it ? I'm
not considering IP cores where we knew from the start that each SoC was
different (such as pinctrl or clocks for instance), but IP cores where
we though all SoCs would be handled in the same way. I also wouldn't
count ES-specific differences, as those are handled by
soc_device_match() anyway.

-- 
Regards,

Laurent Pinchart
