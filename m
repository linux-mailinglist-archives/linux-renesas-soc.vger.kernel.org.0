Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6411CBF283
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 14:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbfIZMHq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 08:07:46 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46214 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfIZMHq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 08:07:46 -0400
Received: by mail-oi1-f193.google.com with SMTP id k25so1805807oiw.13;
        Thu, 26 Sep 2019 05:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7v7Wljn2xMnyQGsTELGQoCNcNICUj7FbDoKU1E80zjc=;
        b=NcPwO+GNWKm3cZqNM3f/Y91+15db6+bfxMMCYNJjiMZFk5l91+IovYoIPj4PSVE4ls
         c+ImhP+JgG8w//F4Ql6KkCZgYv/oKuqDLUwOsTmwKv9B1HC49wZnKdxnwQy55fFbyXZr
         TCuSE1icnogLSqTQ+Dx7XrGVfAKK/SLQFcyERsP8VJ7N1WVwNdNy8RctpDwr+7w1S/Es
         Pol+Ck9cEzGxvTBtyiphjxt8AsBfUyUeCRjGQWASJVUuih0egTjIwod48ytzHmGhrGdX
         IOr/Hm8WP5G2w3iGX8/e3StKq6q3OvCr7Pj74o0ZnO25V8jpb31d7MNybVwrVc6SxE6C
         TqiA==
X-Gm-Message-State: APjAAAUtT6Erc7sScg9wwrbYBHt9AmtPTUhNbdpUAmMNdKF0q0xNrouV
        30Q+mJ2RT5qNs/6qwqZ2DFyafjIl9MtZLngvJJwB7A==
X-Google-Smtp-Source: APXvYqzxWm7yld4+CIiWQaVVxXLhle4gpN2IYol4E2QghYYb7ip7tcvNkGCPJqkhAo99sV1tdE6htsJ3dmOD5OeJX7o=
X-Received: by 2002:aca:f305:: with SMTP id r5mr2208276oih.131.1569499664682;
 Thu, 26 Sep 2019 05:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190925210354.8845-1-navid.emamdoost@gmail.com> <20190926082302.smaruxtgamgwoxad@verge.net.au>
In-Reply-To: <20190926082302.smaruxtgamgwoxad@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 14:07:33 +0200
Message-ID: <CAMuHMdV8Q6PnOO8RiNo39WSFrkSxnVjQ+bDvNLFjWzhrJX7F4Q@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rcar-sysc: fix memory leak in rcar_sysc_pd_init
To:     Simon Horman <horms@verge.net.au>
Cc:     Navid Emamdoost <navid.emamdoost@gmail.com>, emamd001@umn.edu,
        smccaman@umn.edu, Kangjie Lu <kjlu@umn.edu>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 26, 2019 at 10:23 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Sep 25, 2019 at 04:03:53PM -0500, Navid Emamdoost wrote:
> > In rcar_sysc_pd_init when looping over info->areas errors may happen but
> > the error handling path does not clean up the intermediate allocated
> > memories.
> >
> > This patch changes the error handling path in major and a little the loop
> >  itself. Inside the loop if an error happens the current pd will be
> > released and then it goes to error handling path where it releases any
> >  previously allocated domains.
> >
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>

> > @@ -382,6 +382,7 @@ static int __init rcar_sysc_pd_init(void)
> >               pd = kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
> >               if (!pd) {
> >                       error = -ENOMEM;
> > +                     num_areas = i;
> >                       goto out_put;
> >               }
> >
> > @@ -393,8 +394,11 @@ static int __init rcar_sysc_pd_init(void)
> >               pd->flags = area->flags;
> >
> >               error = rcar_sysc_pd_setup(pd);
> > -             if (error)
> > +             if (error) {
> > +                     kfree(pd);
> > +                     num_areas = i;
> >                       goto out_put;
> > +             }
> >
> >               domains->domains[area->isr_bit] = &pd->genpd;
> >
> > @@ -406,13 +410,30 @@ static int __init rcar_sysc_pd_init(void)
> >               if (error) {
> >                       pr_warn("Failed to add PM subdomain %s to parent %u\n",
> >                               area->name, area->parent);
> > +                     kfree(pd);
> > +                     num_areas = i;
> >                       goto out_put;
> >               }
> >       }
> >
> >       error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
> > +     of_node_put(np);
> > +
> > +     return error;
> >
> >  out_put:
> > +     if (domains) {
> > +             for (i = 0; i < num_areas; i++) {
> > +                     const struct rcar_sysc_area *area = &info->areas[i];
> > +
> > +                     if (!area->name) {
> > +                             /* Skip NULLified area */
> > +                             continue;
> > +                     }
> > +                     kfree(domains->domains[area->isr_bit]);
>
> This cleanup doesn't feel correct to me.
>
> For one I think the allocated memory is at
> to_rcar_pd(domains->domains[area->isr_bit]);
>
> And for antoher I wonder if it is also necessary to unwind initialisation done
> by rcar_sysc_pd_setup() and pm_genpd_add_subdomain();

Indeed.

> I think this leads us to the heart of why such unwinding is not present
> and that is, I suspect, that its reasonably complex and in the event of
> failure the system is very likely unusable. So leaking a bit of memory,
> while unpleasent, doesn't effect the user experience.

Exactly. These can fail only on Out-Of-Memory, or when the programmer
did something stupid and the power area topology in the SoC-specific
driver part is wrong.

Hence it's futile to try to clean up, as the system won't work anyway.
So the current code just aborts, and hopes for the best.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
