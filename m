Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E59A79684B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 20:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729351AbfHTSIx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 14:08:53 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46242 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbfHTSIx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 14:08:53 -0400
Received: by mail-ot1-f66.google.com with SMTP id z17so5892748otk.13;
        Tue, 20 Aug 2019 11:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2V1mGMCstWnpcKzMKvJ0w9fxy2kbmS/s8lE+TTa+kuE=;
        b=fTc0zN5WoSWkUWo2d5nChFS2hmYUgXRzKRF5+BtDcOo5Y5+JqLiQ1KL0CbXEcvgjSe
         YcnfSdoKkd94alxeDJXIJ7kyqSWmBzew0OlLpOYluixkUeywXLCLjXuNfr4i7ShnKshe
         C0gF7q6Cg1ocz0rrpCXGCAbVjjwklyq9FNrqOf+/kogol6KuK9LUMtymwVm3glHGSEcZ
         js1QY0oJI+aK9FlRTUFnJKr1SGMyl24iidSXqAEjpF3IHn21Ob0//a5OZ5I3ey0N1Tsa
         NH4ogMBtT/nEesWJ4dDZOxTzSY9nCyK9JvYZ/n8gQ2dMeQ8jluuJnDdDqQ6fwpTzL+vA
         VNvA==
X-Gm-Message-State: APjAAAVazMOEYyZ5zdEYblVswtRROJpW05hz8M9vJTko4i4JQF5MLPF7
        hrVV7bqWC6Lt8caNSyEkLSlNafJbQSMB6Rxtocg=
X-Google-Smtp-Source: APXvYqzBUkEblq/MiYoqxtiYIJSp/mB+lLzwSmJnKZhFoXC5ylVOF7iTENS+UuicCsmexIJBI3y8fX2QgWxZAOSn+Cw=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr24288910otn.297.1566324531299;
 Tue, 20 Aug 2019 11:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-2-jacopo+renesas@jmondi.org> <CAMuHMdWVzm8yoZSoKZh3MJsaX4jCRXQCbn2x2LAu4UWtb1yYjw@mail.gmail.com>
 <CAMuHMdWFHDGPSZt2_H_sC9rCKDYBR0XDLn0TGxzPRxZsrOTEHw@mail.gmail.com>
 <20190820074826.5rdzeqyk6ylpjr7o@uno.localdomain> <CAMuHMdXNJLLRqZCZ5KHkdUKgtwmE-F-s5Vi6P10xHR38n_=HrA@mail.gmail.com>
 <20190820174110.GH10820@pendragon.ideasonboard.com>
In-Reply-To: <20190820174110.GH10820@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Aug 2019 20:08:40 +0200
Message-ID: <CAMuHMdWOOfhPL3+cPyGd+hxL5ewKQjGyxM-Nx5DQy_1eqSG2Qw@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Tue, Aug 20, 2019 at 7:41 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Aug 20, 2019 at 09:53:44AM +0200, Geert Uytterhoeven wrote:
> > On Tue, Aug 20, 2019 at 9:47 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> > > On Mon, Aug 19, 2019 at 03:45:54PM +0200, Geert Uytterhoeven wrote:
> > >> On Mon, Jul 8, 2019 at 9:58 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >>> On Sat, Jul 6, 2019 at 4:07 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > >>>> Add device tree bindings documentation for the Renesas R-Car Display
> > >>>> Unit Color Management Module.
> > >>>>
> > >>>> CMM is the image enhancement module available on each R-Car DU video
> > >>>> channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).
> > >>>>
> > >>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > >>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >>>
> > >>> Thanks for your patch!
> > >>>
> > >>>> --- /dev/null
> > >>>> +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> > >>>> @@ -0,0 +1,25 @@
> > >>>> +* Renesas R-Car Color Management Module (CMM)
> > >>>> +
> > >>>> +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> > >>>> +
> > >>>> +Required properties:
> > >>>> + - compatible: shall be one of:
> > >>>> +   - "renesas,rcar-gen3-cmm"
> > >>>> +   - "renesas,rcar-gen2-cmm"
> > >>>
> > >>> Why do you think you do not need SoC-specific compatible values?
> > >>> What if you discover a different across the R-Car Gen3 line tomorrow?
> > >>> Does the IP block have a version register?
> > >>
> > >> Do you have an answer to these questions?
> > >
> > > It does not seem to me that CMM has any version register, nor there
> > > are differences between the different Gen3 SoCs..
> > >
> > > However, even if we now define a single compatible property for
> > > gen3/gen2 and we later find out one of the SoC needs a soc-specific
> > > property we can safely add it and keep the generic gen3/gen2 one as
> > > fallback.. Does it work for you?
> >
> > Unfortunately that won't work, as the existing DTBs won't have the
> > soc-specific compatible value.
> > You could still resort to soc_device_match(), but it is better to avoid that.
>
> We've had the same discussion over and over for quite a long time :-) I
> wonder, now that we have implemented SoC-specific compatible values for
> many IP cores, how many of them have actually benefited from it ? I'm
> not considering IP cores where we knew from the start that each SoC was
> different (such as pinctrl or clocks for instance), but IP cores where
> we though all SoCs would be handled in the same way. I also wouldn't
> count ES-specific differences, as those are handled by
> soc_device_match() anyway.

Thank you for making me dive into this ;-)

For R-Car Gen3 only:

DRIF?
The driver still matches against "renesas,rcar-gen3-drif", but we found a
difference on M3-N (didn't check if that was documented initially or not).

PCIe?
IIRC, there is still a special PHY register on one of the V3x SoCs that
the driver doesn't handle yet, and wasn't documented initially.

RPC-IF?
Lots of small differences (you can claim they were documented, but they
were unexpected), and non-documented different magic values in the
(not yet upstreamed) driver.

SOUND?
R-Car E3 special handling was bolted on later.

Thermal?
M3-W turned out to have a different Tj than the other SoCs using the same
thermal module (yeah, thermal is a bad example, as some Gen3 SoCs use
the Gen2 thermal module, so we needed to differentiate anyway).

USBHS?
Initially we thought Gen3 was identical to Gen2.  Later it turned out that
(1) wasn't true, and (2) E3/D3 used a different PLL than the other Gen3
SoCs.

VIN?
IIRC, we initialize thought a family-specific compatible value would work
for Gen3, like it did for Gen2, but had to reconsider.

I may have missed some...

Convinced?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
