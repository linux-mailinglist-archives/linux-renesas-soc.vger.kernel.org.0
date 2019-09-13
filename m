Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69619B19A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Sep 2019 10:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387453AbfIMIa6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Sep 2019 04:30:58 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:32905 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387431AbfIMIa5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Sep 2019 04:30:57 -0400
Received: by mail-oi1-f196.google.com with SMTP id e12so1526086oie.0;
        Fri, 13 Sep 2019 01:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JZrVZS3TRiAi6B0nR+YVzqpc9AbnOshhzgNnESTo+HE=;
        b=KCn3scocmz9NWtPLWo0Hm+HOmlxhAWwBEKXN21EDLT7VR/e99JpOWB+xLQmY4hdiMR
         ZffKvqR19EJnY0eLdV8IGXfmNaTEYpAndcufnjKz1inI4JRbgyk1PIAmBMtpWO5aRiFj
         N+WEP+fAmLdsSL8iFQn5rj+/L7QcabaKfKdhiOTYiCU45Y+tAmejfM8wyD/EcbpPEbX1
         XFZTbyd8ZslBA4ViGoDIssBMP1tTR+p1mZaJrbdkjlAcH1D51k3rgZkwh1aHoJI1r6yW
         G80HYhN5kkS50n+l+NggbKnnhj8TwjNS4ly15JsBVeU6jLXrTXkrt2nVNwSklEoRYGLN
         H2Bw==
X-Gm-Message-State: APjAAAUNIPErH1P5uGOtoXxKyxPvP3l/EFMmrnYKN7f7kZvKFP+qm0mA
        XXKEHTQ+9zURzGyZSzdPHM4H2kgE1fUeX5vlSRI=
X-Google-Smtp-Source: APXvYqyZc6bUus5bM4ajLOuNStwe1fxIICi5FZQbHrnZYT2316LpnT9EOtOUUKhjtBGtQMpYE9tImf+FrfJyqZHIJEY=
X-Received: by 2002:a05:6808:98a:: with SMTP id a10mr2296403oic.54.1568363456676;
 Fri, 13 Sep 2019 01:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com> <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
In-Reply-To: <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 13 Sep 2019 10:30:45 +0200
Message-ID: <CAMuHMdU5SgQhnfoeTc1Ur+dhjrUXkEfpk+9VRQR2EKxLzEnmGg@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
To:     Simon Horman <horms@verge.net.au>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 13, 2019 at 10:21 AM Simon Horman <horms@verge.net.au> wrote:
> On Thu, Sep 12, 2019 at 01:00:41PM +0300, Sergei Shtylyov wrote:
> > On 11.09.2019 22:25, Kieran Bingham wrote:
> > > Add direct support for the r8a77980 (V3H).
> > > The V3H shares a common, compatible configuration with the r8a77970
> > > (V3M) so that device info structure is reused.
> >
> >    Do we really need to add yet another compatible in this case?
> > I just added r8a77970 to the compatible prop in the r8a77980 DT. That's why
> > a patch like this one didn't get posted by me.
>
> The reason for having per-SoC compat strings is that the IP blocks
> are not versioned and while we can observe that there are similarities
> between, f.e. the DU on the r8a77970 and r8a77980, we can't be certain that
> differences may not emerge at some point. By having per-SoC compat strings
> we have the flexibility for the driver to address any such differences as
> the need arises.

Thanks, that is the generic reason, applicable to all IP blocks without
version registers.

For the Display Unit, there are documented differences (e.g. number and type
of ports), so we definitely need it there.

> My recollection is that this scheme has been adopted for non-versioned
> Renesas IP blocks since June 2015 and uses of this scheme well before that.
>
> > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
