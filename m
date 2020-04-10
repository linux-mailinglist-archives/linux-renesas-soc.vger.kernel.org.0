Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 964021A432F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 09:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgDJHtO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 03:49:14 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:41743 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbgDJHtO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 03:49:14 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 57087FF803;
        Fri, 10 Apr 2020 07:49:10 +0000 (UTC)
Date:   Fri, 10 Apr 2020 09:52:13 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 03/13] squash! max9286: Fix cleanup path from GPIO
 powerdown
Message-ID: <20200410075213.gelbnkltkzfqcfgc@uno.localdomain>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-4-kieran.bingham+renesas@ideasonboard.com>
 <20200409162207.xcj2ro4ecji5yte4@uno.localdomain>
 <CAMuHMdUYk92CX7NDNA3QEFG7fPC0Gwu702A9RU26fQGpBu=ugA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUYk92CX7NDNA3QEFG7fPC0Gwu702A9RU26fQGpBu=ugA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Fri, Apr 10, 2020 at 09:34:28AM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Thu, Apr 9, 2020 at 7:07 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
> > On Thu, Apr 09, 2020 at 01:11:52PM +0100, Kieran Bingham wrote:
> > >  - Fix up cleanup path from GPIO PowerDown registration
> > > ---
> > >  drivers/media/i2c/max9286.c | 14 ++++++++------
> > >  1 file changed, 8 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > > index 0a43137b8112..cc99740b34c5 100644
> > > --- a/drivers/media/i2c/max9286.c
> > > +++ b/drivers/media/i2c/max9286.c
> > > @@ -1171,8 +1171,10 @@ static int max9286_probe(struct i2c_client *client)
> > >
> > >       priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
> > >                                                  GPIOD_OUT_HIGH);
> > > -     if (IS_ERR(priv->gpiod_pwdn))
> > > -             return PTR_ERR(priv->gpiod_pwdn);
> > > +     if (IS_ERR(priv->gpiod_pwdn)) {
> > > +             ret = PTR_ERR(priv->gpiod_pwdn);
> > > +             goto err_cleanup_dt;
> > > +     }
> > >
> > >       gpiod_set_consumer_name(priv->gpiod_pwdn, "max9286-pwdn");
> > >       gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
> >
> > As we get_optional(), shouldn't this be protected by an
> >         if (priv->gpiod_pwdn)
> >
> >  ?
>
> When passed a NULL desc, validate_desc() just returns 0, without printing
> an error message, so both functions become no-ops.
>

Ah indeed, sorry I have overlooked this!

Thanks for pointing this out and sorry Kieran for the noise!

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
