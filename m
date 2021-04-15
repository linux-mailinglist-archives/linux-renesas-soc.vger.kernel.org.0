Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8893602E0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 09:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhDOHAZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 03:00:25 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:41491 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhDOHAZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 03:00:25 -0400
Received: by mail-vs1-f48.google.com with SMTP id d6so5419075vsm.8;
        Thu, 15 Apr 2021 00:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vbzgJOlVxu5yO76Hjt4YIfAWsnQVrr2IcvyeAahZ2KQ=;
        b=kC4/O6cX7Q75dObTn03vhx/q79eBlVAvfSVEk/WKBVVPHLDWsje8Q9DJVajzn0cl33
         jKfZwaPN/qyq77JTsJJ7U/K1OVJjqE7VwdpxFOw78kRLNoV/JQesac6RIJCRtqVdbN6z
         Zarw/vW9ROdP7Um3E+pNQHiF/4Jp1CH7fuB8dytlRr+XS/doH5oFiTalD8CBIm5IjUuw
         LT29U7Ev6kBjY6w9RSdgIg1B+51+hpVbNwaBZQqjkupfSgQb1+mRE7Pbof+7vImUAWOZ
         SYN4FE3wyQbvEeHciWn860TALqz8GoFRYlx4WkM8CcYsFOIzz6X8mOqPd+A3Ogfq3/Cb
         +BCQ==
X-Gm-Message-State: AOAM530BRqzec/M2iIf0xRZPB/4Ss4AZYSb4jXjRxirEBYX8Y3XTbq8r
        kseMjpqS9oWPFJ2/702FKkUSa3D5xIa4J591hN6KOY2u
X-Google-Smtp-Source: ABdhPJzLqx3+sTnBI59ImPcvOZLWyigNGqnXndOIssdcnUZiTr0YKH3CjOyOvll5xVJ+/Q7K4238d/3Jagum/tX5tTs=
X-Received: by 2002:a67:7c8c:: with SMTP id x134mr1090046vsc.40.1618470001382;
 Thu, 15 Apr 2021 00:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210414135128.180980-1-jacopo+renesas@jmondi.org>
 <20210414135128.180980-2-jacopo+renesas@jmondi.org> <YHd/AKIfxIHhTjWO@pendragon.ideasonboard.com>
 <20210415065420.lbba2hig4p2ynx6c@uno.localdomain>
In-Reply-To: <20210415065420.lbba2hig4p2ynx6c@uno.localdomain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Apr 2021 08:59:50 +0200
Message-ID: <CAMuHMdV6=DXO4AzrhgcDzdCNB4qYua2jkGsEcZyi5FwnbF70tQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: media: max9286: Define 'maxim,gpio-poc'
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Thu, Apr 15, 2021 at 8:53 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> On Thu, Apr 15, 2021 at 02:47:12AM +0300, Laurent Pinchart wrote:
> > On Wed, Apr 14, 2021 at 03:51:24PM +0200, Jacopo Mondi wrote:
> > > Define a new vendor property in the maxim,max9286 binding schema.
> > >
> > > The new property allows to declare that the remote camera
> > > power-over-coax is controlled by one of the MAX9286 gpio lines.
> > >
> > > As it is currently not possible to establish a regulator as consumer
> > > of the MAX9286 gpio controller for this purpose, the property allows to
> > > declare that the camera power is controlled by the MAX9286 directly.
> > >
> > > The property accepts a gpio-index (0 or 1) and one line polarity
> > > flag as defined by dt-bindings/gpio/gpio.h.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  .../bindings/media/i2c/maxim,max9286.yaml     | 53 ++++++++++++++++++-
> > >  1 file changed, 52 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > index ee16102fdfe7..480a491f3744 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > @@ -70,6 +70,24 @@ properties:
> > >        a remote serializer whose high-threshold noise immunity is not enabled
> > >        is 100000 micro volts
> > >
> > > +  maxim,gpio-poc:
> >
> > I would have written poc-gpio to match the order of the GPIO bindings
> > syntax.
> >
>
> That's what I had :) but then the property gets matched against the
> gpio schema and I get complains because it expects a phandle as first
> argument... Maybe there's a way I've missed to prevent the property to
> be matched with *-gpio ?

GPIO hogs also use gpio properties lacking the phandle.
Hence the way this is handled for hogs may (or may not, it's yaml after all ;-)
inspire you how to handle this here.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
