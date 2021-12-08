Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6998146DAF4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Dec 2021 19:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238824AbhLHS1L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Dec 2021 13:27:11 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:43739 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhLHS1K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 13:27:10 -0500
Received: by mail-ua1-f52.google.com with SMTP id j14so6235109uan.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Dec 2021 10:23:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w7XrYi4tTR58dtbzk1bmcm8TwxPajFFkIsyUlKABfow=;
        b=fSrj8/el5rJDvyyGFdY5rO8I1NVXuYiWEmyMGsfQHgQv2Pl4nnCfnmjlRYl4fG3/7j
         LmqYduG/4mDFdDq96ECyOWMNxaZYWBwzc7uzQncC1oYl5JEOUvRYukh3BcBWGj8V45Fh
         n4XHdcOAuXHvQl+MH9q2piUdPEcPyTesQI6NjXPjyX3mxYaEleIHvMPWpPY6oV5I0+r/
         nd7jTkqDE2wA1aCrw946It2mM7UL7RrgVqRLKu/RpkyDnWEpgW2VikE8jI4ux0lwJDbu
         rYWWBmkcooaHtJT0KxS92GrBISLLnG35RlRpl+a1JpzKBZrIRojBY9Nn+yN9iYHmA/M0
         k4Rw==
X-Gm-Message-State: AOAM532oxZi7L3BR4D4ODW+phX7YV2ngtZAhP8JsbBu7u788DcjGSHDi
        X1veCYTXYkO9dBZKLNDxeGe6BXG/oH9hpQ==
X-Google-Smtp-Source: ABdhPJxuznuqBUNKHSWbOhDnz4l1Q+mp1PGbNqDtmEKio6qbLrbYQhiJaFa2KE1kKzRRZRcumpXDNA==
X-Received: by 2002:a05:6102:3053:: with SMTP id w19mr295712vsa.60.1638987817722;
        Wed, 08 Dec 2021 10:23:37 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id q12sm2311078vkd.1.2021.12.08.10.23.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Dec 2021 10:23:37 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id o1so6312627uap.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Dec 2021 10:23:37 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id r28mr389275vsg.57.1638987817118;
 Wed, 08 Dec 2021 10:23:37 -0800 (PST)
MIME-Version: 1.0
References: <62adddea1fc5e9133766af2d953be7334f4622aa.1638959417.git.geert+renesas@glider.be>
 <163896464129.995700.3492964836875185548@Monstersaurus> <YbDyjFEJuAgROwqU@pendragon.ideasonboard.com>
In-Reply-To: <YbDyjFEJuAgROwqU@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Dec 2021 19:23:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUq0F-fiqwxOuyQHv7VNfXC0De2gxBCwCyC6iOjEBk7NQ@mail.gmail.com>
Message-ID: <CAMuHMdUq0F-fiqwxOuyQHv7VNfXC0De2gxBCwCyC6iOjEBk7NQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Use dev_err_probe() helper
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Dec 8, 2021 at 7:00 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Dec 08, 2021 at 11:57:21AM +0000, Kieran Bingham wrote:
> > Quoting Geert Uytterhoeven (2021-12-08 10:30:53)
> > > Use the dev_err_probe() helper, instead of open-coding the same
> > > operation.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > index 5612a9e7a9056cf7..86eeda769e2ebd10 100644
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > @@ -661,9 +661,8 @@ static int rcar_du_probe(struct platform_device *pdev)
> > >         /* DRM/KMS objects */
> > >         ret = rcar_du_modeset_init(rcdu);
> > >         if (ret < 0) {
> > > -               if (ret != -EPROBE_DEFER)
> > > -                       dev_err(&pdev->dev,
> > > -                               "failed to initialize DRM/KMS (%d)\n", ret);
> > > +               dev_err_probe(&pdev->dev, ret,
> > > +                             "failed to initialize DRM/KMS\n");
> >
> > I've just learned that dev_err_probe() sets a 'reason' for the deferral.
> > Seems like a nice feature when exploring devices that are still waiting
> > to probe. Is the message still appropriate enough in that case?
>
> It's a very generic message, so it's not ideal. One issue is that
> dev_err_probe() replaces any currently stored probe deferral reason
> message, which means that we'll override any message previously set. We
> don't set any message now, but we should (in rcar_du_encoder_init(),
> there are two main code paths where -EPROBE_DEFER is expected), so this
> patch would then get in the way I'm afraid.

If rcar_du_encoder_init() will handle the printing of errors, there is indeed
no more reason for rcar_du_probe() to do that, so the existing dev_err()
with the fuzzy message can be removed?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
