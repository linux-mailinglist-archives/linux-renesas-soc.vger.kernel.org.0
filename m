Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52751958F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 09:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbfHTHx4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 03:53:56 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38264 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfHTHx4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 03:53:56 -0400
Received: by mail-ot1-f65.google.com with SMTP id r20so4205421ota.5;
        Tue, 20 Aug 2019 00:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UeZCihW1/iCQp+6FgwvqZaN1t+fpmStZoau36fwpTT8=;
        b=ZcVGvaSAGQrN4uT3ztogRXOfPbA6d1SWR+qB08WUrdwOn2HhI9CFmEQBI1gsqrp/aB
         fEX3QWhoORcSJm5DpGulntyWw4zEBJvBEt+YkYYp2hNOODup5S9uVvwOSLqtKVZUYZec
         /3U2rUVl31+D8fOf5p16UKiy8lUO5+O5gjdfvcCJEQMbQDlrD8RRr55wnZc/uk/BY2GO
         e8/OsibTisFzBvM+2yIawKAOXKQFJpx2hXcDTlZiuAcemBxLo3ELcGsysoEPZSHRnGCs
         VOWy8DNZEhbjoNHBxisQLQUo0XaTz5OOSvXsF67l5E+PzOiiCl6ySZXwowFdU/+uoOVG
         uYmQ==
X-Gm-Message-State: APjAAAUckgRkovPiFkq25Mu5mtg0ZB6MUxjPlXpctSZy+ouPa53yWOSa
        WtmAXKVxMwC+tWqYnweScq8/E2HAYHZm/wWNPgM=
X-Google-Smtp-Source: APXvYqxi285mUlLiZy1iYv/ah5Dqi221sPkvqG1lYm/S6M3NNg6Amld+nigmYA87ocdOf24hemH7ijB43JtXkfCd1Yc=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr21320045oto.250.1566287635275;
 Tue, 20 Aug 2019 00:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-2-jacopo+renesas@jmondi.org> <CAMuHMdWVzm8yoZSoKZh3MJsaX4jCRXQCbn2x2LAu4UWtb1yYjw@mail.gmail.com>
 <CAMuHMdWFHDGPSZt2_H_sC9rCKDYBR0XDLn0TGxzPRxZsrOTEHw@mail.gmail.com> <20190820074826.5rdzeqyk6ylpjr7o@uno.localdomain>
In-Reply-To: <20190820074826.5rdzeqyk6ylpjr7o@uno.localdomain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Aug 2019 09:53:44 +0200
Message-ID: <CAMuHMdXNJLLRqZCZ5KHkdUKgtwmE-F-s5Vi6P10xHR38n_=HrA@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

Hi Jacopo,

On Tue, Aug 20, 2019 at 9:47 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> On Mon, Aug 19, 2019 at 03:45:54PM +0200, Geert Uytterhoeven wrote:
> > On Mon, Jul 8, 2019 at 9:58 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Sat, Jul 6, 2019 at 4:07 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > > > Add device tree bindings documentation for the Renesas R-Car Display
> > > > Unit Color Management Module.
> > > >
> > > > CMM is the image enhancement module available on each R-Car DU video
> > > > channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> > > > @@ -0,0 +1,25 @@
> > > > +* Renesas R-Car Color Management Module (CMM)
> > > > +
> > > > +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> > > > +
> > > > +Required properties:
> > > > + - compatible: shall be one of:
> > > > +   - "renesas,rcar-gen3-cmm"
> > > > +   - "renesas,rcar-gen2-cmm"
> > >
> > > Why do you think you do not need SoC-specific compatible values?
> > > What if you discover a different across the R-Car Gen3 line tomorrow?
> > > Does the IP block have a version register?
> >
> > Do you have an answer to these questions?
>
> It does not seem to me that CMM has any version register, nor there
> are differences between the different Gen3 SoCs..
>
> However, even if we now define a single compatible property for
> gen3/gen2 and we later find out one of the SoC needs a soc-specific
> property we can safely add it and keep the generic gen3/gen2 one as
> fallback.. Does it work for you?

Unfortunately that won't work, as the existing DTBs won't have the
soc-specific compatible value.
You could still resort to soc_device_match(), but it is better to avoid that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
