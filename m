Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723372C42F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 16:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730318AbgKYPc7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 10:32:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730308AbgKYPc7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 10:32:59 -0500
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05E7C0613D4;
        Wed, 25 Nov 2020 07:32:58 -0800 (PST)
Received: by mail-yb1-xb44.google.com with SMTP id e81so111478ybc.1;
        Wed, 25 Nov 2020 07:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eAuXwpBdS/JjUO7qcexKMImXRzelfRnoZ0qNW4H1WMU=;
        b=ACEdiyJ3cqIrtVHqzdxs4l1WSVZrfWwchaiEt11W/TCuygiIfdX4xPQnZnWzYcJjzK
         kOWpEw4J1ATkaKN+TKG/VsFDHpqHkf86VOZGgqfYieK+8cXX5EFqfGWPzLu6UIIUQMR5
         51DjnwRwsIIykw5QynNfOdbEeoDuq7oipZjiNHH+6hhlyXGBQW2rWX15DR9j0R37ueY0
         04aKxerOjP1lWJ/aD0Fqva/5h3Oj7bD6DS8jn2rucG5QDncstsoofxqVZNINe9GhJ3dc
         sZkMboxQq+z4gaeuSTHdd6CdqW0P6LXVPaVyfEPo5GdSve7nBp+M5Efd5lQ8X7wDBzo+
         2dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eAuXwpBdS/JjUO7qcexKMImXRzelfRnoZ0qNW4H1WMU=;
        b=MZpkQM5OxkbnVqMLO5L5dg+BD+0KKdtrpMl7PH1KlCORemfYLhX72q3Svh4hRcw56M
         TAnkpbcnI8olXLDr1zFlbgQU9sIxRtx2GmY8cPy5NPyI0fzn/xfZ+rZcKwqmFxIUe5Vx
         n7A6nsq23FYUTQg/6foLeDdBkKp8rV37Ab9EpHjMVVrYCyuPqNFJOz496MvlbA3AzX1e
         wDfheIptDXqus+94sEzrXpOrYGnWUTWYrwh6+VC/7lZ0rJMFRG82YqkK/yx76uROlOf8
         FEOyiC9FjTkXhwb/XdHvb+1rHzMMD0RysFpUzrfi7wSIFWyvNuL2uTTwZRMUaZ35dFM1
         kb6w==
X-Gm-Message-State: AOAM531vHhtDgF6hypUXNSL9CFQewxLl5Rt4RIoRhq6M0kIZ/FC/Z634
        hLswWLlnxxASdIponYsdvIJwP4qWjIXTCWQQe3A=
X-Google-Smtp-Source: ABdhPJyq+SmzDTDK0sQ3+oM+n2t5BqLyprPZNbfTyRthNwymIYmu4klbqVyo00JJseeiE+9X8KpMKt2xh4EafgzFFHU=
X-Received: by 2002:a25:aa6b:: with SMTP id s98mr4568353ybi.214.1606318377703;
 Wed, 25 Nov 2020 07:32:57 -0800 (PST)
MIME-Version: 1.0
References: <20201124112552.26377-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201124112552.26377-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVkbMbKdY76XGDGxGwCsY_oHZfF=v9XMLZSjLMN+jKe_Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVkbMbKdY76XGDGxGwCsY_oHZfF=v9XMLZSjLMN+jKe_Q@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 25 Nov 2020 15:32:31 +0000
Message-ID: <CA+V-a8s2MCB=_dX+V7_hARyJybKwnTgZyVWgPb3B0tmvLZaSzw@mail.gmail.com>
Subject: Re: [PATCH 2/5] memory: renesas-rpc-if: Make rpcif_enable/disable_rpm()
 as static inline
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Tue, Nov 24, 2020 at 3:43 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Nov 24, 2020 at 12:27 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Define rpcif_enable_rpm() and rpcif_disable_rpm() as static
> > inline in the header instead of exporting it.
> >
> > Suggested-by: Pavel Machek <pavel@denx.de>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch, which is an improvement.
>
> > --- a/include/memory/renesas-rpc-if.h
> > +++ b/include/memory/renesas-rpc-if.h
> > @@ -10,6 +10,7 @@
> >  #ifndef __RENESAS_RPC_IF_H
> >  #define __RENESAS_RPC_IF_H
> >
> > +#include <linux/pm_runtime.h>
> >  #include <linux/types.h>
> >
> >  enum rpcif_data_dir {
> > @@ -77,11 +78,19 @@ struct      rpcif {
> >
> >  int  rpcif_sw_init(struct rpcif *rpc, struct device *dev);
> >  void rpcif_hw_init(struct rpcif *rpc, bool hyperflash);
> > -void rpcif_enable_rpm(struct rpcif *rpc);
> > -void rpcif_disable_rpm(struct rpcif *rpc);
> >  void rpcif_prepare(struct rpcif *rpc, const struct rpcif_op *op, u64 *offs,
> >                    size_t *len);
> >  int rpcif_manual_xfer(struct rpcif *rpc);
> >  ssize_t rpcif_dirmap_read(struct rpcif *rpc, u64 offs, size_t len, void *buf);
> >
> > +static inline void rpcif_enable_rpm(struct rpcif *rpc)
> > +{
> > +       pm_runtime_enable(rpc->dev);
> > +}
> > +
> > +static inline void rpcif_disable_rpm(struct rpcif *rpc)
> > +{
> > +       pm_runtime_put_sync(rpc->dev);
>
> Looking at how this is used, this should call pm_runtime_disable()
> instead.
>
> And probably this should be moved inside the core RPC-IF driver:
>   1. pm_runtime_enable() could be called from rpcif_sw_init(),
>   2. pm_runtime_put_sync() can be called from a new rpc_sw_deinit()
>      function, to be called by the SPI and MTD drivers on probe failure
>      and on remove.
>
Totally agree.

Sergei are you OK with the above suggestions ?

Cheers,
Prabhakar
