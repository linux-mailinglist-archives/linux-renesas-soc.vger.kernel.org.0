Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55CA746D33E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Dec 2021 13:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbhLHM32 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Dec 2021 07:29:28 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:46992 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231815AbhLHM31 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 07:29:27 -0500
Received: by mail-ua1-f44.google.com with SMTP id 30so4289346uag.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Dec 2021 04:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8jEZuxyTH0INbolsiPEAQffoHG2ckrzZgo9Hq7QWaxk=;
        b=Ji+J6vZFa/3j5SthkZ6G5OQf4+yi9QHKAKAOieBHNntF1bEiwVgzpAjAxO4CyivJka
         yCnJYQXkMDgFnGwPlZ++5h6fzxhb3CQeXDcORdyBnCB8gBzmvrLWD4sGdWOiPbVYugBv
         HdAZCNvsP9oDpZpaAicH9Tus4IJ9N9cK9lD8FViFjU0w/P1QrjHXOJ+2MJYej9/fV6/U
         8yFRU1MxdueBqmJ2HWSJKCNm4zpAdPfISQLFexFa2N9gOhyhI468cUO2KicIAv5iCC7O
         KerJLzF1gZcaveQpI38ZN0iZcuzPnq8IEOjnhb1n+u6DCIELSfKjIuHa4px18d90sJ33
         N/Lg==
X-Gm-Message-State: AOAM532QqdZHpfSf6HJkDu5M10SilwEHjFt7xawJ1uqfmjpUtgDyorSU
        xZdL5+N0nPATLUIume8G3InWqJA/bdwv4g==
X-Google-Smtp-Source: ABdhPJxP33EmqCDIe/VIgTw/ldly71bHFOiXumUMtUBRZbrQGQJZXrmGDOaHnUneIXdOFXVJ7YX0YA==
X-Received: by 2002:a67:f8c2:: with SMTP id c2mr49009077vsp.62.1638966355120;
        Wed, 08 Dec 2021 04:25:55 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id i24sm1684497vkk.5.2021.12.08.04.25.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Dec 2021 04:25:54 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id y5so4341236ual.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Dec 2021 04:25:54 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr8228271uae.122.1638966354316;
 Wed, 08 Dec 2021 04:25:54 -0800 (PST)
MIME-Version: 1.0
References: <62adddea1fc5e9133766af2d953be7334f4622aa.1638959417.git.geert+renesas@glider.be>
 <163896464129.995700.3492964836875185548@Monstersaurus>
In-Reply-To: <163896464129.995700.3492964836875185548@Monstersaurus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Dec 2021 13:25:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8=ZftyH2_WVxQ6_=X81UniF3q+uGveHAv+nz2QYtjrQ@mail.gmail.com>
Message-ID: <CAMuHMdX8=ZftyH2_WVxQ6_=X81UniF3q+uGveHAv+nz2QYtjrQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Use dev_err_probe() helper
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Wed, Dec 8, 2021 at 12:57 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Quoting Geert Uytterhoeven (2021-12-08 10:30:53)
> > Use the dev_err_probe() helper, instead of open-coding the same
> > operation.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > index 5612a9e7a9056cf7..86eeda769e2ebd10 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -661,9 +661,8 @@ static int rcar_du_probe(struct platform_device *pdev)
> >         /* DRM/KMS objects */
> >         ret = rcar_du_modeset_init(rcdu);
> >         if (ret < 0) {
> > -               if (ret != -EPROBE_DEFER)
> > -                       dev_err(&pdev->dev,
> > -                               "failed to initialize DRM/KMS (%d)\n", ret);
> > +               dev_err_probe(&pdev->dev, ret,
> > +                             "failed to initialize DRM/KMS\n");
>
> I've just learned that dev_err_probe() sets a 'reason' for the deferral.
> Seems like a nice feature when exploring devices that are still waiting
> to probe. Is the message still appropriate enough in that case?
>
> I think it's probably fine, so

I have no idea why it could fail. So if you think the message is
fine, it must be fine ;-)

> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
