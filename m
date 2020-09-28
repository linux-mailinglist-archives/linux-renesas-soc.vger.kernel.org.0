Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCCF327A886
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Sep 2020 09:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgI1H02 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Sep 2020 03:26:28 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:45913 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgI1H02 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Sep 2020 03:26:28 -0400
Received: by mail-oo1-f65.google.com with SMTP id h8so53116ooc.12;
        Mon, 28 Sep 2020 00:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FIXuEXH1Fk3QAlLQe9GSnuwlSzVtMlZPFzZmwI9UqQo=;
        b=G8Dq8Z9bC5ToYVrQ0mJoIEE28SO9kMXZRC8Nk9wSswSc0AjjSQLeNSSpo8LDOkFp11
         UViMrkmSptv9jHQgvq26jdeHtgUbOH31rKEEbhvrMt5xryiYTNqKuKZIPNnifkmzihq5
         5FQblJ/8puYRx9k2W5Tq4KN99zql01CRiD6rvtK2NbRudLXuJWfcWqDuI7Kg4fXzV0cH
         E8LGtob2DsNJJTgtFJmsvlNYIPxD/q2jEWwd4oKL4oEhOuuAqdytiojmTeBvEWMoAjBK
         /VSiRdjmqDVvdDMlJmXZ+0wMoQib5krm2Nu9yoU1xnFNm3/M1aWjjXL9hoobnW66zotJ
         lwkg==
X-Gm-Message-State: AOAM532rhQIwHf3s0r4q60VpzjshCMNYfF/iCJbstIJLQ16wZZQR8+Im
        3TZRxtcGCMJquU31sRWqe1/Th3WaKYnQLjwHAj0=
X-Google-Smtp-Source: ABdhPJwi1FqBvCqk6eXHKuHxD5zI6xr62zVsPkSsss785K8jM34uDKUyzRoSrlbneMqYlq2BfkG/5PiagZhx5YxubQ0=
X-Received: by 2002:a4a:e616:: with SMTP id f22mr155254oot.11.1601277987442;
 Mon, 28 Sep 2020 00:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200813140041.5082-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200824004816.GS6002@pendragon.ideasonboard.com> <CA+V-a8uq44hKOxbwBXZ_90q6e4JjCEPwOWp4BDY7BJJaP1Cg6g@mail.gmail.com>
 <20200927200418.GA3986@pendragon.ideasonboard.com>
In-Reply-To: <20200927200418.GA3986@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Sep 2020 09:26:15 +0200
Message-ID: <CAMuHMdX0_VDVw41ZuGy0M+d6sgNMujSas4x+YqZMWwpF-TvOZg@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Sun, Sep 27, 2020 at 10:04 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Sun, Sep 27, 2020 at 02:01:50PM +0100, Lad, Prabhakar wrote:
> > On Mon, Aug 24, 2020 at 1:48 AM Laurent Pinchart wrote:
> > > On Thu, Aug 13, 2020 at 03:00:41PM +0100, Lad Prabhakar wrote:
> > > > The iwg21d comes with a 7" capacitive touch screen, therefore
> > > > add support for it.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > >
> > > Everything seems to match the schematics :-)
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > > ---
> > > > v1->v2
> > > > * This patch is part of series [1] (rest of the patches have be accepted
> > > >   by Geert [2]).
> > > > * Added regulator for lvds
> > > > * Added reset pin for touchpanel
> > > > * This patch is based on series [3]
> > > >
> > > > [1] https://patchwork.kernel.org/project/linux-renesas-soc/list/
> > > >     ?series=330277
> > > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
> > > >     renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10
> > > > [3] https://patchwork.kernel.org/project/linux-renesas-soc/list/
> > > >     ?series=330957
> > > > ---
> > > >  arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 99 +++++++++++++++++++++++++
> > > >  1 file changed, 99 insertions(+)
> >
> > Would you be queueing this patch along with DRM driver patches for v5.10 ?
>
> No, I expect Geert to do so, DT patches go through his tree. I handle
> the drivers and DT bindings.

Indeed.

As the dependencies are now in linux-next, I'm queueing this in
renesas-devel for v5.11, after fixing all conflicts due to recent
additions, and sorting &lvds0 before &pfc.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
