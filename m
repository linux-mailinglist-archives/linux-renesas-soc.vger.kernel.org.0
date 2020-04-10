Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 711541A4308
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 09:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgDJHek (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 03:34:40 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38044 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgDJHek (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 03:34:40 -0400
Received: by mail-oi1-f194.google.com with SMTP id w2so788427oic.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2020 00:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Txs03MeW0r1GL91b8oThQVW7XQ3Bbu/GKT2cATeMt+0=;
        b=LeofzavrKTxFXD3MpGkub6YtlPJI1tVnDCB0+tYCo5X5NtWin3qD5TWkIHBzky2jq2
         PgFf+AFyLkIwji7MWeIztSHamB6qCk47yoVJRGwviP67y10p1KVUr7NIDC/MtPAuNKWi
         2L3Mb+QTqPey2mt/ORmpYNrnIg17+pexYL66e04DiAQILIBrk1whNt6cOFW6CuS35B6M
         jOeVz1EghvGIA6Xt6+BjFsrE6XwR7HKV01jP/GpaYXkMtpWC3oT3/nMkPFrUMf9r9ORm
         rhcdk5LhyzRMpOI+6xLh6AkSgzwcAO2WQQMvluSzgZQg9vaxxN+V96KWuCnGFp3APFA8
         19vw==
X-Gm-Message-State: AGi0PuYHyAbzZxSbXCwsuBQieR7aAV4eDA64J6F3zZoSvcmwva+iDKVV
        rh+4FIgDzvG+Mg3WaVJ5fZFSyuXohAEWeqmMZTghzI0H
X-Google-Smtp-Source: APiQypLQAABlzahAlEOoG284oxadnTbcFnBqcKybjz9E+K3ysSYREwx0vVAwCBY6Su/gSgXvtp8nv1xZPLWzzZKm+B8=
X-Received: by 2002:aca:ac09:: with SMTP id v9mr2376644oie.148.1586504079548;
 Fri, 10 Apr 2020 00:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-4-kieran.bingham+renesas@ideasonboard.com> <20200409162207.xcj2ro4ecji5yte4@uno.localdomain>
In-Reply-To: <20200409162207.xcj2ro4ecji5yte4@uno.localdomain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Apr 2020 09:34:28 +0200
Message-ID: <CAMuHMdUYk92CX7NDNA3QEFG7fPC0Gwu702A9RU26fQGpBu=ugA@mail.gmail.com>
Subject: Re: [PATCH v8 03/13] squash! max9286: Fix cleanup path from GPIO powerdown
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Thu, Apr 9, 2020 at 7:07 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
> On Thu, Apr 09, 2020 at 01:11:52PM +0100, Kieran Bingham wrote:
> >  - Fix up cleanup path from GPIO PowerDown registration
> > ---
> >  drivers/media/i2c/max9286.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index 0a43137b8112..cc99740b34c5 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -1171,8 +1171,10 @@ static int max9286_probe(struct i2c_client *client)
> >
> >       priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
> >                                                  GPIOD_OUT_HIGH);
> > -     if (IS_ERR(priv->gpiod_pwdn))
> > -             return PTR_ERR(priv->gpiod_pwdn);
> > +     if (IS_ERR(priv->gpiod_pwdn)) {
> > +             ret = PTR_ERR(priv->gpiod_pwdn);
> > +             goto err_cleanup_dt;
> > +     }
> >
> >       gpiod_set_consumer_name(priv->gpiod_pwdn, "max9286-pwdn");
> >       gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
>
> As we get_optional(), shouldn't this be protected by an
>         if (priv->gpiod_pwdn)
>
>  ?

When passed a NULL desc, validate_desc() just returns 0, without printing
an error message, so both functions become no-ops.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
